; H3000_v153  block KERNEL  8400-ffff
; Kernel ROM D:/midi/Firmware/H3000/modules/h3000_v153


; ---- function Reset
Reset:
API_FD82:
  8400  1A50           ORCC #0x50                        
  8402  8600           LDA #0x0                          
  8404  B780A7         STA 0x80a7                        
  8407  7F8052         CLR 0x8052                        
  840a  C6FF           LDB #0xff                         
  840c  F780A1         STB 0x80a1                        
  840f  8E6000         LDX #0x6000                       
  8412  108E1FFF       LDY #0x1fff                       
LAB_8416:
  8416  6F80           CLR ,X+                           
  8418  313F           LEAY -0x1,Y                       
  841a  26FA           BNE 0x8416                        
  841c  10CE6500       LDS #0x6500                       
  8420  CE6580         LDU #0x6580                       
  8423  865A           LDA #0x5a                         
  8425  B76000         STA 0x6000                        
  8428  B16000         CMPA 0x6000                       
  842b  1026429D       LBNE 0xc6cc                       
  842f  171677         LBSR 0x9aa9                       
  8432  173C7A         LBSR 0xc0af                       
  8435  8E6600         LDX #0x6600                       
  8438  86B7           LDA #0xb7                         
  843a  A780           STA ,X+                           
  843c  CC8055         LDD #0x8055                       
  843f  ED81           STD ,X++                          
  8441  863B           LDA #0x3b                         
  8443  A780           STA ,X+                           
  8445  B76700         STA 0x6700                        
  8448  B76780         STA 0x6780                        
  844b  B767C0         STA 0x67c0                        
  844e  173BC4         LBSR 0xc015                        ; inline[API_FD18]: [$600F]=$8877 [$6011]=$8877 [$6013]=$8877 [$6015]=$8877 [$6006]=$8877 [$6004]=$8877 [$6002]=$8877 [$608B]=$8877 [$60F2]=$8601 [$608D]=$8877
  8451  600F           addr 600f                         
  8453  8877           dw 8877h                          
  8455  6011           addr 6011                         
  8457  8877           dw 8877h                          
  8459  6013           addr 6013                         
  845b  8877           dw 8877h                          
  845d  6015           addr 6015                         
  845f  8877           dw 8877h                          
  8461  6006           addr 6006                         
  8463  8877           dw 8877h                          
  8465  6004           addr 6004                         
  8467  8877           dw 8877h                          
  8469  6002           addr 6002                         
  846b  8877           dw 8877h                          
  846d  608B           addr 608b                         
  846f  8877           dw 8877h                          
  8471  60F2           addr 60f2                         
  8473  8601           dw 8601h                          
  8475  608D           addr 608d                         
  8477  8877           dw 8877h                          
  8479  FFFF           dw FFFFh                          
LAB_847b:
  847b  C605           LDB #0x5                          
  847d  F76109         STB 0x6109                        
  8480  17402F         LBSR 0xc4b2                       
  8483  171ADE         LBSR 0x9f64                       
  8486  170B61         LBSR 0x8fea                       
  8489  173503         LBSR 0xb98f                       
  848c  1711D6         LBSR 0x9665                       
  848f  17125B         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Welcome to the H3000 ULTRA HARMONIZER "
  8492  0157656C636F.. char[40] 01h,"Welcome to the H3000 ULTRA HARMONIZER "
LAB_84ba:
  84ba  170ED6         LBSR 0x9393                       
  84bd  1715F3         LBSR 0x9ab3                       
  84c0  8E0103         LDX #0x103                        
  84c3  171CD0         LBSR 0xa196                       
  84c6  171476         LBSR 0x993f                       
  84c9  171099         LBSR 0x9565                       
  84cc  17444C         LBSR 0xc91b                       
  84cf  175BF4         LBSR 0xe0c6                       
  84d2  17682A         LBSR 0xecff                       
  84d5  176194         LBSR 0xe66c                       
  84d8  171D78         LBSR 0xa253                       
  84db  C6FF           LDB #0xff                         
  84dd  108E0100       LDY #0x100                        
  84e1  171CEB         LBSR 0xa1cf                       
  84e4  C6FF           LDB #0xff                         
  84e6  108E0101       LDY #0x101                        
  84ea  171CE2         LBSR 0xa1cf                       
  84ed  C675           LDB #0x75                         
  84ef  F76189         STB 0x6189                        
  84f2  C61F           LDB #0x1f                         
  84f4  F7618A         STB 0x618a                        
  84f7  C611           LDB #0x11                         
  84f9  F7618B         STB 0x618b                        
  84fc  170B54         LBSR 0x9053                       
  84ff  2603           BNE 0x8504                        
  8501  1741D3         LBSR 0xc6d7                       
LAB_8504:
  8504  1709B2         LBSR 0x8eb9                       
  8507  C106           CMPB #0x6                         
  8509  2613           BNE 0x851e                        
  850b  1741F4         LBSR 0xc702                       
LAB_850e:
  850e  1709A8         LBSR 0x8eb9                       
  8511  27FB           BEQ 0x850e                        
  8513  C106           CMPB #0x6                         
  8515  27F7           BEQ 0x850e                        
  8517  C102           CMPB #0x2                         
  8519  2603           BNE 0x851e                        
  851b  17421E         LBSR 0xc73c                       
LAB_851e:
  851e  1741CD         LBSR 0xc6ee                       
  8521  273E           BEQ 0x8561                        
  8523  1711C7         LBSR 0x96ed                        ; inline[API_FC38]: "{1}non-volatile memory  not working {2:28}can not load programs "
  8526  016E6F6E2D76.. char[59] 01h,"non-volatile memory  not working ",02h,"(can not load programs "
LAB_8561:
  8561  1CAF           ANDCC #0xaf                       
  8563  174188         LBSR 0xc6ee                       
  8566  17253E         LBSR 0xaaa7                       
  8569  171849         LBSR 0x9db5                       
  856c  2000           BRA 0x856e                        
LAB_856e:
  856e  CC03E8         LDD #0x3e8                        
  8571  173B2F         LBSR 0xc0a3                       
  8574  17159F         LBSR 0x9b16                       
  8577  171740         LBSR 0x9cba                       
LAB_857a:
  857a  F66102         LDB 0x6102                        
  857d  F7600B         STB 0x600b                        
  8580  F78052         STB 0x8052                        
  8583  173535         LBSR 0xbabb                       
  8586  260F           BNE 0x8597                        
  8588  CC001E         LDD #0x1e                         
  858b  173523         LBSR 0xbab1                       
  858e  BD8F2C         JSR 0x8f2c                        
  8591  BD943B         JSR 0x943b                        
  8594  1718DB         LBSR 0x9e72                       
LAB_8597:
  8597  8D02           BSR 0x859b                        
  8599  20DF           BRA 0x857a                        

; ---- function FUN_859b
FUN_859b:
  859b  3416           PSHS  X B A                       
  859d  F66102         LDB 0x6102                        
  85a0  1778DD         LBSR 0xfe80                       
  85a3  173421         LBSR 0xb9c7                       
  85a6  1742BF         LBSR 0xc868                       
  85a9  AD9F600F       JSR [0x600f]                      
  85ad  AD9F6011       JSR [0x6011]                      
  85b1  AD9F6013       JSR [0x6013]                      
  85b5  AD9F6015       JSR [0x6015]                      
  85b9  17385C         LBSR 0xbe18                       
  85bc  1778DB         LBSR 0xfe9a                       
  85bf  3516           PULS  A B X                       
  85c1  39             RTS                               

; ---- function IRQ_Handler
IRQ_Handler:
  85c2  1A40           ORCC #0x40                        
  85c4  CE6590         LDU #0x6590                       
  85c7  8680           LDA #0x80                         
  85c9  B48053         ANDA 0x8053                       
  85cc  2707           BEQ 0x85d5                        
  85ce  AD9F6006       JSR [0x6006]                      
  85d2  173ED2         LBSR 0xc4a7                       
LAB_85d5:
  85d5  F68300         LDB 0x8300                        
  85d8  C501           BITB #0x1                         
  85da  1027016B       LBEQ 0x8749                       
  85de  C520           BITB #0x20                        
  85e0  2611           BNE 0x85f3                        
LAB_85e2:
  85e2  F68301         LDB 0x8301                        
  85e5  7D619C         TST 0x619c                        
  85e8  27EB           BEQ 0x85d5                        
  85ea  5D             TSTB                              
  85eb  2B0E           BMI 0x85fb                        
  85ed  AD9F608B       JSR [0x608b]                      
  85f1  20E2           BRA 0x85d5                        
LAB_85f3:
  85f3  F68301         LDB 0x8301                        
  85f6  170047         LBSR 0x8640                       
  85f9  20DA           BRA 0x85d5                        
LAB_85fb:
  85fb  AD9F60F2       JSR [0x60f2]                      
  85ff  20D4           BRA 0x85d5                        

; ---- function FUN_8601
FUN_8601:
  8601  1F98           TFR B,A                           
  8603  84F0           ANDA #0xf0                        
  8605  81F0           CMPA #0xf0                        
  8607  273D           BEQ 0x8646                        
  8609  81C0           CMPA #0xc0                        
  860b  10270111       LBEQ 0x8720                       
  860f  8E8618         LDX #0x8618                       
  8612  BF608B         STX 0x608b                        
  8615  8D01           BSR 0x8618                        
  8617  39             RTS                               

; ---- function FUN_8618
FUN_8618:
  8618  F76105         STB 0x6105                        
  861b  7D6081         TST 0x6081                        
  861e  2620           BNE 0x8640                        
  8620  BE6083         LDX 0x6083                        
  8623  E7897800       STB 0x7800,X                      
  8627  1F10           TFR X,D                           
  8629  C30001         ADDD #0x1                         
  862c  8403           ANDA #0x3                         
  862e  FD6083         STD 0x6083                        
  8631  10B36085       CMPD 0x6085                       
  8635  2605           BNE 0x863c                        
  8637  C6FF           LDB #0xff                         
  8639  F76081         STB 0x6081                        
LAB_863c:
  863c  7F6082         CLR 0x6082                        
  863f  39             RTS                               

; ---- function FUN_8640
FUN_8640:
  8640  86FF           LDA #0xff                         
  8642  B76087         STA 0x6087                        
  8645  39             RTS                               

; ---- function FUN_8646
FUN_8646:
  8646  3406           PSHS  B A                         
  8648  C1F0           CMPB #0xf0                        
  864a  2712           BEQ 0x865e                        
  864c  1F98           TFR B,A                           
  864e  84F8           ANDA #0xf8                        
  8650  81F8           CMPA #0xf8                        
  8652  2603           BNE 0x8657                        
  8654  1700F7         LBSR 0x874e                       
LAB_8657:
  8657  AD9F608D       JSR [0x608d]                      
  865b  3506           PULS  A B                         
  865d  39             RTS                               
LAB_865e:
  865e  CC8666         LDD #0x8666                       
  8661  FD608B         STD 0x608b                        
  8664  20F1           BRA 0x8657                        

; ---- function FUN_8666
FUN_8666:
  8666  3406           PSHS  B A                         
  8668  C11C           CMPB #0x1c                        
  866a  2639           BNE 0x86a5                        
  866c  CC8671         LDD #0x8671                       
  866f  2037           BRA 0x86a8                        

; ---- function FUN_8671
FUN_8671:
  8671  3406           PSHS  B A                         
  8673  C160           CMPB #0x60                        
  8675  262E           BNE 0x86a5                        
  8677  CC867C         LDD #0x867c                       
  867a  202C           BRA 0x86a8                        

; ---- function FUN_867c
FUN_867c:
  867c  3406           PSHS  B A                         
  867e  3404           PSHS  B                           
  8680  3410           PSHS  X                           
  8682  8E0110         LDX #0x110                        
  8685  171B0E         LBSR 0xa196                       
  8688  3510           PULS  X                           
  868a  E1E0           CMPB ,S+                          
  868c  2617           BNE 0x86a5                        
  868e  CC8696         LDD #0x8696                       
  8691  FD608B         STD 0x608b                        
  8694  2012           BRA 0x86a8                        

; ---- function FUN_8696
FUN_8696:
  8696  5D             TSTB                              
  8697  2615           BNE 0x86ae                        
  8699  CC8618         LDD #0x8618                       
  869c  FD608B         STD 0x608b                        
  869f  C6F0           LDB #0xf0                         
  86a1  17FF74         LBSR 0x8618                       
  86a4  39             RTS                               
LAB_86a5:
  86a5  CC8877         LDD #0x8877                       
LAB_86a8:
  86a8  FD608B         STD 0x608b                        
  86ab  3506           PULS  A B                         
  86ad  39             RTS                               

; ---- function FUN_86ae
FUN_86ae:
  86ae  3432           PSHS  Y X A                       
  86b0  108E68C0       LDY #0x68c0                       
  86b4  1713F2         LBSR 0x9aa9                       
  86b7  1A40           ORCC #0x40                        
  86b9  E6A9000B       LDB 0xb,Y                         
  86bd  1777C0         LBSR 0xfe80                       
  86c0  CCE9EB         LDD #0xe9eb                       
  86c3  EDA90002       STD 0x2,Y                         
  86c7  8E7D00         LDX #0x7d00                       
  86ca  200E           BRA 0x86da                        
LAB_86cc:
  86cc  ADB90002       JSR [0x2,Y]                       
  86d0  A6A9000B       LDA 0xb,Y                         
  86d4  B7600B         STA 0x600b                        
  86d7  B78052         STA 0x8052                        
LAB_86da:
  86da  F68300         LDB 0x8300                        
  86dd  C501           BITB #0x1                         
  86df  271A           BEQ 0x86fb                        
  86e1  C520           BITB #0x20                        
  86e3  261A           BNE 0x86ff                        
  86e5  F68301         LDB 0x8301                        
  86e8  8E7D00         LDX #0x7d00                       
  86eb  5D             TSTB                              
  86ec  2CDE           BGE 0x86cc                        
  86ee  1F98           TFR B,A                           
  86f0  84F8           ANDA #0xf8                        
  86f2  81F8           CMPA #0xf8                        
  86f4  260E           BNE 0x8704                        
  86f6  170055         LBSR 0x874e                       
  86f9  20DF           BRA 0x86da                        
LAB_86fb:
  86fb  301F           LEAX -0x1,X                       
  86fd  26DB           BNE 0x86da                        
LAB_86ff:
  86ff  F68301         LDB 0x8301                        
  8702  20D6           BRA 0x86da                        
LAB_8704:
  8704  3406           PSHS  B A                         
  8706  CCE9EB         LDD #0xe9eb                       
  8709  EDA90002       STD 0x2,Y                         
  870d  1713A3         LBSR 0x9ab3                       
  8710  3506           PULS  A B                         
  8712  177785         LBSR 0xfe9a                       
  8715  3532           PULS  A X Y                       
  8717  3262           LEAS 0x2,S                        
  8719  16FEC6         LBRA 0x85e2                       

; ---- function FUN_871c
FUN_871c:
  871c  171394         LBSR 0x9ab3                       
  871f  39             RTS                               
LAB_8720:
  8720  3406           PSHS  B A                         
  8722  7D608A         TST 0x608a                        
  8725  2B10           BMI 0x8737                        
  8727  C40F           ANDB #0xf                         
  8729  F1608A         CMPB 0x608a                       
  872c  2709           BEQ 0x8737                        
  872e  CC8877         LDD #0x8877                       
  8731  FD608B         STD 0x608b                        
  8734  3506           PULS  A B                         
  8736  39             RTS                               
LAB_8737:
  8737  CC8740         LDD #0x8740                       
  873a  FD608B         STD 0x608b                        
  873d  3506           PULS  A B                         
  873f  39             RTS                               

; ---- function FUN_8740
FUN_8740:
  8740  F760F1         STB 0x60f1                        
  8743  C6FF           LDB #0xff                         
  8745  F76106         STB 0x6106                        
  8748  39             RTS                               
LAB_8749:
  8749  AD9F6004       JSR [0x6004]                      
  874d  3B             RTI                               

; ---- function FUN_874e
FUN_874e:
  874e  3406           PSHS  B A                         
  8750  C1F8           CMPB #0xf8                        
  8752  1026000A       LBNE 0x8760                       
  8756  7C6109         INC 0x6109                        
  8759  2605           BNE 0x8760                        
  875b  86FF           LDA #0xff                         
  875d  B76109         STA 0x6109                        
LAB_8760:
  8760  3506           PULS  A B                         
  8762  39             RTS                               

; ---- function FUN_8763
FUN_8763:
  8763  3436           PSHS  Y X B A                     
  8765  327C           LEAS -0x4,S                       
  8767  F6610A         LDB 0x610a                        
  876a  F1611B         CMPB 0x611b                       
  876d  102700AD       LBEQ 0x881e                       
  8771  F7611B         STB 0x611b                        
  8774  108E610B       LDY #0x610b                       
  8778  A6A5           LDA B,Y                           
  877a  A762           STA 0x2,S                         
  877c  5A             DECB                              
  877d  C40F           ANDB #0xf                         
  877f  A0A5           SUBA B,Y                          
  8781  8101           CMPA #0x1                         
  8783  2E71           BGT 0x87f6                        
  8785  81FF           CMPA #0xff                        
  8787  2D6D           BLT 0x87f6                        
LAB_8789:
  8789  108E610B       LDY #0x610b                       
  878d  8E0000         LDX #0x0                          
  8790  E6A0           LDB ,Y+                           
  8792  3A             ABX                               
  8793  E6A0           LDB ,Y+                           
  8795  3A             ABX                               
  8796  E6A0           LDB ,Y+                           
  8798  3A             ABX                               
  8799  E6A0           LDB ,Y+                           
  879b  3A             ABX                               
  879c  E6A0           LDB ,Y+                           
  879e  3A             ABX                               
  879f  E6A0           LDB ,Y+                           
  87a1  3A             ABX                               
  87a2  E6A0           LDB ,Y+                           
  87a4  3A             ABX                               
  87a5  E6A0           LDB ,Y+                           
  87a7  3A             ABX                               
  87a8  E6A0           LDB ,Y+                           
  87aa  3A             ABX                               
  87ab  E6A0           LDB ,Y+                           
  87ad  3A             ABX                               
  87ae  E6A0           LDB ,Y+                           
  87b0  3A             ABX                               
  87b1  E6A0           LDB ,Y+                           
  87b3  3A             ABX                               
  87b4  E6A0           LDB ,Y+                           
  87b6  3A             ABX                               
  87b7  E6A0           LDB ,Y+                           
  87b9  3A             ABX                               
  87ba  E6A0           LDB ,Y+                           
  87bc  3A             ABX                               
  87bd  E6A0           LDB ,Y+                           
  87bf  3A             ABX                               
  87c0  6D62           TST 0x2,S                         
  87c2  275A           BEQ 0x881e                        
  87c4  1F10           TFR X,D                           
  87c6  EDE4           STD ,S                            
  87c8  B360EB         SUBD 0x60eb                       
  87cb  10830001       CMPD #0x1                         
  87cf  234D           BLS 0x881e                        
  87d1  1083FFFF       CMPD #0xffff                      
  87d5  2747           BEQ 0x881e                        
  87d7  10830002       CMPD #0x2                         
  87db  230A           BLS 0x87e7                        
  87dd  1083FFFE       CMPD #0xfffe                      
  87e1  2C09           BGE 0x87ec                        
  87e3  ECE4           LDD ,S                            
  87e5  200A           BRA 0x87f1                        
LAB_87e7:
  87e7  CCFFFF         LDD #0xffff                       
  87ea  2003           BRA 0x87ef                        
LAB_87ec:
  87ec  CC0001         LDD #0x1                          
LAB_87ef:
  87ef  E3E4           ADDD ,S                           
LAB_87f1:
  87f1  FD60EB         STD 0x60eb                        
  87f4  2028           BRA 0x881e                        
LAB_87f6:
  87f6  E662           LDB 0x2,S                         
  87f8  E7A0           STB ,Y+                           
  87fa  E7A0           STB ,Y+                           
  87fc  E7A0           STB ,Y+                           
  87fe  E7A0           STB ,Y+                           
  8800  E7A0           STB ,Y+                           
  8802  E7A0           STB ,Y+                           
  8804  E7A0           STB ,Y+                           
  8806  E7A0           STB ,Y+                           
  8808  E7A0           STB ,Y+                           
  880a  E7A0           STB ,Y+                           
  880c  E7A0           STB ,Y+                           
  880e  E7A0           STB ,Y+                           
  8810  E7A0           STB ,Y+                           
  8812  E7A0           STB ,Y+                           
  8814  E7A0           STB ,Y+                           
  8816  E7A0           STB ,Y+                           
  8818  16FF6E         LBRA 0x8789                       
  881b  .db BF 60 EB                                         ; .`.
LAB_881e:
  881e  3264           LEAS 0x4,S                        
  8820  3536           PULS  A B X Y                     
  8822  39             RTS                               

; ---- function NMI_Handler
NMI_Handler:
  8823  1F40           TFR S,D                           
  8825  8164           CMPA #0x64                        
  8827  1026FBD5       LBNE 0x8400                       
  882b  AD9F6002       JSR [0x6002]                      
  882f  170B6B         LBSR 0x939d                       
  8832  7C6165         INC 0x6165                        
  8835  7C6107         INC 0x6107                        
  8838  2631           BNE 0x886b                        
  883a  B66109         LDA 0x6109                        
  883d  4D             TSTA                              
  883e  271B           BEQ 0x885b                        
  8840  7D611D         TST 0x611d                        
  8843  261D           BNE 0x8862                        
  8845  F6611C         LDB 0x611c                        
  8848  B7611C         STA 0x611c                        
  884b  B6610A         LDA 0x610a                        
  884e  8E610B         LDX #0x610b                       
  8851  4C             INCA                              
  8852  840F           ANDA #0xf                         
  8854  E786           STB A,X                           
  8856  B7610A         STA 0x610a                        
  8859  200D           BRA 0x8868                        
LAB_885b:
  885b  C602           LDB #0x2                          
  885d  F7611D         STB 0x611d                        
  8860  2006           BRA 0x8868                        
LAB_8862:
  8862  B7611C         STA 0x611c                        
  8865  7A611D         DEC 0x611d                        
LAB_8868:
  8868  7F6109         CLR 0x6109                        
LAB_886b:
  886b  8600           LDA #0x0                          
  886d  B780A7         STA 0x80a7                        
  8870  4C             INCA                              
  8871  B780A7         STA 0x80a7                        
  8874  3B             RTI                               

; ---- function API_FC00
API_FC00:
  8875  20FE           BRA 0x8875                        

; ---- function API_FD80
API_FD80:
  8877  39             RTS                               

; ---- function FIRQ_Handler
FIRQ_Handler:
  8878  1CEF           ANDCC #0xef                       
  887a  16DD83         LBRA 0x6600                       
  887d  .db AA 55 00 08 F9 00 00 00 FF FF                    ; .U........
DAT_8887:
  8887  0008           undefined2 0008h                  
  8889  .db FA 00 00 00 E0 00 C0 00 C1 00 E2 00 E3 00 00 00  ; ................
  8899  .db 01 00 02 00 03 00 20 00 21 00 22 00 23 00 30 00  ; ...... .!.".#.0.
  88a9  .db 31 00 32 00 33 00 10 00 11 00 12 00 13 00 A0 03  ; 1.2.3...........
  88b9  .db FF FF                                            ; ..

;; Kernel API slot $FC02: D = record key; scans the bank chains, leaves bank/ptr/len in $6079/$607A/$607D

; ---- function RomFindRecord
RomFindRecord:
  88bb  3406           PSHS  B A                         
  88bd  170076         LBSR 0x8936                       
LAB_88c0:
  88c0  260A           BNE 0x88cc                        
  88c2  10A3E4         CMPD ,S                           
  88c5  2705           BEQ 0x88cc                        
  88c7  1700D0         LBSR 0x899a                       
  88ca  20F4           BRA 0x88c0                        
LAB_88cc:
  88cc  3506           PULS  A B                         
  88ce  39             RTS                               

;; Kernel API slot $FC04: next byte of the current record (crosses bank boundaries)

; ---- function RomStreamReadByte
RomStreamReadByte:
  88cf  3433           PSHS  Y X A CC                    
  88d1  7D607C         TST 0x607c                        
  88d4  2643           BNE 0x8919                        
  88d6  F66079         LDB 0x6079                        
  88d9  1775A4         LBSR 0xfe80                       
  88dc  10BE607A       LDY 0x607a                        
  88e0  E6A0           LDB ,Y+                           
  88e2  3404           PSHS  B                           
  88e4  10BF607A       STY 0x607a                        
  88e8  BE607D         LDX 0x607d                        
  88eb  301F           LEAX -0x1,X                       
  88ed  2723           BEQ 0x8912                        
  88ef  BF607D         STX 0x607d                        
  88f2  1F20           TFR Y,D                           
  88f4  5D             TSTB                              
  88f5  260C           BNE 0x8903                        
  88f7  843F           ANDA #0x3f                        
  88f9  2608           BNE 0x8903                        
  88fb  1700F8         LBSR 0x89f6                       
  88fe  260D           BNE 0x890d                        
  8900  FD607A         STD 0x607a                        
LAB_8903:
  8903  3504           PULS  B                           
  8905  177592         LBSR 0xfe9a                       
  8908  3533           PULS CC A X Y                     
  890a  1A04           ORCC #0x4                         
  890c  39             RTS                               
LAB_890d:
  890d  86FF           LDA #0xff                         
  890f  B76076         STA 0x6076                        
LAB_8912:
  8912  86FF           LDA #0xff                         
  8914  B7607C         STA 0x607c                        
  8917  20EA           BRA 0x8903                        
LAB_8919:
  8919  3533           PULS CC A X Y                     
  891b  1CFB           ANDCC #0xfb                       
  891d  39             RTS                               

; ---- function API_FD9E
API_FD9E:
  891e  3432           PSHS  Y X A                       
  8920  B66079         LDA 0x6079                        
  8923  17755A         LBSR 0xfe80                       
  8926  10BE607A       LDY 0x607a                        
  892a  1F10           TFR X,D                           
  892c  31AB           LEAY D,Y                          
  892e  E6A4           LDB ,Y                            
  8930  177567         LBSR 0xfe9a                       
  8933  3532           PULS  A X Y                       
  8935  39             RTS                               

;; Kernel API slot $FDA0

; ---- function RomFirstRecord
RomFirstRecord:
  8936  3431           PSHS  Y X CC                      
  8938  F6600B         LDB 0x600b                        
  893b  177542         LBSR 0xfe80                       
  893e  8E888D         LDX #0x888d                       
  8941  BF607F         STX 0x607f                        
LAB_8944:
  8944  1700AF         LBSR 0x89f6                       
  8947  2616           BNE 0x895f                        
  8949  1F02           TFR D,Y                           
  894b  ECA4           LDD ,Y                            
  894d  1083AA55       CMPD #0xaa55                      
  8951  2727           BEQ 0x897a                        
  8953  20EF           BRA 0x8944                        

; ---- function FUN_8955
FUN_8955:
  8955  3431           PSHS  Y X CC                      
  8957  F6600B         LDB 0x600b                        
  895a  177523         LBSR 0xfe80                       
  895d  20E5           BRA 0x8944                        
LAB_895f:
  895f  108E0000       LDY #0x0                          
  8963  10BF607A       STY 0x607a                        
  8967  10BF6077       STY 0x6077                        
  896b  10BF607D       STY 0x607d                        
  896f  B76076         STA 0x6076                        
  8972  177525         LBSR 0xfe9a                       
  8975  3531           PULS CC X Y                       
  8977  1CFB           ANDCC #0xfb                       
  8979  39             RTS                               

; ---- function FUN_897a
FUN_897a:
  897a  10BF607A       STY 0x607a                        
  897e  FD6077         STD 0x6077                        
  8981  CC0000         LDD #0x0                          
  8984  B7607C         STA 0x607c                        
  8987  B76076         STA 0x6076                        
  898a  EC22           LDD 0x2,Y                         
  898c  FD607D         STD 0x607d                        
  898f  177508         LBSR 0xfe9a                       
  8992  FC6077         LDD 0x6077                        
  8995  3531           PULS CC X Y                       
  8997  1A04           ORCC #0x4                         
  8999  39             RTS                               

;; Kernel API slot $FDA2

; ---- function RomNextRecord
RomNextRecord:
  899a  3431           PSHS  Y X CC                      
  899c  F66079         LDB 0x6079                        
  899f  1774DE         LBSR 0xfe80                       
  89a2  7D6076         TST 0x6076                        
  89a5  26B8           BNE 0x895f                        
  89a7  FC6077         LDD 0x6077                        
  89aa  1083FFFF       CMPD #0xffff                      
  89ae  2794           BEQ 0x8944                        
LAB_89b0:
  89b0  10BE607A       LDY 0x607a                        
  89b4  CC0008         LDD #0x8                          
  89b7  10B3607D       CMPD 0x607d                       
  89bb  2287           BHI 0x8944                        
  89bd  1F20           TFR Y,D                           
  89bf  843F           ANDA #0x3f                        
  89c1  F3607D         ADDD 0x607d                       
  89c4  84C0           ANDA #0xc0                        
  89c6  2720           BEQ 0x89e8                        
  89c8  1F20           TFR Y,D                           
  89ca  843F           ANDA #0x3f                        
  89cc  3406           PSHS  B A                         
  89ce  CC4000         LDD #0x4000                       
  89d1  A3E1           SUBD ,S++                         
  89d3  3406           PSHS  B A                         
  89d5  FC607D         LDD 0x607d                        
  89d8  A3E1           SUBD ,S++                         
  89da  FD607D         STD 0x607d                        
  89dd  8D17           BSR 0x89f6                        
  89df  1026FF7C       LBNE 0x895f                       
  89e3  FD607A         STD 0x607a                        
  89e6  20C8           BRA 0x89b0                        
LAB_89e8:
  89e8  1F20           TFR Y,D                           
  89ea  F3607D         ADDD 0x607d                       
  89ed  FD607A         STD 0x607a                        
  89f0  1F02           TFR D,Y                           
  89f2  ECA4           LDD ,Y                            
  89f4  2084           BRA 0x897a                        

; ---- function FUN_89f6
FUN_89f6:
  89f6  BE607F         LDX 0x607f                        
  89f9  EC81           LDD ,X++                          
  89fb  BF607F         STX 0x607f                        
  89fe  1083FFFF       CMPD #0xffff                      
  8a02  270D           BEQ 0x8a11                        
  8a04  B76079         STA 0x6079                        
  8a07  B7600B         STA 0x600b                        
  8a0a  B78052         STA 0x8052                        
  8a0d  1F98           TFR B,A                           
  8a0f  5F             CLRB                              
  8a10  39             RTS                               
LAB_8a11:
  8a11  1CFB           ANDCC #0xfb                       
  8a13  39             RTS                               

; ---- function API_FDA4
API_FDA4:
  8a14  3410           PSHS  X                           
  8a16  3406           PSHS  B A                         
  8a18  FC607D         LDD 0x607d                        
  8a1b  A3E4           SUBD ,S                           
  8a1d  FD607D         STD 0x607d                        
  8a20  FC607A         LDD 0x607a                        
  8a23  843F           ANDA #0x3f                        
  8a25  E3E4           ADDD ,S                           
  8a27  84C0           ANDA #0xc0                        
  8a29  2714           BEQ 0x8a3f                        
  8a2b  FD607A         STD 0x607a                        
  8a2e  8DC6           BSR 0x89f6                        
  8a30  2614           BNE 0x8a46                        
  8a32  F3607A         ADDD 0x607a                       
LAB_8a35:
  8a35  FD607A         STD 0x607a                        
  8a38  3506           PULS  A B                         
  8a3a  3510           PULS  X                           
  8a3c  1A04           ORCC #0x4                         
  8a3e  39             RTS                               
LAB_8a3f:
  8a3f  FC607A         LDD 0x607a                        
  8a42  E3E4           ADDD ,S                           
  8a44  20EF           BRA 0x8a35                        
LAB_8a46:
  8a46  3506           PULS  A B                         
  8a48  3510           PULS  X                           
  8a4a  1A04           ORCC #0x4                         
  8a4c  39             RTS                               

; ---- function API_FC06
API_FC06:
  8a4d  17FE6B         LBSR 0x88bb                       
  8a50  2608           BNE 0x8a5a                        
  8a52  10BE607A       LDY 0x607a                        
  8a56  F66079         LDB 0x6079                        
  8a59  4F             CLRA                              
LAB_8a5a:
  8a5a  39             RTS                               

; ---- function API_FC08
API_FC08:
  8a5b  1083FFFF       CMPD #0xffff                      
  8a5f  271B           BEQ 0x8a7c                        
  8a61  17FE57         LBSR 0x88bb                       
  8a64  2615           BNE 0x8a7b                        
  8a66  CC0008         LDD #0x8                          
  8a69  17FFA8         LBSR 0x8a14                       
  8a6c  F66079         LDB 0x6079                        
  8a6f  17740E         LBSR 0xfe80                       
  8a72  AD9F607A       JSR [0x607a]                      
  8a76  177421         LBSR 0xfe9a                       
  8a79  1A04           ORCC #0x4                         
LAB_8a7b:
  8a7b  39             RTS                               
LAB_8a7c:
  8a7c  1CFB           ANDCC #0xfb                       
  8a7e  20FB           BRA 0x8a7b                        

;; Kernel API slot $FC0A: inline word = record key; switch bank, JSR [$607A], restore

; ---- function FarCallModuleInline
FarCallModuleInline:
  8a80  3416           PSHS  X B A                       
  8a82  AE64           LDX 0x4,S                         
  8a84  EC81           LDD ,X++                          
  8a86  AF64           STX 0x4,S                         
  8a88  17FE30         LBSR 0x88bb                       
  8a8b  2639           BNE 0x8ac6                        
  8a8d  CC0008         LDD #0x8                          
  8a90  17FF81         LBSR 0x8a14                       
  8a93  F66079         LDB 0x6079                        
  8a96  1773E7         LBSR 0xfe80                       
  8a99  3504           PULS  B                           
  8a9b  17361C         LBSR 0xc0ba                       
  8a9e  E664           LDB 0x4,S                         
  8aa0  173617         LBSR 0xc0ba                       
  8aa3  E665           LDB 0x5,S                         
  8aa5  173612         LBSR 0xc0ba                       
  8aa8  3516           PULS  A B X                       
  8aaa  3262           LEAS 0x2,S                        
  8aac  AD9F607A       JSR [0x607a]                      
  8ab0  3416           PSHS  X B A                       
  8ab2  173612         LBSR 0xc0c7                       
  8ab5  E765           STB 0x5,S                         
  8ab7  17360D         LBSR 0xc0c7                       
  8aba  E764           STB 0x4,S                         
  8abc  173608         LBSR 0xc0c7                       
  8abf  3404           PSHS  B                           
  8ac1  1773D6         LBSR 0xfe9a                       
  8ac4  1A04           ORCC #0x4                         
LAB_8ac6:
  8ac6  3516           PULS  A B X                       
  8ac8  39             RTS                               

; ---- function API_FC0C
API_FC0C:
  8ac9  3402           PSHS  A                           
  8acb  1F10           TFR X,D                           
  8acd  17FDEB         LBSR 0x88bb                       
  8ad0  2612           BNE 0x8ae4                        
  8ad2  CC0008         LDD #0x8                          
  8ad5  17FF3C         LBSR 0x8a14                       
  8ad8  1F20           TFR Y,D                           
  8ada  17FF37         LBSR 0x8a14                       
  8add  17FDEF         LBSR 0x88cf                       
  8ae0  1A04           ORCC #0x4                         
  8ae2  3121           LEAY 0x1,Y                        
LAB_8ae4:
  8ae4  3502           PULS  A                           
  8ae6  39             RTS                               

; ---- function API_FC0E
API_FC0E:
  8ae7  1F10           TFR X,D                           
  8ae9  17FDCF         LBSR 0x88bb                       
  8aec  2619           BNE 0x8b07                        
  8aee  CC0008         LDD #0x8                          
  8af1  17FF20         LBSR 0x8a14                       
  8af4  1F20           TFR Y,D                           
  8af6  58             LSLB                              
  8af7  49             ROLA                              
  8af8  17FF19         LBSR 0x8a14                       
  8afb  17FDD1         LBSR 0x88cf                       
  8afe  1F98           TFR B,A                           
  8b00  17FDCC         LBSR 0x88cf                       
  8b03  3121           LEAY 0x1,Y                        
  8b05  1A04           ORCC #0x4                         
LAB_8b07:
  8b07  39             RTS                               

; ---- function API_FDA6
API_FDA6:
  8b08  3416           PSHS  X B A                       
  8b0a  1F10           TFR X,D                           
  8b0c  17FDAC         LBSR 0x88bb                       
  8b0f  260B           BNE 0x8b1c                        
LAB_8b11:
  8b11  17FDBB         LBSR 0x88cf                       
  8b14  2604           BNE 0x8b1a                        
  8b16  E7A0           STB ,Y+                           
  8b18  20F7           BRA 0x8b11                        
LAB_8b1a:
  8b1a  8600           LDA #0x0                          
LAB_8b1c:
  8b1c  3516           PULS  A B X                       
  8b1e  39             RTS                               

; ---- function API_FC10
API_FC10:
  8b1f  3416           PSHS  X B A                       
  8b21  1E01           EXG D,X                           
  8b23  17FD95         LBSR 0x88bb                       
  8b26  2610           BNE 0x8b38                        
  8b28  3706           PULU  A B                         
  8b2a  17FEE7         LBSR 0x8a14                       
LAB_8b2d:
  8b2d  17FD9F         LBSR 0x88cf                       
  8b30  2606           BNE 0x8b38                        
  8b32  E7A0           STB ,Y+                           
  8b34  301F           LEAX -0x1,X                       
  8b36  26F5           BNE 0x8b2d                        
LAB_8b38:
  8b38  3516           PULS  A B X                       
  8b3a  39             RTS                               

;; Kernel API slot $FC12: inline: 2 words

; ---- function KernelHelper_FC12
KernelHelper_FC12:
  8b3b  3456           PSHS  U X B A                     
  8b3d  3406           PSHS  B A                         
  8b3f  1F43           TFR S,U                           
  8b41  327E           LEAS -0x2,S                       
  8b43  AE6A           LDX 0xa,S                         
  8b45  EC81           LDD ,X++                          
  8b47  3606           PSHU  B A                         
  8b49  EC81           LDD ,X++                          
  8b4b  AF6A           STX 0xa,S                         
  8b4d  AE62           LDX 0x2,S                         
  8b4f  8DCE           BSR 0x8b1f                        
  8b51  3264           LEAS 0x4,S                        
  8b53  3556           PULS  A B X U                     
  8b55  39             RTS                               

; ---- function API_FDA8
API_FDA8:
  8b56  3436           PSHS  Y X B A                     
  8b58  17FD60         LBSR 0x88bb                       
  8b5b  2630           BNE 0x8b8d                        
  8b5d  BE607A         LDX 0x607a                        
  8b60  F66079         LDB 0x6079                        
  8b63  F7600C         STB 0x600c                        
  8b66  3005           LEAX 0x5,X                        
  8b68  177344         LBSR 0xfeaf                       
  8b6b  C401           ANDB #0x1                         
  8b6d  271C           BEQ 0x8b8b                        
  8b6f  B760BE         STA 0x60be                        
  8b72  BE607A         LDX 0x607a                        
  8b75  3001           LEAX 0x1,X                        
  8b77  1F12           TFR X,Y                           
  8b79  177333         LBSR 0xfeaf                       
  8b7c  F760BF         STB 0x60bf                        
  8b7f  C6FF           LDB #0xff                         
  8b81  F760BD         STB 0x60bd                        
  8b84  177345         LBSR 0xfecc                       
  8b87  1A04           ORCC #0x4                         
  8b89  2002           BRA 0x8b8d                        
LAB_8b8b:
  8b8b  1CFB           ANDCC #0xfb                       
LAB_8b8d:
  8b8d  3536           PULS  A B X Y                     
  8b8f  39             RTS                               

; ---- function API_FDAA
API_FDAA:
  8b90  3426           PSHS  Y B A                       
  8b92  7D60BD         TST 0x60bd                        
  8b95  261E           BNE 0x8bb5                        
  8b97  B660BE         LDA 0x60be                        
  8b9a  C6FF           LDB #0xff                         
  8b9c  17FD1C         LBSR 0x88bb                       
  8b9f  2614           BNE 0x8bb5                        
  8ba1  F66079         LDB 0x6079                        
  8ba4  F7600C         STB 0x600c                        
  8ba7  10BE607A       LDY 0x607a                        
  8bab  3121           LEAY 0x1,Y                        
  8bad  F660BF         LDB 0x60bf                        
  8bb0  177319         LBSR 0xfecc                       
  8bb3  1A04           ORCC #0x4                         
LAB_8bb5:
  8bb5  3526           PULS  A B Y                       
  8bb7  39             RTS                               
  8bb8  .db 00                                               ; .
DAT_8bb9:
  8bb9  A0             undefined1 A0h                    
  8bba  .db 03 00                                            ; ..
DAT_8bbc:
  8bbc  2004           undefined2 2004h                  

; ---- function API_FDAC
API_FDAC:
  8bbe  3476           PSHS  U Y X B A                   
  8bc0  CE8BB8         LDU #0x8bb8                       
  8bc3  8D50           BSR 0x8c15                        
  8bc5  1772B8         LBSR 0xfe80                       
  8bc8  3128           LEAY 0x8,Y                        
  8bca  3420           PSHS  Y                           
  8bcc  EC44           LDD 0x4,U                         
  8bce  A3E1           SUBD ,S++                         
  8bd0  10A302         CMPD 0x2,X                        
  8bd3  252E           BCS 0x8c03                        
  8bd5  A641           LDA 0x1,U                         
  8bd7  B7600C         STA 0x600c                        
  8bda  3138           LEAY -0x8,Y                       
  8bdc  3420           PSHS  Y                           
  8bde  EC02           LDD 0x2,X                         
  8be0  177333         LBSR 0xff16                       
  8be3  8E8885         LDX #0x8885                       
  8be6  EC02           LDD 0x2,X                         
  8be8  17732B         LBSR 0xff16                       
  8beb  3520           PULS  Y                           
  8bed  F6600C         LDB 0x600c                        
  8bf0  F7600B         STB 0x600b                        
  8bf3  F78052         STB 0x8052                        
  8bf6  E625           LDB 0x5,Y                         
  8bf8  CA01           ORB #0x1                          
  8bfa  E725           STB 0x5,Y                         
  8bfc  17729B         LBSR 0xfe9a                       
  8bff  1A04           ORCC #0x4                         
  8c01  2005           BRA 0x8c08                        
LAB_8c03:
  8c03  177294         LBSR 0xfe9a                       
  8c06  1CFB           ANDCC #0xfb                       
LAB_8c08:
  8c08  3576           PULS  A B X Y U                   
  8c0a  39             RTS                               

; ---- function FUN_8c0b
FUN_8c0b:
  8c0b  3440           PSHS  U                           
  8c0d  CE8BB8         LDU #0x8bb8                       
  8c10  8D03           BSR 0x8c15                        
  8c12  3540           PULS  U                           
  8c14  39             RTS                               

; ---- function FUN_8c15
FUN_8c15:
  8c15  3416           PSHS  X B A                       
  8c17  7F60BD         CLR 0x60bd                        
  8c1a  E641           LDB 0x1,U                         
  8c1c  177261         LBSR 0xfe80                       
  8c1f  AE42           LDX 0x2,U                         
  8c21  1F12           TFR X,Y                           
LAB_8c23:
  8c23  EC84           LDD ,X                            
  8c25  1083FFFF       CMPD #0xffff                      
  8c29  2711           BEQ 0x8c3c                        
  8c2b  C1FF           CMPB #0xff                        
  8c2d  2707           BEQ 0x8c36                        
  8c2f  EC02           LDD 0x2,X                         
  8c31  1732DE         LBSR 0xbf12                       
  8c34  20ED           BRA 0x8c23                        
LAB_8c36:
  8c36  EC02           LDD 0x2,X                         
  8c38  308B           LEAX D,X                          
  8c3a  20E7           BRA 0x8c23                        
LAB_8c3c:
  8c3c  8E8885         LDX #0x8885                       
  8c3f  EC02           LDD 0x2,X                         
  8c41  1772D2         LBSR 0xff16                       
  8c44  3138           LEAY -0x8,Y                       
  8c46  177251         LBSR 0xfe9a                       
  8c49  3516           PULS  A B X                       
  8c4b  39             RTS                               

; ---- function API_FC18
API_FC18:
  8c4c  3406           PSHS  B A                         
  8c4e  CC8C5D         LDD #0x8c5d                       
  8c51  FD6032         STD 0x6032                        
  8c54  CC8CD7         LDD #0x8cd7                       
  8c57  FD6034         STD 0x6034                        
  8c5a  3506           PULS  A B                         
  8c5c  39             RTS                               

; ---- function FUN_8c5d
FUN_8c5d:
  8c5d  3406           PSHS  B A                         
  8c5f  F66058         LDB 0x6058                        
  8c62  C407           ANDB #0x7                         
  8c64  4F             CLRA                              
  8c65  173378         LBSR 0xbfe0                        ; inline[API_FD14]: jump table[D]: 0->8C87 1->8C90 2->8C8A 3->8C87 4->8C87 5->8C80 6->8C78 7->8C87
  8c68  8C87           addr 8c87                         
  8c6a  8C90           addr 8c90                         
  8c6c  8C8A           addr 8c8a                         
  8c6e  8C87           addr 8c87                         
  8c70  8C87           addr 8c87                         
  8c72  8C80           addr 8c80                         
  8c74  8C78           addr 8c78                         
  8c76  8C87           addr 8c87                         

; ---- function FUN_8c78
FUN_8c78:
  8c78  170029         LBSR 0x8ca4                       
  8c7b  260A           BNE 0x8c87                        
  8c7d  17003F         LBSR 0x8cbf                       

; ---- function FUN_8c80
FUN_8c80:
  8c80  FC60DE         LDD 0x60de                        
LAB_8c83:
  8c83  AD9F605A       JSR [0x605a]                      

; ---- function FUN_8c87
FUN_8c87:
  8c87  3506           PULS  A B                         
  8c89  39             RTS                               

; ---- function FUN_8c8a
FUN_8c8a:
  8c8a  8D18           BSR 0x8ca4                        
  8c8c  26F9           BNE 0x8c87                        
  8c8e  8D2F           BSR 0x8cbf                        

; ---- function FUN_8c90
FUN_8c90:
  8c90  FC6054         LDD 0x6054                        
  8c93  F360DE         ADDD 0x60de                       
  8c96  10B36056       CMPD 0x6056                       
  8c9a  2303           BLS 0x8c9f                        
  8c9c  FC6056         LDD 0x6056                        
LAB_8c9f:
  8c9f  FD6054         STD 0x6054                        
  8ca2  20DF           BRA 0x8c83                        

; ---- function FUN_8ca4
FUN_8ca4:
  8ca4  3406           PSHS  B A                         
  8ca6  7D604C         TST 0x604c                        
  8ca9  2705           BEQ 0x8cb0                        
  8cab  172DFC         LBSR 0xbaaa                       
  8cae  260A           BNE 0x8cba                        
LAB_8cb0:
  8cb0  FC60E0         LDD 0x60e0                        
  8cb3  172DEA         LBSR 0xbaa0                       
  8cb6  1A04           ORCC #0x4                         
  8cb8  2002           BRA 0x8cbc                        
LAB_8cba:
  8cba  1CFB           ANDCC #0xfb                       
LAB_8cbc:
  8cbc  3506           PULS  A B                         
  8cbe  39             RTS                               

; ---- function FUN_8cbf
FUN_8cbf:
  8cbf  3406           PSHS  B A                         
  8cc1  7D604C         TST 0x604c                        
  8cc4  2609           BNE 0x8ccf                        
  8cc6  CC0064         LDD #0x64                         
  8cc9  F360E0         ADDD 0x60e0                       
  8ccc  172DD1         LBSR 0xbaa0                       
LAB_8ccf:
  8ccf  86FF           LDA #0xff                         
  8cd1  B7604C         STA 0x604c                        
  8cd4  3506           PULS  A B                         
  8cd6  39             RTS                               

; ---- function FUN_8cd7
FUN_8cd7:
  8cd7  3406           PSHS  B A                         
  8cd9  F66058         LDB 0x6058                        
  8cdc  C407           ANDB #0x7                         
  8cde  4F             CLRA                              
  8cdf  1732FE         LBSR 0xbfe0                        ; inline[API_FD14]: jump table[D]: 0->8D04 1->8D0F 2->8D07 3->8D04 4->8D04 5->8CFA 6->8CF2 7->8D04
  8ce2  8D04           addr 8d04                         
  8ce4  8D0F           addr 8d0f                         
  8ce6  8D07           addr 8d07                         
  8ce8  8D04           addr 8d04                         
  8cea  8D04           addr 8d04                         
  8cec  8CFA           addr 8cfa                         
  8cee  8CF2           addr 8cf2                         
  8cf0  8D04           addr 8d04                         

; ---- function FUN_8cf2
FUN_8cf2:
  8cf2  17FFAF         LBSR 0x8ca4                       
  8cf5  260D           BNE 0x8d04                        
  8cf7  17FFC5         LBSR 0x8cbf                       

; ---- function FUN_8cfa
FUN_8cfa:
  8cfa  CC0000         LDD #0x0                          
  8cfd  B360DE         SUBD 0x60de                       
LAB_8d00:
  8d00  AD9F605A       JSR [0x605a]                      

; ---- function FUN_8d04
FUN_8d04:
  8d04  3506           PULS  A B                         
  8d06  39             RTS                               

; ---- function FUN_8d07
FUN_8d07:
  8d07  17FF9A         LBSR 0x8ca4                       
  8d0a  26F8           BNE 0x8d04                        
  8d0c  17FFB0         LBSR 0x8cbf                       

; ---- function FUN_8d0f
FUN_8d0f:
  8d0f  FC6054         LDD 0x6054                        
  8d12  B360DE         SUBD 0x60de                       
  8d15  10B36054       CMPD 0x6054                       
  8d19  2303           BLS 0x8d1e                        
  8d1b  CC0000         LDD #0x0                          
LAB_8d1e:
  8d1e  FD6054         STD 0x6054                        
  8d21  20DD           BRA 0x8d00                        

; ---- function API_FC14
API_FC14:
  8d23  3477           PSHS  U Y X B A CC                
  8d25  7F60DB         CLR 0x60db                        
  8d28  CC0000         LDD #0x0                          
  8d2b  B3606E         SUBD 0x606e                       
  8d2e  FD6120         STD 0x6120                        
  8d31  F3606C         ADDD 0x606c                       
  8d34  FD611E         STD 0x611e                        
  8d37  7D6066         TST 0x6066                        
  8d3a  2718           BEQ 0x8d54                        
  8d3c  FC611E         LDD 0x611e                        
  8d3f  FD6064         STD 0x6064                        
  8d42  FC6074         LDD 0x6074                        
  8d45  F36120         ADDD 0x6120                       
  8d48  FD6062         STD 0x6062                        
  8d4b  CC8D7D         LDD #0x8d7d                       
  8d4e  FD605C         STD 0x605c                        
  8d51  1706E0         LBSR 0x9434                       
LAB_8d54:
  8d54  7D6058         TST 0x6058                        
  8d57  2718           BEQ 0x8d71                        
  8d59  FC611E         LDD 0x611e                        
  8d5c  FD6056         STD 0x6056                        
  8d5f  FC6074         LDD 0x6074                        
  8d62  F36120         ADDD 0x6120                       
  8d65  FD6054         STD 0x6054                        
  8d68  CC8DAF         LDD #0x8daf                       
  8d6b  FD605A         STD 0x605a                        
  8d6e  17FEDB         LBSR 0x8c4c                       
LAB_8d71:
  8d71  CC8DC1         LDD #0x8dc1                       
  8d74  FD606A         STD 0x606a                        
  8d77  1702F0         LBSR 0x906a                       
  8d7a  3577           PULS CC A B X Y U                 
  8d7c  39             RTS                               

; ---- function FUN_8d7d
FUN_8d7d:
  8d7d  3406           PSHS  B A                         
  8d7f  C601           LDB #0x1                          
  8d81  F760DB         STB 0x60db                        
  8d84  FC6062         LDD 0x6062                        
  8d87  FD6054         STD 0x6054                        
  8d8a  B36120         SUBD 0x6120                       
LAB_8d8d:
  8d8d  7F604D         CLR 0x604d                        
  8d90  FD6074         STD 0x6074                        
  8d93  3606           PSHU  B A                         
  8d95  108E609A       LDY #0x609a                       
  8d99  8610           LDA #0x10                         
  8d9b  1709EB         LBSR 0x9789                       
  8d9e  1700DD         LBSR 0x8e7e                       
  8da1  FC6074         LDD 0x6074                        
  8da4  AD9F6070       JSR [0x6070]                      
  8da8  AD9F6072       JSR [0x6072]                      
  8dac  3506           PULS  A B                         
  8dae  39             RTS                               

; ---- function FUN_8daf
FUN_8daf:
  8daf  3406           PSHS  B A                         
  8db1  C602           LDB #0x2                          
  8db3  F760DB         STB 0x60db                        
  8db6  FC6054         LDD 0x6054                        
  8db9  FD6062         STD 0x6062                        
  8dbc  B36120         SUBD 0x6120                       
  8dbf  20CC           BRA 0x8d8d                        

; ---- function FUN_8dc1
FUN_8dc1:
  8dc1  3406           PSHS  B A                         
  8dc3  C603           LDB #0x3                          
  8dc5  F760DB         STB 0x60db                        
  8dc8  FC6074         LDD 0x6074                        
  8dcb  F36120         ADDD 0x6120                       
  8dce  FD6062         STD 0x6062                        
  8dd1  FD6054         STD 0x6054                        
  8dd4  1700A7         LBSR 0x8e7e                       
  8dd7  FC6074         LDD 0x6074                        
  8dda  AD9F6072       JSR [0x6072]                      
  8dde  3506           PULS  A B                         
  8de0  39             RTS                               

; ---- function FUN_8de1
FUN_8de1:
  8de1  170018         LBSR 0x8dfc                        ; inline[API_FC16]: 00 00 00 00 00 00 00 00 $0000 $0000 $0000 ->$0000 ->$0000 $0000 $0000 $0000
  8de4  00             db 0h                             
  8de5  00             db 0h                             
  8de6  00             db 0h                             
  8de7  00             db 0h                             
  8de8  00             db 0h                             
  8de9  00             db 0h                             
  8dea  00             db 0h                             
  8deb  00             db 0h                             
  8dec  0000           dw 0h                             
  8dee  0000           dw 0h                             
  8df0  0000           dw 0h                             
  8df2  0000           addr 0000                         
  8df4  0000           addr 0000                         
  8df6  0000           dw 0h                             
  8df8  0000           dw 0h                             
  8dfa  0000           dw 0h                             

;; Kernel API slot $FC16: inline 24-byte record: limits + display/adjust callbacks

; ---- function SetupParamEditPage
SetupParamEditPage:
  8dfc  3437           PSHS  Y X B A CC                  
  8dfe  AE67           LDX 0x7,S                         
  8e00  327C           LEAS -0x4,S                       
  8e02  E680           LDB ,X+                           
  8e04  F76066         STB 0x6066                        
  8e07  E680           LDB ,X+                           
  8e09  F76067         STB 0x6067                        
  8e0c  E680           LDB ,X+                           
  8e0e  F76058         STB 0x6058                        
  8e11  E680           LDB ,X+                           
  8e13  4F             CLRA                              
  8e14  FD60E0         STD 0x60e0                        
  8e17  E680           LDB ,X+                           
  8e19  F76068         STB 0x6068                        
  8e1c  E680           LDB ,X+                           
  8e1e  F76099         STB 0x6099                        
  8e21  E680           LDB ,X+                           
  8e23  F76069         STB 0x6069                        
  8e26  CC0000         LDD #0x0                          
  8e29  EDE4           STD ,S                            
  8e2b  E680           LDB ,X+                           
  8e2d  E762           STB 0x2,S                         
  8e2f  2A05           BPL 0x8e36                        
  8e31  FC600D         LDD 0x600d                        
  8e34  EDE4           STD ,S                            
LAB_8e36:
  8e36  C640           LDB #0x40                         
  8e38  E462           ANDB 0x2,S                        
  8e3a  260C           BNE 0x8e48                        
  8e3c  EC81           LDD ,X++                          
  8e3e  FD606C         STD 0x606c                        
  8e41  EC81           LDD ,X++                          
  8e43  FD606E         STD 0x606e                        
  8e46  2010           BRA 0x8e58                        
LAB_8e48:
  8e48  10AE81         LDY ,X++                          
  8e4b  ECA4           LDD ,Y                            
  8e4d  FD606C         STD 0x606c                        
  8e50  10AE81         LDY ,X++                          
  8e53  ECA4           LDD ,Y                            
  8e55  FD606E         STD 0x606e                        
LAB_8e58:
  8e58  EC81           LDD ,X++                          
  8e5a  EC81           LDD ,X++                          
  8e5c  E3E4           ADDD ,S                           
  8e5e  FD6070         STD 0x6070                        
  8e61  EC81           LDD ,X++                          
  8e63  E3E4           ADDD ,S                           
  8e65  FD6072         STD 0x6072                        
  8e68  EC81           LDD ,X++                          
  8e6a  FD60DC         STD 0x60dc                        
  8e6d  EC81           LDD ,X++                          
  8e6f  FD60DE         STD 0x60de                        
  8e72  EC81           LDD ,X++                          
  8e74  3264           LEAS 0x4,S                        
  8e76  AF67           STX 0x7,S                         
  8e78  17FEA8         LBSR 0x8d23                       
  8e7b  3537           PULS CC A B X Y                   
  8e7d  39             RTS                               

; ---- function FUN_8e7e
FUN_8e7e:
  8e7e  3407           PSHS  B A CC                      
  8e80  FC6074         LDD 0x6074                        
  8e83  10B36122       CMPD 0x6122                       
  8e87  2205           BHI 0x8e8e                        
  8e89  2507           BCS 0x8e92                        
  8e8b  5F             CLRB                              
  8e8c  2006           BRA 0x8e94                        
LAB_8e8e:
  8e8e  C601           LDB #0x1                          
  8e90  2002           BRA 0x8e94                        
LAB_8e92:
  8e92  C6FF           LDB #0xff                         
LAB_8e94:
  8e94  F760E2         STB 0x60e2                        
  8e97  FC6074         LDD 0x6074                        
  8e9a  FD6122         STD 0x6122                        
  8e9d  3507           PULS CC A B                       
  8e9f  39             RTS                               
DAT_8ea0:
  8ea0  1A             undefined1 1Ah                    
  8ea1  .db 1B 10 0C 02 04 03 01 07 05 06 08 11 13 12 0A 17  ; ................
  8eb1  .db 19 18 0D 14 16 15 0B 09                          ; ........

; ---- function API_FC1A
API_FC1A:
  8eb9  3412           PSHS  X A                         
  8ebb  8E604E         LDX #0x604e                       
  8ebe  8601           LDA #0x1                          
  8ec0  8D3D           BSR 0x8eff                        
  8ec2  8D3B           BSR 0x8eff                        
  8ec4  8D39           BSR 0x8eff                        
  8ec6  8D37           BSR 0x8eff                        
  8ec8  8D35           BSR 0x8eff                        
  8eca  8D33           BSR 0x8eff                        
  8ecc  8E604E         LDX #0x604e                       
  8ecf  5F             CLRB                              
  8ed0  8D37           BSR 0x8f09                        
  8ed2  271F           BEQ 0x8ef3                        
  8ed4  8D33           BSR 0x8f09                        
  8ed6  271B           BEQ 0x8ef3                        
  8ed8  8D2F           BSR 0x8f09                        
  8eda  2717           BEQ 0x8ef3                        
  8edc  8D2B           BSR 0x8f09                        
  8ede  2713           BEQ 0x8ef3                        
  8ee0  8D27           BSR 0x8f09                        
  8ee2  270F           BEQ 0x8ef3                        
  8ee4  8D23           BSR 0x8f09                        
  8ee6  270B           BEQ 0x8ef3                        
  8ee8  8604           LDA #0x4                          
  8eea  B4604E         ANDA 0x604e                       
  8eed  2704           BEQ 0x8ef3                        
  8eef  C600           LDB #0x0                          
  8ef1  2009           BRA 0x8efc                        
LAB_8ef3:
  8ef3  8E8EA0         LDX #0x8ea0                       
  8ef6  A685           LDA B,X                           
  8ef8  1F89           TFR A,B                           
  8efa  86FF           LDA #0xff                         
LAB_8efc:
  8efc  3512           PULS  A X                         
  8efe  39             RTS                               

; ---- function FUN_8eff
FUN_8eff:
  8eff  B78057         STA 0x8057                        
  8f02  F68056         LDB 0x8056                        
  8f05  E780           STB ,X+                           
  8f07  48             LSLA                              
  8f08  39             RTS                               

; ---- function FUN_8f09
FUN_8f09:
  8f09  8601           LDA #0x1                          
  8f0b  A484           ANDA ,X                           
  8f0d  2716           BEQ 0x8f25                        
  8f0f  5C             INCB                              
  8f10  8602           LDA #0x2                          
  8f12  A484           ANDA ,X                           
  8f14  270F           BEQ 0x8f25                        
  8f16  5C             INCB                              
  8f17  8610           LDA #0x10                         
  8f19  A484           ANDA ,X                           
  8f1b  2708           BEQ 0x8f25                        
  8f1d  5C             INCB                              
  8f1e  8620           LDA #0x20                         
  8f20  A484           ANDA ,X                           
  8f22  2701           BEQ 0x8f25                        
  8f24  5C             INCB                              
LAB_8f25:
  8f25  3401           PSHS  CC                          
  8f27  3001           LEAX 0x1,X                        
  8f29  3501           PULS CC                           
  8f2b  39             RTS                               

; ---- function API_FC1C
API_FC1C:
  8f2c  3417           PSHS  X B A CC                    
  8f2e  8D89           BSR 0x8eb9                        
  8f30  F160FD         CMPB 0x60fd                       
  8f33  2608           BNE 0x8f3d                        
  8f35  7D604C         TST 0x604c                        
  8f38  2606           BNE 0x8f40                        
LAB_8f3a:
  8f3a  3517           PULS CC A B X                     
  8f3c  39             RTS                               
LAB_8f3d:
  8f3d  7F604C         CLR 0x604c                        
LAB_8f40:
  8f40  F760FD         STB 0x60fd                        
  8f43  C510           BITB #0x10                        
  8f45  1026008D       LBNE 0x8fd6                       
  8f49  170111         LBSR 0x905d                       
  8f4c  4F             CLRA                              
  8f4d  C40F           ANDB #0xf                         
  8f4f  17308E         LBSR 0xbfe0                        ; inline[API_FD14]: jump table[D]: 0->8F72 1->8F78 2->8F7E 3->8F84 4->8F8A 5->8F90 6->8F96 7->8F9C 8->8FA2 9->8FA8 10->8FAE 11->8FB4 12->8FBA 13->8FC5 14->8FD0 15->8FD3
  8f52  8F72           addr 8f72                         
  8f54  8F78           addr 8f78                         
  8f56  8F7E           addr 8f7e                         
  8f58  8F84           addr 8f84                         
  8f5a  8F8A           addr 8f8a                         
  8f5c  8F90           addr 8f90                         
  8f5e  8F96           addr 8f96                         
  8f60  8F9C           addr 8f9c                         
  8f62  8FA2           addr 8fa2                         
  8f64  8FA8           addr 8fa8                         
  8f66  8FAE           addr 8fae                         
  8f68  8FB4           addr 8fb4                         
  8f6a  8FBA           addr 8fba                         
  8f6c  8FC5           addr 8fc5                         
  8f6e  8FD0           addr 8fd0                         
  8f70  8FD3           addr 8fd3                         

; ---- function FUN_8f72
FUN_8f72:
  8f72  AD9F6048       JSR [0x6048]                      
  8f76  20C2           BRA 0x8f3a                        

; ---- function FUN_8f78
FUN_8f78:
  8f78  AD9F603C       JSR [0x603c]                      
  8f7c  2066           BRA 0x8fe4                        

; ---- function FUN_8f7e
FUN_8f7e:
  8f7e  AD9F603E       JSR [0x603e]                      
  8f82  2060           BRA 0x8fe4                        

; ---- function FUN_8f84
FUN_8f84:
  8f84  AD9F6040       JSR [0x6040]                      
  8f88  205A           BRA 0x8fe4                        

; ---- function FUN_8f8a
FUN_8f8a:
  8f8a  AD9F6042       JSR [0x6042]                      
  8f8e  2054           BRA 0x8fe4                        

; ---- function FUN_8f90
FUN_8f90:
  8f90  AD9F603A       JSR [0x603a]                      
  8f94  204E           BRA 0x8fe4                        

; ---- function FUN_8f96
FUN_8f96:
  8f96  AD9F6030       JSR [0x6030]                      
  8f9a  2048           BRA 0x8fe4                        

; ---- function FUN_8f9c
FUN_8f9c:
  8f9c  AD9F602E       JSR [0x602e]                      
  8fa0  2042           BRA 0x8fe4                        

; ---- function FUN_8fa2
FUN_8fa2:
  8fa2  AD9F602A       JSR [0x602a]                      
  8fa6  203C           BRA 0x8fe4                        

; ---- function FUN_8fa8
FUN_8fa8:
  8fa8  AD9F602C       JSR [0x602c]                      
  8fac  2036           BRA 0x8fe4                        

; ---- function FUN_8fae
FUN_8fae:
  8fae  AD9F6032       JSR [0x6032]                      
  8fb2  2030           BRA 0x8fe4                        

; ---- function FUN_8fb4
FUN_8fb4:
  8fb4  AD9F6034       JSR [0x6034]                      
  8fb8  202A           BRA 0x8fe4                        

; ---- function FUN_8fba
FUN_8fba:
  8fba  7D604D         TST 0x604d                        
  8fbd  2604           BNE 0x8fc3                        
  8fbf  AD9F6038       JSR [0x6038]                      
LAB_8fc3:
  8fc3  2011           BRA 0x8fd6                        

; ---- function FUN_8fc5
FUN_8fc5:
  8fc5  7D604D         TST 0x604d                        
  8fc8  2604           BNE 0x8fce                        
  8fca  AD9F6036       JSR [0x6036]                      
LAB_8fce:
  8fce  2006           BRA 0x8fd6                        

; ---- function FUN_8fd0
FUN_8fd0:
  8fd0  16FF67         LBRA 0x8f3a                       

; ---- function FUN_8fd3
FUN_8fd3:
  8fd3  16FF64         LBRA 0x8f3a                       

; ---- function FUN_8fd6
FUN_8fd6:
  8fd6  F660FD         LDB 0x60fd                        
  8fd9  AD9F6044       JSR [0x6044]                      
  8fdd  AD9F6046       JSR [0x6046]                      
  8fe1  16FF56         LBRA 0x8f3a                       

; ---- function FUN_8fe4
FUN_8fe4:
  8fe4  7F604D         CLR 0x604d                        
  8fe7  16FF50         LBRA 0x8f3a                       

; ---- function FUN_8fea
FUN_8fea:
  8fea  3407           PSHS  B A CC                      
  8fec  173026         LBSR 0xc015                        ; inline[API_FD18]: [$602A]=$8877 [$602C]=$8877 [$602E]=$8877 [$6030]=$8877 [$6032]=$8877 [$6034]=$8877 [$6036]=$8877 [$6038]=$8877 [$603A]=$8877 [$603C]=$8877 [$603E]=$8877 [$6040]=$8877 [$6042]=$8877 [$6044]=$8877 [$6046]=$8877 [$6048]=$8877 [$604A]=$8877
  8fef  602A           addr 602a                         
  8ff1  8877           dw 8877h                          
  8ff3  602C           addr 602c                         
  8ff5  8877           dw 8877h                          
  8ff7  602E           addr 602e                         
  8ff9  8877           dw 8877h                          
  8ffb  6030           addr 6030                         
  8ffd  8877           dw 8877h                          
  8fff  6032           addr 6032                         
  9001  8877           dw 8877h                          
  9003  6034           addr 6034                         
  9005  8877           dw 8877h                          
  9007  6036           addr 6036                         
  9009  8877           dw 8877h                          
  900b  6038           addr 6038                         
  900d  8877           dw 8877h                          
  900f  603A           addr 603a                         
  9011  8877           dw 8877h                          
  9013  603C           addr 603c                         
  9015  8877           dw 8877h                          
  9017  603E           addr 603e                         
  9019  8877           dw 8877h                          
  901b  6040           addr 6040                         
  901d  8877           dw 8877h                          
  901f  6042           addr 6042                         
  9021  8877           dw 8877h                          
  9023  6044           addr 6044                         
  9025  8877           dw 8877h                          
  9027  6046           addr 6046                         
  9029  8877           dw 8877h                          
  902b  6048           addr 6048                         
  902d  8877           dw 8877h                          
  902f  604A           addr 604a                         
  9031  8877           dw 8877h                          
  9033  FFFF           dw FFFFh                          
LAB_9035:
  9035  7F604C         CLR 0x604c                        
  9038  7F604D         CLR 0x604d                        
  903b  7F60FD         CLR 0x60fd                        
  903e  3507           PULS CC A B                       
  9040  39             RTS                               

; ---- function FUN_9041
FUN_9041:
  9041  3436           PSHS  Y X B A                     
LAB_9043:
  9043  17FE73         LBSR 0x8eb9                       
  9046  F160FD         CMPB 0x60fd                       
  9049  2605           BNE 0x9050                        
  904b  17F54D         LBSR 0x859b                       
  904e  20F3           BRA 0x9043                        
LAB_9050:
  9050  3536           PULS  A B X Y                     
  9052  39             RTS                               

; ---- function API_FDAE
API_FDAE:
  9053  3402           PSHS  A                           
  9055  B68056         LDA 0x8056                        
  9058  8404           ANDA #0x4                         
  905a  3502           PULS  A                           
  905c  39             RTS                               

; ---- function FUN_905d
FUN_905d:
  905d  3404           PSHS  B                           
  905f  C104           CMPB #0x4                         
  9061  2204           BHI 0x9067                        
  9063  5A             DECB                              
  9064  F760B9         STB 0x60b9                        
LAB_9067:
  9067  3504           PULS  B                           
  9069  39             RTS                               

; ---- function API_FC1E
API_FC1E:
  906a  3477           PSHS  U Y X B A CC                
  906c  33E4           LEAU ,S                           
  906e  327C           LEAS -0x4,S                       
  9070  108E609A       LDY #0x609a                       
  9074  FC6074         LDD 0x6074                        
  9077  3606           PSHU  B A                         
  9079  8610           LDA #0x10                         
  907b  17070B         LBSR 0x9789                       
  907e  7F60A3         CLR 0x60a3                        
  9081  CC90CA         LDD #0x90ca                       
  9084  FD6044         STD 0x6044                        
  9087  7F604D         CLR 0x604d                        
  908a  CC0000         LDD #0x0                          
  908d  B3606E         SUBD 0x606e                       
  9090  F3606C         ADDD 0x606c                       
  9093  3606           PSHU  B A                         
  9095  CC0009         LDD #0x9                          
  9098  3606           PSHU  B A                         
  909a  172BA1         LBSR 0xbc3e                       
  909d  3706           PULU  A B                         
  909f  FD6128         STD 0x6128                        
  90a2  B66069         LDA 0x6069                        
  90a5  8001           SUBA #0x1                         
  90a7  B76124         STA 0x6124                        
  90aa  86FF           LDA #0xff                         
  90ac  B7612B         STA 0x612b                        
  90af  B7612A         STA 0x612a                        
  90b2  7D6099         TST 0x6099                        
  90b5  2603           BNE 0x90ba                        
  90b7  7F612B         CLR 0x612b                        
LAB_90ba:
  90ba  7D606E         TST 0x606e                        
  90bd  2B06           BMI 0x90c5                        
  90bf  7F612A         CLR 0x612a                        
  90c2  7C6124         INC 0x6124                        
LAB_90c5:
  90c5  3264           LEAS 0x4,S                        
  90c7  3577           PULS CC A B X Y U                 
  90c9  39             RTS                               

; ---- function FUN_90ca
FUN_90ca:
  90ca  3477           PSHS  U Y X B A CC                
  90cc  3361           LEAU 0x1,S                        
  90ce  3276           LEAS -0xa,S                       
  90d0  7D604D         TST 0x604d                        
  90d3  2679           BNE 0x914e                        
  90d5  7F6126         CLR 0x6126                        
  90d8  3404           PSHS  B                           
  90da  4F             CLRA                              
  90db  F66068         LDB 0x6068                        
  90de  C407           ANDB #0x7                         
  90e0  172EFD         LBSR 0xbfe0                        ; inline[API_FD14]: jump table[D]: 0->9110 1->9149 2->90F3 3->9115 4->9140 5->9110 6->9110 7->9110
  90e3  9110           addr 9110                         
  90e5  9149           addr 9149                         
  90e7  90F3           addr 90f3                         
  90e9  9115           addr 9115                         
  90eb  9140           addr 9140                         
  90ed  9110           addr 9110                         
  90ef  9110           addr 9110                         
  90f1  9110           addr 9110                         

; ---- function FUN_90f3
FUN_90f3:
  90f3  3504           PULS  B                           
  90f5  C110           CMPB #0x10                        
  90f7  10250160       LBCS 0x925b                       
  90fb  C119           CMPB #0x19                        
  90fd  1022015A       LBHI 0x925b                       
  9101  4F             CLRA                              
  9102  C010           SUBB #0x10                        
  9104  10B3606C       CMPD 0x606c                       
  9108  2303           BLS 0x910d                        
  910a  FC606C         LDD 0x606c                        
LAB_910d:
  910d  160132         LBRA 0x9242                       

; ---- function FUN_9110
FUN_9110:
  9110  3504           PULS  B                           
  9112  160146         LBRA 0x925b                       

; ---- function FUN_9115
FUN_9115:
  9115  3504           PULS  B                           
  9117  C110           CMPB #0x10                        
  9119  1025013E       LBCS 0x925b                       
  911d  C119           CMPB #0x19                        
  911f  10220138       LBHI 0x925b                       
  9123  2715           BEQ 0x913a                        
  9125  4F             CLRA                              
  9126  C010           SUBB #0x10                        
  9128  3606           PSHU  B A                         
  912a  FC6128         LDD 0x6128                        
  912d  3606           PSHU  B A                         
  912f  172BAE         LBSR 0xbce0                       
  9132  FC606E         LDD 0x606e                        
  9135  E3C1           ADDD ,U++                         
  9137  160108         LBRA 0x9242                       
LAB_913a:
  913a  FC606C         LDD 0x606c                        
  913d  160102         LBRA 0x9242                       

; ---- function FUN_9140
FUN_9140:
  9140  C6FF           LDB #0xff                         
  9142  F7612C         STB 0x612c                        
  9145  3504           PULS  B                           
  9147  2005           BRA 0x914e                        

; ---- function FUN_9149
FUN_9149:
  9149  7F612C         CLR 0x612c                        
  914c  3504           PULS  B                           
LAB_914e:
  914e  4F             CLRA                              
  914f  172E9E         LBSR 0xbff0                        ; inline[API_FD16]: switch(D) 000C->9236 000D->91F1 001A->91A6 001B->91C5
  9152  000C           dw Ch                             
  9154  9236           addr 9236                         
  9156  000D           dw Dh                             
  9158  91F1           addr 91f1                         
  915a  001A           dw 1Ah                            
  915c  91A6           addr 91a6                         
  915e  001B           dw 1Bh                            
  9160  91C5           addr 91c5                         
  9162  0000           dw 0h                             
  9164  FFFF           dw FFFFh                          
LAB_9166:
  9166  CB20           ADDB #0x20                        
LAB_9168:
  9168  7D604D         TST 0x604d                        
  916b  2603           BNE 0x9170                        
  916d  1700F0         LBSR 0x9260                       
LAB_9170:
  9170  7D6125         TST 0x6125                        
  9173  102700E4       LBEQ 0x925b                       
  9177  170106         LBSR 0x9280                       
  917a  7A6125         DEC 0x6125                        
  917d  108E6900       LDY #0x6900                       
  9181  3440           PSHS  U                           
  9183  CE0008         LDU #0x8                          
  9186  172E1F         LBSR 0xbfa8                       
  9189  3540           PULS  U                           
LAB_918b:
  918b  8E6900         LDX #0x6900                       
  918e  108E609B       LDY #0x609b                       
  9192  CC0008         LDD #0x8                          
  9195  172D7A         LBSR 0xbf12                       
  9198  7D612C         TST 0x612c                        
  919b  1026009D       LBNE 0x923c                       
  919f  AD9F6070       JSR [0x6070]                      
  91a3  1600B5         LBRA 0x925b                       

; ---- function FUN_91a6
FUN_91a6:
  91a6  7D612B         TST 0x612b                        
  91a9  102700AE       LBEQ 0x925b                       
  91ad  7D604D         TST 0x604d                        
  91b0  2603           BNE 0x91b5                        
  91b2  1700AB         LBSR 0x9260                       
LAB_91b5:
  91b5  7D6126         TST 0x6126                        
  91b8  1026009F       LBNE 0x925b                       
  91bc  86FF           LDA #0xff                         
  91be  B76126         STA 0x6126                        
  91c1  C62E           LDB #0x2e                         
  91c3  20A3           BRA 0x9168                        

; ---- function FUN_91c5
FUN_91c5:
  91c5  7D612A         TST 0x612a                        
  91c8  1027008F       LBEQ 0x925b                       
  91cc  7D604D         TST 0x604d                        
  91cf  2603           BNE 0x91d4                        
  91d1  17008C         LBSR 0x9260                       
LAB_91d4:
  91d4  1700A9         LBSR 0x9280                       
  91d7  108E6900       LDY #0x6900                       
  91db  3129           LEAY 0x9,Y                        
LAB_91dd:
  91dd  E6A2           LDB ,-Y                           
  91df  C120           CMPB #0x20                        
  91e1  270A           BEQ 0x91ed                        
  91e3  C12D           CMPB #0x2d                        
  91e5  26F6           BNE 0x91dd                        
  91e7  8620           LDA #0x20                         
LAB_91e9:
  91e9  A7A4           STA ,Y                            
  91eb  209E           BRA 0x918b                        
LAB_91ed:
  91ed  862D           LDA #0x2d                         
  91ef  20F8           BRA 0x91e9                        

; ---- function FUN_91f1
FUN_91f1:
  91f1  7D6127         TST 0x6127                        
  91f4  2765           BEQ 0x925b                        
  91f6  108E6900       LDY #0x6900                       
  91fa  3028           LEAX 0x8,Y                        
  91fc  CC0078         LDD #0x78                         
  91ff  172D10         LBSR 0xbf12                       
  9202  7A6127         DEC 0x6127                        
  9205  2727           BEQ 0x922e                        
  9207  7F6126         CLR 0x6126                        
  920a  8E6900         LDX #0x6900                       
  920d  3440           PSHS  U                           
  920f  CE0008         LDU #0x8                          
  9212  C62E           LDB #0x2e                         
  9214  172D58         LBSR 0xbf6f                       
  9217  3540           PULS  U                           
  9219  2605           BNE 0x9220                        
  921b  C6FF           LDB #0xff                         
  921d  F76126         STB 0x6126                        
LAB_9220:
  9220  B66900         LDA 0x6900                        
  9223  B76125         STA 0x6125                        
  9226  8620           LDA #0x20                         
  9228  B76900         STA 0x6900                        
  922b  16FF5D         LBRA 0x918b                       
LAB_922e:
  922e  7F604D         CLR 0x604d                        
  9231  FC612D         LDD 0x612d                        
  9234  200C           BRA 0x9242                        

; ---- function FUN_9236
FUN_9236:
  9236  7F604D         CLR 0x604d                        
  9239  7F6127         CLR 0x6127                        
LAB_923c:
  923c  8E609A         LDX #0x609a                       
  923f  170074         LBSR 0x92b6                       
LAB_9242:
  9242  FD6074         STD 0x6074                        
  9245  3606           PSHU  B A                         
  9247  8610           LDA #0x10                         
  9249  108E609A       LDY #0x609a                       
  924d  170539         LBSR 0x9789                       
  9250  AD9F6070       JSR [0x6070]                      
  9254  FC6074         LDD 0x6074                        
  9257  AD9F606A       JSR [0x606a]                      
LAB_925b:
  925b  326A           LEAS 0xa,S                        
  925d  3577           PULS CC A B X Y U                 
  925f  39             RTS                               

; ---- function FUN_9260
FUN_9260:
  9260  3426           PSHS  Y B A                       
  9262  B66124         LDA 0x6124                        
  9265  B76125         STA 0x6125                        
  9268  86FF           LDA #0xff                         
  926a  B7604D         STA 0x604d                        
  926d  108E6900       LDY #0x6900                       
  9271  172CE8         LBSR 0xbf5c                        ; inline[API_FD0C]: $0008 20
  9274  0008           dw 8h                             
  9276  20             db 20h                            
LAB_9277:
  9277  FC6074         LDD 0x6074                        
  927a  FD612D         STD 0x612d                        
  927d  3526           PULS  A B Y                       
  927f  39             RTS                               

; ---- function FUN_9280
FUN_9280:
  9280  3437           PSHS  Y X B A CC                  
  9282  B66125         LDA 0x6125                        
  9285  B76900         STA 0x6900                        
  9288  108E6978       LDY #0x6978                       
  928c  3038           LEAX -0x8,Y                       
  928e  C60F           LDB #0xf                          
LAB_9290:
  9290  3404           PSHS  B                           
  9292  CC0008         LDD #0x8                          
  9295  172C7A         LBSR 0xbf12                       
  9298  3130           LEAY -0x10,Y                      
  929a  3038           LEAX -0x8,Y                       
  929c  3504           PULS  B                           
  929e  5A             DECB                              
  929f  26EF           BNE 0x9290                        
  92a1  7C6127         INC 0x6127                        
  92a4  860F           LDA #0xf                          
  92a6  B16127         CMPA 0x6127                       
  92a9  2403           BCC 0x92ae                        
  92ab  B76127         STA 0x6127                        
LAB_92ae:
  92ae  8620           LDA #0x20                         
  92b0  B76900         STA 0x6900                        
  92b3  3537           PULS CC A B X Y                   
  92b5  39             RTS                               

; ---- function API_FC20
API_FC20:
  92b6  3471           PSHS  U Y X CC                    
  92b8  327A           LEAS -0x6,S                       
  92ba  8E609A         LDX #0x609a                       
  92bd  CC0000         LDD #0x0                          
  92c0  3606           PSHU  B A                         
  92c2  E761           STB 0x1,S                         
  92c4  E762           STB 0x2,S                         
  92c6  E763           STB 0x3,S                         
  92c8  E764           STB 0x4,S                         
  92ca  E7E4           STB ,S                            
LAB_92cc:
  92cc  E680           LDB ,X+                           
  92ce  C100           CMPB #0x0                         
  92d0  2757           BEQ 0x9329                        
  92d2  C120           CMPB #0x20                        
  92d4  27F6           BEQ 0x92cc                        
  92d6  C12D           CMPB #0x2d                        
  92d8  273E           BEQ 0x9318                        
  92da  C12E           CMPB #0x2e                        
  92dc  2740           BEQ 0x931e                        
  92de  C130           CMPB #0x30                        
  92e0  1025009E       LBCS 0x9382                       
  92e4  C139           CMPB #0x39                        
  92e6  10220098       LBHI 0x9382                       
  92ea  108E000A       LDY #0xa                          
  92ee  3620           PSHU  Y                           
  92f0  1729F2         LBSR 0xbce5                       
  92f3  3720           PULU  Y                           
  92f5  108C0000       CMPY #0x0                         
  92f9  10260085       LBNE 0x9382                       
  92fd  C030           SUBB #0x30                        
  92ff  4F             CLRA                              
  9300  3606           PSHU  B A                         
  9302  172921         LBSR 0xbc26                       
  9305  6DC4           TST ,U                            
  9307  2B79           BMI 0x9382                        
  9309  6D64           TST 0x4,S                         
  930b  27BF           BEQ 0x92cc                        
  930d  6C63           INC 0x3,S                         
  930f  A663           LDA 0x3,S                         
  9311  B16099         CMPA 0x6099                       
  9314  2713           BEQ 0x9329                        
  9316  20B4           BRA 0x92cc                        
LAB_9318:
  9318  86FF           LDA #0xff                         
  931a  A7E4           STA ,S                            
  931c  20AE           BRA 0x92cc                        
LAB_931e:
  931e  86FF           LDA #0xff                         
  9320  A764           STA 0x4,S                         
  9322  7D6099         TST 0x6099                        
  9325  26A5           BNE 0x92cc                        
  9327  2000           BRA 0x9329                        
LAB_9329:
  9329  A61F           LDA -0x1,X                        
  932b  2718           BEQ 0x9345                        
  932d  A684           LDA ,X                            
  932f  2714           BEQ 0x9345                        
  9331  8135           CMPA #0x35                        
  9333  2510           BCS 0x9345                        
  9335  8139           CMPA #0x39                        
  9337  220C           BHI 0x9345                        
  9339  CC0001         LDD #0x1                          
  933c  3606           PSHU  B A                         
  933e  1728E5         LBSR 0xbc26                       
  9341  6DC4           TST ,U                            
  9343  2B3D           BMI 0x9382                        
LAB_9345:
  9345  A663           LDA 0x3,S                         
  9347  B16099         CMPA 0x6099                       
  934a  271A           BEQ 0x9366                        
  934c  108E000A       LDY #0xa                          
  9350  3620           PSHU  Y                           
  9352  172990         LBSR 0xbce5                       
  9355  3720           PULU  Y                           
  9357  108C0000       CMPY #0x0                         
  935b  2625           BNE 0x9382                        
  935d  6DC4           TST ,U                            
  935f  2B21           BMI 0x9382                        
  9361  4C             INCA                              
  9362  A763           STA 0x3,S                         
  9364  20DF           BRA 0x9345                        
LAB_9366:
  9366  6DE4           TST ,S                            
  9368  2703           BEQ 0x936d                        
  936a  1728AE         LBSR 0xbc1b                       
LAB_936d:
  936d  3720           PULU  Y                           
  936f  FC606E         LDD 0x606e                        
  9372  3606           PSHU  B A                         
  9374  FC606C         LDD 0x606c                        
  9377  3606           PSHU  B A                         
  9379  3620           PSHU  Y                           
  937b  172819         LBSR 0xbb97                       
  937e  3706           PULU  A B                         
  9380  200C           BRA 0x938e                        
LAB_9382:
  9382  6DE4           TST ,S                            
  9384  2705           BEQ 0x938b                        
  9386  FC606E         LDD 0x606e                        
  9389  2003           BRA 0x938e                        
LAB_938b:
  938b  FC606C         LDD 0x606c                        
LAB_938e:
  938e  3266           LEAS 0x6,S                        
  9390  3571           PULS CC X Y U                     
  9392  39             RTS                               

; ---- function API_FC22
API_FC22:
  9393  3406           PSHS  B A                         
  9395  8608           LDA #0x8                          
  9397  B76133         STA 0x6133                        
  939a  3506           PULS  A B                         
  939c  39             RTS                               

; ---- function API_FC24
API_FC24:
  939d  7C612F         INC 0x612f                        
  93a0  2603           BNE 0x93a5                        
  93a2  7A612F         DEC 0x612f                        
LAB_93a5:
  93a5  F68056         LDB 0x8056                        
  93a8  C4C0           ANDB #0xc0                        
  93aa  54             LSRB                              
  93ab  54             LSRB                              
  93ac  FA6131         ORB 0x6131                        
  93af  54             LSRB                              
  93b0  54             LSRB                              
  93b1  F76131         STB 0x6131                        
  93b4  8E93EC         LDX #0x93ec                       
  93b7  A685           LDA B,X                           
  93b9  270D           BEQ 0x93c8                        
  93bb  7D6134         TST 0x6134                        
  93be  2621           BNE 0x93e1                        
  93c0  B76132         STA 0x6132                        
  93c3  B76134         STA 0x6134                        
  93c6  2019           BRA 0x93e1                        
LAB_93c8:
  93c8  C40C           ANDB #0xc                         
  93ca  2715           BEQ 0x93e1                        
  93cc  C10C           CMPB #0xc                         
  93ce  2711           BEQ 0x93e1                        
  93d0  F16133         CMPB 0x6133                       
  93d3  2712           BEQ 0x93e7                        
  93d5  B66132         LDA 0x6132                        
  93d8  F76133         STB 0x6133                        
  93db  BB6130         ADDA 0x6130                       
  93de  B76130         STA 0x6130                        
LAB_93e1:
  93e1  7D6135         TST 0x6135                        
  93e4  2616           BNE 0x93fc                        
  93e6  39             RTS                               
LAB_93e7:
  93e7  7F6134         CLR 0x6134                        
  93ea  20F5           BRA 0x93e1                        
DAT_93ec:
  93ec  00             ?? 00h                            
  93ed  .db 01 FF 00 FF 00 00 01 01 00 00 FF 00 FF 01 00     ; ...............
LAB_93fc:
  93fc  B66130         LDA 0x6130                        
  93ff  B7605E         STA 0x605e                        
  9402  B6612F         LDA 0x612f                        
  9405  B76060         STA 0x6060                        
  9408  4F             CLRA                              
  9409  B76130         STA 0x6130                        
  940c  B7612F         STA 0x612f                        
  940f  B76135         STA 0x6135                        
  9412  39             RTS                               

; ---- function API_FC26
API_FC26:
  9413  3410           PSHS  X                           
  9415  86FF           LDA #0xff                         
  9417  B76135         STA 0x6135                        
  941a  8E07D0         LDX #0x7d0                        
LAB_941d:
  941d  301F           LEAX -0x1,X                       
  941f  270E           BEQ 0x942f                        
  9421  7D6135         TST 0x6135                        
  9424  26F7           BNE 0x941d                        
  9426  B6605E         LDA 0x605e                        
  9429  F66060         LDB 0x6060                        
LAB_942c:
  942c  3510           PULS  X                           
  942e  39             RTS                               
LAB_942f:
  942f  CC0000         LDD #0x0                          
  9432  20F8           BRA 0x942c                        

; ---- function API_FC28
API_FC28:
  9434  17FFDC         LBSR 0x9413                       
  9437  1700D7         LBSR 0x9511                       
  943a  39             RTS                               

; ---- function FUN_943b
FUN_943b:
  943b  3406           PSHS  B A                         
  943d  F66066         LDB 0x6066                        
  9440  C407           ANDB #0x7                         
  9442  4F             CLRA                              
  9443  172B9A         LBSR 0xbfe0                        ; inline[API_FD14]: jump table[D]: 0->9468 1->946B 2->9456 3->9458 4->9468 5->9468 6->9468 7->9468
  9446  9468           addr 9468                         
  9448  946B           addr 946b                         
  944a  9456           addr 9456                         
  944c  9458           addr 9458                         
  944e  9468           addr 9468                         
  9450  9468           addr 9468                         
  9452  9468           addr 9468                         
  9454  9468           addr 9468                         

; ---- function thunk_FUN_946b
thunk_FUN_946b:
  9456  2013           BRA 0x946b                        

; ---- function FUN_9458
FUN_9458:
  9458  17FFB8         LBSR 0x9413                       
  945b  17004A         LBSR 0x94a8                       
  945e  1F89           TFR A,B                           
  9460  5D             TSTB                              
  9461  2705           BEQ 0x9468                        
  9463  1D             SEX                               

; ---- function FUN_9464
FUN_9464:
  9464  AD9F605C       JSR [0x605c]                      

; ---- function FUN_9468
FUN_9468:
  9468  3506           PULS  A B                         
  946a  39             RTS                               

; ---- function FUN_946b
FUN_946b:
  946b  17FFA5         LBSR 0x9413                       
  946e  170037         LBSR 0x94a8                       
  9471  1F89           TFR A,B                           
  9473  5D             TSTB                              
  9474  1D             SEX                               
  9475  27F1           BEQ 0x9468                        
  9477  3606           PSHU  B A                         
  9479  FC60DC         LDD 0x60dc                        
  947c  3606           PSHU  B A                         
  947e  172859         LBSR 0xbcda                       
  9481  3706           PULU  A B                         
  9483  10830000       CMPD #0x0                         
  9487  2B0E           BMI 0x9497                        
  9489  F36062         ADDD 0x6062                       
  948c  10B36064       CMPD 0x6064                       
  9490  2311           BLS 0x94a3                        
  9492  FC6064         LDD 0x6064                        
  9495  200C           BRA 0x94a3                        
LAB_9497:
  9497  F36062         ADDD 0x6062                       
  949a  10B36062       CMPD 0x6062                       
  949e  2303           BLS 0x94a3                        
  94a0  CC0000         LDD #0x0                          
LAB_94a3:
  94a3  FD6062         STD 0x6062                        
  94a6  20BC           BRA 0x9464                        

; ---- function FUN_94a8
FUN_94a8:
  94a8  3404           PSHS  B                           
  94aa  4D             TSTA                              
  94ab  2739           BEQ 0x94e6                        
  94ad  3402           PSHS  A                           
  94af  F66136         LDB 0x6136                        
  94b2  C403           ANDB #0x3                         
  94b4  1D             SEX                               
  94b5  172B28         LBSR 0xbfe0                        ; inline[API_FD14]: jump table[D]: 0->94E4 1->94C0 2->94CB 3->94D7
  94b8  94E4           addr 94e4                         
  94ba  94C0           addr 94c0                         
  94bc  94CB           addr 94cb                         
  94be  94D7           addr 94d7                         

; ---- function FUN_94c0
FUN_94c0:
  94c0  170025         LBSR 0x94e8                       
  94c3  47             ASRA                              
  94c4  170032         LBSR 0x94f9                       
  94c7  3261           LEAS 0x1,S                        
  94c9  201B           BRA 0x94e6                        

; ---- function FUN_94cb
FUN_94cb:
  94cb  17001A         LBSR 0x94e8                       
  94ce  47             ASRA                              
  94cf  47             ASRA                              
  94d0  170026         LBSR 0x94f9                       
  94d3  3261           LEAS 0x1,S                        
  94d5  200F           BRA 0x94e6                        

; ---- function FUN_94d7
FUN_94d7:
  94d7  17000E         LBSR 0x94e8                       
  94da  47             ASRA                              
  94db  47             ASRA                              
  94dc  47             ASRA                              
  94dd  170019         LBSR 0x94f9                       
  94e0  3261           LEAS 0x1,S                        
  94e2  2002           BRA 0x94e6                        

; ---- function FUN_94e4
FUN_94e4:
  94e4  3502           PULS  A                           
LAB_94e6:
  94e6  3584           PULS  B PC                        

; ---- function FUN_94e8
FUN_94e8:
  94e8  A662           LDA 0x2,S                         
  94ea  BB6137         ADDA 0x6137                       
  94ed  2B05           BMI 0x94f4                        
  94ef  7F6139         CLR 0x6139                        
  94f2  2004           BRA 0x94f8                        
LAB_94f4:
  94f4  B76139         STA 0x6139                        
  94f7  40             NEGA                              
LAB_94f8:
  94f8  39             RTS                               

; ---- function FUN_94f9
FUN_94f9:
  94f9  4D             TSTA                              
  94fa  260B           BNE 0x9507                        
  94fc  A662           LDA 0x2,S                         
  94fe  BB6137         ADDA 0x6137                       
  9501  B76137         STA 0x6137                        
  9504  4F             CLRA                              
  9505  2009           BRA 0x9510                        
LAB_9507:
  9507  7F6137         CLR 0x6137                        
  950a  7D6139         TST 0x6139                        
  950d  2A01           BPL 0x9510                        
  950f  40             NEGA                              
LAB_9510:
  9510  39             RTS                               

; ---- function FUN_9511
FUN_9511:
  9511  3406           PSHS  B A                         
  9513  F66067         LDB 0x6067                        
  9516  C4F0           ANDB #0xf0                        
  9518  270C           BEQ 0x9526                        
  951a  C5C0           BITB #0xc0                        
  951c  2614           BNE 0x9532                        
  951e  C520           BITB #0x20                        
  9520  260C           BNE 0x952e                        
  9522  C510           BITB #0x10                        
  9524  2604           BNE 0x952a                        
LAB_9526:
  9526  8600           LDA #0x0                          
  9528  200A           BRA 0x9534                        
LAB_952a:
  952a  8601           LDA #0x1                          
  952c  2006           BRA 0x9534                        
LAB_952e:
  952e  8602           LDA #0x2                          
  9530  2002           BRA 0x9534                        
LAB_9532:
  9532  8603           LDA #0x3                          
LAB_9534:
  9534  B76136         STA 0x6136                        
  9537  7F6137         CLR 0x6137                        
  953a  3586           PULS  A B PC                      

; ---- function API_FC90
API_FC90:
  953c  3407           PSHS  B A CC                      
  953e  8603           LDA #0x3                          
  9540  B78300         STA 0x8300                        
  9543  8615           LDA #0x15                         
  9545  B78300         STA 0x8300                        
  9548  B68301         LDA 0x8301                        
  954b  3507           PULS CC A B                       
  954d  39             RTS                               

; ---- function API_FC92
API_FC92:
  954e  3403           PSHS  A CC                        
  9550  8695           LDA #0x95                         
  9552  B78300         STA 0x8300                        
  9555  B68301         LDA 0x8301                        
  9558  3503           PULS CC A                         
  955a  39             RTS                               

; ---- function API_FC94
API_FC94:
  955b  3403           PSHS  A CC                        
  955d  8615           LDA #0x15                         
  955f  B78300         STA 0x8300                        
  9562  3503           PULS CC A                         
  9564  39             RTS                               

; ---- function API_FDD8
API_FDD8:
  9565  3406           PSHS  B A                         
  9567  17FFD2         LBSR 0x953c                       
  956a  CC0000         LDD #0x0                          
  956d  FD6083         STD 0x6083                        
  9570  FD6085         STD 0x6085                        
  9573  7F6081         CLR 0x6081                        
  9576  86FF           LDA #0xff                         
  9578  B76082         STA 0x6082                        
  957b  7F6087         CLR 0x6087                        
  957e  CC95FD         LDD #0x95fd                       
  9581  175574         LBSR 0xeaf8                        ; inline[API_FE30]: $68A0
  9584  68A0           addr 68a0                         
LAB_9586:
  9586  175583         LBSR 0xeb0c                        ; inline[API_FE2E]: $68A0
  9589  68A0           addr 68a0                         
LAB_958b:
  958b  17557E         LBSR 0xeb0c                        ; inline[API_FE2E]: $68C0
  958e  68C0           addr 68c0                         
LAB_9590:
  9590  CC8601         LDD #0x8601                       
  9593  FD60F2         STD 0x60f2                        
  9596  CC8877         LDD #0x8877                       
  9599  FD608B         STD 0x608b                        
  959c  C6A0           LDB #0xa0                         
  959e  1768DF         LBSR 0xfe80                       
  95a1  F60116         LDB 0x0116                        
  95a4  F7619C         STB 0x619c                        
  95a7  F6010F         LDB 0x010f                        
  95aa  F76161         STB 0x6161                        
  95ad  F60111         LDB 0x0111                        
  95b0  F760FC         STB 0x60fc                        
  95b3  F60117         LDB 0x0117                        
  95b6  F7619D         STB 0x619d                        
  95b9  C601           LDB #0x1                          
  95bb  F7613A         STB 0x613a                        
  95be  1768D9         LBSR 0xfe9a                       
  95c1  3506           PULS  A B                         
  95c3  39             RTS                               

; ---- function API_FDDA
API_FDDA:
  95c4  3412           PSHS  X A                         
  95c6  7D6082         TST 0x6082                        
  95c9  2625           BNE 0x95f0                        
  95cb  BE6085         LDX 0x6085                        
  95ce  E6897800       LDB 0x7800,X                      
  95d2  3405           PSHS  B CC                        
  95d4  1A50           ORCC #0x50                        
  95d6  1F10           TFR X,D                           
  95d8  C30001         ADDD #0x1                         
  95db  8403           ANDA #0x3                         
  95dd  FD6085         STD 0x6085                        
  95e0  10B36083       CMPD 0x6083                       
  95e4  2605           BNE 0x95eb                        
  95e6  86FF           LDA #0xff                         
  95e8  B76082         STA 0x6082                        
LAB_95eb:
  95eb  3505           PULS CC B                         
  95ed  7F6081         CLR 0x6081                        
LAB_95f0:
  95f0  3512           PULS  A X                         
  95f2  39             RTS                               

; ---- function API_FC96
API_FC96:
  95f3  3402           PSHS  A                           
  95f5  8602           LDA #0x2                          
  95f7  B58300         BITA 0x8300                       
  95fa  3502           PULS  A                           
  95fc  39             RTS                               

; ---- function API_FC98
API_FC98:
  95fd  3406           PSHS  B A                         
  95ff  8602           LDA #0x2                          
LAB_9601:
  9601  B58300         BITA 0x8300                       
  9604  27FB           BEQ 0x9601                        
  9606  F78301         STB 0x8301                        
  9609  1A04           ORCC #0x4                         
  960b  3506           PULS  A B                         
  960d  39             RTS                               

; ---- function API_FC9A
API_FC9A:
  960e  3406           PSHS  B A                         
LAB_9610:
  9610  E680           LDB ,X+                           
  9612  C1FF           CMPB #0xff                        
  9614  270C           BEQ 0x9622                        
  9616  8602           LDA #0x2                          
LAB_9618:
  9618  B58300         BITA 0x8300                       
  961b  27FB           BEQ 0x9618                        
  961d  F78301         STB 0x8301                        
  9620  20EE           BRA 0x9610                        
LAB_9622:
  9622  3506           PULS  A B                         
  9624  39             RTS                               

; ---- function API_FC2A
API_FC2A:
  9625  17002A         LBSR 0x9652                       
  9628  3407           PSHS  B A CC                      
  962a  1F98           TFR B,A                           
  962c  FD8062         STD 0x8062                        
  962f  3507           PULS CC A B                       
  9631  39             RTS                               

; ---- function API_FC2C
API_FC2C:
  9632  17001D         LBSR 0x9652                       
  9635  3403           PSHS  A CC                        
  9637  FC8062         LDD 0x8062                        
  963a  3503           PULS CC A                         
  963c  39             RTS                               

; ---- function API_FC2E
API_FC2E:
  963d  170012         LBSR 0x9652                       

; ---- function FUN_9640
FUN_9640:
  9640  3407           PSHS  B A CC                      
  9642  1F98           TFR B,A                           
  9644  FD8060         STD 0x8060                        
  9647  3507           PULS CC A B                       
  9649  39             RTS                               

; ---- function API_FC30
API_FC30:
  964a  3403           PSHS  A CC                        
  964c  FC8060         LDD 0x8060                        
  964f  3503           PULS CC A                         
  9651  39             RTS                               

; ---- function API_FC32
API_FC32:
  9652  3416           PSHS  X B A                       
  9654  8E03E8         LDX #0x3e8                        
LAB_9657:
  9657  301F           LEAX -0x1,X                       
  9659  2707           BEQ 0x9662                        
  965b  FC8060         LDD 0x8060                        
  965e  C480           ANDB #0x80                        
  9660  26F5           BNE 0x9657                        
LAB_9662:
  9662  3516           PULS  A B X                       
  9664  39             RTS                               

; ---- function API_FC34
API_FC34:
  9665  3407           PSHS  B A CC                      
  9667  CC05DC         LDD #0x5dc                        
  966a  172A36         LBSR 0xc0a3                       
  966d  C638           LDB #0x38                         
  966f  17FFCE         LBSR 0x9640                       
  9672  3404           PSHS  B                           
  9674  CC019A         LDD #0x19a                        
  9677  172A29         LBSR 0xc0a3                       
  967a  E6E4           LDB ,S                            
  967c  17FFC1         LBSR 0x9640                       
  967f  CC000A         LDD #0xa                          
  9682  172A1E         LBSR 0xc0a3                       
  9685  3504           PULS  B                           
  9687  17FFB6         LBSR 0x9640                       
  968a  17FFB0         LBSR 0x963d                       
  968d  C60C           LDB #0xc                          
  968f  17FFAB         LBSR 0x963d                       
  9692  C601           LDB #0x1                          
  9694  17FFA6         LBSR 0x963d                       
  9697  C606           LDB #0x6                          
  9699  17FFA1         LBSR 0x963d                       
  969c  3507           PULS CC A B                       
  969e  39             RTS                               

; ---- function API_FDB2
API_FDB2:
  969f  3405           PSHS  B CC                        
  96a1  F660C1         LDB 0x60c1                        
  96a4  C403           ANDB #0x3                         
  96a6  CA0C           ORB #0xc                          
  96a8  17FF92         LBSR 0x963d                       
  96ab  3505           PULS CC B                         
  96ad  39             RTS                               

; ---- function API_FDB0
API_FDB0:
  96ae  3405           PSHS  B CC                        
  96b0  C60C           LDB #0xc                          
  96b2  17FF88         LBSR 0x963d                       
  96b5  3505           PULS CC B                         
  96b7  39             RTS                               

; ---- function API_FDB8
API_FDB8:
  96b8  F760C0         STB 0x60c0                        
  96bb  8D1E           BSR 0x96db                        
  96bd  39             RTS                               

; ---- function API_FDB4
API_FDB4:
  96be  3405           PSHS  B CC                        
  96c0  17FF87         LBSR 0x964a                       
  96c3  C4FF           ANDB #0xff                        
  96c5  C129           CMPB #0x29                        
  96c7  2302           BLS 0x96cb                        
  96c9  C018           SUBB #0x18                        
LAB_96cb:
  96cb  F760C0         STB 0x60c0                        
  96ce  3505           PULS CC B                         
  96d0  39             RTS                               

; ---- function API_FDB6
API_FDB6:
  96d1  3405           PSHS  B CC                        
  96d3  F660C0         LDB 0x60c0                        
  96d6  8D03           BSR 0x96db                        
  96d8  3505           PULS CC B                         
  96da  39             RTS                               

;; Kernel API slot $FC36: B = position 0-79 (2 x 40 LCD)

; ---- function LcdSetCursor
LcdSetCursor:
  96db  3405           PSHS  B CC                        
  96dd  C47F           ANDB #0x7f                        
  96df  C128           CMPB #0x28                        
  96e1  2D02           BLT 0x96e5                        
  96e3  CB18           ADDB #0x18                        
LAB_96e5:
  96e5  CA80           ORB #0x80                         
  96e7  17FF53         LBSR 0x963d                       
  96ea  3505           PULS CC B                         
  96ec  39             RTS                               

;; Kernel API slot $FC38: inline text with control codes 0-7

; ---- function LcdPrintInline
LcdPrintInline:
  96ed  3437           PSHS  Y X B A CC                  
  96ef  AE67           LDX 0x7,S                         

; ---- function FUN_96f1
FUN_96f1:
  96f1  E680           LDB ,X+                           
  96f3  C5F8           BITB #0xf8                        
  96f5  2705           BEQ 0x96fc                        
  96f7  17FF2B         LBSR 0x9625                       
  96fa  20F5           BRA 0x96f1                        
LAB_96fc:
  96fc  4F             CLRA                              
  96fd  C407           ANDB #0x7                         
  96ff  1728DE         LBSR 0xbfe0                        ; inline[API_FD14]: jump table[D]: 0->9758 1->9712 2->9719 3->9724 4->9731 5->973E 6->9720 7->96F1
  9702  9758           addr 9758                         
  9704  9712           addr 9712                         
  9706  9719           addr 9719                         
  9708  9724           addr 9724                         
  970a  9731           addr 9731                         
  970c  973E           addr 973e                         
  970e  9720           addr 9720                         
  9710  96F1           addr 96f1                         

; ---- function FUN_9712
FUN_9712:
  9712  C601           LDB #0x1                          
  9714  17FF26         LBSR 0x963d                       
  9717  20D8           BRA 0x96f1                        

; ---- function FUN_9719
FUN_9719:
  9719  E680           LDB ,X+                           
  971b  17FFBD         LBSR 0x96db                       
  971e  20D1           BRA 0x96f1                        

; ---- function FUN_9720
FUN_9720:
  9720  3706           PULU  A B                         
  9722  2002           BRA 0x9726                        

; ---- function FUN_9724
FUN_9724:
  9724  EC81           LDD ,X++                          
LAB_9726:
  9726  3410           PSHS  X                           
  9728  1F01           TFR D,X                           
  972a  17004E         LBSR 0x977b                       
  972d  3510           PULS  X                           
  972f  20C0           BRA 0x96f1                        

; ---- function FUN_9731
FUN_9731:
  9731  108E60A4       LDY #0x60a4                       
  9735  A680           LDA ,X+                           
  9737  E680           LDB ,X+                           
  9739  17004D         LBSR 0x9789                       
  973c  20B3           BRA 0x96f1                        

; ---- function FUN_973e
FUN_973e:
  973e  17FF09         LBSR 0x964a                       
  9741  C47F           ANDB #0x7f                        
  9743  3424           PSHS  Y B                         
  9745  A680           LDA ,X+                           
  9747  C620           LDB #0x20                         
LAB_9749:
  9749  17FED9         LBSR 0x9625                       
  974c  4A             DECA                              
  974d  26FA           BNE 0x9749                        
  974f  3524           PULS  B Y                         
  9751  CA80           ORB #0x80                         
  9753  17FEE7         LBSR 0x963d                       
  9756  2099           BRA 0x96f1                        

; ---- function FUN_9758
FUN_9758:
  9758  AF67           STX 0x7,S                         
  975a  3537           PULS CC A B X Y                   
  975c  39             RTS                               

; ---- function API_FC3A
API_FC3A:
  975d  3407           PSHS  B A CC                      
  975f  1F98           TFR B,A                           
LAB_9761:
  9761  E680           LDB ,X+                           
  9763  17FEBF         LBSR 0x9625                       
  9766  4A             DECA                              
  9767  26F8           BNE 0x9761                        
  9769  3507           PULS CC A B                       
  976b  39             RTS                               

; ---- function API_FC3C
API_FC3C:
  976c  3407           PSHS  B A CC                      
  976e  1F98           TFR B,A                           
LAB_9770:
  9770  17FEBF         LBSR 0x9632                       
  9773  E7A0           STB ,Y+                           
  9775  4A             DECA                              
  9776  26F8           BNE 0x9770                        
  9778  3507           PULS CC A B                       
  977a  39             RTS                               

; ---- function API_FC3E
API_FC3E:
  977b  3405           PSHS  B CC                        
LAB_977d:
  977d  E680           LDB ,X+                           
  977f  2705           BEQ 0x9786                        
  9781  17FEA1         LBSR 0x9625                       
  9784  20F7           BRA 0x977d                        
LAB_9786:
  9786  3505           PULS CC B                         
  9788  39             RTS                               

; ---- function API_FC40
API_FC40:
  9789  3436           PSHS  Y X B A                     
  978b  327E           LEAS -0x2,S                       
  978d  3402           PSHS  A                           
  978f  C600           LDB #0x0                          
  9791  E729           STB 0x9,Y                         
  9793  8608           LDA #0x8                          
  9795  C620           LDB #0x20                         
LAB_9797:
  9797  E7A6           STB A,Y                           
  9799  4A             DECA                              
  979a  2AFB           BPL 0x9797                        
  979c  E6E4           LDB ,S                            
  979e  54             LSRB                              
  979f  54             LSRB                              
  97a0  54             LSRB                              
  97a1  54             LSRB                              
  97a2  4F             CLRA                              
  97a3  17283A         LBSR 0xbfe0                        ; inline[API_FD14]: jump table[D]: 0->97B3 1->97AE 2->9815 3->9857
  97a6  97B3           addr 97b3                         
  97a8  97AE           addr 97ae                         
  97aa  9815           addr 9815                         
  97ac  9857           addr 9857                         

; ---- function FUN_97ae
FUN_97ae:
  97ae  F66099         LDB 0x6099                        
  97b1  E7E4           STB ,S                            

; ---- function FUN_97b3
FUN_97b3:
  97b3  6DE4           TST ,S                            
  97b5  2602           BNE 0x97b9                        
  97b7  3121           LEAY 0x1,Y                        
LAB_97b9:
  97b9  86FF           LDA #0xff                         
  97bb  A761           STA 0x1,S                         
  97bd  3123           LEAY 0x3,Y                        
  97bf  6F62           CLR 0x2,S                         
  97c1  6DC4           TST ,U                            
  97c3  2C05           BGE 0x97ca                        
  97c5  A762           STA 0x2,S                         
  97c7  17235D         LBSR 0xbb27                       
LAB_97ca:
  97ca  8605           LDA #0x5                          
  97cc  A0E4           SUBA ,S                           
  97ce  30A6           LEAX A,Y                          
  97d0  8D34           BSR 0x9806                        
  97d2  CC2710         LDD #0x2710                       
  97d5  8D62           BSR 0x9839                        
  97d7  8D2D           BSR 0x9806                        
  97d9  CC03E8         LDD #0x3e8                        
  97dc  8D5B           BSR 0x9839                        
  97de  8D26           BSR 0x9806                        
  97e0  CC0064         LDD #0x64                         
  97e3  8D54           BSR 0x9839                        
  97e5  8D1F           BSR 0x9806                        
  97e7  CC000A         LDD #0xa                          
  97ea  17004C         LBSR 0x9839                       
  97ed  8D17           BSR 0x9806                        
  97ef  6F61           CLR 0x1,S                         
  97f1  CC0001         LDD #0x1                          
  97f4  8D43           BSR 0x9839                        
  97f6  6D62           TST 0x2,S                         
  97f8  270A           BEQ 0x9804                        
  97fa  8620           LDA #0x20                         
LAB_97fc:
  97fc  A1A2           CMPA ,-Y                          
  97fe  26FC           BNE 0x97fc                        
  9800  C62D           LDB #0x2d                         
  9802  E7A4           STB ,Y                            
LAB_9804:
  9804  206F           BRA 0x9875                        

; ---- function FUN_9806
FUN_9806:
  9806  3420           PSHS  Y                           
  9808  ACE4           CMPX ,S                           
  980a  2606           BNE 0x9812                        
  980c  6F65           CLR 0x5,S                         
  980e  C62E           LDB #0x2e                         
  9810  E7A0           STB ,Y+                           
LAB_9812:
  9812  3262           LEAS 0x2,S                        
  9814  39             RTS                               

; ---- function FUN_9815
FUN_9815:
  9815  86FF           LDA #0xff                         
  9817  A761           STA 0x1,S                         
  9819  3124           LEAY 0x4,Y                        
  981b  CC2710         LDD #0x2710                       
  981e  8D19           BSR 0x9839                        
  9820  CC03E8         LDD #0x3e8                        
  9823  8D14           BSR 0x9839                        
  9825  CC0064         LDD #0x64                         
  9828  8D0F           BSR 0x9839                        
  982a  CC000A         LDD #0xa                          
  982d  170009         LBSR 0x9839                       
  9830  CC0001         LDD #0x1                          
  9833  6F61           CLR 0x1,S                         
  9835  8D02           BSR 0x9839                        
  9837  203C           BRA 0x9875                        

; ---- function FUN_9839
FUN_9839:
  9839  3606           PSHU  B A                         
  983b  172466         LBSR 0xbca4                       
  983e  3706           PULU  A B                         
  9840  6D63           TST 0x3,S                         
  9842  2605           BNE 0x9849                        
LAB_9844:
  9844  8D38           BSR 0x987e                        
LAB_9846:
  9846  E7A0           STB ,Y+                           
  9848  39             RTS                               
LAB_9849:
  9849  10830000       CMPD #0x0                         
  984d  2704           BEQ 0x9853                        
  984f  6F63           CLR 0x3,S                         
  9851  20F1           BRA 0x9844                        
LAB_9853:
  9853  C620           LDB #0x20                         
  9855  20EF           BRA 0x9846                        

; ---- function FUN_9857
FUN_9857:
  9857  6F61           CLR 0x1,S                         
  9859  3124           LEAY 0x4,Y                        
  985b  CC1000         LDD #0x1000                       
  985e  8DD9           BSR 0x9839                        
  9860  CC0100         LDD #0x100                        
  9863  8DD4           BSR 0x9839                        
  9865  CC0010         LDD #0x10                         
  9868  8DCF           BSR 0x9839                        
  986a  CC0001         LDD #0x1                          
  986d  8DCA           BSR 0x9839                        
  986f  C648           LDB #0x48                         
  9871  E7A4           STB ,Y                            
  9873  2000           BRA 0x9875                        

; ---- function FUN_9875
FUN_9875:
  9875  3342           LEAU 0x2,U                        
  9877  3262           LEAS 0x2,S                        
  9879  3502           PULS  A                           
  987b  3536           PULS  A B X Y                     
  987d  39             RTS                               

; ---- function FUN_987e
FUN_987e:
  987e  C40F           ANDB #0xf                         
  9880  C109           CMPB #0x9                         
  9882  2204           BHI 0x9888                        
  9884  CB30           ADDB #0x30                        
  9886  2002           BRA 0x988a                        
LAB_9888:
  9888  CB37           ADDB #0x37                        
LAB_988a:
  988a  39             RTS                               

; ---- function API_FC42
API_FC42:
  988b  3430           PSHS  Y X                         
  988d  108E609A       LDY #0x609a                       
  9891  17FEF5         LBSR 0x9789                       
  9894  C608           LDB #0x8                          
  9896  8E609A         LDX #0x609a                       
  9899  17FEC1         LBSR 0x975d                       
  989c  3530           PULS  X Y                         
  989e  39             RTS                               

; ---- function API_FDF8
API_FDF8:
  989f  3406           PSHS  B A                         
  98a1  327F           LEAS -0x1,S                       
  98a3  8608           LDA #0x8                          
  98a5  A7E4           STA ,S                            
  98a7  1F98           TFR B,A                           
LAB_98a9:
  98a9  C631           LDB #0x31                         
  98ab  4D             TSTA                              
  98ac  2D02           BLT 0x98b0                        
  98ae  C630           LDB #0x30                         
LAB_98b0:
  98b0  17FD72         LBSR 0x9625                       
  98b3  48             LSLA                              
  98b4  6AE4           DEC ,S                            
  98b6  26F1           BNE 0x98a9                        
  98b8  3502           PULS  A                           
  98ba  3506           PULS  A B                         
  98bc  39             RTS                               

; ---- function API_FC44
API_FC44:
  98bd  3407           PSHS  B A CC                      
  98bf  327E           LEAS -0x2,S                       
  98c1  6FE4           CLR ,S                            
  98c3  8664           LDA #0x64                         
  98c5  A761           STA 0x1,S                         
  98c7  170015         LBSR 0x98df                       
  98ca  860A           LDA #0xa                          
  98cc  A761           STA 0x1,S                         
  98ce  17000E         LBSR 0x98df                       
  98d1  8601           LDA #0x1                          
  98d3  A761           STA 0x1,S                         
  98d5  A7E4           STA ,S                            
  98d7  170005         LBSR 0x98df                       
  98da  3262           LEAS 0x2,S                        
  98dc  3507           PULS CC A B                       
  98de  39             RTS                               

; ---- function FUN_98df
FUN_98df:
  98df  4F             CLRA                              
LAB_98e0:
  98e0  E163           CMPB 0x3,S                        
  98e2  2505           BCS 0x98e9                        
  98e4  E063           SUBB 0x3,S                        
  98e6  4C             INCA                              
  98e7  20F7           BRA 0x98e0                        
LAB_98e9:
  98e9  1E89           EXG A,B                           
  98eb  CB30           ADDB #0x30                        
  98ed  6D62           TST 0x2,S                         
  98ef  260A           BNE 0x98fb                        
  98f1  C130           CMPB #0x30                        
  98f3  2604           BNE 0x98f9                        
  98f5  C620           LDB #0x20                         
  98f7  2002           BRA 0x98fb                        
LAB_98f9:
  98f9  E762           STB 0x2,S                         
LAB_98fb:
  98fb  17FD27         LBSR 0x9625                       
  98fe  1E89           EXG A,B                           
  9900  39             RTS                               

; ---- function API_FC46
API_FC46:
  9901  1F98           TFR B,A                           
  9903  17FF78         LBSR 0x987e                       
  9906  3404           PSHS  B                           
  9908  1F89           TFR A,B                           
  990a  57             ASRB                              
  990b  57             ASRB                              
  990c  57             ASRB                              
  990d  57             ASRB                              
  990e  17FF6D         LBSR 0x987e                       
  9911  1F98           TFR B,A                           
  9913  3504           PULS  B                           
  9915  39             RTS                               

;; Kernel API slot $FC48: inline: position byte + 8 chars

; ---- function LcdPrintAt8Inline
LcdPrintAt8Inline:
  9916  3417           PSHS  X B A CC                    
  9918  AE65           LDX 0x5,S                         
  991a  E680           LDB ,X+                           
  991c  C008           SUBB #0x8                         
  991e  8608           LDA #0x8                          
  9920  3D             MUL                               
  9921  CA40           ORB #0x40                         
  9923  17FD17         LBSR 0x963d                       
  9926  8608           LDA #0x8                          
LAB_9928:
  9928  E680           LDB ,X+                           
  992a  17FCF8         LBSR 0x9625                       
  992d  4A             DECA                              
  992e  26F8           BNE 0x9928                        
  9930  AF65           STX 0x5,S                         
  9932  3517           PULS CC A B X                     
  9934  39             RTS                               

; ---- function API_FDBA
API_FDBA:
  9935  3404           PSHS  B                           
  9937  C620           LDB #0x20                         
  9939  17FCE9         LBSR 0x9625                       
  993c  3504           PULS  B                           
  993e  39             RTS                               

; ---- function API_FC4A
API_FC4A:
  993f  3415           PSHS  X B CC                      
  9941  C43F           ANDB #0x3f                        
  9943  F78054         STB 0x8054                        
  9946  108E0103       LDY #0x103                        
  994a  170882         LBSR 0xa1cf                       
  994d  3515           PULS CC B X                       
  994f  39             RTS                               

; ---- function API_FC4C
API_FC4C:
  9950  3426           PSHS  Y B A                       
  9952  3410           PSHS  X                           
  9954  3085           LEAX B,X                          
  9956  1F12           TFR X,Y                           
  9958  8620           LDA #0x20                         
LAB_995a:
  995a  ACE4           CMPX ,S                           
  995c  2708           BEQ 0x9966                        
  995e  A184           CMPA ,X                           
  9960  2604           BNE 0x9966                        
  9962  301F           LEAX -0x1,X                       
  9964  20F4           BRA 0x995a                        
LAB_9966:
  9966  A684           LDA ,X                            
  9968  A7A4           STA ,Y                            
  996a  ACE4           CMPX ,S                           
  996c  2706           BEQ 0x9974                        
  996e  301F           LEAX -0x1,X                       
  9970  313F           LEAY -0x1,Y                       
  9972  20F2           BRA 0x9966                        
LAB_9974:
  9974  8620           LDA #0x20                         
  9976  1F21           TFR Y,X                           
LAB_9978:
  9978  10ACE4         CMPY ,S                           
  997b  2706           BEQ 0x9983                        
  997d  313F           LEAY -0x1,Y                       
  997f  A7A4           STA ,Y                            
  9981  20F5           BRA 0x9978                        
LAB_9983:
  9983  ACE4           CMPX ,S                           
  9985  2702           BEQ 0x9989                        
  9987  301F           LEAX -0x1,X                       
LAB_9989:
  9989  3262           LEAS 0x2,S                        
  998b  3526           PULS  A B Y                       
  998d  39             RTS                               

; ---- function API_FC4E
API_FC4E:
  998e  3426           PSHS  Y B A                       
  9990  5A             DECB                              
  9991  1F12           TFR X,Y                           
  9993  3085           LEAX B,X                          
  9995  3410           PSHS  X                           
  9997  1F21           TFR Y,X                           
  9999  8620           LDA #0x20                         
LAB_999b:
  999b  ACE4           CMPX ,S                           
  999d  2708           BEQ 0x99a7                        
  999f  A184           CMPA ,X                           
  99a1  2604           BNE 0x99a7                        
  99a3  3001           LEAX 0x1,X                        
  99a5  20F4           BRA 0x999b                        
LAB_99a7:
  99a7  A684           LDA ,X                            
  99a9  A7A4           STA ,Y                            
  99ab  ACE4           CMPX ,S                           
  99ad  2706           BEQ 0x99b5                        
  99af  3001           LEAX 0x1,X                        
  99b1  3121           LEAY 0x1,Y                        
  99b3  20F2           BRA 0x99a7                        
LAB_99b5:
  99b5  8620           LDA #0x20                         
  99b7  1F21           TFR Y,X                           
LAB_99b9:
  99b9  10ACE4         CMPY ,S                           
  99bc  2706           BEQ 0x99c4                        
  99be  3121           LEAY 0x1,Y                        
  99c0  A7A4           STA ,Y                            
  99c2  20F5           BRA 0x99b9                        
LAB_99c4:
  99c4  ACE4           CMPX ,S                           
  99c6  2702           BEQ 0x99ca                        
  99c8  3001           LEAX 0x1,X                        
LAB_99ca:
  99ca  3262           LEAS 0x2,S                        
  99cc  3526           PULS  A B Y                       
  99ce  39             RTS                               

; ---- function API_FC50
API_FC50:
  99cf  3426           PSHS  Y B A                       
  99d1  1F12           TFR X,Y                           
  99d3  3085           LEAX B,X                          
  99d5  3410           PSHS  X                           
  99d7  1F21           TFR Y,X                           
LAB_99d9:
  99d9  8620           LDA #0x20                         
LAB_99db:
  99db  ACE4           CMPX ,S                           
  99dd  271A           BEQ 0x99f9                        
  99df  A184           CMPA ,X                           
  99e1  2604           BNE 0x99e7                        
  99e3  3001           LEAX 0x1,X                        
  99e5  20F4           BRA 0x99db                        
LAB_99e7:
  99e7  ACE4           CMPX ,S                           
  99e9  270E           BEQ 0x99f9                        
  99eb  A684           LDA ,X                            
  99ed  A7A4           STA ,Y                            
  99ef  3001           LEAX 0x1,X                        
  99f1  3121           LEAY 0x1,Y                        
  99f3  8120           CMPA #0x20                        
  99f5  27E2           BEQ 0x99d9                        
  99f7  20EE           BRA 0x99e7                        
LAB_99f9:
  99f9  8620           LDA #0x20                         
  99fb  1F21           TFR Y,X                           
LAB_99fd:
  99fd  10ACE4         CMPY ,S                           
  9a00  2706           BEQ 0x9a08                        
  9a02  A7A4           STA ,Y                            
  9a04  3121           LEAY 0x1,Y                        
  9a06  20F5           BRA 0x99fd                        
LAB_9a08:
  9a08  A7A4           STA ,Y                            
  9a0a  ACE4           CMPX ,S                           
  9a0c  2702           BEQ 0x9a10                        
  9a0e  3001           LEAX 0x1,X                        
LAB_9a10:
  9a10  3262           LEAS 0x2,S                        
  9a12  3526           PULS  A B Y                       
  9a14  39             RTS                               

; ---- function API_FC52
API_FC52:
  9a15  3426           PSHS  Y B A                       
  9a17  1F12           TFR X,Y                           
  9a19  3085           LEAX B,X                          
  9a1b  3420           PSHS  Y                           
  9a1d  1F12           TFR X,Y                           
LAB_9a1f:
  9a1f  8620           LDA #0x20                         
LAB_9a21:
  9a21  ACE4           CMPX ,S                           
  9a23  271A           BEQ 0x9a3f                        
  9a25  A184           CMPA ,X                           
  9a27  2604           BNE 0x9a2d                        
  9a29  301F           LEAX -0x1,X                       
  9a2b  20F4           BRA 0x9a21                        
LAB_9a2d:
  9a2d  A684           LDA ,X                            
  9a2f  A7A4           STA ,Y                            
  9a31  ACE4           CMPX ,S                           
  9a33  270A           BEQ 0x9a3f                        
  9a35  301F           LEAX -0x1,X                       
  9a37  313F           LEAY -0x1,Y                       
  9a39  8120           CMPA #0x20                        
  9a3b  27E2           BEQ 0x9a1f                        
  9a3d  20EE           BRA 0x9a2d                        
LAB_9a3f:
  9a3f  8620           LDA #0x20                         
  9a41  1F21           TFR Y,X                           
LAB_9a43:
  9a43  10ACE4         CMPY ,S                           
  9a46  2706           BEQ 0x9a4e                        
  9a48  A7A4           STA ,Y                            
  9a4a  313F           LEAY -0x1,Y                       
  9a4c  20F5           BRA 0x9a43                        
LAB_9a4e:
  9a4e  A7A4           STA ,Y                            
  9a50  ACE4           CMPX ,S                           
  9a52  2702           BEQ 0x9a56                        
  9a54  301F           LEAX -0x1,X                       
LAB_9a56:
  9a56  3262           LEAS 0x2,S                        
  9a58  3526           PULS  A B Y                       
  9a5a  39             RTS                               

; ---- function API_FDBC
API_FDBC:
  9a5b  3437           PSHS  Y X B A CC                  
  9a5d  AE67           LDX 0x7,S                         
  9a5f  10BE60AE       LDY 0x60ae                        
  9a63  C620           LDB #0x20                         
  9a65  E7A0           STB ,Y+                           
  9a67  8608           LDA #0x8                          
LAB_9a69:
  9a69  E680           LDB ,X+                           
  9a6b  E7A0           STB ,Y+                           
  9a6d  4A             DECA                              
  9a6e  26F9           BNE 0x9a69                        
  9a70  5F             CLRB                              
  9a71  E7A0           STB ,Y+                           
  9a73  AF67           STX 0x7,S                         
  9a75  3537           PULS CC A B X Y                   
  9a77  39             RTS                               

; ---- function API_FDFC
API_FDFC:
  9a78  3407           PSHS  B A CC                      
  9a7a  C6A0           LDB #0xa0                         
  9a7c  F76079         STB 0x6079                        
  9a7f  CC0000         LDD #0x0                          
  9a82  FD607A         STD 0x607a                        
  9a85  C600           LDB #0x0                          
  9a87  17FC51         LBSR 0x96db                       
  9a8a  1713D8         LBSR 0xae65                       
  9a8d  3587           PULS CC A B PC                    
  9a8f  .db 4F 66 66 00 4F 6E 20 00                          ; Off.On .
  9a97  44697361626C.. ds "Disabled"                     
  9aa0  456E61626C65.. ds "Enabled "                     

;; Kernel API slot $FC54: $80A7 = 0

; ---- function Io80A7_Clear
Io80A7_Clear:
  9aa9  3402           PSHS  A                           
  9aab  8600           LDA #0x0                          
  9aad  B780A7         STA 0x80a7                        
  9ab0  3502           PULS  A                           
  9ab2  39             RTS                               

;; Kernel API slot $FC56: $80A7 = $FF

; ---- function Io80A7_Set
Io80A7_Set:
  9ab3  3402           PSHS  A                           
  9ab5  86FF           LDA #0xff                         
  9ab7  B780A7         STA 0x80a7                        
  9aba  3502           PULS  A                           
  9abc  39             RTS                               

; ---- function API_FC58
API_FC58:
  9abd  3407           PSHS  B A CC                      
  9abf  C403           ANDB #0x3                         
  9ac1  4F             CLRA                              
  9ac2  17251B         LBSR 0xbfe0                        ; inline[API_FD14]: jump table[D]: 0->9ACD 1->9AD9 2->9AE0 3->9AE7
  9ac5  9ACD           addr 9acd                         
  9ac7  9AD9           addr 9ad9                         
  9ac9  9AE0           addr 9ae0                         
  9acb  9AE7           addr 9ae7                         

; ---- function FUN_9acd
FUN_9acd:
  9acd  8600           LDA #0x0                          
  9acf  B780A4         STA 0x80a4                        
LAB_9ad2:
  9ad2  8600           LDA #0x0                          
  9ad4  B780A5         STA 0x80a5                        
  9ad7  2018           BRA 0x9af1                        

; ---- function FUN_9ad9
FUN_9ad9:
  9ad9  8600           LDA #0x0                          
  9adb  B780A4         STA 0x80a4                        
  9ade  200C           BRA 0x9aec                        

; ---- function FUN_9ae0
FUN_9ae0:
  9ae0  86FF           LDA #0xff                         
  9ae2  B780A4         STA 0x80a4                        
  9ae5  20EB           BRA 0x9ad2                        

; ---- function FUN_9ae7
FUN_9ae7:
  9ae7  86FF           LDA #0xff                         
  9ae9  B780A4         STA 0x80a4                        
LAB_9aec:
  9aec  86FF           LDA #0xff                         
  9aee  B780A5         STA 0x80a5                        
LAB_9af1:
  9af1  3507           PULS CC A B                       
  9af3  39             RTS                               

; ---- function API_FC5A
API_FC5A:
  9af4  3425           PSHS  Y B CC                      
  9af6  C6FF           LDB #0xff                         
  9af8  F780A1         STB 0x80a1                        
  9afb  108E0102       LDY #0x102                        
  9aff  1706CD         LBSR 0xa1cf                       
  9b02  3525           PULS CC B Y                       
  9b04  39             RTS                               

; ---- function API_FC5C
API_FC5C:
  9b05  3425           PSHS  Y B CC                      
  9b07  C600           LDB #0x0                          
  9b09  F780A1         STB 0x80a1                        
  9b0c  108E0102       LDY #0x102                        
  9b10  1706BC         LBSR 0xa1cf                       
  9b13  3525           PULS CC B Y                       
  9b15  39             RTS                               

; ---- function API_FC5E
API_FC5E:
  9b16  3415           PSHS  X B CC                      
  9b18  8E0102         LDX #0x102                        
  9b1b  170678         LBSR 0xa196                       
  9b1e  F780A1         STB 0x80a1                        
  9b21  3515           PULS CC B X                       
  9b23  39             RTS                               

; ---- function API_FDBE
API_FDBE:
  9b24  3417           PSHS  X B A CC                    
  9b26  8E0102         LDX #0x102                        
  9b29  17066A         LBSR 0xa196                       
  9b2c  53             COMB                              
  9b2d  1F12           TFR X,Y                           
  9b2f  17069D         LBSR 0xa1cf                       
  9b32  108E2004       LDY #0x2004                       
  9b36  4F             CLRA                              
  9b37  174FEB         LBSR 0xeb25                       
  9b3a  F780A1         STB 0x80a1                        
  9b3d  3517           PULS CC A B X                     
  9b3f  39             RTS                               

; ---- function FUN_9b40
FUN_9b40:
  9b40  3416           PSHS  X B A                       
  9b42  108E0102       LDY #0x102                        
  9b46  170686         LBSR 0xa1cf                       
  9b49  F780A1         STB 0x80a1                        
  9b4c  3516           PULS  A B X                       
  9b4e  39             RTS                               

;; Kernel API slot $FC60: inline word: $600D = return address - word (position-independent modules)

; ---- function ModuleSetBase
ModuleSetBase:
  9b4f  3417           PSHS  X B A CC                    
  9b51  AE65           LDX 0x5,S                         
  9b53  1F10           TFR X,D                           
  9b55  A381           SUBD ,X++                         
  9b57  FD600D         STD 0x600d                        
  9b5a  AF65           STX 0x5,S                         
  9b5c  3517           PULS CC A B X                     
  9b5e  39             RTS                               

;; Kernel API slot $FC62: inline ptr: [ptr] = D + module base

; ---- function ModuleStorePtr
ModuleStorePtr:
  9b5f  3437           PSHS  Y X B A CC                  
  9b61  AE67           LDX 0x7,S                         
  9b63  10AE81         LDY ,X++                          
  9b66  F3600D         ADDD 0x600d                       
  9b69  EDA4           STD ,Y                            
  9b6b  AF67           STX 0x7,S                         
  9b6d  3537           PULS CC A B X Y                   
  9b6f  39             RTS                               

; ---- function API_FDC0
API_FDC0:
  9b70  3416           PSHS  X B A                       
  9b72  17255F         LBSR 0xc0d4                        ; inline[API_FD8E]: $613B
  9b75  613B           addr 613b                         
LAB_9b77:
  9b77  FD60BB         STD 0x60bb                        
  9b7a  7F60BA         CLR 0x60ba                        
  9b7d  BE60BB         LDX 0x60bb                        
  9b80  AD94           JSR [,X]                          
LAB_9b82:
  9b82  17000A         LBSR 0x9b8f                       
  9b85  2705           BEQ 0x9b8c                        
  9b87  17007B         LBSR 0x9c05                       
  9b8a  20F6           BRA 0x9b82                        
LAB_9b8c:
  9b8c  3516           PULS  A B X                       
  9b8e  39             RTS                               

; ---- function API_FDC2
API_FDC2:
  9b8f  3432           PSHS  Y X A                       
  9b91  327D           LEAS -0x3,S                       
  9b93  6F61           CLR 0x1,S                         
LAB_9b95:
  9b95  170ADA         LBSR 0xa672                       
  9b98  86FF           LDA #0xff                         
  9b9a  A7E4           STA ,S                            
  9b9c  BE60BB         LDX 0x60bb                        
  9b9f  3002           LEAX 0x2,X                        
  9ba1  B660BA         LDA 0x60ba                        
  9ba4  3086           LEAX A,X                          
  9ba6  10AE81         LDY ,X++                          
  9ba9  A6A4           LDA ,Y                            
  9bab  8139           CMPA #0x39                        
  9bad  2702           BEQ 0x9bb1                        
  9baf  6FE4           CLR ,S                            
LAB_9bb1:
  9bb1  6D61           TST 0x1,S                         
  9bb3  2602           BNE 0x9bb7                        
  9bb5  ADA4           JSR ,Y                            
LAB_9bb7:
  9bb7  7F60B9         CLR 0x60b9                        
LAB_9bba:
  9bba  10AE81         LDY ,X++                          
  9bbd  A6A4           LDA ,Y                            
  9bbf  8139           CMPA #0x39                        
  9bc1  2702           BEQ 0x9bc5                        
  9bc3  6FE4           CLR ,S                            
LAB_9bc5:
  9bc5  ADA4           JSR ,Y                            
  9bc7  7C60B9         INC 0x60b9                        
  9bca  8604           LDA #0x4                          
  9bcc  B160B9         CMPA 0x60b9                       
  9bcf  26E9           BNE 0x9bba                        
  9bd1  A6E4           LDA ,S                            
  9bd3  3263           LEAS 0x3,S                        
  9bd5  3532           PULS  A X Y                       
  9bd7  39             RTS                               

; ---- function FUN_9bd8
FUN_9bd8:
  9bd8  3432           PSHS  Y X A                       
  9bda  327D           LEAS -0x3,S                       
  9bdc  86FF           LDA #0xff                         
  9bde  A761           STA 0x1,S                         
  9be0  20B3           BRA 0x9b95                        

; ---- function API_FDC4
API_FDC4:
  9be2  3436           PSHS  Y X B A                     
LAB_9be4:
  9be4  BE60BB         LDX 0x60bb                        
  9be7  3002           LEAX 0x2,X                        
  9be9  B660BA         LDA 0x60ba                        
  9bec  260B           BNE 0x9bf9                        
LAB_9bee:
  9bee  8B0A           ADDA #0xa                         
  9bf0  10AE86         LDY A,X                           
  9bf3  108CFFFF       CMPY #0xffff                      
  9bf7  26F5           BNE 0x9bee                        
LAB_9bf9:
  9bf9  800A           SUBA #0xa                         
  9bfb  B760BA         STA 0x60ba                        
  9bfe  8D8F           BSR 0x9b8f                        
  9c00  26E2           BNE 0x9be4                        
  9c02  3536           PULS  A B X Y                     
  9c04  39             RTS                               

; ---- function API_FDC6
API_FDC6:
  9c05  3436           PSHS  Y X B A                     
LAB_9c07:
  9c07  BE60BB         LDX 0x60bb                        
  9c0a  3002           LEAX 0x2,X                        
  9c0c  B660BA         LDA 0x60ba                        
  9c0f  8B0A           ADDA #0xa                         
  9c11  10AE86         LDY A,X                           
  9c14  108CFFFF       CMPY #0xffff                      
  9c18  2601           BNE 0x9c1b                        
  9c1a  4F             CLRA                              
LAB_9c1b:
  9c1b  B760BA         STA 0x60ba                        
  9c1e  17FF6E         LBSR 0x9b8f                       
  9c21  26E4           BNE 0x9c07                        
  9c23  3536           PULS  A B X Y                     
  9c25  39             RTS                               

; ---- function API_FDC8
API_FDC8:
  9c26  3416           PSHS  X B A                       
  9c28  FC60BB         LDD 0x60bb                        
  9c2b  1724B6         LBSR 0xc0e4                        ; inline[API_FD90]: $613B
  9c2e  613B           addr 613b                         
LAB_9c30:
  9c30  F660BA         LDB 0x60ba                        
  9c33  1724AE         LBSR 0xc0e4                        ; inline[API_FD90]: $613B
  9c36  613B           addr 613b                         
LAB_9c38:
  9c38  ECE4           LDD ,S                            
  9c3a  FD60BB         STD 0x60bb                        
  9c3d  7F60BA         CLR 0x60ba                        
  9c40  BE60BB         LDX 0x60bb                        
  9c43  AD94           JSR [,X]                          
LAB_9c45:
  9c45  17FF47         LBSR 0x9b8f                       
  9c48  2705           BEQ 0x9c4f                        
  9c4a  17FFB8         LBSR 0x9c05                       
  9c4d  20F6           BRA 0x9c45                        
LAB_9c4f:
  9c4f  3516           PULS  A B X                       
  9c51  39             RTS                               

; ---- function API_FDCA
API_FDCA:
  9c52  3416           PSHS  X B A                       
  9c54  17249F         LBSR 0xc0f6                        ; inline[API_FD92]: $613B
  9c57  613B           addr 613b                         
LAB_9c59:
  9c59  260D           BNE 0x9c68                        
  9c5b  F760BA         STB 0x60ba                        
  9c5e  172495         LBSR 0xc0f6                        ; inline[API_FD92]: $613B
  9c61  613B           addr 613b                         
LAB_9c63:
  9c63  2603           BNE 0x9c68                        
  9c65  FD60BB         STD 0x60bb                        
LAB_9c68:
  9c68  BE60BB         LDX 0x60bb                        
  9c6b  AD94           JSR [,X]                          
LAB_9c6d:
  9c6d  17FF1F         LBSR 0x9b8f                       
  9c70  2705           BEQ 0x9c77                        
  9c72  17FF90         LBSR 0x9c05                       
  9c75  20F6           BRA 0x9c6d                        
LAB_9c77:
  9c77  3516           PULS  A B X                       
  9c79  39             RTS                               

; ---- function FUN_9c7a
FUN_9c7a:
  9c7a  3416           PSHS  X B A                       
  9c7c  20EA           BRA 0x9c68                        

; ---- function API_FDCC
API_FDCC:
  9c7e  3436           PSHS  Y X B A                     
  9c80  1709EF         LBSR 0xa672                       
  9c83  AE66           LDX 0x6,S                         
  9c85  7F60B9         CLR 0x60b9                        
LAB_9c88:
  9c88  AD91           JSR [,X++]                        
  9c8a  7C60B9         INC 0x60b9                        
  9c8d  C604           LDB #0x4                          
  9c8f  F160B9         CMPB 0x60b9                       
  9c92  26F4           BNE 0x9c88                        
  9c94  AF66           STX 0x6,S                         
  9c96  3536           PULS  A B X Y                     
  9c98  39             RTS                               
  9c99  .db 00 00 00 21 00 00 00 00 9C 9A 20 20 20 20 20 20  ; ...!......      
  9ca9  .db 20 20 20 20 20 20 20 20 20 00 00 00 00 00 00 00  ;          .......
  9cb9  .db 00                                               ; .

; ---- function API_FC64
API_FC64:
  9cba  3437           PSHS  Y X B A CC                  
  9cbc  108E6A00       LDY #0x6a00                       
  9cc0  172299         LBSR 0xbf5c                        ; inline[API_FD0C]: $0080 FF
  9cc3  0080           dw 80h                            
  9cc5  FF             db FFh                            
LAB_9cc6:
  9cc6  C6FF           LDB #0xff                         
  9cc8  F7614D         STB 0x614d                        
  9ccb  17EC68         LBSR 0x8936                       
LAB_9cce:
  9cce  2615           BNE 0x9ce5                        
  9cd0  17003D         LBSR 0x9d10                       
  9cd3  260B           BNE 0x9ce0                        
  9cd5  1F01           TFR D,X                           
  9cd7  5F             CLRB                              
  9cd8  172496         LBSR 0xc171                       
  9cdb  6A00           DEC 0x0,X                         
  9cdd  7F614D         CLR 0x614d                        
LAB_9ce0:
  9ce0  17ECB7         LBSR 0x899a                       
  9ce3  20E9           BRA 0x9cce                        
LAB_9ce5:
  9ce5  8E03E8         LDX #0x3e8                        
  9ce8  108E0000       LDY #0x0                          
LAB_9cec:
  9cec  301F           LEAX -0x1,X                       
  9cee  1724B6         LBSR 0xc1a7                       
  9cf1  6A00           DEC 0x0,X                         
  9cf3  2602           BNE 0x9cf7                        
  9cf5  3121           LEAY 0x1,Y                        
LAB_9cf7:
  9cf7  8C0000         CMPX #0x0                         
  9cfa  26F0           BNE 0x9cec                        
  9cfc  10BF614B       STY 0x614b                        
  9d00  3537           PULS CC A B X Y                   
  9d02  39             RTS                               

; ---- function FUN_9d03
FUN_9d03:
  9d03  3436           PSHS  Y X B A                     
  9d05  8403           ANDA #0x3                         
  9d07  1F01           TFR D,X                           
  9d09  17249B         LBSR 0xc1a7                       
  9d0c  6A00           DEC 0x0,X                         
  9d0e  35B6           PULS  A B X Y PC                  

; ---- function FUN_9d10
FUN_9d10:
  9d10  81C8           CMPA #0xc8                        
  9d12  2518           BCS 0x9d2c                        
  9d14  C1C8           CMPB #0xc8                        
  9d16  241C           BCC 0x9d34                        
  9d18  81CC           CMPA #0xcc                        
  9d1a  2418           BCC 0x9d34                        
  9d1c  3404           PSHS  B                           
  9d1e  8403           ANDA #0x3                         
  9d20  C6C8           LDB #0xc8                         
  9d22  3D             MUL                               
  9d23  C300C8         ADDD #0xc8                        
  9d26  EBE0           ADDB ,S+                          
  9d28  8900           ADCA #0x0                         
  9d2a  2005           BRA 0x9d31                        
LAB_9d2c:
  9d2c  5D             TSTB                              
  9d2d  2605           BNE 0x9d34                        
  9d2f  1E89           EXG A,B                           
LAB_9d31:
  9d31  1A04           ORCC #0x4                         
  9d33  39             RTS                               
LAB_9d34:
  9d34  CCFFFF         LDD #0xffff                       
  9d37  39             RTS                               

; ---- function FUN_9d38
FUN_9d38:
  9d38  108300C8       CMPD #0xc8                        
  9d3c  252E           BCS 0x9d6c                        
  9d3e  8300C8         SUBD #0xc8                        
  9d41  108300C8       CMPD #0xc8                        
  9d45  2521           BCS 0x9d68                        
  9d47  8300C8         SUBD #0xc8                        
  9d4a  108300C8       CMPD #0xc8                        
  9d4e  2514           BCS 0x9d64                        
  9d50  8300C8         SUBD #0xc8                        
  9d53  108300C8       CMPD #0xc8                        
  9d57  2507           BCS 0x9d60                        
  9d59  8300C8         SUBD #0xc8                        
  9d5c  86CB           LDA #0xcb                         
  9d5e  200E           BRA 0x9d6e                        
LAB_9d60:
  9d60  86CA           LDA #0xca                         
  9d62  200A           BRA 0x9d6e                        
LAB_9d64:
  9d64  86C9           LDA #0xc9                         
  9d66  2006           BRA 0x9d6e                        
LAB_9d68:
  9d68  86C8           LDA #0xc8                         
  9d6a  2002           BRA 0x9d6e                        
LAB_9d6c:
  9d6c  1E89           EXG A,B                           
LAB_9d6e:
  9d6e  39             RTS                               

; ---- function API_FC66
API_FC66:
  9d6f  3476           PSHS  U Y X B A                   
  9d71  F6600B         LDB 0x600b                        
  9d74  176109         LBSR 0xfe80                       
  9d77  EC61           LDD 0x1,S                         
  9d79  17ECD1         LBSR 0x8a4d                       
  9d7c  262F           BNE 0x9dad                        
  9d7e  1A40           ORCC #0x40                        
  9d80  7F60DA         CLR 0x60da                        
  9d83  E7E4           STB ,S                            
  9d85  F7600B         STB 0x600b                        
  9d88  F78052         STB 0x8052                        
  9d8b  8E0008         LDX #0x8                          
  9d8e  17041C         LBSR 0xa1ad                       
  9d91  B7600A         STA 0x600a                        
  9d94  1F21           TFR Y,X                           
  9d96  86A0           LDA #0xa0                         
  9d98  B7600C         STA 0x600c                        
  9d9b  108E0000       LDY #0x0                          
  9d9f  FC607D         LDD 0x607d                        
  9da2  176171         LBSR 0xff16                       
  9da5  1760F2         LBSR 0xfe9a                       
  9da8  3576           PULS  A B X Y U                   
  9daa  1A04           ORCC #0x4                         
  9dac  39             RTS                               
LAB_9dad:
  9dad  1760EA         LBSR 0xfe9a                       
  9db0  3576           PULS  A B X Y U                   
  9db2  1CFB           ANDCC #0xfb                       
  9db4  39             RTS                               

; ---- function API_FDCE
API_FDCE:
  9db5  3416           PSHS  X B A                       
  9db7  1A40           ORCC #0x40                        
  9db9  C6FF           LDB #0xff                         
  9dbb  F760FB         STB 0x60fb                        
  9dbe  F760F4         STB 0x60f4                        
  9dc1  17035C         LBSR 0xa120                       
  9dc4  170862         LBSR 0xa629                       
  9dc7  7F60B8         CLR 0x60b8                        
  9dca  170027         LBSR 0x9df4                       
  9dcd  172B4B         LBSR 0xc91b                       
  9dd0  8E0008         LDX #0x8                          
  9dd3  1703D7         LBSR 0xa1ad                       
  9dd6  3406           PSHS  B A                         
  9dd8  17EC72         LBSR 0x8a4d                       
  9ddb  F7600B         STB 0x600b                        
  9dde  F76102         STB 0x6102                        
  9de1  3506           PULS  A B                         
  9de3  17EC75         LBSR 0x8a5b                       
  9de6  17F765         LBSR 0x954e                       
  9de9  170371         LBSR 0xa15d                       
  9dec  7F60F4         CLR 0x60f4                        
  9def  3516           PULS  A B X                       
  9df1  1CBF           ANDCC #0xbf                       
  9df3  39             RTS                               

; ---- function API_FDD0
API_FDD0:
  9df4  7F6009         CLR 0x6009                        
  9df7  7F6008         CLR 0x6008                        
  9dfa  17082C         LBSR 0xa629                       
  9dfd  1740D0         LBSR 0xded0                       
  9e00  8E6600         LDX #0x6600                       
  9e03  86B7           LDA #0xb7                         
  9e05  A780           STA ,X+                           
  9e07  CC8055         LDD #0x8055                       
  9e0a  ED81           STD ,X++                          
  9e0c  863B           LDA #0x3b                         
  9e0e  A780           STA ,X+                           
  9e10  B76700         STA 0x6700                        
  9e13  B76780         STA 0x6780                        
  9e16  B767C0         STA 0x67c0                        
  9e19  1721F9         LBSR 0xc015                        ; inline[API_FD18]: [$600F]=$8877 [$6011]=$8877 [$6013]=$8877 [$6015]=$8877 [$6006]=$8877 [$6004]=$8877 [$6002]=$8877 [$608F]=$8877 [$6091]=$8877 [$6093]=$8877 [$6095]=$8877 [$6097]=$8877 [$603A]=$8877 [$6038]=$8877 [$6036]=$8877 [$608D]=$8877 [$60ED]=$8877 [$60EF]=$8D23
  9e1c  600F           addr 600f                         
  9e1e  8877           dw 8877h                          
  9e20  6011           addr 6011                         
  9e22  8877           dw 8877h                          
  9e24  6013           addr 6013                         
  9e26  8877           dw 8877h                          
  9e28  6015           addr 6015                         
  9e2a  8877           dw 8877h                          
  9e2c  6006           addr 6006                         
  9e2e  8877           dw 8877h                          
  9e30  6004           addr 6004                         
  9e32  8877           dw 8877h                          
  9e34  6002           addr 6002                         
  9e36  8877           dw 8877h                          
  9e38  608F           addr 608f                         
  9e3a  8877           dw 8877h                          
  9e3c  6091           addr 6091                         
  9e3e  8877           dw 8877h                          
  9e40  6093           addr 6093                         
  9e42  8877           dw 8877h                          
  9e44  6095           addr 6095                         
  9e46  8877           dw 8877h                          
  9e48  6097           addr 6097                         
  9e4a  8877           dw 8877h                          
  9e4c  603A           addr 603a                         
  9e4e  8877           dw 8877h                          
  9e50  6038           addr 6038                         
  9e52  8877           dw 8877h                          
  9e54  6036           addr 6036                         
  9e56  8877           dw 8877h                          
  9e58  608D           addr 608d                         
  9e5a  8877           dw 8877h                          
  9e5c  60ED           addr 60ed                         
  9e5e  8877           dw 8877h                          
  9e60  60EF           addr 60ef                         
  9e62  8D23           dw 8D23h                          
  9e64  FFFF           dw FFFFh                          
LAB_9e66:
  9e66  C600           LDB #0x0                          
  9e68  17FC52         LBSR 0x9abd                       
  9e6b  170259         LBSR 0xa0c7                       
  9e6e  174E77         LBSR 0xece8                       
  9e71  39             RTS                               

; ---- function FUN_9e72
FUN_9e72:
  9e72  3436           PSHS  Y X B A                     
  9e74  C6A0           LDB #0xa0                         
  9e76  176007         LBSR 0xfe80                       
  9e79  F660F1         LDB 0x60f1                        
  9e7c  4F             CLRA                              
  9e7d  7D6106         TST 0x6106                        
  9e80  273D           BEQ 0x9ebf                        
  9e82  7F6106         CLR 0x6106                        
  9e85  F76089         STB 0x6089                        
  9e88  7D0114         TST 0x0114                        
  9e8b  261E           BNE 0x9eab                        
  9e8d  7D010E         TST 0x010e                        
  9e90  262D           BNE 0x9ebf                        
  9e92  7D010D         TST 0x010d                        
  9e95  2714           BEQ 0x9eab                        
  9e97  8E0180         LDX #0x180                        
  9e9a  58             LSLB                              
  9e9b  49             ROLA                              
  9e9c  308B           LEAX D,X                          
  9e9e  EC84           LDD ,X                            
  9ea0  1083FFFF       CMPD #0xffff                      
  9ea4  2719           BEQ 0x9ebf                        
  9ea6  17FE5A         LBSR 0x9d03                       
  9ea9  2614           BNE 0x9ebf                        
LAB_9eab:
  9eab  840F           ANDA #0xf                         
  9ead  175FEA         LBSR 0xfe9a                       
  9eb0  17FE85         LBSR 0x9d38                       
  9eb3  17FEB9         LBSR 0x9d6f                       
  9eb6  2603           BNE 0x9ebb                        
  9eb8  17FEFA         LBSR 0x9db5                       
LAB_9ebb:
  9ebb  3536           PULS  A B X Y                     
  9ebd  2005           BRA 0x9ec4                        
LAB_9ebf:
  9ebf  175FD8         LBSR 0xfe9a                       
  9ec2  3536           PULS  A B X Y                     
LAB_9ec4:
  9ec4  39             RTS                               

; ---- function API_FC68
API_FC68:
  9ec5  3437           PSHS  Y X B A CC                  
  9ec7  8E8022         LDX #0x8022                       
  9eca  1600E9         LBRA 0x9fb6                       

; ---- function API_FC6A
API_FC6A:
  9ecd  3436           PSHS  Y X B A                     
  9ecf  F76153         STB 0x6153                        
  9ed2  7D60F4         TST 0x60f4                        
  9ed5  2622           BNE 0x9ef9                        
  9ed7  F7614E         STB 0x614e                        
LAB_9eda:
  9eda  B6614E         LDA 0x614e                        
  9edd  F6614F         LDB 0x614f                        
  9ee0  3D             MUL                               
  9ee1  1F89           TFR A,B                           
  9ee3  8E8026         LDX #0x8026                       
  9ee6  1700CB         LBSR 0x9fb4                       
  9ee9  B6614E         LDA 0x614e                        
  9eec  43             COMA                              
  9eed  F6614F         LDB 0x614f                        
  9ef0  3D             MUL                               
  9ef1  1F89           TFR A,B                           
  9ef3  8E8036         LDX #0x8036                       
  9ef6  1700BB         LBSR 0x9fb4                       
LAB_9ef9:
  9ef9  3536           PULS  A B X Y                     
  9efb  39             RTS                               

; ---- function API_FC6C
API_FC6C:
  9efc  3437           PSHS  Y X B A CC                  
  9efe  1F98           TFR B,A                           
  9f00  8E0100         LDX #0x100                        
  9f03  170290         LBSR 0xa196                       
  9f06  3D             MUL                               
  9f07  1F89           TFR A,B                           
  9f09  8E8025         LDX #0x8025                       
  9f0c  1600A7         LBRA 0x9fb6                       

; ---- function API_FC6E
API_FC6E:
  9f0f  3436           PSHS  Y X B A                     
  9f11  F7614F         STB 0x614f                        
  9f14  20C4           BRA 0x9eda                        

; ---- function API_FC70
API_FC70:
  9f16  3437           PSHS  Y X B A CC                  
  9f18  8E8024         LDX #0x8024                       
  9f1b  160098         LBRA 0x9fb6                       

; ---- function API_FC72
API_FC72:
  9f1e  3436           PSHS  Y X B A                     
  9f20  F76152         STB 0x6152                        
  9f23  7D60F4         TST 0x60f4                        
  9f26  2620           BNE 0x9f48                        
  9f28  F76150         STB 0x6150                        
LAB_9f2b:
  9f2b  B66150         LDA 0x6150                        
  9f2e  F66151         LDB 0x6151                        
  9f31  3D             MUL                               
  9f32  1F89           TFR A,B                           
  9f34  8E8033         LDX #0x8033                       
  9f37  8D7B           BSR 0x9fb4                        
  9f39  B66150         LDA 0x6150                        
  9f3c  43             COMA                              
  9f3d  F66151         LDB 0x6151                        
  9f40  3D             MUL                               
  9f41  1F89           TFR A,B                           
  9f43  8E8023         LDX #0x8023                       
  9f46  8D6C           BSR 0x9fb4                        
LAB_9f48:
  9f48  3536           PULS  A B X Y                     
  9f4a  39             RTS                               

; ---- function API_FC74
API_FC74:
  9f4b  3437           PSHS  Y X B A CC                  
  9f4d  1F98           TFR B,A                           
  9f4f  8E0101         LDX #0x101                        
  9f52  170241         LBSR 0xa196                       
  9f55  3D             MUL                               
  9f56  1F89           TFR A,B                           
  9f58  8E8027         LDX #0x8027                       
  9f5b  2059           BRA 0x9fb6                        

; ---- function API_FC76
API_FC76:
  9f5d  3436           PSHS  Y X B A                     
  9f5f  F76151         STB 0x6151                        
  9f62  20C7           BRA 0x9f2b                        

; ---- function API_FC78
API_FC78:
  9f64  3406           PSHS  B A                         
  9f66  8600           LDA #0x0                          
  9f68  B78020         STA 0x8020                        
  9f6b  B780A6         STA 0x80a6                        
  9f6e  C600           LDB #0x0                          
  9f70  17FF89         LBSR 0x9efc                       
  9f73  17FFD5         LBSR 0x9f4b                       
  9f76  86FF           LDA #0xff                         
  9f78  17FF52         LBSR 0x9ecd                       
  9f7b  17FFA0         LBSR 0x9f1e                       
  9f7e  8E0104         LDX #0x104                        
  9f81  170212         LBSR 0xa196                       
  9f84  17004B         LBSR 0x9fd2                       
  9f87  17FF3B         LBSR 0x9ec5                       
  9f8a  8E0105         LDX #0x105                        
  9f8d  170206         LBSR 0xa196                       
  9f90  17003F         LBSR 0x9fd2                       
  9f93  17FF80         LBSR 0x9f16                       
  9f96  8E0106         LDX #0x106                        
  9f99  1701FA         LBSR 0xa196                       
  9f9c  170033         LBSR 0x9fd2                       
  9f9f  17FF6D         LBSR 0x9f0f                       
  9fa2  8E0107         LDX #0x107                        
  9fa5  1701EE         LBSR 0xa196                       
  9fa8  170027         LBSR 0x9fd2                       
  9fab  17FFAF         LBSR 0x9f5d                       
  9fae  7F60F4         CLR 0x60f4                        
  9fb1  3506           PULS  A B                         
  9fb3  39             RTS                               

; ---- function API_FC7A
API_FC7A:
  9fb4  3437           PSHS  Y X B A CC                  
LAB_9fb6:
  9fb6  1A50           ORCC #0x50                        
  9fb8  E784           STB ,X                            
  9fba  8605           LDA #0x5                          
LAB_9fbc:
  9fbc  4A             DECA                              
  9fbd  26FD           BNE 0x9fbc                        
  9fbf  8601           LDA #0x1                          
  9fc1  B780A6         STA 0x80a6                        
  9fc4  8605           LDA #0x5                          
LAB_9fc6:
  9fc6  4A             DECA                              
  9fc7  26FD           BNE 0x9fc6                        
  9fc9  B780A6         STA 0x80a6                        
  9fcc  F78020         STB 0x8020                        
  9fcf  3537           PULS CC A B X Y                   
  9fd1  39             RTS                               

; ---- function API_FDD2
API_FDD2:
  9fd2  3412           PSHS  X A                         
  9fd4  5D             TSTB                              
  9fd5  2C01           BGE 0x9fd8                        
  9fd7  50             NEGB                              
LAB_9fd8:
  9fd8  C130           CMPB #0x30                        
  9fda  2D02           BLT 0x9fde                        
  9fdc  C630           LDB #0x30                         
LAB_9fde:
  9fde  8E9FE8         LDX #0x9fe8                       
  9fe1  1F98           TFR B,A                           
  9fe3  E686           LDB A,X                           
  9fe5  3512           PULS  A X                         
  9fe7  39             RTS                               
DAT_9fe8:
  9fe8  FF             ?? FFh                            
  9fe9  .db E4 CB B5 A1 90 80 72 66 5B 51 48 40 39 33 2E 29  ; ......rf[QH@93.)
  9ff9  .db 24 20 1D 1A 17 14 12 10 0E 0B 0A 09 08 08 07 06  ; $ ..............
  a009  .db 06 05 05 04 04 03 03 03 02 02 02 01 01 01 01     ; ...............
DAT_a018:
  a018  00             undefined1 00h                    
  a019  .db 80 22                                            ; ."
DAT_a01b:
  a01b  0104           undefined2 0104h                  
DAT_a01d:
  a01d  6154           undefined2 6154h                  
DAT_a01f:
  a01f  9EC5           undefined2 9EC5h                  
  a021  .db 80 24 01 05 61 55 9F 16 80 36 01 06 61 56 9F 0F  ; .$..aU...6..aV..
  a031  .db 80 23 01 07 61 57 9F 5D                          ; .#..aW.]

; ---- function API_FD94
API_FD94:
  a039  3426           PSHS  Y B A                       
  a03b  108EA019       LDY #0xa019                       
LAB_a03f:
  a03f  3420           PSHS  Y                           
  a041  10AE22         LDY 0x2,Y                         
  a044  170188         LBSR 0xa1cf                       
  a047  3520           PULS  Y                           
  a049  6DB804         TST [0x4,Y]                       
  a04c  2605           BNE 0xa053                        
  a04e  17FF81         LBSR 0x9fd2                       
  a051  2001           BRA 0xa054                        
LAB_a053:
  a053  5F             CLRB                              
LAB_a054:
  a054  ADB806         JSR [0x6,Y]                       
  a057  3526           PULS  A B Y                       
  a059  39             RTS                               

; ---- function API_FD96
API_FD96:
  a05a  3426           PSHS  Y B A                       
  a05c  108EA021       LDY #0xa021                       
  a060  20DD           BRA 0xa03f                        

; ---- function API_FD98
API_FD98:
  a062  3426           PSHS  Y B A                       
  a064  108EA029       LDY #0xa029                       
  a068  20D5           BRA 0xa03f                        

; ---- function API_FD9A
API_FD9A:
  a06a  3426           PSHS  Y B A                       
  a06c  108EA031       LDY #0xa031                       
  a070  20CD           BRA 0xa03f                        

; ---- function FUN_a072
FUN_a072:
  a072  3426           PSHS  Y B A                       
  a074  108EA019       LDY #0xa019                       

; ---- function FUN_a078
FUN_a078:
  a078  6FB804         CLR [0x4,Y]                       
LAB_a07b:
  a07b  3410           PSHS  X                           
  a07d  AE22           LDX 0x2,Y                         
  a07f  170114         LBSR 0xa196                       
  a082  3510           PULS  X                           
  a084  20B9           BRA 0xa03f                        

; ---- function FUN_a086
FUN_a086:
  a086  3426           PSHS  Y B A                       
  a088  20EE           BRA 0xa078                        

; ---- function FUN_a08a
FUN_a08a:
  a08a  3426           PSHS  Y B A                       
  a08c  108EA021       LDY #0xa021                       
  a090  20E6           BRA 0xa078                        

; ---- function FUN_a092
FUN_a092:
  a092  3426           PSHS  Y B A                       
  a094  108EA029       LDY #0xa029                       
  a098  20DE           BRA 0xa078                        

; ---- function FUN_a09a
FUN_a09a:
  a09a  3426           PSHS  Y B A                       
  a09c  108EA031       LDY #0xa031                       
  a0a0  20D6           BRA 0xa078                        

; ---- function FUN_a0a2
FUN_a0a2:
  a0a2  3426           PSHS  Y B A                       
  a0a4  108EA019       LDY #0xa019                       
LAB_a0a8:
  a0a8  C6FF           LDB #0xff                         
  a0aa  E7B804         STB [0x4,Y]                       
  a0ad  20CC           BRA 0xa07b                        

; ---- function FUN_a0af
FUN_a0af:
  a0af  3426           PSHS  Y B A                       
  a0b1  108EA021       LDY #0xa021                       
  a0b5  20F1           BRA 0xa0a8                        

; ---- function FUN_a0b7
FUN_a0b7:
  a0b7  3426           PSHS  Y B A                       
  a0b9  108EA029       LDY #0xa029                       
  a0bd  20E9           BRA 0xa0a8                        

; ---- function FUN_a0bf
FUN_a0bf:
  a0bf  3426           PSHS  Y B A                       
  a0c1  108EA031       LDY #0xa031                       
  a0c5  20E1           BRA 0xa0a8                        

; ---- function FUN_a0c7
FUN_a0c7:
  a0c7  3426           PSHS  Y B A                       
  a0c9  108EA019       LDY #0xa019                       
  a0cd  17FFB6         LBSR 0xa086                       
  a0d0  108EA021       LDY #0xa021                       
  a0d4  17FFAF         LBSR 0xa086                       
  a0d7  108EA029       LDY #0xa029                       
  a0db  17FFA8         LBSR 0xa086                       
  a0de  108EA031       LDY #0xa031                       
  a0e2  17FFA1         LBSR 0xa086                       
  a0e5  3526           PULS  A B Y                       
  a0e7  39             RTS                               

; ---- function API_FD9C
API_FD9C:
  a0e8  5D             TSTB                              
  a0e9  2F02           BLE 0xa0ed                        
  a0eb  C600           LDB #0x0                          
LAB_a0ed:
  a0ed  C1D0           CMPB #0xd0                        
  a0ef  2C02           BGE 0xa0f3                        
  a0f1  C6D0           LDB #0xd0                         
LAB_a0f3:
  a0f3  1D             SEX                               
  a0f4  39             RTS                               

; ---- function API_FDE2
API_FDE2:
  a0f5  3406           PSHS  B A                         
  a0f7  17F5E1         LBSR 0x96db                       
  a0fa  170099         LBSR 0xa196                       
  a0fd  1D             SEX                               
  a0fe  C1D0           CMPB #0xd0                        
  a100  2711           BEQ 0xa113                        
  a102  3606           PSHU  B A                         
  a104  17F5E6         LBSR 0x96ed                        ; inline[API_FC38]: "{4:0000}{3:60AA} dB"
  a107  0400000360AA.. char[10] 04h                      
LAB_a111:
  a111  200A           BRA 0xa11d                        
LAB_a113:
  a113  17F5D7         LBSR 0x96ed                        ; inline[API_FC38]: "  Off "
  a116  20204F666620.. char[7] "  Off "                  
LAB_a11d:
  a11d  3506           PULS  A B                         
  a11f  39             RTS                               

; ---- function FUN_a120
FUN_a120:
  a120  3436           PSHS  Y X B A                     
LAB_a122:
  a122  F66150         LDB 0x6150                        
  a125  C1FF           CMPB #0xff                        
  a127  2707           BEQ 0xa130                        
  a129  5C             INCB                              
  a12a  F76150         STB 0x6150                        
  a12d  170023         LBSR 0xa153                       
LAB_a130:
  a130  F6614E         LDB 0x614e                        
  a133  C1FF           CMPB #0xff                        
  a135  2707           BEQ 0xa13e                        
  a137  5C             INCB                              
  a138  F7614E         STB 0x614e                        
  a13b  17001A         LBSR 0xa158                       
LAB_a13e:
  a13e  CC0005         LDD #0x5                          
  a141  171F5F         LBSR 0xc0a3                       
  a144  C6FF           LDB #0xff                         
  a146  F16150         CMPB 0x6150                       
  a149  26D7           BNE 0xa122                        
  a14b  F1614E         CMPB 0x614e                       
  a14e  26D2           BNE 0xa122                        
  a150  3536           PULS  A B X Y                     
  a152  39             RTS                               

; ---- function FUN_a153
FUN_a153:
  a153  3436           PSHS  Y X B A                     
  a155  16FDD3         LBRA 0x9f2b                       

; ---- function FUN_a158
FUN_a158:
  a158  3436           PSHS  Y X B A                     
  a15a  16FD7D         LBRA 0x9eda                       

; ---- function FUN_a15d
FUN_a15d:
  a15d  3436           PSHS  Y X B A                     
LAB_a15f:
  a15f  F66150         LDB 0x6150                        
  a162  F16152         CMPB 0x6152                       
  a165  2707           BEQ 0xa16e                        
  a167  5A             DECB                              
  a168  F76150         STB 0x6150                        
  a16b  17FFE5         LBSR 0xa153                       
LAB_a16e:
  a16e  F6614E         LDB 0x614e                        
  a171  F16153         CMPB 0x6153                       
  a174  2707           BEQ 0xa17d                        
  a176  5A             DECB                              
  a177  F7614E         STB 0x614e                        
  a17a  17FFDB         LBSR 0xa158                       
LAB_a17d:
  a17d  CC0005         LDD #0x5                          
  a180  171F20         LBSR 0xc0a3                       
  a183  F66152         LDB 0x6152                        
  a186  F16150         CMPB 0x6150                       
  a189  26D4           BNE 0xa15f                        
  a18b  F66153         LDB 0x6153                        
  a18e  F1614E         CMPB 0x614e                       
  a191  26CC           BNE 0xa15f                        
  a193  3536           PULS  A B X Y                     
  a195  39             RTS                               

; ---- function API_FC7C
API_FC7C:
  a196  3403           PSHS  A CC                        
  a198  B6600C         LDA 0x600c                        
  a19b  3402           PSHS  A                           
  a19d  86A0           LDA #0xa0                         
  a19f  B7600C         STA 0x600c                        
  a1a2  175D0A         LBSR 0xfeaf                       
  a1a5  3502           PULS  A                           
  a1a7  B7600C         STA 0x600c                        
  a1aa  3503           PULS CC A                         
  a1ac  39             RTS                               

; ---- function API_FC7E
API_FC7E:
  a1ad  3441           PSHS  U CC                        
  a1af  B6600C         LDA 0x600c                        
  a1b2  3402           PSHS  A                           
  a1b4  86A0           LDA #0xa0                         
  a1b6  B7600C         STA 0x600c                        
  a1b9  175CF3         LBSR 0xfeaf                       
  a1bc  1F98           TFR B,A                           
  a1be  3001           LEAX 0x1,X                        
  a1c0  175CEC         LBSR 0xfeaf                       
  a1c3  1F03           TFR D,U                           
  a1c5  3502           PULS  A                           
  a1c7  B7600C         STA 0x600c                        
  a1ca  1F30           TFR U,D                           
  a1cc  3541           PULS CC U                         
  a1ce  39             RTS                               

; ---- function API_FC80
API_FC80:
  a1cf  3423           PSHS  Y A CC                      
  a1d1  B6600C         LDA 0x600c                        
  a1d4  3402           PSHS  A                           
  a1d6  86A0           LDA #0xa0                         
  a1d8  B7600C         STA 0x600c                        
  a1db  175CEE         LBSR 0xfecc                       
  a1de  3502           PULS  A                           
  a1e0  B7600C         STA 0x600c                        
  a1e3  3523           PULS CC A Y                       
  a1e5  39             RTS                               

; ---- function API_FC82
API_FC82:
  a1e6  3461           PSHS  U Y CC                      
  a1e8  1F03           TFR D,U                           
  a1ea  B6600C         LDA 0x600c                        
  a1ed  3402           PSHS  A                           
  a1ef  86A0           LDA #0xa0                         
  a1f1  B7600C         STA 0x600c                        
  a1f4  1F30           TFR U,D                           
  a1f6  1E89           EXG A,B                           
  a1f8  175CD1         LBSR 0xfecc                       
  a1fb  1E98           EXG B,A                           
  a1fd  3121           LEAY 0x1,Y                        
  a1ff  175CCA         LBSR 0xfecc                       
  a202  3502           PULS  A                           
  a204  B7600C         STA 0x600c                        
  a207  3561           PULS CC Y U                       
  a209  39             RTS                               

; ---- function API_FD88
API_FD88:
  a20a  3402           PSHS  A                           
  a20c  8D31           BSR 0xa23f                        
  a20e  3402           PSHS  A                           
  a210  17FF83         LBSR 0xa196                       
  a213  E4E0           ANDB ,S+                          
  a215  3502           PULS  A                           
  a217  39             RTS                               

; ---- function API_FD8A
API_FD8A:
  a218  3413           PSHS  X A CC                      
  a21a  8D23           BSR 0xa23f                        
  a21c  3402           PSHS  A                           
  a21e  1F21           TFR Y,X                           
  a220  17FF73         LBSR 0xa196                       
  a223  EAE0           ORB ,S+                           
  a225  17FFA7         LBSR 0xa1cf                       
  a228  3513           PULS CC A X                       
  a22a  39             RTS                               

; ---- function API_FD8C
API_FD8C:
  a22b  3413           PSHS  X A CC                      
  a22d  8D10           BSR 0xa23f                        
  a22f  43             COMA                              
  a230  3402           PSHS  A                           
  a232  1F21           TFR Y,X                           
  a234  17FF5F         LBSR 0xa196                       
  a237  E4E0           ANDB ,S+                          
  a239  17FF93         LBSR 0xa1cf                       
  a23c  3513           PULS CC A X                       
  a23e  39             RTS                               

; ---- function FUN_a23f
FUN_a23f:
  a23f  3410           PSHS  X                           
  a241  8EA24B         LDX #0xa24b                       
  a244  C407           ANDB #0x7                         
  a246  A685           LDA B,X                           
  a248  3510           PULS  X                           
  a24a  39             RTS                               
DAT_a24b:
  a24b  01             ?? 01h                            
  a24c  .db 02 04 08 10 20 40 80                             ; .... @.

; ---- function API_FC84
API_FC84:
  a253  3406           PSHS  B A                         
  a255  1703D1         LBSR 0xa629                       
  a258  173C75         LBSR 0xded0                       
  a25b  86FF           LDA #0xff                         
  a25d  B760B8         STA 0x60b8                        
  a260  3506           PULS  A B                         
  a262  39             RTS                               

; ---- function FUN_a263
FUN_a263:
  a263  3406           PSHS  B A                         
  a265  86FF           LDA #0xff                         
  a267  B760FB         STA 0x60fb                        
  a26a  8D06           BSR 0xa272                        
  a26c  170084         LBSR 0xa2f3                       
  a26f  3506           PULS  A B                         
  a271  39             RTS                               

; ---- function FUN_a272
FUN_a272:
  a272  3406           PSHS  B A                         
  a274  F660FB         LDB 0x60fb                        
  a277  C4F8           ANDB #0xf8                        
  a279  C180           CMPB #0x80                        
  a27b  2773           BEQ 0xa2f0                        
  a27d  17049C         LBSR 0xa71c                       
  a280  1703A6         LBSR 0xa629                       
  a283  17F467         LBSR 0x96ed                        ; inline[API_FC38]: "{1} Left In   Right In  Left Out  Right Out(        )(        )(        )(        )"
  a286  01204C656674.. char[82] 01h," Left In   Right In  Left Out  Right Out(        )(        )(        )(        )"
LAB_a2d8:
  a2d8  170171         LBSR 0xa44c                       
  a2db  171D37         LBSR 0xc015                        ; inline[API_FD18]: [$603C]=$A48D [$603E]=$A4CA [$6040]=$A4F1 [$6042]=$A518
  a2de  603C           addr 603c                         
  a2e0  A48D           dw A48Dh                          
  a2e2  603E           addr 603e                         
  a2e4  A4CA           dw A4CAh                          
  a2e6  6040           addr 6040                         
  a2e8  A4F1           dw A4F1h                          
  a2ea  6042           addr 6042                         
  a2ec  A518           dw A518h                          
  a2ee  FFFF           dw FFFFh                          
LAB_a2f0:
  a2f0  3506           PULS  A B                         
  a2f2  39             RTS                               

; ---- function FUN_a2f3
FUN_a2f3:
  a2f3  3416           PSHS  X B A                       
  a2f5  C680           LDB #0x80                         
  a2f7  F160FB         CMPB 0x60fb                       
  a2fa  2736           BEQ 0xa332                        
  a2fc  F760FB         STB 0x60fb                        
  a2ff  8E0104         LDX #0x104                        
  a302  17FE91         LBSR 0xa196                       
  a305  1D             SEX                               
  a306  FD6074         STD 0x6074                        
  a309  170161         LBSR 0xa46d                       
  a30c  171D06         LBSR 0xc015                        ; inline[API_FD18]: [$602A]=$A3A4 [$6070]=$A335 [$6072]=$A34D [$605C]=$A36A [$605A]=$A36A
  a30f  602A           addr 602a                         
  a311  A3A4           dw A3A4h                          
  a313  6070           addr 6070                         
  a315  A335           dw A335h                          
  a317  6072           addr 6072                         
  a319  A34D           dw A34Dh                          
  a31b  605C           addr 605c                         
  a31d  A36A           dw A36Ah                          
  a31f  605A           addr 605a                         
  a321  A36A           dw A36Ah                          
  a323  FFFF           dw FFFFh                          
LAB_a325:
  a325  17430B         LBSR 0xe633                       
  a328  C600           LDB #0x0                          
  a32a  1742C3         LBSR 0xe5f0                       
  a32d  C601           LDB #0x1                          
  a32f  1742BE         LBSR 0xe5f0                       
LAB_a332:
  a332  3516           PULS  A B X                       
  a334  39             RTS                               

; ---- function FUN_a335
FUN_a335:
  a335  7D604D         TST 0x604d                        
  a338  2712           BEQ 0xa34c                        
  a33a  17F3B0         LBSR 0x96ed                        ; inline[API_FC38]: "{2:2A}{5:06}{3:60A0}{2:34}{5:06}{3:60A0}"
  a33d  022A05060360.. char[15] 02h,"*",05h,06h,03h,"`",A0h,02h,"4",05h,06h,03h,"`",A0h
LAB_a34c:
  a34c  39             RTS                               

; ---- function FUN_a34d
FUN_a34d:
  a34d  3436           PSHS  Y X B A                     
  a34f  FC6074         LDD 0x6074                        
  a352  108EA5E9       LDY #0xa5e9                       
  a356  170271         LBSR 0xa5ca                       
  a359  ADB90000       JSR [0x0,Y]                       
  a35d  108EA5F4       LDY #0xa5f4                       
  a361  170266         LBSR 0xa5ca                       
  a364  ADB90000       JSR [0x0,Y]                       
  a368  2010           BRA 0xa37a                        

; ---- function FUN_a36a
FUN_a36a:
  a36a  3436           PSHS  Y X B A                     
  a36c  108EA5E9       LDY #0xa5e9                       
  a370  170018         LBSR 0xa38b                       
  a373  108EA5F4       LDY #0xa5f4                       
  a377  170011         LBSR 0xa38b                       
LAB_a37a:
  a37a  108EA5E9       LDY #0xa5e9                       
  a37e  1700BB         LBSR 0xa43c                       
  a381  108EA5F4       LDY #0xa5f4                       
  a385  1700B4         LBSR 0xa43c                       
  a388  3536           PULS  A B X Y                     
  a38a  39             RTS                               

; ---- function FUN_a38b
FUN_a38b:
  a38b  3406           PSHS  B A                         
  a38d  AEA90002       LDX 0x2,Y                         
  a391  17FE02         LBSR 0xa196                       
  a394  1D             SEX                               
  a395  E3E4           ADDD ,S                           
  a397  17FD4E         LBSR 0xa0e8                       
  a39a  17022D         LBSR 0xa5ca                       
  a39d  ADB90000       JSR [0x0,Y]                       
  a3a1  3506           PULS  A B                         
  a3a3  39             RTS                               

; ---- function FUN_a3a4
FUN_a3a4:
  a3a4  3416           PSHS  X B A                       
  a3a6  C681           LDB #0x81                         
  a3a8  F160FB         CMPB 0x60fb                       
  a3ab  2736           BEQ 0xa3e3                        
  a3ad  F760FB         STB 0x60fb                        
  a3b0  8E0106         LDX #0x106                        
  a3b3  17FDE0         LBSR 0xa196                       
  a3b6  1D             SEX                               
  a3b7  FD6074         STD 0x6074                        
  a3ba  1700B0         LBSR 0xa46d                       
  a3bd  171C55         LBSR 0xc015                        ; inline[API_FD18]: [$602A]=$A2F3 [$6070]=$A3E6 [$6072]=$A3FE [$605C]=$A41B [$605A]=$A41B
  a3c0  602A           addr 602a                         
  a3c2  A2F3           dw A2F3h                          
  a3c4  6070           addr 6070                         
  a3c6  A3E6           dw A3E6h                          
  a3c8  6072           addr 6072                         
  a3ca  A3FE           dw A3FEh                          
  a3cc  605C           addr 605c                         
  a3ce  A41B           dw A41Bh                          
  a3d0  605A           addr 605a                         
  a3d2  A41B           dw A41Bh                          
  a3d4  FFFF           dw FFFFh                          
LAB_a3d6:
  a3d6  17425A         LBSR 0xe633                       
  a3d9  C602           LDB #0x2                          
  a3db  174212         LBSR 0xe5f0                       
  a3de  C603           LDB #0x3                          
  a3e0  17420D         LBSR 0xe5f0                       
LAB_a3e3:
  a3e3  3516           PULS  A B X                       
  a3e5  39             RTS                               

; ---- function FUN_a3e6
FUN_a3e6:
  a3e6  7D604D         TST 0x604d                        
  a3e9  2712           BEQ 0xa3fd                        
  a3eb  17F2FF         LBSR 0x96ed                        ; inline[API_FC38]: "{2:3E}{5:06}{3:60A0}{2:48}{5:06}{3:60A0}"
  a3ee  023E05060360.. char[15] 02h,">",05h,06h,03h,"`",A0h,02h,"H",05h,06h,03h,"`",A0h
LAB_a3fd:
  a3fd  39             RTS                               

; ---- function FUN_a3fe
FUN_a3fe:
  a3fe  3436           PSHS  Y X B A                     
  a400  FC6074         LDD 0x6074                        
  a403  108EA5FF       LDY #0xa5ff                       
  a407  1701C0         LBSR 0xa5ca                       
  a40a  ADB90000       JSR [0x0,Y]                       
  a40e  108EA60A       LDY #0xa60a                       
  a412  1701B5         LBSR 0xa5ca                       
  a415  ADB90000       JSR [0x0,Y]                       
  a419  2010           BRA 0xa42b                        

; ---- function FUN_a41b
FUN_a41b:
  a41b  3436           PSHS  Y X B A                     
  a41d  108EA5FF       LDY #0xa5ff                       
  a421  17FF67         LBSR 0xa38b                       
  a424  108EA60A       LDY #0xa60a                       
  a428  17FF60         LBSR 0xa38b                       
LAB_a42b:
  a42b  108EA5FF       LDY #0xa5ff                       
  a42f  17000A         LBSR 0xa43c                       
  a432  108EA60A       LDY #0xa60a                       
  a436  170003         LBSR 0xa43c                       
  a439  3536           PULS  A B X Y                     
  a43b  39             RTS                               

; ---- function FUN_a43c
FUN_a43c:
  a43c  3416           PSHS  X B A                       
  a43e  AEA90002       LDX 0x2,Y                         
  a442  E6A90006       LDB 0x6,Y                         
  a446  17FCAC         LBSR 0xa0f5                       
  a449  3516           PULS  A B X                       
  a44b  39             RTS                               

; ---- function FUN_a44c
FUN_a44c:
  a44c  3426           PSHS  Y B A                       
  a44e  108EA5E9       LDY #0xa5e9                       
  a452  17FFE7         LBSR 0xa43c                       
  a455  108EA5F4       LDY #0xa5f4                       
  a459  17FFE0         LBSR 0xa43c                       
  a45c  108EA5FF       LDY #0xa5ff                       
  a460  17FFD9         LBSR 0xa43c                       
  a463  108EA60A       LDY #0xa60a                       
  a467  17FFD2         LBSR 0xa43c                       
  a46a  3526           PULS  A B Y                       
  a46c  39             RTS                               

; ---- function FUN_a46d
FUN_a46d:
  a46d  3406           PSHS  B A                         
  a46f  17E98A         LBSR 0x8dfc                        ; inline[API_FC16]: 03 10 06 32 01 00 03 00 $0000 $FFD0 $0000 ->$8877 ->$8877 $0001 $0001 $0000
  a472  03             db 3h                             
  a473  10             db 10h                            
  a474  06             db 6h                             
  a475  32             db 32h                            
  a476  01             db 1h                             
  a477  00             db 0h                             
  a478  03             db 3h                             
  a479  00             db 0h                             
  a47a  0000           dw 0h                             
  a47c  FFD0           dw FFD0h                          
  a47e  0000           dw 0h                             
  a480  8877           addr 8877                         
  a482  8877           addr 8877                         
  a484  0001           dw 1h                             
  a486  0001           dw 1h                             
  a488  0000           dw 0h                             
LAB_a48a:
  a48a  3506           PULS  A B                         
  a48c  39             RTS                               

; ---- function FUN_a48d
FUN_a48d:
  a48d  3406           PSHS  B A                         
  a48f  C682           LDB #0x82                         
  a491  F160FB         CMPB 0x60fb                       
  a494  270D           BEQ 0xa4a3                        
  a496  F760FB         STB 0x60fb                        
  a499  108EA5E9       LDY #0xa5e9                       
  a49d  1700D4         LBSR 0xa574                       
  a4a0  1700FC         LBSR 0xa59f                       
LAB_a4a3:
  a4a3  3506           PULS  A B                         
  a4a5  39             RTS                               

; ---- function FUN_a4a6
FUN_a4a6:
  a4a6  3436           PSHS  Y X B A                     
  a4a8  108EA5E9       LDY #0xa5e9                       
  a4ac  170103         LBSR 0xa5b2                       
  a4af  8D03           BSR 0xa4b4                        
  a4b1  3536           PULS  A B X Y                     
  a4b3  39             RTS                               

; ---- function FUN_a4b4
FUN_a4b4:
  a4b4  3416           PSHS  X B A                       
  a4b6  FC60F9         LDD 0x60f9                        
  a4b9  FD6074         STD 0x6074                        
  a4bc  10BF60C2       STY 0x60c2                        
  a4c0  ADB90000       JSR [0x0,Y]                       
  a4c4  17FF75         LBSR 0xa43c                       
  a4c7  3516           PULS  A B X                       
  a4c9  39             RTS                               

; ---- function FUN_a4ca
FUN_a4ca:
  a4ca  3406           PSHS  B A                         
  a4cc  C683           LDB #0x83                         
  a4ce  F160FB         CMPB 0x60fb                       
  a4d1  270D           BEQ 0xa4e0                        
  a4d3  F760FB         STB 0x60fb                        
  a4d6  108EA5F4       LDY #0xa5f4                       
  a4da  170097         LBSR 0xa574                       
  a4dd  1700BF         LBSR 0xa59f                       
LAB_a4e0:
  a4e0  3506           PULS  A B                         
  a4e2  39             RTS                               

; ---- function FUN_a4e3
FUN_a4e3:
  a4e3  3436           PSHS  Y X B A                     
  a4e5  108EA5F4       LDY #0xa5f4                       
  a4e9  1700C6         LBSR 0xa5b2                       
  a4ec  8DC6           BSR 0xa4b4                        
  a4ee  3536           PULS  A B X Y                     
  a4f0  39             RTS                               

; ---- function FUN_a4f1
FUN_a4f1:
  a4f1  3406           PSHS  B A                         
  a4f3  C684           LDB #0x84                         
  a4f5  F160FB         CMPB 0x60fb                       
  a4f8  270D           BEQ 0xa507                        
  a4fa  F760FB         STB 0x60fb                        
  a4fd  108EA5FF       LDY #0xa5ff                       
  a501  170070         LBSR 0xa574                       
  a504  170098         LBSR 0xa59f                       
LAB_a507:
  a507  3506           PULS  A B                         
  a509  39             RTS                               

; ---- function FUN_a50a
FUN_a50a:
  a50a  3436           PSHS  Y X B A                     
  a50c  108EA5FF       LDY #0xa5ff                       
  a510  17009F         LBSR 0xa5b2                       
  a513  8D9F           BSR 0xa4b4                        
  a515  3536           PULS  A B X Y                     
  a517  39             RTS                               

; ---- function FUN_a518
FUN_a518:
  a518  3406           PSHS  B A                         
  a51a  C685           LDB #0x85                         
  a51c  F160FB         CMPB 0x60fb                       
  a51f  270D           BEQ 0xa52e                        
  a521  F760FB         STB 0x60fb                        
  a524  108EA60A       LDY #0xa60a                       
  a528  170049         LBSR 0xa574                       
  a52b  170071         LBSR 0xa59f                       
LAB_a52e:
  a52e  3506           PULS  A B                         
  a530  39             RTS                               

; ---- function FUN_a531
FUN_a531:
  a531  3436           PSHS  Y X B A                     
  a533  108EA60A       LDY #0xa60a                       
  a537  170078         LBSR 0xa5b2                       
  a53a  17FF77         LBSR 0xa4b4                       
  a53d  3536           PULS  A B X Y                     
  a53f  39             RTS                               

; ---- function FUN_a540
FUN_a540:
  a540  3406           PSHS  B A                         
  a542  10BE60C2       LDY 0x60c2                        
  a546  E6A90006       LDB 0x6,Y                         
  a54a  17F18E         LBSR 0x96db                       
  a54d  7D604D         TST 0x604d                        
  a550  2709           BEQ 0xa55b                        
  a552  17F198         LBSR 0x96ed                        ; inline[API_FC38]: "{5:06}{3:60A0}"
  a555  05060360A000   char[6] 05h,06h,03h,"`",A0h       
LAB_a55b:
  a55b  3506           PULS  A B                         
  a55d  39             RTS                               

; ---- function FUN_a55e
FUN_a55e:
  a55e  3416           PSHS  X B A                       
  a560  10BE60C2       LDY 0x60c2                        
  a564  FC6074         LDD 0x6074                        
  a567  170060         LBSR 0xa5ca                       
  a56a  ADB90000       JSR [0x0,Y]                       
  a56e  17FECB         LBSR 0xa43c                       
  a571  3516           PULS  A B X                       
  a573  39             RTS                               

; ---- function FUN_a574
FUN_a574:
  a574  10BF60C2       STY 0x60c2                        
  a578  AEA90002       LDX 0x2,Y                         
  a57c  17FC17         LBSR 0xa196                       
  a57f  1D             SEX                               
  a580  FD6074         STD 0x6074                        
  a583  17E876         LBSR 0x8dfc                        ; inline[API_FC16]: 01 10 02 32 01 00 03 00 $0000 $FFD0 $0000 ->$A540 ->$A55E $0001 $0001 $0000
  a586  01             db 1h                             
  a587  10             db 10h                            
  a588  02             db 2h                             
  a589  32             db 32h                            
  a58a  01             db 1h                             
  a58b  00             db 0h                             
  a58c  03             db 3h                             
  a58d  00             db 0h                             
  a58e  0000           dw 0h                             
  a590  FFD0           dw FFD0h                          
  a592  0000           dw 0h                             
  a594  A540           addr a540                         
  a596  A55E           addr a55e                         
  a598  0001           dw 1h                             
  a59a  0001           dw 1h                             
  a59c  0000           dw 0h                             
LAB_a59e:
  a59e  39             RTS                               

; ---- function FUN_a59f
FUN_a59f:
  a59f  3404           PSHS  B                           
  a5a1  E6A90006       LDB 0x6,Y                         
  a5a5  17408B         LBSR 0xe633                       
  a5a8  E6A90007       LDB 0x7,Y                         
  a5ac  174041         LBSR 0xe5f0                       
  a5af  3504           PULS  B                           
  a5b1  39             RTS                               

; ---- function FUN_a5b2
FUN_a5b2:
  a5b2  E6A9000A       LDB 0xa,Y                         
  a5b6  F160FB         CMPB 0x60fb                       
  a5b9  270E           BEQ 0xa5c9                        
  a5bb  17FCB4         LBSR 0xa272                       
  a5be  E6A90007       LDB 0x7,Y                         
  a5c2  F760B9         STB 0x60b9                        
  a5c5  ADB90008       JSR [0x8,Y]                       
LAB_a5c9:
  a5c9  39             RTS                               

; ---- function FUN_a5ca
FUN_a5ca:
  a5ca  3436           PSHS  Y X B A                     
  a5cc  3404           PSHS  B                           
  a5ce  AEA90002       LDX 0x2,Y                         
  a5d2  17FBC1         LBSR 0xa196                       
  a5d5  E1E4           CMPB ,S                           
  a5d7  270B           BEQ 0xa5e4                        
  a5d9  E6E4           LDB ,S                            
  a5db  1D             SEX                               
  a5dc  10AEA90004     LDY 0x4,Y                         
  a5e1  174541         LBSR 0xeb25                       
LAB_a5e4:
  a5e4  3504           PULS  B                           
  a5e6  3536           PULS  A B X Y                     
  a5e8  39             RTS                               
DAT_a5e9:
  a5e9  A039           undefined2 A039h                  
  a5eb  .db 01 04 20 00 2A 00 A4 8D 82                       ; .. .*....
DAT_a5f4:
  a5f4  A05A           undefined2 A05Ah                  
  a5f6  .db 01 05 20 01 34 01 A4 CA 83                       ; .. .4....
DAT_a5ff:
  a5ff  A062           undefined2 A062h                  
  a601  .db 01 06 20 02 3E 02 A4 F1 84                       ; .. .>....
DAT_a60a:
  a60a  A06A           undefined2 A06Ah                  
  a60c  .db 01 07 20 03 48 03 A5 18 85 17 F5 0C 39           ; .. .H.......9

; ---- function FUN_a619
FUN_a619:
  a619  3406           PSHS  B A                         
  a61b  86FF           LDA #0xff                         
  a61d  B760FB         STA 0x60fb                        
  a620  170006         LBSR 0xa629                       
  a623  17011D         LBSR 0xa743                       
  a626  3506           PULS  A B                         
  a628  39             RTS                               

; ---- function API_FC88
API_FC88:
  a629  17F082         LBSR 0x96ae                       
  a62c  1719E6         LBSR 0xc015                        ; inline[API_FD18]: [$602A]=$A263 [$602E]=$A7DE [$6030]=$DE80 [$602C]=$A615 [$603C]=$8877 [$603E]=$8877 [$6040]=$8877 [$6042]=$8877 [$6038]=$8877 [$6036]=$8877 [$603A]=$A619 [$605C]=$8877 [$605A]=$8877 [$606A]=$8877 [$6072]=$8877 [$6070]=$8877
  a62f  602A           addr 602a                         
  a631  A263           dw A263h                          
  a633  602E           addr 602e                         
  a635  A7DE           dw A7DEh                          
  a637  6030           addr 6030                         
  a639  DE80           dw DE80h                          
  a63b  602C           addr 602c                         
  a63d  A615           dw A615h                          
  a63f  603C           addr 603c                         
  a641  8877           dw 8877h                          
  a643  603E           addr 603e                         
  a645  8877           dw 8877h                          
  a647  6040           addr 6040                         
  a649  8877           dw 8877h                          
  a64b  6042           addr 6042                         
  a64d  8877           dw 8877h                          
  a64f  6038           addr 6038                         
  a651  8877           dw 8877h                          
  a653  6036           addr 6036                         
  a655  8877           dw 8877h                          
  a657  603A           addr 603a                         
  a659  A619           dw A619h                          
  a65b  605C           addr 605c                         
  a65d  8877           dw 8877h                          
  a65f  605A           addr 605a                         
  a661  8877           dw 8877h                          
  a663  606A           addr 606a                         
  a665  8877           dw 8877h                          
  a667  6072           addr 6072                         
  a669  8877           dw 8877h                          
  a66b  6070           addr 6070                         
  a66d  8877           dw 8877h                          
  a66f  FFFF           dw FFFFh                          
LAB_a671:
  a671  39             RTS                               

; ---- function API_FDD4
API_FDD4:
  a672  17F078         LBSR 0x96ed                        ; inline[API_FC38]: "{2:28}{5:28}"
  a675  0228052800     char[5] 02h,"(",05h,"("           
LAB_a67a:
  a67a  171998         LBSR 0xc015                        ; inline[API_FD18]: [$603C]=$8877 [$603E]=$8877 [$6040]=$8877 [$6042]=$8877
  a67d  603C           addr 603c                         
  a67f  8877           dw 8877h                          
  a681  603E           addr 603e                         
  a683  8877           dw 8877h                          
  a685  6040           addr 6040                         
  a687  8877           dw 8877h                          
  a689  6042           addr 6042                         
  a68b  8877           dw 8877h                          
  a68d  FFFF           dw FFFFh                          
LAB_a68f:
  a68f  39             RTS                               

; ---- function FUN_a690
FUN_a690:
  a690  3416           PSHS  X B A                       
  a692  AE64           LDX 0x4,S                         
  a694  EC81           LDD ,X++                          
  a696  FD6158         STD 0x6158                        
  a699  EC81           LDD ,X++                          
  a69b  FD615A         STD 0x615a                        
  a69e  AF64           STX 0x4,S                         
  a6a0  C601           LDB #0x1                          
  a6a2  170028         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$A6C5 "(  Yes   )"
  a6a5  A6C5           addr a6c5                         
  a6a7  282020596573.. ds "(  Yes   )"                   
LAB_a6b1:
  a6b1  C602           LDB #0x2                          
  a6b3  170017         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$A6C9 "(   No   )"
  a6b6  A6C9           addr a6c9                         
  a6b8  282020204E6F.. ds "(   No   )"                   
LAB_a6c2:
  a6c2  3516           PULS  A B X                       
  a6c4  39             RTS                               

; ---- function FUN_a6c5
FUN_a6c5:
  a6c5  6E9F6158       JMP [0x6158]                      

; ---- function FUN_a6c9
FUN_a6c9:
  a6c9  6E9F615A       JMP [0x615a]                      

;; Kernel API slot $FC8A: B = key 0-3; inline handler + 10-char label

; ---- function SoftKeyDefine
SoftKeyDefine:
  a6cd  3437           PSHS  Y X B A CC                  
  a6cf  C403           ANDB #0x3                         
  a6d1  3604           PSHU  B                           
  a6d3  58             LSLB                              
  a6d4  108E603C       LDY #0x603c                       
  a6d8  31A5           LEAY B,Y                          
  a6da  AE67           LDX 0x7,S                         
  a6dc  EC81           LDD ,X++                          
  a6de  EDA4           STD ,Y                            
  a6e0  E6C4           LDB ,U                            
  a6e2  860A           LDA #0xa                          
  a6e4  3D             MUL                               
  a6e5  CB28           ADDB #0x28                        
  a6e7  17EFF1         LBSR 0x96db                       
  a6ea  C60A           LDB #0xa                          
  a6ec  17F06E         LBSR 0x975d                       
  a6ef  AF67           STX 0x7,S                         
  a6f1  3341           LEAU 0x1,U                        
  a6f3  3537           PULS CC A B X Y                   
  a6f5  39             RTS                               

; ---- function API_FDD6
API_FDD6:
  a6f6  3436           PSHS  Y X B A                     
  a6f8  C403           ANDB #0x3                         
  a6fa  3404           PSHS  B                           
  a6fc  58             LSLB                              
  a6fd  108E603C       LDY #0x603c                       
  a701  31A5           LEAY B,Y                          
  a703  ECC4           LDD ,U                            
  a705  EDA4           STD ,Y                            
  a707  E6E4           LDB ,S                            
  a709  860A           LDA #0xa                          
  a70b  3D             MUL                               
  a70c  CB28           ADDB #0x28                        
  a70e  17EFCA         LBSR 0x96db                       
  a711  C608           LDB #0x8                          
  a713  3084           LEAX ,X                           
  a715  17F045         LBSR 0x975d                       
  a718  3504           PULS  B                           
  a71a  3536           PULS  A B X Y                     

; ---- function API_FC8C
API_FC8C:
  a71c  3437           PSHS  Y X B A CC                  
  a71e  7D60B8         TST 0x60b8                        
  a721  261D           BNE 0xa740                        
  a723  86FF           LDA #0xff                         
  a725  B760B8         STA 0x60b8                        
  a728  8EA768         LDX #0xa768                       
  a72b  108E6800       LDY #0x6800                       
  a72f  171913         LBSR 0xc045                       
  a732  C600           LDB #0x0                          
  a734  17EFA4         LBSR 0x96db                       
  a737  C650           LDB #0x50                         
  a739  17F030         LBSR 0x976c                       
  a73c  AD9F60ED       JSR [0x60ed]                      
LAB_a740:
  a740  3537           PULS CC A B X Y                   
  a742  39             RTS                               

; ---- function API_FC8E
API_FC8E:
  a743  3437           PSHS  Y X B A CC                  
  a745  7D60B8         TST 0x60b8                        
  a748  271B           BEQ 0xa765                        
  a74a  7F60B8         CLR 0x60b8                        
  a74d  108EA768       LDY #0xa768                       
  a751  8E6800         LDX #0x6800                       
  a754  17191D         LBSR 0xc074                       
  a757  C600           LDB #0x0                          
  a759  17EF7F         LBSR 0x96db                       
  a75c  C650           LDB #0x50                         
  a75e  17EFFC         LBSR 0x975d                       
  a761  AD9F60EF       JSR [0x60ef]                      
LAB_a765:
  a765  3537           PULS CC A B X Y                   
  a767  39             RTS                               
  a768  .db 60 3C 02 60 3E 02 60 40 02 60 42 02 60 E3 02 60  ; `<.`>.`@.`B.`..`
  a778  .db E5 02 60 E7 02 60 E9 02 60 3A 02 60 64 02 60 62  ; ..`..`..`:.`d.`b
  a788  .db 02 60 66 01 60 5C 02 60 38 02 60 36 02 60 54 02  ; .`f.`\.`8.`6.`T.
  a798  .db 60 56 02 60 58 02 60 5A 02 60 60 02 60 67 02 60  ; `V.`X.`Z.``.`g.`
  a7a8  .db 68 02 60 69 02 60 6A 02 60 6E 02 60 6C 02 60 74  ; h.`i.`j.`n.`l.`t
  a7b8  .db 02 60 70 02 60 72 02 60 F2 02 60 8B 02 60 8D 02  ; .`p.`r.`..`..`..
  a7c8  .db 60 99 01 60 BA 01 60 BB 02 60 DC 02 60 DE 02 60  ; `..`..`..`..`..`
  a7d8  .db E0 02 FF FF 00 00                                ; ......

; ---- function FUN_a7de
FUN_a7de:
  a7de  3406           PSHS  B A                         
  a7e0  17FF39         LBSR 0xa71c                       
  a7e3  8E0000         LDX #0x0                          
  a7e6  17F9C4         LBSR 0xa1ad                       
  a7e9  17F524         LBSR 0x9d10                       
  a7ec  170170         LBSR 0xa95f                       
  a7ef  FD615C         STD 0x615c                        
  a7f2  CCA7FB         LDD #0xa7fb                       
  a7f5  17F378         LBSR 0x9b70                       
  a7f8  3506           PULS  A B                         
  a7fa  39             RTS                               
  a7fb  A827A82CA9DF.. addr[21]                          
  a825  .db FF FF                                            ; ..

; ---- function FUN_a827
FUN_a827:
  a827  3416           PSHS  X B A                       
  a829  3516           PULS  A B X                       
  a82b  39             RTS                               

; ---- function FUN_a82c
FUN_a82c:
  a82c  3436           PSHS  Y X B A                     
  a82e  C6A0           LDB #0xa0                         
  a830  F760FB         STB 0x60fb                        
  a833  17FDF3         LBSR 0xa629                       
  a836  CC9BE2         LDD #0x9be2                       
  a839  FD6036         STD 0x6036                        
  a83c  CC9C05         LDD #0x9c05                       
  a83f  FD602E         STD 0x602e                        
  a842  17FE2D         LBSR 0xa672                       
  a845  17EEA5         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}Selected Program : "
  a848  020053656C65.. char[22] 02h                      
LAB_a85e:
  a85e  FC615C         LDD 0x615c                        
  a861  1700FB         LBSR 0xa95f                       
  a864  FD615C         STD 0x615c                        
  a867  FD6062         STD 0x6062                        
  a86a  FD6054         STD 0x6054                        
  a86d  CC03E8         LDD #0x3e8                        
  a870  FD6064         STD 0x6064                        
  a873  FD6056         STD 0x6056                        
  a876  FC615C         LDD 0x615c                        
  a879  FD6074         STD 0x6074                        
  a87c  171796         LBSR 0xc015                        ; inline[API_FD18]: [$606C]=$03E7 [$606E]=$0000 [$6070]=$8877 [$6072]=$8877 [$606A]=$A918 [$605C]=$A97C [$605A]=$A956 [$60DE]=$0001 [$60DC]=$0001 [$60E0]=$0096
  a87f  606C           addr 606c                         
  a881  03E7           dw 3E7h                           
  a883  606E           addr 606e                         
  a885  0000           dw 0h                             
  a887  6070           addr 6070                         
  a889  8877           dw 8877h                          
  a88b  6072           addr 6072                         
  a88d  8877           dw 8877h                          
  a88f  606A           addr 606a                         
  a891  A918           dw A918h                          
  a893  605C           addr 605c                         
  a895  A97C           dw A97Ch                          
  a897  605A           addr 605a                         
  a899  A956           dw A956h                          
  a89b  60DE           addr 60de                         
  a89d  0001           dw 1h                             
  a89f  60DC           addr 60dc                         
  a8a1  0001           dw 1h                             
  a8a3  60E0           addr 60e0                         
  a8a5  0096           dw 96h                            
  a8a7  FFFF           dw FFFFh                          
LAB_a8a9:
  a8a9  171781         LBSR 0xc02d                        ; inline[API_FD1A]: [$6066]=$01 [$6067]=$20 [$6058]=$02 [$6068]=$04 [$6099]=$00 [$6069]=$03
  a8ac  6066           addr 6066                         
  a8ae  01             db 1h                             
  a8af  6067           addr 6067                         
  a8b1  20             db 20h                            
  a8b2  6058           addr 6058                         
  a8b4  02             db 2h                             
  a8b5  6068           addr 6068                         
  a8b7  04             db 4h                             
  a8b8  6099           addr 6099                         
  a8ba  00             db 0h                             
  a8bb  6069           addr 6069                         
  a8bd  03             db 3h                             
  a8be  FFFF           dw FFFFh                          
LAB_a8c0:
  a8c0  17E7A7         LBSR 0x906a                       
  a8c3  17EB6E         LBSR 0x9434                       
  a8c6  17E383         LBSR 0x8c4c                       
  a8c9  170003         LBSR 0xa8cf                       
  a8cc  3536           PULS  A B X Y                     
  a8ce  39             RTS                               

; ---- function FUN_a8cf
FUN_a8cf:
  a8cf  3406           PSHS  B A                         
  a8d1  C613           LDB #0x13                         
  a8d3  17EE05         LBSR 0x96db                       
  a8d6  FC615C         LDD 0x615c                        
  a8d9  108303E8       CMPD #0x3e8                       
  a8dd  2708           BEQ 0xa8e7                        
  a8df  17057C         LBSR 0xae5e                       
  a8e2  170588         LBSR 0xae6d                       
  a8e5  202E           BRA 0xa915                        
LAB_a8e7:
  a8e7  17EE03         LBSR 0x96ed                        ; inline[API_FC38]: "Last Edit            "
  a8ea  4C6173742045.. char[22] "Last Edit            "  
LAB_a900:
  a900  7D61AD         TST 0x61ad                        
  a903  2710           BEQ 0xa915                        
  a905  17EDE5         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1E}<SEQUENCE>"
  a908  021E3C534551.. char[13] 02h,1Eh,"<SEQUENCE>"     
LAB_a915:
  a915  3506           PULS  A B                         
  a917  39             RTS                               

; ---- function FUN_a918
FUN_a918:
  a918  3436           PSHS  Y X B A                     
  a91a  F660FD         LDB 0x60fd                        
  a91d  C10C           CMPB #0xc                         
  a91f  2727           BEQ 0xa948                        
  a921  FC6074         LDD 0x6074                        
  a924  17F3DC         LBSR 0x9d03                       
  a927  275A           BEQ 0xa983                        
  a929  FC6074         LDD 0x6074                        
  a92c  3606           PSHU  B A                         
  a92e  17EDBC         LBSR 0x96ed                        ; inline[API_FC38]: "{2:28}{5:28}{2:13}{5:15}[{4:2000}{3:60AA}]"
  a931  022805280213.. char[17] 02h,"(",05h,"(",02h,13h,05h,15h,"[",04h," "
LAB_a942:
  a942  17FD2D         LBSR 0xa672                       
  a945  3536           PULS  A B X Y                     
  a947  39             RTS                               
LAB_a948:
  a948  FC6074         LDD 0x6074                        
  a94b  17F3B5         LBSR 0x9d03                       
  a94e  2603           BNE 0xa953                        
  a950  1700CA         LBSR 0xaa1d                       
LAB_a953:
  a953  3536           PULS  A B X Y                     
  a955  39             RTS                               

; ---- function FUN_a956
FUN_a956:
  a956  3436           PSHS  Y X B A                     
  a958  FC6054         LDD 0x6054                        
  a95b  8D16           BSR 0xa973                        
  a95d  2024           BRA 0xa983                        

; ---- function FUN_a95f
FUN_a95f:
  a95f  17F3A1         LBSR 0x9d03                       
  a962  270E           BEQ 0xa972                        
  a964  10B3615C       CMPD 0x615c                       
  a968  2505           BCS 0xa96f                        
  a96a  170028         LBSR 0xa995                       
  a96d  2003           BRA 0xa972                        
LAB_a96f:
  a96f  170043         LBSR 0xa9b5                       
LAB_a972:
  a972  39             RTS                               

; ---- function FUN_a973
FUN_a973:
  a973  8DEA           BSR 0xa95f                        
  a975  FD6074         STD 0x6074                        
  a978  17E6EF         LBSR 0x906a                       
  a97b  39             RTS                               

; ---- function FUN_a97c
FUN_a97c:
  a97c  3436           PSHS  Y X B A                     
  a97e  FC6062         LDD 0x6062                        
  a981  8DF0           BSR 0xa973                        
LAB_a983:
  a983  FD6054         STD 0x6054                        
  a986  FD6062         STD 0x6062                        
  a989  FD615C         STD 0x615c                        
  a98c  17FF40         LBSR 0xa8cf                       
  a98f  17F246         LBSR 0x9bd8                       
  a992  3536           PULS  A B X Y                     
  a994  39             RTS                               

; ---- function FUN_a995
FUN_a995:
  a995  3406           PSHS  B A                         
  a997  8D3C           BSR 0xa9d5                        
  a999  2717           BEQ 0xa9b2                        
  a99b  108303E8       CMPD #0x3e8                       
  a99f  270D           BEQ 0xa9ae                        
LAB_a9a1:
  a9a1  C30001         ADDD #0x1                         
  a9a4  8D2F           BSR 0xa9d5                        
  a9a6  270A           BEQ 0xa9b2                        
  a9a8  108303E8       CMPD #0x3e8                       
  a9ac  25F3           BCS 0xa9a1                        
LAB_a9ae:
  a9ae  ECE4           LDD ,S                            
  a9b0  8D03           BSR 0xa9b5                        
LAB_a9b2:
  a9b2  3262           LEAS 0x2,S                        
  a9b4  39             RTS                               

; ---- function FUN_a9b5
FUN_a9b5:
  a9b5  3406           PSHS  B A                         
  a9b7  8D1C           BSR 0xa9d5                        
  a9b9  2717           BEQ 0xa9d2                        
  a9bb  10830000       CMPD #0x0                         
  a9bf  270D           BEQ 0xa9ce                        
LAB_a9c1:
  a9c1  C3FFFF         ADDD #0xffff                      
  a9c4  8D0F           BSR 0xa9d5                        
  a9c6  270A           BEQ 0xa9d2                        
  a9c8  10830000       CMPD #0x0                         
  a9cc  26F3           BNE 0xa9c1                        
LAB_a9ce:
  a9ce  ECE4           LDD ,S                            
  a9d0  8DC3           BSR 0xa995                        
LAB_a9d2:
  a9d2  3262           LEAS 0x2,S                        
  a9d4  39             RTS                               

; ---- function FUN_a9d5
FUN_a9d5:
  a9d5  17F32B         LBSR 0x9d03                       
  a9d8  2704           BEQ 0xa9de                        
  a9da  108303E8       CMPD #0x3e8                       
LAB_a9de:
  a9de  39             RTS                               

; ---- function FUN_a9df
FUN_a9df:
  a9df  3416           PSHS  X B A                       
  a9e1  FC615C         LDD 0x615c                        
  a9e4  108303E8       CMPD #0x3e8                       
  a9e8  2706           BEQ 0xa9f0                        
  a9ea  10830080       CMPD #0x80                        
  a9ee  2519           BCS 0xaa09                        
LAB_a9f0:
  a9f0  7D61AD         TST 0x61ad                        
  a9f3  2714           BEQ 0xaa09                        
  a9f5  F660B9         LDB 0x60b9                        
  a9f8  17FCD2         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$AA47 "---SEQ--- "
  a9fb  AA47           addr aa47                         
  a9fd  2D2D2D534551.. ds "---SEQ--- "                   
LAB_aa07:
  aa07  2012           BRA 0xaa1b                        
LAB_aa09:
  aa09  F660B9         LDB 0x60b9                        
  aa0c  17FCBE         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$AA1D "(  Load  )"
  aa0f  AA1D           addr aa1d                         
  aa11  2820204C6F61.. ds "(  Load  )"                   
LAB_aa1b:
  aa1b  3596           PULS  A B X PC                    

; ---- function FUN_aa1d
FUN_aa1d:
  aa1d  3416           PSHS  X B A                       
  aa1f  FC615C         LDD 0x615c                        
  aa22  108303E8       CMPD #0x3e8                       
  aa26  271A           BEQ 0xaa42                        
  aa28  1083007F       CMPD #0x7f                        
  aa2c  2203           BHI 0xaa31                        
  aa2e  174184         LBSR 0xebb5                       
LAB_aa31:
  aa31  170073         LBSR 0xaaa7                       
  aa34  17F301         LBSR 0x9d38                       
  aa37  17F335         LBSR 0x9d6f                       
  aa3a  2603           BNE 0xaa3f                        
LAB_aa3c:
  aa3c  17F376         LBSR 0x9db5                       
LAB_aa3f:
  aa3f  3516           PULS  A B X                       
  aa41  39             RTS                               
LAB_aa42:
  aa42  17007C         LBSR 0xaac1                       
  aa45  20F5           BRA 0xaa3c                        

; ---- function FUN_aa47
FUN_aa47:
  aa47  3406           PSHS  B A                         
  aa49  17ECA1         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Loading this is not allowed because     Program Sequence Transmission is Enabled"
  aa4c  014C6F616469.. char[82] 01h,"Loading this is not allowed because     Program Sequence Transmission is Enabled"
LAB_aa9e:
  aa9e  17E5A0         LBSR 0x9041                       
  aaa1  17F0EB         LBSR 0x9b8f                       
  aaa4  3506           PULS  A B                         
  aaa6  39             RTS                               

; ---- function FUN_aaa7
FUN_aaa7:
  aaa7  3436           PSHS  Y X B A                     
  aaa9  C6A0           LDB #0xa0                         
  aaab  1753D2         LBSR 0xfe80                       
  aaae  CC0100         LDD #0x100                        
  aab1  8E0000         LDX #0x0                          
  aab4  108E6E00       LDY #0x6e00                       
  aab8  171457         LBSR 0xbf12                       
  aabb  1753DC         LBSR 0xfe9a                       
  aabe  3536           PULS  A B X Y                     
  aac0  39             RTS                               

; ---- function FUN_aac1
FUN_aac1:
  aac1  3436           PSHS  Y X B A                     
  aac3  C6A0           LDB #0xa0                         
  aac5  1753B8         LBSR 0xfe80                       
  aac8  CC0100         LDD #0x100                        
  aacb  8E0000         LDX #0x0                          
  aace  108E6E00       LDY #0x6e00                       
  aad2  1714F4         LBSR 0xbfc9                       
  aad5  1753C2         LBSR 0xfe9a                       
  aad8  3536           PULS  A B X Y                     
  aada  39             RTS                               

; ---- function FUN_aadb
FUN_aadb:
  aadb  3406           PSHS  B A                         
  aadd  F660B9         LDB 0x60b9                        
  aae0  17FBEA         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$AAF2 "( Origin )"
  aae3  AAF2           addr aaf2                         
  aae5  28204F726967.. ds "( Origin )"                   
LAB_aaef:
  aaef  3506           PULS  A B                         
  aaf1  39             RTS                               

; ---- function FUN_aaf2
FUN_aaf2:
  aaf2  3416           PSHS  X B A                       
  aaf4  FC615C         LDD 0x615c                        
  aaf7  108303E8       CMPD #0x3e8                       
  aafb  2739           BEQ 0xab36                        
  aafd  17F238         LBSR 0x9d38                       
  ab00  17DF4A         LBSR 0x8a4d                       
  ab03  262E           BNE 0xab33                        
  ab05  8E0008         LDX #0x8                          
  ab08  17DE13         LBSR 0x891e                       
LAB_ab0b:
  ab0b  1F98           TFR B,A                           
  ab0d  5F             CLRB                              
  ab0e  17DF3C         LBSR 0x8a4d                       
  ab11  2620           BNE 0xab33                        
  ab13  17EBD7         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Original Program :"
  ab16  014F72696769.. char[20] 01h,"Original Program :" 
LAB_ab2a:
  ab2a  170340         LBSR 0xae6d                       
  ab2d  17E511         LBSR 0x9041                       
  ab30  17F05C         LBSR 0x9b8f                       
LAB_ab33:
  ab33  3516           PULS  A B X                       
  ab35  39             RTS                               
LAB_ab36:
  ab36  F66E00         LDB 0x6e00                        
  ab39  20D0           BRA 0xab0b                        

; ---- function FUN_ab3b
FUN_ab3b:
  ab3b  3416           PSHS  X B A                       
  ab3d  F66079         LDB 0x6079                        
  ab40  17533D         LBSR 0xfe80                       
  ab43  BE607A         LDX 0x607a                        
  ab46  E605           LDB 0x5,X                         
  ab48  C401           ANDB #0x1                         
  ab4a  2712           BEQ 0xab5e                        
  ab4c  F660B9         LDB 0x60b9                        
  ab4f  17FB7B         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$AB64 "( Remove )"
  ab52  AB64           addr ab64                         
  ab54  282052656D6F.. ds "( Remove )"                   
LAB_ab5e:
  ab5e  175339         LBSR 0xfe9a                       
  ab61  3516           PULS  A B X                       
  ab63  39             RTS                               

; ---- function FUN_ab64
FUN_ab64:
  ab64  3416           PSHS  X B A                       
  ab66  17EB84         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Remove Preset "
  ab69  0152656D6F76.. char[16] 01h,"Remove Preset "     
LAB_ab79:
  ab79  FC615C         LDD 0x615c                        
  ab7c  1702DF         LBSR 0xae5e                       
  ab7f  1702EB         LBSR 0xae6d                       
  ab82  C63F           LDB #0x3f                         
  ab84  17EA9E         LBSR 0x9625                       
  ab87  17FB06         LBSR 0xa690                        ; inline[API_FE3C]: $AB91 $ABAB
  ab8a  AB91           dw AB91h                          
  ab8c  ABAB           dw ABABh                          
LAB_ab8e:
  ab8e  3516           PULS  A B X                       
  ab90  39             RTS                               

; ---- function FUN_ab91
FUN_ab91:
  ab91  3416           PSHS  X B A                       
  ab93  FC615C         LDD 0x615c                        
  ab96  8E6A00         LDX #0x6a00                       
  ab99  17F19C         LBSR 0x9d38                       
  ab9c  17DFB7         LBSR 0x8b56                       
  ab9f  17F118         LBSR 0x9cba                       
  aba2  17FC82         LBSR 0xa827                       
  aba5  17F0D2         LBSR 0x9c7a                       
  aba8  3516           PULS  A B X                       
  abaa  39             RTS                               

; ---- function FUN_abab
FUN_abab:
  abab  17F0CC         LBSR 0x9c7a                       
  abae  39             RTS                               

; ---- function FUN_abaf
FUN_abaf:
  abaf  3406           PSHS  B A                         
  abb1  C6A2           LDB #0xa2                         
  abb3  F760FB         STB 0x60fb                        
  abb6  17FA70         LBSR 0xa629                       
  abb9  CC9BE2         LDD #0x9be2                       
  abbc  FD6036         STD 0x6036                        
  abbf  CC9C05         LDD #0x9c05                       
  abc2  FD602E         STD 0x602e                        
  abc5  17EB25         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Current Edit :"
  abc8  014375727265.. char[16] 01h,"Current Edit :"     
LAB_abd8:
  abd8  C6A0           LDB #0xa0                         
  abda  F76079         STB 0x6079                        
  abdd  CC0000         LDD #0x0                          
  abe0  FD607A         STD 0x607a                        
  abe3  170287         LBSR 0xae6d                       
  abe6  3506           PULS  A B                         
  abe8  39             RTS                               

; ---- function FUN_abe9
FUN_abe9:
  abe9  3406           PSHS  B A                         
  abeb  F660B9         LDB 0x60b9                        
  abee  17FADC         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B4ED "(  Save  )"
  abf1  B4ED           addr b4ed                         
  abf3  282020536176.. ds "(  Save  )"                   
LAB_abfd:
  abfd  3506           PULS  A B                         
  abff  39             RTS                               

; ---- function FUN_ac00
FUN_ac00:
  ac00  3406           PSHS  B A                         
  ac02  170BF3         LBSR 0xb7f8                       
  ac05  2612           BNE 0xac19                        
  ac07  F660B9         LDB 0x60b9                        
  ac0a  17FAC0         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$AC1C "( Update )"
  ac0d  AC1C           addr ac1c                         
  ac0f  282055706461.. ds "( Update )"                   
LAB_ac19:
  ac19  3506           PULS  A B                         
  ac1b  39             RTS                               

; ---- function FUN_ac1c
FUN_ac1c:
  ac1c  3416           PSHS  X B A                       
  ac1e  17EACC         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Overwrite Program "
  ac21  014F76657277.. char[20] 01h,"Overwrite Program " 
LAB_ac35:
  ac35  8E0000         LDX #0x0                          
  ac38  17F55B         LBSR 0xa196                       
  ac3b  1F98           TFR B,A                           
  ac3d  5F             CLRB                              
  ac3e  17DE0C         LBSR 0x8a4d                       
  ac41  170229         LBSR 0xae6d                       
  ac44  17FA49         LBSR 0xa690                        ; inline[API_FE3C]: $AC4E $AC54
  ac47  AC4E           dw AC4Eh                          
  ac49  AC54           dw AC54h                          
LAB_ac4b:
  ac4b  3516           PULS  A B X                       
  ac4d  39             RTS                               

; ---- function FUN_ac4e
FUN_ac4e:
  ac4e  170BDD         LBSR 0xb82e                       
  ac51  17F066         LBSR 0x9cba                       
  ac54  17F023         LBSR 0x9c7a                       
  ac57  39             RTS                               

; ---- function FUN_ac58
FUN_ac58:
  ac58  3406           PSHS  B A                         
  ac5a  C6A2           LDB #0xa2                         
  ac5c  F760FB         STB 0x60fb                        
  ac5f  17F9C7         LBSR 0xa629                       
  ac62  CC9BE2         LDD #0x9be2                       
  ac65  FD6036         STD 0x6036                        
  ac68  CC9C05         LDD #0x9c05                       
  ac6b  FD602E         STD 0x602e                        
  ac6e  17EA7C         LBSR 0x96ed                        ; inline[API_FC38]: "{1}MIDI Program Load Functions "
  ac71  014D49444920.. char[30] 01h,"MIDI Program Load Functions "
LAB_ac8f:
  ac8f  7D61AF         TST 0x61af                        
  ac92  2711           BEQ 0xaca5                        
  ac94  17EA56         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1C}<SEQUENCED>"
  ac97  021C3C534551.. char[14] 02h,1Ch,"<SEQUENCED>"    
LAB_aca5:
  aca5  3506           PULS  A B                         
  aca7  39             RTS                               

; ---- function FUN_aca8
FUN_aca8:
  aca8  3406           PSHS  B A                         
  acaa  C6A0           LDB #0xa0                         
  acac  1751D1         LBSR 0xfe80                       
  acaf  F660B9         LDB 0x60b9                        
  acb2  17FA18         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$ACCA "(Load=   )"
  acb5  ACCA           addr acca                         
  acb7  284C6F61643D.. ds "(Load=   )"                   
LAB_acc1:
  acc1  1700E2         LBSR 0xada6                       
  acc4  1751D3         LBSR 0xfe9a                       
  acc7  3506           PULS  A B                         
  acc9  39             RTS                               

; ---- function FUN_acca
FUN_acca:
  acca  3424           PSHS  Y B                         
  accc  7D61AF         TST 0x61af                        
  accf  2626           BNE 0xacf7                        
  acd1  C6A0           LDB #0xa0                         
  acd3  1751AA         LBSR 0xfe80                       
  acd6  F6010D         LDB 0x010d                        
  acd9  C801           EORB #0x1                         
  acdb  F7010D         STB 0x010d                        
  acde  17428D         LBSR 0xef6e                        ; inline[API_FE5E]: $AD80 $AD57
  ace1  AD80           dw AD80h                          
  ace3  AD57           dw AD57h                          
LAB_ace5:
  ace5  17EA05         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}{6}"
  ace8  020005280600   char[6] 02h                       
LAB_acee:
  acee  1700B5         LBSR 0xada6                       
  acf1  1751A6         LBSR 0xfe9a                       
LAB_acf4:
  acf4  3524           PULS  B Y                         
  acf6  39             RTS                               
LAB_acf7:
  acf7  8D02           BSR 0xacfb                        
  acf9  20F9           BRA 0xacf4                        

; ---- function FUN_acfb
FUN_acfb:
  acfb  17E9EF         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Changing this is not allowed because    Program Sequencing Reception is Enabled "
  acfe  014368616E67.. char[82] 01h,"Changing this is not allowed because    Program Sequencing Reception is Enabled "
LAB_ad50:
  ad50  17E2EE         LBSR 0x9041                       
  ad53  17EE39         LBSR 0x9b8f                       
  ad56  39             RTS                               
  ad57  .db 49 44 20 4E 75 6D 62 65 72 73 20 61 72 65 20 75  ; ID Numbers are u
  ad67  .db 73 65 64 20 66 6F 72 20 50 72 6F 67 72 61 6D 20  ; sed for Program 
  ad77  .db 4C 6F 61 64 69 6E 67 20 00                       ; Loading .
  ad80  50726F677261.. ds "Program Map Table is used for Loading"

; ---- function FUN_ada6
FUN_ada6:
  ada6  3404           PSHS  B                           
  ada8  C638           LDB #0x38                         
  adaa  17E92E         LBSR 0x96db                       
  adad  7D61AF         TST 0x61af                        
  adb0  2605           BNE 0xadb7                        
  adb2  7D010D         TST 0x010d                        
  adb5  2609           BNE 0xadc0                        
LAB_adb7:
  adb7  17E933         LBSR 0x96ed                        ; inline[API_FC38]: "ID "
  adba  49442000       char[4] "ID "                     
LAB_adbe:
  adbe  200C           BRA 0xadcc                        
LAB_adc0:
  adc0  C601           LDB #0x1                          
  adc2  F7010D         STB 0x010d                        
  adc5  17E925         LBSR 0x96ed                        ; inline[API_FC38]: "Map"
  adc8  4D617000       char[4] "Map"                     
LAB_adcc:
  adcc  3504           PULS  B                           
  adce  39             RTS                               

; ---- function FUN_adcf
FUN_adcf:
  adcf  3426           PSHS  Y B A                       
  add1  C6A0           LDB #0xa0                         
  add3  1750AA         LBSR 0xfe80                       
  add6  F660B9         LDB 0x60b9                        
  add9  17F8F1         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$ADEA "(        )"
  addc  ADEA           addr adea                         
  adde  282020202020.. ds "(        )"                   
LAB_ade8:
  ade8  2038           BRA 0xae22                        

; ---- function FUN_adea
FUN_adea:
  adea  3426           PSHS  Y B A                       
  adec  C6A0           LDB #0xa0                         
  adee  17508F         LBSR 0xfe80                       
  adf1  7D61AF         TST 0x61af                        
  adf4  2663           BNE 0xae59                        
  adf6  F6010E         LDB 0x010e                        
  adf9  C801           EORB #0x1                         
  adfb  F7010E         STB 0x010e                        
  adfe  53             COMB                              
  adff  C401           ANDB #0x1                         
  ae01  174128         LBSR 0xef2c                       
  ae04  17E8E6         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}MIDI Program Loading {6}"
  ae07  020005284D49.. char[27] 02h                      

; ---- function FUN_ae22
FUN_ae22:
  ae22  F6010E         LDB 0x010e                        
  ae25  271C           BEQ 0xae43                        
  ae27  7D61AF         TST 0x61af                        
  ae2a  2617           BNE 0xae43                        
  ae2c  C601           LDB #0x1                          
  ae2e  F7010E         STB 0x010e                        
  ae31  17E8B9         LBSR 0x96ed                        ; inline[API_FC38]: "{2:3C}(Disabled)"
  ae34  023C28446973.. char[13] 02h,"<(Disabled)"        
LAB_ae41:
  ae41  2010           BRA 0xae53                        
LAB_ae43:
  ae43  17E8A7         LBSR 0x96ed                        ; inline[API_FC38]: "{2:3C}( Enabled)"
  ae46  023C2820456E.. char[13] 02h,"<( Enabled)"        
LAB_ae53:
  ae53  175044         LBSR 0xfe9a                       
  ae56  3526           PULS  A B Y                       
  ae58  39             RTS                               
LAB_ae59:
  ae59  17FE9F         LBSR 0xacfb                       
  ae5c  20F5           BRA 0xae53                        

; ---- function FUN_ae5e
FUN_ae5e:
  ae5e  17EED7         LBSR 0x9d38                       
  ae61  17DBE9         LBSR 0x8a4d                       
  ae64  39             RTS                               

; ---- function FUN_ae65
FUN_ae65:
  ae65  3416           PSHS  X B A                       
  ae67  86FF           LDA #0xff                         
  ae69  3402           PSHS  A                           
  ae6b  2005           BRA 0xae72                        

; ---- function FUN_ae6d
FUN_ae6d:
  ae6d  3416           PSHS  X B A                       
  ae6f  4F             CLRA                              
  ae70  3402           PSHS  A                           
LAB_ae72:
  ae72  F66079         LDB 0x6079                        
  ae75  175008         LBSR 0xfe80                       
  ae78  BE607A         LDX 0x607a                        
  ae7b  EC84           LDD ,X                            
  ae7d  17EE90         LBSR 0x9d10                       
  ae80  3606           PSHU  B A                         
  ae82  6D61           TST 0x1,S                         
  ae84  260F           BNE 0xae95                        
  ae86  17E864         LBSR 0x96ed                        ; inline[API_FC38]: "[{4:2000}{3:60AA}] "
  ae89  5B0420000360.. char[10] "[",04h," "              
LAB_ae93:
  ae93  200B           BRA 0xaea0                        
LAB_ae95:
  ae95  17E855         LBSR 0x96ed                        ; inline[API_FC38]: "{4:2000}{3:60AA} "
  ae98  0420000360AA.. char[8] 04h," "                   
LAB_aea0:
  aea0  3089000A       LEAX 0xa,X                        
  aea4  C60F           LDB #0xf                          
  aea6  17E8B4         LBSR 0x975d                       
  aea9  174FEE         LBSR 0xfe9a                       
  aeac  3261           LEAS 0x1,S                        
  aeae  3516           PULS  A B X                       
  aeb0  39             RTS                               

; ---- function FUN_aeb1
FUN_aeb1:
  aeb1  3404           PSHS  B                           
  aeb3  F660B9         LDB 0x60b9                        
  aeb6  17F814         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$AEC8 "(  Map   )"
  aeb9  AEC8           addr aec8                         
  aebb  2820204D6170.. ds "(  Map   )"                   
LAB_aec5:
  aec5  3504           PULS  B                           
  aec7  39             RTS                               

; ---- function FUN_aec8
FUN_aec8:
  aec8  3416           PSHS  X B A                       
  aeca  CC0000         LDD #0x0                          
  aecd  C6A3           LDB #0xa3                         
  aecf  F760FB         STB 0x60fb                        
  aed2  CC9BE2         LDD #0x9be2                       
  aed5  FD6036         STD 0x6036                        
  aed8  F76160         STB 0x6160                        
  aedb  4F             CLRA                              
  aedc  FD6074         STD 0x6074                        
  aedf  CCAEF0         LDD #0xaef0                       
  aee2  17ED41         LBSR 0x9c26                       
  aee5  C600           LDB #0x0                          
  aee7  F760B9         STB 0x60b9                        
  aeea  17015C         LBSR 0xb049                       
  aeed  3516           PULS  A B X                       
  aeef  39             RTS                               
  aef0  8877AEFEB032.. addr[6]                           
  aefc  .db FF FF                                            ; ..

; ---- function FUN_aefe
FUN_aefe:
  aefe  3416           PSHS  X B A                       
  af00  7F6160         CLR 0x6160                        
  af03  CC9C52         LDD #0x9c52                       
  af06  FD602E         STD 0x602e                        
  af09  3516           PULS  A B X                       
  af0b  39             RTS                               

; ---- function FUN_af0c
FUN_af0c:
  af0c  3416           PSHS  X B A                       
  af0e  F660B9         LDB 0x60b9                        
  af11  17F7B9         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$AF23 "(  Name  )"
  af14  AF23           addr af23                         
  af16  2820204E616D.. ds "(  Name  )"                   
LAB_af20:
  af20  3516           PULS  A B X                       
  af22  39             RTS                               

; ---- function FUN_af23
FUN_af23:
  af23  3436           PSHS  Y X B A                     
  af25  C6A4           LDB #0xa4                         
  af27  F760FB         STB 0x60fb                        
  af2a  CC9BE2         LDD #0x9be2                       
  af2d  FD6036         STD 0x6036                        
  af30  173700         LBSR 0xe633                       
  af33  F660B9         LDB 0x60b9                        
  af36  1736B7         LBSR 0xe5f0                       
  af39  F66160         LDB 0x6160                        
  af3c  1701FB         LBSR 0xb13a                       
  af3f  10830FFF       CMPD #0xfff                       
  af43  2603           BNE 0xaf48                        
  af45  CC03E8         LDD #0x3e8                        
LAB_af48:
  af48  FD615C         STD 0x615c                        
  af4b  FD6062         STD 0x6062                        
  af4e  FD6054         STD 0x6054                        
  af51  CC03E8         LDD #0x3e8                        
  af54  FD6064         STD 0x6064                        
  af57  FD6056         STD 0x6056                        
  af5a  FC615C         LDD 0x615c                        
  af5d  FD6074         STD 0x6074                        
  af60  1710B2         LBSR 0xc015                        ; inline[API_FD18]: [$606C]=$03E7 [$606E]=$0000 [$6070]=$8877 [$6072]=$8877 [$606A]=$AFB3 [$605C]=$AFFF [$605A]=$AFDC [$60DE]=$0001 [$60DC]=$0001 [$60E0]=$0096
  af63  606C           addr 606c                         
  af65  03E7           dw 3E7h                           
  af67  606E           addr 606e                         
  af69  0000           dw 0h                             
  af6b  6070           addr 6070                         
  af6d  8877           dw 8877h                          
  af6f  6072           addr 6072                         
  af71  8877           dw 8877h                          
  af73  606A           addr 606a                         
  af75  AFB3           dw AFB3h                          
  af77  605C           addr 605c                         
  af79  AFFF           dw AFFFh                          
  af7b  605A           addr 605a                         
  af7d  AFDC           dw AFDCh                          
  af7f  60DE           addr 60de                         
  af81  0001           dw 1h                             
  af83  60DC           addr 60dc                         
  af85  0001           dw 1h                             
  af87  60E0           addr 60e0                         
  af89  0096           dw 96h                            
  af8b  FFFF           dw FFFFh                          
LAB_af8d:
  af8d  17109D         LBSR 0xc02d                        ; inline[API_FD1A]: [$6066]=$01 [$6067]=$20 [$6058]=$02 [$6068]=$04 [$6099]=$00 [$6069]=$03
  af90  6066           addr 6066                         
  af92  01             db 1h                             
  af93  6067           addr 6067                         
  af95  20             db 20h                            
  af96  6058           addr 6058                         
  af98  02             db 2h                             
  af99  6068           addr 6068                         
  af9b  04             db 4h                             
  af9c  6099           addr 6099                         
  af9e  00             db 0h                             
  af9f  6069           addr 6069                         
  afa1  03             db 3h                             
  afa2  FFFF           dw FFFFh                          
LAB_afa4:
  afa4  17E0C3         LBSR 0x906a                       
  afa7  17E48A         LBSR 0x9434                       
  afaa  17DC9F         LBSR 0x8c4c                       
  afad  170102         LBSR 0xb0b2                       
  afb0  3536           PULS  A B X Y                     
  afb2  39             RTS                               

; ---- function FUN_afb3
FUN_afb3:
  afb3  3436           PSHS  Y X B A                     
  afb5  FC6074         LDD 0x6074                        
  afb8  17ED48         LBSR 0x9d03                       
  afbb  2749           BEQ 0xb006                        
  afbd  FC6074         LDD 0x6074                        
  afc0  3606           PSHU  B A                         
  afc2  17E728         LBSR 0x96ed                        ; inline[API_FC38]: "{2:28}{5:28}{2:13}{5:15}[{4:2000}{3:60AA}]"
  afc5  022805280213.. char[17] 02h,"(",05h,"(",02h,13h,05h,15h,"[",04h," "
LAB_afd6:
  afd6  17F699         LBSR 0xa672                       
  afd9  3536           PULS  A B X Y                     
  afdb  39             RTS                               

; ---- function FUN_afdc
FUN_afdc:
  afdc  3436           PSHS  Y X B A                     
  afde  FC6054         LDD 0x6054                        
  afe1  8D02           BSR 0xafe5                        
  afe3  2021           BRA 0xb006                        

; ---- function FUN_afe5
FUN_afe5:
  afe5  17ED1B         LBSR 0x9d03                       
  afe8  270E           BEQ 0xaff8                        
  afea  10B3615C       CMPD 0x615c                       
  afee  2305           BLS 0xaff5                        
  aff0  17F9A2         LBSR 0xa995                       
  aff3  2003           BRA 0xaff8                        
LAB_aff5:
  aff5  17F9BD         LBSR 0xa9b5                       
LAB_aff8:
  aff8  FD6074         STD 0x6074                        
  affb  17E06C         LBSR 0x906a                       
  affe  39             RTS                               

; ---- function FUN_afff
FUN_afff:
  afff  3436           PSHS  Y X B A                     
  b001  FC6062         LDD 0x6062                        
  b004  8DDF           BSR 0xafe5                        
LAB_b006:
  b006  FD6054         STD 0x6054                        
  b009  FD6062         STD 0x6062                        
  b00c  FD615C         STD 0x615c                        
  b00f  F66160         LDB 0x6160                        
  b012  4F             CLRA                              
  b013  1F02           TFR D,Y                           
  b015  FC615C         LDD 0x615c                        
  b018  108303E8       CMPD #0x3e8                       
  b01c  2603           BNE 0xb021                        
  b01e  CCFFFF         LDD #0xffff                       
LAB_b021:
  b021  170137         LBSR 0xb15b                       
  b024  17008B         LBSR 0xb0b2                       
  b027  17EBAE         LBSR 0x9bd8                       
  b02a  C601           LDB #0x1                          
  b02c  1735C1         LBSR 0xe5f0                       
  b02f  3536           PULS  A B X Y                     
  b031  39             RTS                               

; ---- function FUN_b032
FUN_b032:
  b032  3406           PSHS  B A                         
  b034  F660B9         LDB 0x60b9                        
  b037  17F693         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B049 "( Number )"
  b03a  B049           addr b049                         
  b03c  28204E756D62.. ds "( Number )"                   
LAB_b046:
  b046  3506           PULS  A B                         
  b048  39             RTS                               

; ---- function FUN_b049
FUN_b049:
  b049  3406           PSHS  B A                         
  b04b  C6A5           LDB #0xa5                         
  b04d  F760FB         STB 0x60fb                        
  b050  CC9BE2         LDD #0x9be2                       
  b053  FD6036         STD 0x6036                        
  b056  1735DA         LBSR 0xe633                       
  b059  F660B9         LDB 0x60b9                        
  b05c  173591         LBSR 0xe5f0                       
  b05f  F66160         LDB 0x6160                        
  b062  4F             CLRA                              
  b063  FD6074         STD 0x6074                        
  b066  17DD93         LBSR 0x8dfc                        ; inline[API_FC16]: 01 01 02 32 01 00 03 00 $007F $0000 $0000 ->$B086 ->$B09D $0001 $0001 $0000
  b069  01             db 1h                             
  b06a  01             db 1h                             
  b06b  02             db 2h                             
  b06c  32             db 32h                            
  b06d  01             db 1h                             
  b06e  00             db 0h                             
  b06f  03             db 3h                             
  b070  00             db 0h                             
  b071  007F           dw 7Fh                            
  b073  0000           dw 0h                             
  b075  0000           dw 0h                             
  b077  B086           addr b086                         
  b079  B09D           addr b09d                         
  b07b  0001           dw 1h                             
  b07d  0001           dw 1h                             
  b07f  0000           dw 0h                             
LAB_b081:
  b081  8D1A           BSR 0xb09d                        
  b083  3506           PULS  A B                         
  b085  39             RTS                               

; ---- function FUN_b086
FUN_b086:
  b086  3406           PSHS  B A                         
  b088  17E662         LBSR 0x96ed                        ; inline[API_FC38]: "{2:0A}{3:60A0}{5:1B}"
  b08b  020A0360A005.. char[8] 02h,"\n",03h,"`",A0h,05h,1Bh
LAB_b093:
  b093  7D604D         TST 0x604d                        
  b096  2703           BEQ 0xb09b                        
  b098  17F5D7         LBSR 0xa672                       
LAB_b09b:
  b09b  3586           PULS  A B PC                      

; ---- function FUN_b09d
FUN_b09d:
  b09d  3406           PSHS  B A                         
  b09f  FC6074         LDD 0x6074                        
  b0a2  F76160         STB 0x6160                        
  b0a5  8D0B           BSR 0xb0b2                        
  b0a7  17EB2E         LBSR 0x9bd8                       
  b0aa  C600           LDB #0x0                          
  b0ac  173541         LBSR 0xe5f0                       
  b0af  3506           PULS  A B                         
  b0b1  39             RTS                               

; ---- function FUN_b0b2
FUN_b0b2:
  b0b2  3416           PSHS  X B A                       
  b0b4  17E636         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}MIDI Pgm #    Loads"
  b0b7  02004D494449.. char[22] 02h                      
LAB_b0cd:
  b0cd  F66160         LDB 0x6160                        
  b0d0  4F             CLRA                              
  b0d1  3606           PSHU  B A                         
  b0d3  17E617         LBSR 0x96ed                        ; inline[API_FC38]: "{2:0A}{4:2000}{3:60AA}{2:13}"
  b0d6  020A04200003.. char[11] 02h,"\n",04h," "         
LAB_b0e1:
  b0e1  170056         LBSR 0xb13a                       
  b0e4  10830FFF       CMPD #0xfff                       
  b0e8  2734           BEQ 0xb11e                        
  b0ea  17EC16         LBSR 0x9d03                       
  b0ed  260A           BNE 0xb0f9                        
  b0ef  17FD6C         LBSR 0xae5e                       
  b0f2  2643           BNE 0xb137                        
  b0f4  17FD76         LBSR 0xae6d                       
  b0f7  203E           BRA 0xb137                        
LAB_b0f9:
  b0f9  3606           PSHU  B A                         
  b0fb  17E5EF         LBSR 0x96ed                        ; inline[API_FC38]: " Missing Program     {2:24}{4:2000}{3:60AA}"
  b0fe  204D69737369.. char[30] " Missing Program     ",02h,"$",04h," "
LAB_b11c:
  b11c  2019           BRA 0xb137                        
LAB_b11e:
  b11e  17E5CC         LBSR 0x96ed                        ; inline[API_FC38]: " Nothing, Unpatched  "
  b121  204E6F746869.. char[22] " Nothing, Unpatched  "  
LAB_b137:
  b137  3516           PULS  A B X                       
  b139  39             RTS                               

; ---- function FUN_b13a
FUN_b13a:
  b13a  3410           PSHS  X                           
  b13c  F66160         LDB 0x6160                        
  b13f  4F             CLRA                              
  b140  1F01           TFR D,X                           
  b142  170003         LBSR 0xb148                       
  b145  3510           PULS  X                           
  b147  39             RTS                               

; ---- function FUN_b148
FUN_b148:
  b148  3410           PSHS  X                           
  b14a  1F10           TFR X,D                           
  b14c  58             LSLB                              
  b14d  49             ROLA                              
  b14e  C30180         ADDD #0x180                       
  b151  1F01           TFR D,X                           
  b153  17F057         LBSR 0xa1ad                       
  b156  840F           ANDA #0xf                         
  b158  3510           PULS  X                           
  b15a  39             RTS                               

; ---- function FUN_b15b
FUN_b15b:
  b15b  3436           PSHS  Y X B A                     
  b15d  1F20           TFR Y,D                           
  b15f  58             LSLB                              
  b160  49             ROLA                              
  b161  C30180         ADDD #0x180                       
  b164  1F02           TFR D,Y                           
  b166  1F01           TFR D,X                           
  b168  17F042         LBSR 0xa1ad                       
  b16b  84F0           ANDA #0xf0                        
  b16d  3402           PSHS  A                           
  b16f  EC61           LDD 0x1,S                         
  b171  840F           ANDA #0xf                         
  b173  AAE0           ORA ,S+                           
  b175  17F06E         LBSR 0xa1e6                       
  b178  35B6           PULS  A B X Y PC                  

; ---- function FUN_b17a
FUN_b17a:
  b17a  3406           PSHS  B A                         
  b17c  F660B9         LDB 0x60b9                        
  b17f  17F54B         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B191 "( Clear  )"
  b182  B191           addr b191                         
  b184  2820436C6561.. ds "( Clear  )"                   
LAB_b18e:
  b18e  3506           PULS  A B                         
  b190  39             RTS                               

; ---- function FUN_b191
FUN_b191:
  b191  3406           PSHS  B A                         
  b193  17F4DC         LBSR 0xa672                       
  b196  17E554         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Clear the entire MIDI Map Table ?"
  b199  01436C656172.. char[35] 01h,"Clear the entire MIDI Map Table ?"
LAB_b1bc:
  b1bc  17F4D1         LBSR 0xa690                        ; inline[API_FE3C]: $B1CA $B1C6
  b1bf  B1CA           dw B1CAh                          
  b1c1  B1C6           dw B1C6h                          
LAB_b1c3:
  b1c3  3506           PULS  A B                         
  b1c5  39             RTS                               

; ---- function FUN_b1c6
FUN_b1c6:
  b1c6  3426           PSHS  Y B A                       
  b1c8  2014           BRA 0xb1de                        

; ---- function FUN_b1ca
FUN_b1ca:
  b1ca  3426           PSHS  Y B A                       
  b1cc  C6A0           LDB #0xa0                         
  b1ce  174CAF         LBSR 0xfe80                       
  b1d1  108E0180       LDY #0x180                        
  b1d5  170D84         LBSR 0xbf5c                        ; inline[API_FD0C]: $0100 FF
  b1d8  0100           dw 100h                           
  b1da  FF             db FFh                            
LAB_b1db:
  b1db  174CBC         LBSR 0xfe9a                       
LAB_b1de:
  b1de  17EA99         LBSR 0x9c7a                       
  b1e1  C600           LDB #0x0                          
  b1e3  F760B9         STB 0x60b9                        
  b1e6  17FE60         LBSR 0xb049                       
  b1e9  3526           PULS  A B Y                       
  b1eb  39             RTS                               

; ---- function FUN_b1ec
FUN_b1ec:
  b1ec  3406           PSHS  B A                         
  b1ee  C6A6           LDB #0xa6                         
  b1f0  F760FB         STB 0x60fb                        
  b1f3  17F433         LBSR 0xa629                       
  b1f6  CC9BE2         LDD #0x9be2                       
  b1f9  FD6036         STD 0x6036                        
  b1fc  CC9C05         LDD #0x9c05                       
  b1ff  FD602E         STD 0x602e                        
  b202  17E4E8         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Dump Data Functions "
  b205  0144756D7020.. char[22] 01h,"Dump Data Functions "
LAB_b21b:
  b21b  3506           PULS  A B                         

; ---- function FUN_b21d
FUN_b21d:
  b21d  3404           PSHS  B                           
  b21f  F660B9         LDB 0x60b9                        
  b222  17F4A8         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B234 "(DumpEdit)"
  b225  B234           addr b234                         
  b227  2844756D7045.. ds "(DumpEdit)"                   
LAB_b231:
  b231  3504           PULS  B                           
  b233  39             RTS                               

; ---- function FUN_b234
FUN_b234:
  b234  3436           PSHS  Y X B A                     
  b236  17E4B4         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Sending Current Edited Program to MIDI "
  b239  0153656E6469.. char[41] 01h,"Sending Current Edited Program to MIDI "
LAB_b262:
  b262  170034         LBSR 0xb299                       
  b265  17E927         LBSR 0x9b8f                       
  b268  17E482         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}Current Edit has been sent to MIDI      "
  b26b  020043757272.. char[43] 02h                      
LAB_b296:
  b296  3536           PULS  A B X Y                     
  b298  39             RTS                               

; ---- function FUN_b299
FUN_b299:
  b299  3436           PSHS  Y X B A                     
  b29b  C6A0           LDB #0xa0                         
  b29d  174BE0         LBSR 0xfe80                       
  b2a0  CC000F         LDD #0xf                          
  b2a3  170DFD         LBSR 0xc0a3                       
  b2a6  C6FF           LDB #0xff                         
  b2a8  F7619C         STB 0x619c                        
  b2ab  1701F8         LBSR 0xb4a6                       
  b2ae  5F             CLRB                              
  b2af  17E34B         LBSR 0x95fd                       
  b2b2  17021D         LBSR 0xb4d2                       
  b2b5  8E0000         LDX #0x0                          
  b2b8  FC0002         LDD 0x0002                        
  b2bb  1735F1         LBSR 0xe8af                        ; inline[API_FE24]: $68A0
  b2be  68A0           dw 68A0h                          
LAB_b2c0:
  b2c0  CCFDCE         LDD #0xfdce                       
  b2c3  1736C1         LBSR 0xe987                        ; inline[API_FE28]: $68A0
  b2c6  68A0           dw 68A0h                          
LAB_b2c8:
  b2c8  1701FD         LBSR 0xb4c8                       
  b2cb  CC001E         LDD #0x1e                         
  b2ce  170DD2         LBSR 0xc0a3                       
  b2d1  8E0116         LDX #0x116                        
  b2d4  17EEBF         LBSR 0xa196                       
  b2d7  F7619C         STB 0x619c                        
  b2da  174BBD         LBSR 0xfe9a                       
  b2dd  3536           PULS  A B X Y                     
  b2df  39             RTS                               

; ---- function FUN_b2e0
FUN_b2e0:
  b2e0  3404           PSHS  B                           
  b2e2  F660B9         LDB 0x60b9                        
  b2e5  17F3E5         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B2F7 "(Dump Pre)"
  b2e8  B2F7           addr b2f7                         
  b2ea  2844756D7020.. ds "(Dump Pre)"                   
LAB_b2f4:
  b2f4  3504           PULS  B                           
  b2f6  39             RTS                               

; ---- function FUN_b2f7
FUN_b2f7:
  b2f7  3436           PSHS  Y X B A                     
  b2f9  17E3F1         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Sending Presets to MIDI "
  b2fc  0153656E6469.. char[26] 01h,"Sending Presets to MIDI "
LAB_b316:
  b316  170034         LBSR 0xb34d                       
  b319  17E873         LBSR 0x9b8f                       
  b31c  17E3CE         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}The Presets have been sent to MIDI      "
  b31f  020054686520.. char[43] 02h                      
LAB_b34a:
  b34a  3536           PULS  A B X Y                     
  b34c  39             RTS                               

; ---- function FUN_b34d
FUN_b34d:
  b34d  3436           PSHS  Y X B A                     
  b34f  C6A0           LDB #0xa0                         
  b351  174B2C         LBSR 0xfe80                       
  b354  17D8B4         LBSR 0x8c0b                       
  b357  C6FF           LDB #0xff                         
  b359  F7619C         STB 0x619c                        
  b35c  170147         LBSR 0xb4a6                       
  b35f  C601           LDB #0x1                          
  b361  17E299         LBSR 0x95fd                       
  b364  17017F         LBSR 0xb4e6                       
  b367  8E0300         LDX #0x300                        
LAB_b36a:
  b36a  10AE84         LDY ,X                            
  b36d  EC02           LDD 0x2,X                         
  b36f  17353D         LBSR 0xe8af                        ; inline[API_FE24]: $68A0
  b372  68A0           dw 68A0h                          
LAB_b374:
  b374  108CFFFF       CMPY #0xffff                      
  b378  26F0           BNE 0xb36a                        
  b37a  17014B         LBSR 0xb4c8                       
  b37d  170126         LBSR 0xb4a6                       
  b380  5F             CLRB                              
  b381  17E279         LBSR 0x95fd                       
  b384  CCFC64         LDD #0xfc64                       
  b387  1735FD         LBSR 0xe987                        ; inline[API_FE28]: $68A0
  b38a  68A0           dw 68A0h                          
LAB_b38c:
  b38c  170139         LBSR 0xb4c8                       
  b38f  CC001E         LDD #0x1e                         
  b392  170D0E         LBSR 0xc0a3                       
  b395  8E0116         LDX #0x116                        
  b398  17EDFB         LBSR 0xa196                       
  b39b  F7619C         STB 0x619c                        
  b39e  174AF9         LBSR 0xfe9a                       
  b3a1  3536           PULS  A B X Y                     
  b3a3  39             RTS                               

; ---- function FUN_b3a4
FUN_b3a4:
  b3a4  3404           PSHS  B                           
  b3a6  F660B9         LDB 0x60b9                        
  b3a9  17F321         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B3BB "(Dump Map)"
  b3ac  B3BB           addr b3bb                         
  b3ae  2844756D7020.. ds "(Dump Map)"                   
LAB_b3b8:
  b3b8  3504           PULS  B                           
  b3ba  39             RTS                               

; ---- function FUN_b3bb
FUN_b3bb:
  b3bb  3436           PSHS  Y X B A                     
  b3bd  17E32D         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Sending Map Table to MIDI "
  b3c0  0153656E6469.. char[28] 01h,"Sending Map Table to MIDI "
LAB_b3dc:
  b3dc  170034         LBSR 0xb413                       
  b3df  17E7AD         LBSR 0x9b8f                       
  b3e2  17E308         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}The Map Table has been sent to MIDI     "
  b3e5  020054686520.. char[43] 02h                      
LAB_b410:
  b410  3536           PULS  A B X Y                     
  b412  39             RTS                               

; ---- function FUN_b413
FUN_b413:
  b413  3436           PSHS  Y X B A                     
  b415  C6A0           LDB #0xa0                         
  b417  174A66         LBSR 0xfe80                       
  b41a  CC000F         LDD #0xf                          
  b41d  170C83         LBSR 0xc0a3                       
  b420  C6FF           LDB #0xff                         
  b422  F7619C         STB 0x619c                        
  b425  17007E         LBSR 0xb4a6                       
  b428  5F             CLRB                              
  b429  17E1D1         LBSR 0x95fd                       
  b42c  1700A3         LBSR 0xb4d2                       
  b42f  8E0180         LDX #0x180                        
  b432  CC0100         LDD #0x100                        
  b435  173477         LBSR 0xe8af                        ; inline[API_FE24]: $68A0
  b438  68A0           dw 68A0h                          
LAB_b43a:
  b43a  17008B         LBSR 0xb4c8                       
  b43d  CC001E         LDD #0x1e                         
  b440  170C60         LBSR 0xc0a3                       
  b443  8E0116         LDX #0x116                        
  b446  17ED4D         LBSR 0xa196                       
  b449  F7619C         STB 0x619c                        
  b44c  174A4B         LBSR 0xfe9a                       
  b44f  3536           PULS  A B X Y                     
  b451  39             RTS                               

; ---- function FUN_b452
FUN_b452:
  b452  3436           PSHS  Y X B A                     
  b454  F660B9         LDB 0x60b9                        
  b457  17F273         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B476 "( Load=  )"
  b45a  B476           addr b476                         
  b45c  28204C6F6164.. ds "( Load=  )"                   

; ---- function FUN_b466
FUN_b466:
  b466  173B1C         LBSR 0xef85                       
  b469  CB07           ADDB #0x7                         
  b46b  1F98           TFR B,A                           
  b46d  F66161         LDB 0x6161                        
  b470  173AA2         LBSR 0xef15                       
  b473  3536           PULS  A B X Y                     
  b475  39             RTS                               

; ---- function FUN_b476
FUN_b476:
  b476  3436           PSHS  Y X B A                     
  b478  F66161         LDB 0x6161                        
  b47b  173AD9         LBSR 0xef57                       
  b47e  F76161         STB 0x6161                        
  b481  173AA8         LBSR 0xef2c                       
  b484  17E266         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}Receiving Dumps {6}"
  b487  020005285265.. char[22] 02h                      
LAB_b49d:
  b49d  108E010F       LDY #0x10f                        
  b4a1  17ED2B         LBSR 0xa1cf                       
  b4a4  20C0           BRA 0xb466                        

; ---- function FUN_b4a6
FUN_b4a6:
  b4a6  3404           PSHS  B                           
  b4a8  C6A0           LDB #0xa0                         
  b4aa  1749D3         LBSR 0xfe80                       
  b4ad  C6F0           LDB #0xf0                         
  b4af  17E14B         LBSR 0x95fd                       
  b4b2  C61C           LDB #0x1c                         
  b4b4  17E146         LBSR 0x95fd                       
  b4b7  C660           LDB #0x60                         
  b4b9  17E141         LBSR 0x95fd                       
  b4bc  F60110         LDB 0x0110                        
  b4bf  17E13B         LBSR 0x95fd                       
  b4c2  1749D5         LBSR 0xfe9a                       
  b4c5  3504           PULS  B                           
  b4c7  39             RTS                               

; ---- function FUN_b4c8
FUN_b4c8:
  b4c8  3404           PSHS  B                           
  b4ca  C6F7           LDB #0xf7                         
  b4cc  17E12E         LBSR 0x95fd                       
  b4cf  3504           PULS  B                           
  b4d1  39             RTS                               

; ---- function FUN_b4d2
FUN_b4d2:
  b4d2  3412           PSHS  X A                         
  b4d4  8E68AB         LDX #0x68ab                       
LAB_b4d7:
  b4d7  86A0           LDA #0xa0                         
  b4d9  A784           STA ,X                            
  b4db  CC0001         LDD #0x1                          
  b4de  1733CE         LBSR 0xe8af                        ; inline[API_FE24]: $68A0
  b4e1  68A0           dw 68A0h                          
LAB_b4e3:
  b4e3  3512           PULS  A X                         
  b4e5  39             RTS                               

; ---- function FUN_b4e6
FUN_b4e6:
  b4e6  3412           PSHS  X A                         
  b4e8  8E68CB         LDX #0x68cb                       
  b4eb  20EA           BRA 0xb4d7                        

; ---- function FUN_b4ed
FUN_b4ed:
  b4ed  3436           PSHS  Y X B A                     
  b4ef  FC614B         LDD 0x614b                        
  b4f2  108303E7       CMPD #0x3e7                       
  b4f6  2244           BHI 0xb53c                        
  b4f8  CC0000         LDD #0x0                          
LAB_b4fb:
  b4fb  17E805         LBSR 0x9d03                       
  b4fe  260B           BNE 0xb50b                        
  b500  C30001         ADDD #0x1                         
  b503  108303E8       CMPD #0x3e8                       
  b507  2733           BEQ 0xb53c                        
  b509  20F0           BRA 0xb4fb                        
LAB_b50b:
  b50b  FD6162         STD 0x6162                        
  b50e  7F60C4         CLR 0x60c4                        
  b511  108E60C6       LDY #0x60c6                       
  b515  170A44         LBSR 0xbf5c                        ; inline[API_FD0C]: $0014 20
  b518  0014           dw 14h                            
  b51a  20             db 20h                            
LAB_b51b:
  b51b  C6A0           LDB #0xa0                         
  b51d  F7600C         STB 0x600c                        
  b520  CC000F         LDD #0xf                          
  b523  8E000A         LDX #0xa                          
  b526  108E60C6       LDY #0x60c6                       
  b52a  1749BC         LBSR 0xfee9                       
  b52d  CCB565         LDD #0xb565                       
  b530  17E6F3         LBSR 0x9c26                       
  b533  CC9C52         LDD #0x9c52                       
  b536  FD602E         STD 0x602e                        
LAB_b539:
  b539  3536           PULS  A B X Y                     
  b53b  39             RTS                               
LAB_b53c:
  b53c  17E1AE         LBSR 0x96ed                        ; inline[API_FC38]: "{1}No more ID numbers available"
  b53f  014E6F206D6F.. char[30] 01h,"No more ID numbers available"
LAB_b55d:
  b55d  17DAE1         LBSR 0x9041                       
  b560  17E62C         LBSR 0x9b8f                       
  b563  20D4           BRA 0xb539                        
  b565  8877B57DB69F.. addr[11]                          
  b57b  .db FF FF                                            ; ..

; ---- function FUN_b57d
FUN_b57d:
  b57d  3406           PSHS  B A                         
  b57f  17F0A7         LBSR 0xa629                       
  b582  C6A8           LDB #0xa8                         
  b584  F760FB         STB 0x60fb                        
  b587  CC9BE2         LDD #0x9be2                       
  b58a  FD6036         STD 0x6036                        
  b58d  17E15D         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Save as [   ]{2:1F}Adj Num ~"
  b590  015361766520.. char[26] 01h,"Save as [   ]",02h,1Fh,"Adj Num ~"
LAB_b5aa:
  b5aa  FC6162         LDD 0x6162                        
  b5ad  FD6074         STD 0x6074                        
  b5b0  17D849         LBSR 0x8dfc                        ; inline[API_FC16]: 01 10 02 1E 01 00 03 00 $03E7 $0000 $0000 ->$B5D1 ->$B5DB $0001 $0001 $0000
  b5b3  01             db 1h                             
  b5b4  10             db 10h                            
  b5b5  02             db 2h                             
  b5b6  1E             db 1Eh                            
  b5b7  01             db 1h                             
  b5b8  00             db 0h                             
  b5b9  03             db 3h                             
  b5ba  00             db 0h                             
  b5bb  03E7           dw 3E7h                           
  b5bd  0000           dw 0h                             
  b5bf  0000           dw 0h                             
  b5c1  B5D1           addr b5d1                         
  b5c3  B5DB           addr b5db                         
  b5c5  0001           dw 1h                             
  b5c7  0001           dw 1h                             
  b5c9  0000           dw 0h                             
LAB_b5cb:
  b5cb  17029D         LBSR 0xb86b                       
  b5ce  3506           PULS  A B                         
  b5d0  39             RTS                               

; ---- function FUN_b5d1
FUN_b5d1:
  b5d1  17E119         LBSR 0x96ed                        ; inline[API_FC38]: "{2:09}{3:60A0}"
  b5d4  02090360A000   char[6] 02h,"\t",03h,"`",A0h      
LAB_b5da:
  b5da  39             RTS                               

; ---- function FUN_b5db
FUN_b5db:
  b5db  3406           PSHS  B A                         
  b5dd  FC6074         LDD 0x6074                        
  b5e0  10B36162       CMPD 0x6162                       
  b5e4  2305           BLS 0xb5eb                        
  b5e6  1702A5         LBSR 0xb88e                       
  b5e9  2003           BRA 0xb5ee                        
LAB_b5eb:
  b5eb  1702C0         LBSR 0xb8ae                       
LAB_b5ee:
  b5ee  FD6162         STD 0x6162                        
  b5f1  17E59B         LBSR 0x9b8f                       
  b5f4  3506           PULS  A B                         
  b5f6  39             RTS                               

; ---- function FUN_b5f7
FUN_b5f7:
  b5f7  3406           PSHS  B A                         
  b5f9  F660B9         LDB 0x60b9                        
  b5fc  17F0CE         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B60E "( Number )"
  b5ff  B60E           addr b60e                         
  b601  28204E756D62.. ds "( Number )"                   
LAB_b60b:
  b60b  3506           PULS  A B                         
  b60d  39             RTS                               

; ---- function FUN_b60e
FUN_b60e:
  b60e  17E09D         LBSR 0x96ae                       
  b611  17E5CE         LBSR 0x9be2                       
  b614  39             RTS                               

; ---- function FUN_b615
FUN_b615:
  b615  3436           PSHS  Y X B A                     
  b617  17F00F         LBSR 0xa629                       
  b61a  C6A9           LDB #0xa9                         
  b61c  F760FB         STB 0x60fb                        
  b61f  CC9BE2         LDD #0x9be2                       
  b622  FD6036         STD 0x6036                        
  b625  7D60DA         TST 0x60da                        
  b628  260A           BNE 0xb634                        
  b62a  108E60C6       LDY #0x60c6                       
  b62e  17092B         LBSR 0xbf5c                        ; inline[API_FD0C]: $000F 20
  b631  000F           dw Fh                             
  b633  20             db 20h                            
LAB_b634:
  b634  7F60C3         CLR 0x60c3                        
  b637  8E60C6         LDX #0x60c6                       
  b63a  B660C3         LDA 0x60c3                        
  b63d  E686           LDB A,X                           
  b63f  F76164         STB 0x6164                        
  b642  17E0A8         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1F}Adj Name~"
  b645  021F41646A20.. char[12] 02h,1Fh,"Adj Name~"      
LAB_b651:
  b651  C6FF           LDB #0xff                         
  b653  F760DA         STB 0x60da                        
  b656  8D03           BSR 0xb65b                        
  b658  3536           PULS  A B X Y                     
  b65a  39             RTS                               

; ---- function FUN_b65b
FUN_b65b:
  b65b  3436           PSHS  Y X B A                     
  b65d  8E60C6         LDX #0x60c6                       
  b660  B660C3         LDA 0x60c3                        
  b663  E686           LDB A,X                           
  b665  C120           CMPB #0x20                        
  b667  2603           BNE 0xb66c                        
  b669  F66164         LDB 0x6164                        
LAB_b66c:
  b66c  170064         LBSR 0xb6d3                       
  b66f  4F             CLRA                              
  b670  FD6074         STD 0x6074                        
  b673  17D786         LBSR 0x8dfc                        ; inline[API_FC16]: 01 10 02 4B 02 00 06 00 $00BC $0000 $0000 ->$8877 ->$B6B6 $0001 $0001 $0000
  b676  01             db 1h                             
  b677  10             db 10h                            
  b678  02             db 2h                             
  b679  4B             db 4Bh                            
  b67a  02             db 2h                             
  b67b  00             db 0h                             
  b67c  06             db 6h                             
  b67d  00             db 0h                             
  b67e  00BC           dw BCh                            
  b680  0000           dw 0h                             
  b682  0000           dw 0h                             
  b684  8877           addr 8877                         
  b686  B6B6           addr b6b6                         
  b688  0001           dw 1h                             
  b68a  0001           dw 1h                             
  b68c  0000           dw 0h                             
LAB_b68e:
  b68e  1701DA         LBSR 0xb86b                       
  b691  170052         LBSR 0xb6e6                       
  b694  8602           LDA #0x2                          
  b696  B760C1         STA 0x60c1                        
  b699  17E003         LBSR 0x969f                       
  b69c  3536           PULS  A B X Y                     
  b69e  39             RTS                               

; ---- function FUN_b69f
FUN_b69f:
  b69f  3406           PSHS  B A                         
  b6a1  F660B9         LDB 0x60b9                        
  b6a4  17F026         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$9C05 "(  Name  )"
  b6a7  9C05           addr 9c05                         
  b6a9  2820204E616D.. ds "(  Name  )"                   
LAB_b6b3:
  b6b3  3506           PULS  A B                         
  b6b5  39             RTS                               

; ---- function FUN_b6b6
FUN_b6b6:
  b6b6  3416           PSHS  X B A                       
  b6b8  FC6074         LDD 0x6074                        
  b6bb  8EB8D2         LDX #0xb8d2                       
  b6be  E68B           LDB D,X                           
  b6c0  8E60C6         LDX #0x60c6                       
  b6c3  B660C3         LDA 0x60c3                        
  b6c6  E786           STB A,X                           
  b6c8  F76164         STB 0x6164                        
  b6cb  17019D         LBSR 0xb86b                       
  b6ce  8D16           BSR 0xb6e6                        
  b6d0  3516           PULS  A B X                       
  b6d2  39             RTS                               

; ---- function FUN_b6d3
FUN_b6d3:
  b6d3  3452           PSHS  U X A                       
  b6d5  8EB8D2         LDX #0xb8d2                       
  b6d8  CE00BC         LDU #0xbc                         
  b6db  170891         LBSR 0xbf6f                       
  b6de  1F10           TFR X,D                           
  b6e0  83B8D2         SUBD #0xb8d2                      
  b6e3  3552           PULS  A X U                       
  b6e5  39             RTS                               

; ---- function FUN_b6e6
FUN_b6e6:
  b6e6  C60E           LDB #0xe                          
  b6e8  FB60C3         ADDB 0x60c3                       
  b6eb  17DFCA         LBSR 0x96b8                       
  b6ee  39             RTS                               

; ---- function FUN_b6ef
FUN_b6ef:
  b6ef  3404           PSHS  B                           
  b6f1  F660B9         LDB 0x60b9                        
  b6f4  17EFD6         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B706 "(  .---  )"
  b6f7  B706           addr b706                         
  b6f9  2820207F2D2D.. ds "(  ",7Fh,"---  )"             
LAB_b703:
  b703  3504           PULS  B                           
  b705  39             RTS                               

; ---- function FUN_b706
FUN_b706:
  b706  3406           PSHS  B A                         
  b708  F660C3         LDB 0x60c3                        
  b70b  2701           BEQ 0xb70e                        
  b70d  5A             DECB                              
LAB_b70e:
  b70e  F760C3         STB 0x60c3                        
  b711  17FF47         LBSR 0xb65b                       
  b714  17FFCF         LBSR 0xb6e6                       
  b717  3506           PULS  A B                         
  b719  39             RTS                               

; ---- function FUN_b71a
FUN_b71a:
  b71a  3404           PSHS  B                           
  b71c  F660B9         LDB 0x60b9                        
  b71f  17EFAB         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B731 "(  ---~  )"
  b722  B731           addr b731                         
  b724  2820202D2D2D.. ds "(  ---~  )"                   
LAB_b72e:
  b72e  3504           PULS  B                           
  b730  39             RTS                               

; ---- function FUN_b731
FUN_b731:
  b731  3406           PSHS  B A                         
  b733  F660C3         LDB 0x60c3                        
  b736  C10E           CMPB #0xe                         
  b738  2701           BEQ 0xb73b                        
  b73a  5C             INCB                              
LAB_b73b:
  b73b  F760C3         STB 0x60c3                        
  b73e  17FF1A         LBSR 0xb65b                       
  b741  17FFA2         LBSR 0xb6e6                       
  b744  3506           PULS  A B                         
  b746  39             RTS                               

; ---- function FUN_b747
FUN_b747:
  b747  3404           PSHS  B                           
  b749  F660B9         LDB 0x60b9                        
  b74c  17EF7E         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$B761 "(Save It )"
  b74f  B761           addr b761                         
  b751  285361766520.. ds "(Save It )"                   
LAB_b75b:
  b75b  17FF88         LBSR 0xb6e6                       
  b75e  3504           PULS  B                           
  b760  39             RTS                               

; ---- function FUN_b761
FUN_b761:
  b761  3416           PSHS  X B A                       
  b763  17DF48         LBSR 0x96ae                       
  b766  FC6162         LDD 0x6162                        
  b769  FD615C         STD 0x615c                        
  b76c  17E5C9         LBSR 0x9d38                       
  b76f  108E0000       LDY #0x0                          
  b773  17EA70         LBSR 0xa1e6                       
  b776  108E000A       LDY #0xa                          
  b77a  .db 8E 60                                            ; .`

; ---- function FUN_b77c
FUN_b77c:
  b77c  C6C6           LDB #0xc6                         
  b77e  .db A0 F7 60 0C CC 00 0F 17 47 8E C6 A0 8E 00 00 17  ; ..`.....G.......
  b78e  .db D4 2E 26 0C 7F 60 DA 17 E5 22 17 E4 B7 35 16 39  ; ..&..`..."...5.9
  b79e  .db 17 EE 88 17 DF 49 01                             ; .....I.
  b7a5  4E6F7420656E.. ds "Not enough room to save Program !       Delete some Programs,   Press Program ~"
  b7f5  .db 35 16 39                                         ; 5.9

; ---- function FUN_b7f8
FUN_b7f8:
  b7f8  3416           PSHS  X B A                       
  b7fa  C6A0           LDB #0xa0                         
  b7fc  174681         LBSR 0xfe80                       
  b7ff  FC0000         LDD 0x0000                        
  b802  17D248         LBSR 0x8a4d                       
  b805  2617           BNE 0xb81e                        
  b807  8E0005         LDX #0x5                          
  b80a  17D111         LBSR 0x891e                       
  b80d  C401           ANDB #0x1                         
  b80f  270D           BEQ 0xb81e                        
  b811  FC607D         LDD 0x607d                        
  b814  10B30002       CMPD 0x0002                       
  b818  2604           BNE 0xb81e                        
  b81a  1A04           ORCC #0x4                         
  b81c  2008           BRA 0xb826                        
LAB_b81e:
  b81e  174679         LBSR 0xfe9a                       
  b821  1CFB           ANDCC #0xfb                       
  b823  3516           PULS  A B X                       
  b825  39             RTS                               
LAB_b826:
  b826  174671         LBSR 0xfe9a                       
  b829  1A04           ORCC #0x4                         
  b82b  3516           PULS  A B X                       
  b82d  39             RTS                               

; ---- function FUN_b82e
FUN_b82e:
  b82e  3436           PSHS  Y X B A                     
  b830  17FFC5         LBSR 0xb7f8                       
  b833  2633           BNE 0xb868                        
  b835  C6A0           LDB #0xa0                         
  b837  174646         LBSR 0xfe80                       
  b83a  327E           LEAS -0x2,S                       
  b83c  F66079         LDB 0x6079                        
  b83f  F7600C         STB 0x600c                        
  b842  8E0000         LDX #0x0                          
  b845  10BE607A       LDY 0x607a                        
  b849  10AFE4         STY ,S                            
  b84c  FC607D         LDD 0x607d                        
  b84f  1746C4         LBSR 0xff16                       
  b852  10AEE4         LDY ,S                            
  b855  3125           LEAY 0x5,Y                        
  b857  1F21           TFR Y,X                           
  b859  174653         LBSR 0xfeaf                       
  b85c  CA01           ORB #0x1                          
  b85e  17466B         LBSR 0xfecc                       
  b861  3262           LEAS 0x2,S                        
  b863  174634         LBSR 0xfe9a                       
  b866  1A04           ORCC #0x4                         
LAB_b868:
  b868  3536           PULS  A B X Y                     
  b86a  39             RTS                               

; ---- function FUN_b86b
FUN_b86b:
  b86b  3456           PSHS  U X B A                     
  b86d  CE60DA         LDU #0x60da                       
  b870  FC6162         LDD 0x6162                        
  b873  3606           PSHU  B A                         
  b875  17DE75         LBSR 0x96ed                        ; inline[API_FC38]: "{2:09}{4:2000}{3:60AA}{2:0E}"
  b878  020904200003.. char[11] 02h,"\t",04h," "         
LAB_b883:
  b883  8E60C6         LDX #0x60c6                       
  b886  C60F           LDB #0xf                          
  b888  17DED2         LBSR 0x975d                       
  b88b  3556           PULS  A B X U                     
  b88d  39             RTS                               

; ---- function FUN_b88e
FUN_b88e:
  b88e  3406           PSHS  B A                         
  b890  8D3C           BSR 0xb8ce                        
  b892  2617           BNE 0xb8ab                        
  b894  108303E7       CMPD #0x3e7                       
  b898  270D           BEQ 0xb8a7                        
LAB_b89a:
  b89a  C30001         ADDD #0x1                         
  b89d  8D2F           BSR 0xb8ce                        
  b89f  260A           BNE 0xb8ab                        
  b8a1  108303E7       CMPD #0x3e7                       
  b8a5  25F3           BCS 0xb89a                        
LAB_b8a7:
  b8a7  ECE4           LDD ,S                            
  b8a9  8D03           BSR 0xb8ae                        
LAB_b8ab:
  b8ab  3262           LEAS 0x2,S                        
  b8ad  39             RTS                               

; ---- function FUN_b8ae
FUN_b8ae:
  b8ae  3406           PSHS  B A                         
  b8b0  8D1C           BSR 0xb8ce                        
  b8b2  2617           BNE 0xb8cb                        
  b8b4  10830000       CMPD #0x0                         
  b8b8  270D           BEQ 0xb8c7                        
LAB_b8ba:
  b8ba  C3FFFF         ADDD #0xffff                      
  b8bd  8D0F           BSR 0xb8ce                        
  b8bf  260A           BNE 0xb8cb                        
  b8c1  10830000       CMPD #0x0                         
  b8c5  26F3           BNE 0xb8ba                        
LAB_b8c7:
  b8c7  ECE4           LDD ,S                            
  b8c9  8DC3           BSR 0xb88e                        
LAB_b8cb:
  b8cb  3262           LEAS 0x2,S                        
  b8cd  39             RTS                               

; ---- function FUN_b8ce
FUN_b8ce:
  b8ce  17E432         LBSR 0x9d03                       
  b8d1  39             RTS                               
DAT_b8d2:
  b8d2  30             ?? 30h    0                       
  b8d3  .db 31 32 33 34 35 36 37 38 39 20 41 42 43 44 45 46  ; 123456789 ABCDEF
  b8e3  .db 47 48 49 4A 4B 4C 4D 4E 4F 50 51 52 53 54 55 56  ; GHIJKLMNOPQRSTUV
  b8f3  .db 57 58 59 5A 61 62 63 64 65 66 67 68 69 6A 6B 6C  ; WXYZabcdefghijkl
  b903  .db 6D 6E 6F 70 71 72 73 74 75 76 77 78 79 7A 21 23  ; mnopqrstuvwxyz!#
  b913  .db 24 25 26 40 3F 2B 2D 2A FD 3D 5E 3C 3E 28 29 5B  ; $%&@?+-*.=^<>()[
  b923  .db 5D 7B 7D 7E 7F 2E 2C 3A 3B 27 22 60 5F 2F 7C E0  ; ]{}~..,:;'"`_/|.
  b933  .db E1 E2 E3 E4 E5 E6 E7 E8 E9 EA EB EC ED EE EF F0  ; ................
  b943  .db F1 F2 F3 F4 F5 F6 F7 F8 F9 A0 A1 A2 A3 A4 A5 A6  ; ................
  b953  .db A7 A8 A9 AA AB AC AD AE AF B1 B1 B2 B3 B4 B5 B6  ; ................
  b963  .db B7 B8 B9 BC BB BC BD BE BF C0 C1 C2 C3 C7 C5 C7  ; ................
  b973  .db C7 C8 C9 CA CB CC CD CE CF D0 D1 D2 D3 D4 D5 D6  ; ................
  b983  .db D7 D8 D9 DA DB DC DD DE DF FA FB FC              ; ............

; ---- function API_FCA4
API_FCA4:
  b98f  170683         LBSR 0xc015                        ; inline[API_FD18]: [$608F]=$8877 [$6091]=$8877 [$6093]=$8877 [$6095]=$8877 [$6097]=$8877
  b992  608F           addr 608f                         
  b994  8877           dw 8877h                          
  b996  6091           addr 6091                         
  b998  8877           dw 8877h                          
  b99a  6093           addr 6093                         
  b99c  8877           dw 8877h                          
  b99e  6095           addr 6095                         
  b9a0  8877           dw 8877h                          
  b9a2  6097           addr 6097                         
  b9a4  8877           dw 8877h                          
  b9a6  FFFF           dw FFFFh                          
LAB_b9a8:
  b9a8  7F6168         CLR 0x6168                        
  b9ab  7F616B         CLR 0x616b                        
  b9ae  7F616E         CLR 0x616e                        
  b9b1  7F6171         CLR 0x6171                        
  b9b4  7F6174         CLR 0x6174                        
  b9b7  7F6177         CLR 0x6177                        
  b9ba  7F617A         CLR 0x617a                        
  b9bd  7F617D         CLR 0x617d                        
  b9c0  7F6180         CLR 0x6180                        
  b9c3  7F6183         CLR 0x6183                        
  b9c6  39             RTS                               

; ---- function API_FCA6
API_FCA6:
  b9c7  3427           PSHS  Y B A CC                    
  b9c9  8600           LDA #0x0                          
  b9cb  F66165         LDB 0x6165                        
  b9ce  B76165         STA 0x6165                        
  b9d1  3406           PSHS  B A                         
  b9d3  7D6168         TST 0x6168                        
  b9d6  270A           BEQ 0xb9e2                        
  b9d8  FC6166         LDD 0x6166                        
  b9db  A3E4           SUBD ,S                           
  b9dd  2E03           BGT 0xb9e2                        
  b9df  7F6168         CLR 0x6168                        
LAB_b9e2:
  b9e2  FD6166         STD 0x6166                        
  b9e5  7D616B         TST 0x616b                        
  b9e8  270A           BEQ 0xb9f4                        
  b9ea  FC6169         LDD 0x6169                        
  b9ed  A3E4           SUBD ,S                           
  b9ef  2E03           BGT 0xb9f4                        
  b9f1  7F616B         CLR 0x616b                        
LAB_b9f4:
  b9f4  FD6169         STD 0x6169                        
  b9f7  7D616E         TST 0x616e                        
  b9fa  270A           BEQ 0xba06                        
  b9fc  FC616C         LDD 0x616c                        
  b9ff  A3E4           SUBD ,S                           
  ba01  2E03           BGT 0xba06                        
  ba03  7F616E         CLR 0x616e                        
LAB_ba06:
  ba06  FD616C         STD 0x616c                        
  ba09  7D6171         TST 0x6171                        
  ba0c  270A           BEQ 0xba18                        
  ba0e  FC616F         LDD 0x616f                        
  ba11  A3E4           SUBD ,S                           
  ba13  2E03           BGT 0xba18                        
  ba15  7F6171         CLR 0x6171                        
LAB_ba18:
  ba18  FD616F         STD 0x616f                        
  ba1b  7D6174         TST 0x6174                        
  ba1e  270A           BEQ 0xba2a                        
  ba20  FC6172         LDD 0x6172                        
  ba23  A3E4           SUBD ,S                           
  ba25  2E03           BGT 0xba2a                        
  ba27  7F6174         CLR 0x6174                        
LAB_ba2a:
  ba2a  FD6172         STD 0x6172                        
  ba2d  7D6177         TST 0x6177                        
  ba30  270E           BEQ 0xba40                        
  ba32  FC6175         LDD 0x6175                        
  ba35  A3E4           SUBD ,S                           
  ba37  2E07           BGT 0xba40                        
  ba39  7F6177         CLR 0x6177                        
  ba3c  AD9F608F       JSR [0x608f]                      
LAB_ba40:
  ba40  FD6175         STD 0x6175                        
  ba43  7D617A         TST 0x617a                        
  ba46  270E           BEQ 0xba56                        
  ba48  FC6178         LDD 0x6178                        
  ba4b  A3E4           SUBD ,S                           
  ba4d  2E07           BGT 0xba56                        
  ba4f  7F617A         CLR 0x617a                        
  ba52  AD9F6091       JSR [0x6091]                      
LAB_ba56:
  ba56  FD6178         STD 0x6178                        
  ba59  7D617D         TST 0x617d                        
  ba5c  270E           BEQ 0xba6c                        
  ba5e  FC617B         LDD 0x617b                        
  ba61  A3E4           SUBD ,S                           
  ba63  2E07           BGT 0xba6c                        
  ba65  7F617D         CLR 0x617d                        
  ba68  AD9F6093       JSR [0x6093]                      
LAB_ba6c:
  ba6c  FD617B         STD 0x617b                        
  ba6f  7D6180         TST 0x6180                        
  ba72  270E           BEQ 0xba82                        
  ba74  FC617E         LDD 0x617e                        
  ba77  A3E4           SUBD ,S                           
  ba79  2E07           BGT 0xba82                        
  ba7b  7F6180         CLR 0x6180                        
  ba7e  AD9F6095       JSR [0x6095]                      
LAB_ba82:
  ba82  FD617E         STD 0x617e                        
  ba85  7D6183         TST 0x6183                        
  ba88  270E           BEQ 0xba98                        
  ba8a  FC6181         LDD 0x6181                        
  ba8d  A3E4           SUBD ,S                           
  ba8f  2E07           BGT 0xba98                        
  ba91  7F6183         CLR 0x6183                        
  ba94  AD9F6097       JSR [0x6097]                      
LAB_ba98:
  ba98  FD6181         STD 0x6181                        
  ba9b  3506           PULS  A B                         
  ba9d  3527           PULS CC A B Y                     
  ba9f  39             RTS                               

; ---- function API_FCA8
API_FCA8:
  baa0  7F6168         CLR 0x6168                        
  baa3  FD6166         STD 0x6166                        
  baa6  7C6168         INC 0x6168                        
  baa9  39             RTS                               

; ---- function API_FCAA
API_FCAA:
  baaa  17FF1A         LBSR 0xb9c7                       
  baad  7D6168         TST 0x6168                        
  bab0  39             RTS                               

; ---- function API_FCAC
API_FCAC:
  bab1  7F616B         CLR 0x616b                        
  bab4  FD6169         STD 0x6169                        
  bab7  7C616B         INC 0x616b                        
  baba  39             RTS                               

; ---- function API_FCAE
API_FCAE:
  babb  17FF09         LBSR 0xb9c7                       
  babe  7D616B         TST 0x616b                        
  bac1  39             RTS                               

; ---- function API_FCB0
API_FCB0:
  bac2  7F616E         CLR 0x616e                        
  bac5  FD616C         STD 0x616c                        
  bac8  7C616E         INC 0x616e                        
  bacb  39             RTS                               

; ---- function API_FCB2
API_FCB2:
  bacc  17FEF8         LBSR 0xb9c7                       
  bacf  7D616E         TST 0x616e                        
  bad2  39             RTS                               

; ---- function API_FCB4
API_FCB4:
  bad3  7F6171         CLR 0x6171                        
  bad6  FD616F         STD 0x616f                        
  bad9  7C6171         INC 0x6171                        
  badc  39             RTS                               

; ---- function API_FCB6
API_FCB6:
  badd  17FEE7         LBSR 0xb9c7                       
  bae0  7D6171         TST 0x6171                        
  bae3  39             RTS                               

; ---- function API_FCB8
API_FCB8:
  bae4  7F6174         CLR 0x6174                        
  bae7  FD6172         STD 0x6172                        
  baea  7C6174         INC 0x6174                        
  baed  39             RTS                               

; ---- function API_FCBA
API_FCBA:
  baee  17FED6         LBSR 0xb9c7                       
  baf1  7D6174         TST 0x6174                        
  baf4  39             RTS                               

; ---- function API_FCBC
API_FCBC:
  baf5  7F6177         CLR 0x6177                        
  baf8  FD6175         STD 0x6175                        
  bafb  7C6177         INC 0x6177                        
  bafe  39             RTS                               

; ---- function API_FCBE
API_FCBE:
  baff  7F617A         CLR 0x617a                        
  bb02  FD6178         STD 0x6178                        
  bb05  7C617A         INC 0x617a                        
  bb08  39             RTS                               

; ---- function API_FCC0
API_FCC0:
  bb09  7F617D         CLR 0x617d                        
  bb0c  FD617B         STD 0x617b                        
  bb0f  7C617D         INC 0x617d                        
  bb12  39             RTS                               

; ---- function API_FCC2
API_FCC2:
  bb13  7F6180         CLR 0x6180                        
  bb16  FD617E         STD 0x617e                        
  bb19  7C6180         INC 0x6180                        
  bb1c  39             RTS                               

; ---- function API_FCC4
API_FCC4:
  bb1d  7F6183         CLR 0x6183                        
  bb20  FD6181         STD 0x6181                        
  bb23  7C6183         INC 0x6183                        
  bb26  39             RTS                               

; ---- function API_FCC8
API_FCC8:
  bb27  3406           PSHS  B A                         
  bb29  6DC4           TST ,U                            
  bb2b  2C08           BGE 0xbb35                        
  bb2d  4F             CLRA                              
  bb2e  5F             CLRB                              
  bb2f  A3C4           SUBD ,U                           
  bb31  EDC4           STD ,U                            
  bb33  1A08           ORCC #0x8                         
LAB_bb35:
  bb35  3506           PULS  A B                         
  bb37  39             RTS                               

; ---- function API_FCCA
API_FCCA:
  bb38  3406           PSHS  B A                         
  bb3a  ECC4           LDD ,U                            
  bb3c  C30001         ADDD #0x1                         
  bb3f  EDC4           STD ,U                            
  bb41  3506           PULS  A B                         
  bb43  39             RTS                               

; ---- function API_FCCC
API_FCCC:
  bb44  3406           PSHS  B A                         
  bb46  ECC4           LDD ,U                            
  bb48  830001         SUBD #0x1                         
  bb4b  EDC4           STD ,U                            
  bb4d  3506           PULS  A B                         
  bb4f  39             RTS                               

; ---- function API_FCCE
API_FCCE:
  bb50  3406           PSHS  B A                         
  bb52  3706           PULU  A B                         
  bb54  A8C4           EORA ,U                           
  bb56  A7C4           STA ,U                            
  bb58  E841           EORB 0x1,U                        
  bb5a  E741           STB 0x1,U                         
  bb5c  3506           PULS  A B                         
  bb5e  39             RTS                               

; ---- function API_FCD0
API_FCD0:
  bb5f  3406           PSHS  B A                         
  bb61  3706           PULU  A B                         
  bb63  A4C4           ANDA ,U                           
  bb65  A7C4           STA ,U                            
  bb67  E441           ANDB 0x1,U                        
  bb69  E741           STB 0x1,U                         
  bb6b  3506           PULS  A B                         
  bb6d  39             RTS                               

; ---- function API_FCD2
API_FCD2:
  bb6e  3407           PSHS  B A CC                      
  bb70  3706           PULU  A B                         
  bb72  AAC4           ORA ,U                            
  bb74  A7C4           STA ,U                            
  bb76  EA41           ORB 0x1,U                         
  bb78  E741           STB 0x1,U                         
  bb7a  3507           PULS CC A B                       
  bb7c  39             RTS                               

; ---- function API_FCD4
API_FCD4:
  bb7d  3410           PSHS  X                           
  bb7f  3710           PULU  X                           
  bb81  ACC4           CMPX ,U                           
  bb83  2C02           BGE 0xbb87                        
  bb85  AFC4           STX ,U                            
LAB_bb87:
  bb87  3510           PULS  X                           
  bb89  39             RTS                               

; ---- function API_FCD6
API_FCD6:
  bb8a  3411           PSHS  X CC                        
  bb8c  3710           PULU  X                           
  bb8e  ACC4           CMPX ,U                           
  bb90  2F02           BLE 0xbb94                        
  bb92  AFC4           STX ,U                            
LAB_bb94:
  bb94  3511           PULS CC X                         
  bb96  39             RTS                               

; ---- function API_FCD8
API_FCD8:
  bb97  3410           PSHS  X                           
  bb99  3710           PULU  X                           
  bb9b  ACC4           CMPX ,U                           
  bb9d  2C02           BGE 0xbba1                        
  bb9f  AFC4           STX ,U                            
LAB_bba1:
  bba1  3710           PULU  X                           
  bba3  ACC4           CMPX ,U                           
  bba5  2F02           BLE 0xbba9                        
  bba7  AFC4           STX ,U                            
LAB_bba9:
  bba9  3510           PULS  X                           
  bbab  39             RTS                               

; ---- function API_FCDA
API_FCDA:
  bbac  3410           PSHS  X                           
  bbae  3710           PULU  X                           
  bbb0  ACC4           CMPX ,U                           
  bbb2  2402           BCC 0xbbb6                        
  bbb4  AFC4           STX ,U                            
LAB_bbb6:
  bbb6  3710           PULU  X                           
  bbb8  ACC4           CMPX ,U                           
  bbba  2302           BLS 0xbbbe                        
  bbbc  AFC4           STX ,U                            
LAB_bbbe:
  bbbe  3510           PULS  X                           
  bbc0  39             RTS                               

; ---- function API_FCDC
API_FCDC:
  bbc1  3416           PSHS  X B A                       
  bbc3  ECC1           LDD ,U++                          
  bbc5  2728           BEQ 0xbbef                        
  bbc7  2A12           BPL 0xbbdb                        
  bbc9  50             NEGB                              
  bbca  4F             CLRA                              
  bbcb  C40F           ANDB #0xf                         
  bbcd  1F01           TFR D,X                           
  bbcf  3706           PULU  A B                         
LAB_bbd1:
  bbd1  47             ASRA                              
  bbd2  56             RORB                              
  bbd3  301F           LEAX -0x1,X                       
  bbd5  26FA           BNE 0xbbd1                        
  bbd7  3606           PSHU  B A                         
  bbd9  2014           BRA 0xbbef                        
LAB_bbdb:
  bbdb  1F01           TFR D,X                           
  bbdd  3706           PULU  A B                         
LAB_bbdf:
  bbdf  58             LSLB                              
  bbe0  49             ROLA                              
  bbe1  2504           BCS 0xbbe7                        
  bbe3  847F           ANDA #0x7f                        
  bbe5  2002           BRA 0xbbe9                        
LAB_bbe7:
  bbe7  8A80           ORA #0x80                         
LAB_bbe9:
  bbe9  301F           LEAX -0x1,X                       
  bbeb  26F2           BNE 0xbbdf                        
  bbed  3606           PSHU  B A                         
LAB_bbef:
  bbef  3511           PULS CC X                         
  bbf1  39             RTS                               

; ---- function API_FCDE
API_FCDE:
  bbf2  3416           PSHS  X B A                       
  bbf4  ECC1           LDD ,U++                          
  bbf6  2720           BEQ 0xbc18                        
  bbf8  2A12           BPL 0xbc0c                        
  bbfa  50             NEGB                              
  bbfb  4F             CLRA                              
  bbfc  C40F           ANDB #0xf                         
  bbfe  1F01           TFR D,X                           
  bc00  3706           PULU  A B                         
LAB_bc02:
  bc02  44             LSRA                              
  bc03  56             RORB                              
  bc04  301F           LEAX -0x1,X                       
  bc06  26FA           BNE 0xbc02                        
  bc08  3606           PSHU  B A                         
  bc0a  200C           BRA 0xbc18                        
LAB_bc0c:
  bc0c  1F01           TFR D,X                           
  bc0e  3706           PULU  A B                         
LAB_bc10:
  bc10  58             LSLB                              
  bc11  49             ROLA                              
  bc12  301F           LEAX -0x1,X                       
  bc14  26FA           BNE 0xbc10                        
  bc16  3606           PSHU  B A                         
LAB_bc18:
  bc18  3516           PULS  A B X                       
  bc1a  39             RTS                               

; ---- function API_FCE0
API_FCE0:
  bc1b  3406           PSHS  B A                         
  bc1d  4F             CLRA                              
  bc1e  5F             CLRB                              
  bc1f  A3C4           SUBD ,U                           
  bc21  EDC4           STD ,U                            
  bc23  3506           PULS  A B                         
  bc25  39             RTS                               

; ---- function API_FCE2
API_FCE2:
  bc26  3407           PSHS  B A CC                      
  bc28  3706           PULU  A B                         
  bc2a  E3C4           ADDD ,U                           
  bc2c  EDC4           STD ,U                            
  bc2e  3507           PULS CC A B                       
  bc30  39             RTS                               

; ---- function API_FCE4
API_FCE4:
  bc31  3407           PSHS  B A CC                      
  bc33  EC42           LDD 0x2,U                         
  bc35  A3C4           SUBD ,U                           
  bc37  3342           LEAU 0x2,U                        
  bc39  EDC4           STD ,U                            
  bc3b  3507           PULS CC A B                       
  bc3d  39             RTS                               

; ---- function API_FCE6
API_FCE6:
  bc3e  8D0E           BSR 0xbc4e                        
  bc40  3342           LEAU 0x2,U                        
  bc42  39             RTS                               

; ---- function API_FCE8
API_FCE8:
  bc43  3407           PSHS  B A CC                      
  bc45  8D07           BSR 0xbc4e                        
  bc47  3706           PULU  A B                         
  bc49  EDC4           STD ,U                            
  bc4b  3507           PULS CC A B                       
  bc4d  39             RTS                               

; ---- function FUN_bc4e
FUN_bc4e:
  bc4e  7F6188         CLR 0x6188                        
  bc51  17FED3         LBSR 0xbb27                       
  bc54  2A03           BPL 0xbc59                        
  bc56  736188         COM 0x6188                        
LAB_bc59:
  bc59  3706           PULU  A B                         
  bc5b  FD6184         STD 0x6184                        
  bc5e  17FEC6         LBSR 0xbb27                       
  bc61  2A03           BPL 0xbc66                        
  bc63  736188         COM 0x6188                        
LAB_bc66:
  bc66  3706           PULU  A B                         
  bc68  FD6186         STD 0x6186                        
  bc6b  4F             CLRA                              
  bc6c  5F             CLRB                              
  bc6d  8E0010         LDX #0x10                         
LAB_bc70:
  bc70  796187         ROL 0x6187                        
  bc73  796186         ROL 0x6186                        
  bc76  59             ROLB                              
  bc77  49             ROLA                              
  bc78  10B36184       CMPD 0x6184                       
  bc7c  2503           BCS 0xbc81                        
  bc7e  B36184         SUBD 0x6184                       
LAB_bc81:
  bc81  301F           LEAX -0x1,X                       
  bc83  26EB           BNE 0xbc70                        
  bc85  1F01           TFR D,X                           
  bc87  FC6186         LDD 0x6186                        
  bc8a  59             ROLB                              
  bc8b  49             ROLA                              
  bc8c  53             COMB                              
  bc8d  43             COMA                              
  bc8e  3606           PSHU  B A                         
  bc90  3610           PSHU  X                           
  bc92  7D6188         TST 0x6188                        
  bc95  2A0C           BPL 0xbca3                        
  bc97  4F             CLRA                              
  bc98  5F             CLRB                              
  bc99  A3C4           SUBD ,U                           
  bc9b  EDC4           STD ,U                            
  bc9d  4F             CLRA                              
  bc9e  5F             CLRB                              
  bc9f  A342           SUBD 0x2,U                        
  bca1  ED42           STD 0x2,U                         
LAB_bca3:
  bca3  39             RTS                               

; ---- function API_FCEA
API_FCEA:
  bca4  3416           PSHS  X B A                       
  bca6  3706           PULU  A B                         
  bca8  FD6184         STD 0x6184                        
  bcab  3706           PULU  A B                         
  bcad  FD6186         STD 0x6186                        
  bcb0  4F             CLRA                              
  bcb1  5F             CLRB                              
  bcb2  8E0010         LDX #0x10                         
LAB_bcb5:
  bcb5  796187         ROL 0x6187                        
  bcb8  796186         ROL 0x6186                        
  bcbb  59             ROLB                              
  bcbc  49             ROLA                              
  bcbd  10B36184       CMPD 0x6184                       
  bcc1  2503           BCS 0xbcc6                        
  bcc3  B36184         SUBD 0x6184                       
LAB_bcc6:
  bcc6  301F           LEAX -0x1,X                       
  bcc8  26EB           BNE 0xbcb5                        
  bcca  1F01           TFR D,X                           
  bccc  FC6186         LDD 0x6186                        
  bccf  59             ROLB                              
  bcd0  49             ROLA                              
  bcd1  43             COMA                              
  bcd2  53             COMB                              
  bcd3  3610           PSHU  X                           
  bcd5  3606           PSHU  B A                         
  bcd7  3516           PULS  A B X                       
  bcd9  39             RTS                               

; ---- function API_FCEC
API_FCEC:
  bcda  170080         LBSR 0xbd5d                       
  bcdd  3342           LEAU 0x2,U                        
  bcdf  39             RTS                               

; ---- function API_FCEE
API_FCEE:
  bce0  8D03           BSR 0xbce5                        
  bce2  3342           LEAU 0x2,U                        
  bce4  39             RTS                               

; ---- function API_FCF0
API_FCF0:
  bce5  3406           PSHS  B A                         
  bce7  CC0000         LDD #0x0                          
  bcea  FD6184         STD 0x6184                        
  bced  FD6186         STD 0x6186                        
  bcf0  A641           LDA 0x1,U                         
  bcf2  E643           LDB 0x3,U                         
  bcf4  3D             MUL                               
  bcf5  FD6186         STD 0x6186                        
  bcf8  A6C4           LDA ,U                            
  bcfa  E643           LDB 0x3,U                         
  bcfc  3D             MUL                               
  bcfd  F36185         ADDD 0x6185                       
  bd00  2403           BCC 0xbd05                        
  bd02  7C6184         INC 0x6184                        
LAB_bd05:
  bd05  FD6185         STD 0x6185                        
  bd08  A641           LDA 0x1,U                         
  bd0a  E642           LDB 0x2,U                         
  bd0c  3D             MUL                               
  bd0d  F36185         ADDD 0x6185                       
  bd10  2403           BCC 0xbd15                        
  bd12  7C6184         INC 0x6184                        
LAB_bd15:
  bd15  FD6185         STD 0x6185                        
  bd18  A6C4           LDA ,U                            
  bd1a  E642           LDB 0x2,U                         
  bd1c  3D             MUL                               
  bd1d  F36184         ADDD 0x6184                       
  bd20  EDC4           STD ,U                            
  bd22  FC6186         LDD 0x6186                        
  bd25  ED42           STD 0x2,U                         
  bd27  3506           PULS  A B                         
  bd29  39             RTS                               

; ---- function API_FCF2
API_FCF2:
  bd2a  3406           PSHS  B A                         
  bd2c  8D2F           BSR 0xbd5d                        
  bd2e  3706           PULU  A B                         
  bd30  FD6184         STD 0x6184                        
  bd33  2B10           BMI 0xbd45                        
  bd35  3706           PULU  A B                         
  bd37  10834000       CMPD #0x4000                      
  bd3b  2D18           BLT 0xbd55                        
  bd3d  FC6184         LDD 0x6184                        
  bd40  C30001         ADDD #0x1                         
  bd43  2013           BRA 0xbd58                        
LAB_bd45:
  bd45  3706           PULU  A B                         
  bd47  1083C000       CMPD #0xc000                      
  bd4b  2E08           BGT 0xbd55                        
  bd4d  FC6184         LDD 0x6184                        
  bd50  830001         SUBD #0x1                         
  bd53  2003           BRA 0xbd58                        
LAB_bd55:
  bd55  FC6184         LDD 0x6184                        
LAB_bd58:
  bd58  3606           PSHU  B A                         
  bd5a  3506           PULS  A B                         
  bd5c  39             RTS                               

; ---- function API_FDE4
API_FDE4:
  bd5d  7F6188         CLR 0x6188                        
  bd60  17FDC4         LBSR 0xbb27                       
  bd63  2A03           BPL 0xbd68                        
  bd65  736188         COM 0x6188                        
LAB_bd68:
  bd68  3706           PULU  A B                         
  bd6a  FD6184         STD 0x6184                        
  bd6d  17FDB7         LBSR 0xbb27                       
  bd70  2A03           BPL 0xbd75                        
  bd72  736188         COM 0x6188                        
LAB_bd75:
  bd75  3706           PULU  A B                         
  bd77  FD6186         STD 0x6186                        
  bd7a  335C           LEAU -0x4,U                       
  bd7c  6FC4           CLR ,U                            
  bd7e  6F41           CLR 0x1,U                         
  bd80  B66185         LDA 0x6185                        
  bd83  F66187         LDB 0x6187                        
  bd86  3D             MUL                               
  bd87  ED42           STD 0x2,U                         
  bd89  B66184         LDA 0x6184                        
  bd8c  F66187         LDB 0x6187                        
  bd8f  3D             MUL                               
  bd90  E341           ADDD 0x1,U                        
  bd92  ED41           STD 0x1,U                         
  bd94  2402           BCC 0xbd98                        
  bd96  6CC4           INC ,U                            
LAB_bd98:
  bd98  B66185         LDA 0x6185                        
  bd9b  F66186         LDB 0x6186                        
  bd9e  3D             MUL                               
  bd9f  E341           ADDD 0x1,U                        
  bda1  ED41           STD 0x1,U                         
  bda3  2402           BCC 0xbda7                        
  bda5  6CC4           INC ,U                            
LAB_bda7:
  bda7  B66184         LDA 0x6184                        
  bdaa  F66186         LDB 0x6186                        
  bdad  3D             MUL                               
  bdae  E3C4           ADDD ,U                           
  bdb0  EDC4           STD ,U                            
  bdb2  EC41           LDD 0x1,U                         
  bdb4  58             LSLB                              
  bdb5  49             ROLA                              
  bdb6  69C4           ROL ,U                            
  bdb8  A741           STA 0x1,U                         
  bdba  54             LSRB                              
  bdbb  E742           STB 0x2,U                         
  bdbd  7D6188         TST 0x6188                        
  bdc0  2A0C           BPL 0xbdce                        
  bdc2  4F             CLRA                              
  bdc3  5F             CLRB                              
  bdc4  A342           SUBD 0x2,U                        
  bdc6  ED42           STD 0x2,U                         
  bdc8  4F             CLRA                              
  bdc9  5F             CLRB                              
  bdca  A3C4           SUBD ,U                           
  bdcc  EDC4           STD ,U                            
LAB_bdce:
  bdce  39             RTS                               
  bdcf  .db 20 00                                            ;  .

; ---- function API_FCF4
API_FCF4:
  bdd1  3416           PSHS  X B A                       
  bdd3  7F6188         CLR 0x6188                        
  bdd6  8E0010         LDX #0x10                         
  bdd9  3706           PULU  A B                         
  bddb  3A             ABX                               
  bddc  17FD48         LBSR 0xbb27                       
  bddf  2A03           BPL 0xbde4                        
  bde1  736188         COM 0x6188                        
LAB_bde4:
  bde4  3706           PULU  A B                         
  bde6  FD6184         STD 0x6184                        
  bde9  4F             CLRA                              
  bdea  5F             CLRB                              
LAB_bdeb:
  bdeb  10B36184       CMPD 0x6184                       
  bdef  2503           BCS 0xbdf4                        
  bdf1  B36184         SUBD 0x6184                       
LAB_bdf4:
  bdf4  796187         ROL 0x6187                        
  bdf7  796186         ROL 0x6186                        
  bdfa  1A01           ORCC #0x1                         
  bdfc  59             ROLB                              
  bdfd  49             ROLA                              
  bdfe  301F           LEAX -0x1,X                       
  be00  26E9           BNE 0xbdeb                        
  be02  FC6186         LDD 0x6186                        
  be05  43             COMA                              
  be06  53             COMB                              
  be07  847F           ANDA #0x7f                        
  be09  7D6188         TST 0x6188                        
  be0c  2705           BEQ 0xbe13                        
  be0e  43             COMA                              
  be0f  53             COMB                              
  be10  C30001         ADDD #0x1                         
LAB_be13:
  be13  3606           PSHU  B A                         
  be15  3516           PULS  A B X                       
  be17  39             RTS                               

; ---- function API_FCF6
API_FCF6:
  be18  3403           PSHS  A CC                        
  be1a  B6618B         LDA 0x618b                        
  be1d  44             LSRA                              
  be1e  44             LSRA                              
  be1f  44             LSRA                              
  be20  B8618B         EORA 0x618b                       
  be23  46             RORA                              
  be24  796189         ROL 0x6189                        
  be27  79618A         ROL 0x618a                        
  be2a  79618B         ROL 0x618b                        
  be2d  3503           PULS CC A                         
  be2f  39             RTS                               

; ---- function API_FCF8
API_FCF8:
  be30  3417           PSHS  X B A CC                    
  be32  4F             CLRA                              
  be33  3402           PSHS  A                           
  be35  ECC1           LDD ,U++                          
  be37  2751           BEQ 0xbe8a                        
  be39  2A07           BPL 0xbe42                        
  be3b  43             COMA                              
  be3c  53             COMB                              
  be3d  C30001         ADDD #0x1                         
  be40  63E4           COM ,S                            
LAB_be42:
  be42  10830001       CMPD #0x1                         
  be46  273A           BEQ 0xbe82                        
  be48  10837FFF       CMPD #0x7fff                      
  be4c  2403           BCC 0xbe51                        
  be4e  C30001         ADDD #0x1                         
LAB_be51:
  be51  4D             TSTA                              
  be52  2712           BEQ 0xbe66                        
  be54  3606           PSHU  B A                         
  be56  FC6189         LDD 0x6189                        
  be59  847F           ANDA #0x7f                        
  be5b  3606           PSHU  B A                         
  be5d  BDBD5D         JSR 0xbd5d                        
  be60  3706           PULU  A B                         
  be62  3342           LEAU 0x2,U                        
  be64  200C           BRA 0xbe72                        
LAB_be66:
  be66  B6618A         LDA 0x618a                        
  be69  3D             MUL                               
  be6a  C180           CMPB #0x80                        
  be6c  1F89           TFR A,B                           
  be6e  2501           BCS 0xbe71                        
  be70  5C             INCB                              
LAB_be71:
  be71  4F             CLRA                              
LAB_be72:
  be72  6DE0           TST ,S+                           
  be74  2705           BEQ 0xbe7b                        
  be76  43             COMA                              
  be77  53             COMB                              
  be78  C30001         ADDD #0x1                         
LAB_be7b:
  be7b  3606           PSHU  B A                         
  be7d  8D99           BSR 0xbe18                        
  be7f  3517           PULS CC A B X                     
  be81  39             RTS                               
LAB_be82:
  be82  4F             CLRA                              
  be83  F66189         LDB 0x6189                        
  be86  C401           ANDB #0x1                         
  be88  20E8           BRA 0xbe72                        
LAB_be8a:
  be8a  FC6189         LDD 0x6189                        
  be8d  20E3           BRA 0xbe72                        

; ---- function API_FCFA
API_FCFA:
  be8f  ECC4           LDD ,U                            
  be91  2603           BNE 0xbe96                        
  be93  C30001         ADDD #0x1                         
LAB_be96:
  be96  C38000         ADDD #0x8000                      
  be99  EDC4           STD ,U                            
  be9b  39             RTS                               

; ---- function API_FCFC
API_FCFC:
  be9c  3407           PSHS  B A CC                      
  be9e  AE42           LDX 0x2,U                         
  bea0  ED42           STD 0x2,U                         
  bea2  AFC4           STX ,U                            
  bea4  3507           PULS CC A B                       
  bea6  39             RTS                               

; ---- function API_FCC6
API_FCC6:
  bea7  3407           PSHS  B A CC                      
  bea9  ECC4           LDD ,U                            
  beab  3606           PSHU  B A                         
  bead  3507           PULS CC A B                       
  beaf  39             RTS                               

;; Kernel API slot $FE20: inline n + 2^n+1 point table

; ---- function InterpTableLookup
InterpTableLookup:
  beb0  3436           PSHS  Y X B A                     
  beb2  327A           LEAS -0x6,S                       
  beb4  AE6C           LDX 0xc,S                         
  beb6  E680           LDB ,X+                           
  beb8  E7E4           STB ,S                            
  beba  AF62           STX 0x2,S                         
  bebc  8D42           BSR 0xbf00                        
  bebe  C30001         ADDD #0x1                         
  bec1  58             LSLB                              
  bec2  49             ROLA                              
  bec3  308B           LEAX D,X                          
  bec5  AF6C           STX 0xc,S                         
  bec7  E6E4           LDB ,S                            
  bec9  E761           STB 0x1,S                         
  becb  CC0000         LDD #0x0                          
  bece  ED64           STD 0x4,S                         
  bed0  ECC4           LDD ,U                            
  bed2  847F           ANDA #0x7f                        
  bed4  58             LSLB                              
  bed5  49             ROLA                              
LAB_bed6:
  bed6  58             LSLB                              
  bed7  49             ROLA                              
  bed8  6965           ROL 0x5,S                         
  beda  6964           ROL 0x4,S                         
  bedc  6A61           DEC 0x1,S                         
  bede  26F6           BNE 0xbed6                        
  bee0  44             LSRA                              
  bee1  56             RORB                              
  bee2  EDC4           STD ,U                            
  bee4  EC64           LDD 0x4,S                         
  bee6  58             LSLB                              
  bee7  49             ROLA                              
  bee8  AE62           LDX 0x2,S                         
  beea  308B           LEAX D,X                          
  beec  EC02           LDD 0x2,X                         
  beee  A384           SUBD ,X                           
  bef0  3606           PSHU  B A                         
  bef2  17FE35         LBSR 0xbd2a                       
  bef5  ECC4           LDD ,U                            
  bef7  E384           ADDD ,X                           
  bef9  EDC4           STD ,U                            
  befb  3266           LEAS 0x6,S                        
  befd  3536           PULS  A B X Y                     
  beff  39             RTS                               

; ---- function FUN_bf00
FUN_bf00:
  bf00  3404           PSHS  B                           
  bf02  CC0001         LDD #0x1                          
LAB_bf05:
  bf05  6DE4           TST ,S                            
  bf07  2706           BEQ 0xbf0f                        
  bf09  58             LSLB                              
  bf0a  49             ROLA                              
  bf0b  6AE4           DEC ,S                            
  bf0d  20F6           BRA 0xbf05                        
LAB_bf0f:
  bf0f  3261           LEAS 0x1,S                        
  bf11  39             RTS                               

; ---- function API_FD04
API_FD04:
  bf12  3447           PSHS  U B A CC                    
  bf14  1F13           TFR X,U                           
  bf16  1F01           TFR D,X                           
LAB_bf18:
  bf18  A6C0           LDA ,U+                           
  bf1a  A7A0           STA ,Y+                           
  bf1c  301F           LEAX -0x1,X                       
  bf1e  26F8           BNE 0xbf18                        
  bf20  1F31           TFR U,X                           
  bf22  3547           PULS CC A B U                     
  bf24  39             RTS                               

; ---- function API_FD06
API_FD06:
  bf25  3447           PSHS  U B A CC                    
  bf27  1F13           TFR X,U                           
  bf29  1F01           TFR D,X                           
LAB_bf2b:
  bf2b  A6C4           LDA ,U                            
  bf2d  A7A4           STA ,Y                            
  bf2f  335F           LEAU -0x1,U                       
  bf31  313F           LEAY -0x1,Y                       
  bf33  301F           LEAX -0x1,X                       
  bf35  26F4           BNE 0xbf2b                        
  bf37  1F31           TFR U,X                           
  bf39  3547           PULS CC A B U                     
  bf3b  39             RTS                               

; ---- function API_FD08
API_FD08:
  bf3c  3403           PSHS  A CC                        
  bf3e  3440           PSHS  U                           
LAB_bf40:
  bf40  A680           LDA ,X+                           
  bf42  A7A0           STA ,Y+                           
  bf44  ACE4           CMPX ,S                           
  bf46  26F8           BNE 0xbf40                        
  bf48  3540           PULS  U                           
  bf4a  3503           PULS CC A                         
  bf4c  39             RTS                               

; ---- function API_FD0A
API_FD0A:
  bf4d  3403           PSHS  A CC                        
LAB_bf4f:
  bf4f  A680           LDA ,X+                           
  bf51  8100           CMPA #0x0                         
  bf53  2704           BEQ 0xbf59                        
  bf55  A7A0           STA ,Y+                           
  bf57  20F6           BRA 0xbf4f                        
LAB_bf59:
  bf59  3503           PULS CC A                         
  bf5b  39             RTS                               

;; Kernel API slot $FD0C: inline count word + fill byte; Y = destination

; ---- function MemsetInline
MemsetInline:
  bf5c  3477           PSHS  U Y X B A CC                
  bf5e  EE69           LDU 0x9,S                         
  bf60  AEC1           LDX ,U++                          
  bf62  E6C0           LDB ,U+                           
LAB_bf64:
  bf64  E7A0           STB ,Y+                           
  bf66  301F           LEAX -0x1,X                       
  bf68  26FA           BNE 0xbf64                        
  bf6a  EF69           STU 0x9,S                         
  bf6c  3577           PULS CC A B X Y U                 
  bf6e  39             RTS                               

; ---- function API_FD0E
API_FD0E:
  bf6f  3466           PSHS  U Y B A                     
  bf71  1F32           TFR U,Y                           
LAB_bf73:
  bf73  E180           CMPB ,X+                          
  bf75  270A           BEQ 0xbf81                        
  bf77  313F           LEAY -0x1,Y                       
  bf79  26F8           BNE 0xbf73                        
  bf7b  301F           LEAX -0x1,X                       
  bf7d  86FF           LDA #0xff                         
  bf7f  2003           BRA 0xbf84                        
LAB_bf81:
  bf81  301F           LEAX -0x1,X                       
  bf83  4F             CLRA                              
LAB_bf84:
  bf84  3566           PULS  A B Y U                     
  bf86  39             RTS                               

; ---- function API_FD10
API_FD10:
  bf87  3473           PSHS  U Y X A CC                  
  bf89  3404           PSHS  B                           
  bf8b  3404           PSHS  B                           
  bf8d  1F31           TFR U,X                           
  bf8f  1F30           TFR U,D                           
  bf91  31AB           LEAY D,Y                          
  bf93  A6A4           LDA ,Y                            
  bf95  A761           STA 0x1,S                         
LAB_bf97:
  bf97  A6A2           LDA ,-Y                           
  bf99  A721           STA 0x1,Y                         
  bf9b  301F           LEAX -0x1,X                       
  bf9d  26F8           BNE 0xbf97                        
  bf9f  3502           PULS  A                           
  bfa1  A7A4           STA ,Y                            
  bfa3  3504           PULS  B                           
  bfa5  3573           PULS CC A X Y U                   
  bfa7  39             RTS                               

; ---- function API_FD12
API_FD12:
  bfa8  3473           PSHS  U Y X A CC                  
  bfaa  3404           PSHS  B                           
  bfac  3404           PSHS  B                           
  bfae  1F31           TFR U,X                           
  bfb0  A6A0           LDA ,Y+                           
  bfb2  A761           STA 0x1,S                         
  bfb4  301F           LEAX -0x1,X                       
  bfb6  2708           BEQ 0xbfc0                        
LAB_bfb8:
  bfb8  A6A0           LDA ,Y+                           
  bfba  A73E           STA -0x2,Y                        
  bfbc  301F           LEAX -0x1,X                       
  bfbe  26F8           BNE 0xbfb8                        
LAB_bfc0:
  bfc0  3502           PULS  A                           
  bfc2  A73F           STA -0x1,Y                        
  bfc4  3504           PULS  B                           
  bfc6  3573           PULS CC A X Y U                   
  bfc8  39             RTS                               

; ---- function FUN_bfc9
FUN_bfc9:
  bfc9  3447           PSHS  U B A CC                    
  bfcb  1F13           TFR X,U                           
  bfcd  1F01           TFR D,X                           
LAB_bfcf:
  bfcf  A6C4           LDA ,U                            
  bfd1  E6A4           LDB ,Y                            
  bfd3  A7A0           STA ,Y+                           
  bfd5  E7C0           STB ,U+                           
  bfd7  301F           LEAX -0x1,X                       
  bfd9  26F4           BNE 0xbfcf                        
  bfdb  1F31           TFR U,X                           
  bfdd  3547           PULS CC A B U                     
  bfdf  39             RTS                               

;; Kernel API slot $FD14: D = index into inline table of code pointers (never returns here)

; ---- function JumpTableDispatch
JumpTableDispatch:
  bfe0  3406           PSHS  B A                         
  bfe2  58             LSLB                              
  bfe3  49             ROLA                              
  bfe4  E362           ADDD 0x2,S                        
  bfe6  ED62           STD 0x2,S                         
  bfe8  ECF802         LDD [0x2,S]                       
  bfeb  ED62           STD 0x2,S                         
  bfed  3506           PULS  A B                         
  bfef  39             RTS                               

;; Kernel API slot $FD16: inline (value, target)* list, compared with D

; ---- function SwitchInline
SwitchInline:
  bff0  3437           PSHS  Y X B A CC                  
  bff2  AE67           LDX 0x7,S                         
LAB_bff4:
  bff4  10A381         CMPD ,X++                         
  bff7  270D           BEQ 0xc006                        
  bff9  10AE81         LDY ,X++                          
  bffc  108CFFFF       CMPY #0xffff                      
  c000  26F2           BNE 0xbff4                        
LAB_c002:
  c002  AF67           STX 0x7,S                         
  c004  200C           BRA 0xc012                        
LAB_c006:
  c006  10AE81         LDY ,X++                          
  c009  108CFFFF       CMPY #0xffff                      
  c00d  27F3           BEQ 0xc002                        
  c00f  10AF67         STY 0x7,S                         
LAB_c012:
  c012  3537           PULS CC A B X Y                   
  c014  39             RTS                               

;; Kernel API slot $FD18: inline ([addr] = word)* until $FFFF

; ---- function StoreWordsInline
StoreWordsInline:
  c015  3437           PSHS  Y X B A CC                  
  c017  AE67           LDX 0x7,S                         
LAB_c019:
  c019  10AE81         LDY ,X++                          
  c01c  108CFFFF       CMPY #0xffff                      
  c020  2706           BEQ 0xc028                        
  c022  EC81           LDD ,X++                          
  c024  EDA4           STD ,Y                            
  c026  20F1           BRA 0xc019                        
LAB_c028:
  c028  AF67           STX 0x7,S                         
  c02a  3537           PULS CC A B X Y                   
  c02c  39             RTS                               

;; Kernel API slot $FD1A: inline ([addr] = byte)* until $FFFF

; ---- function StoreBytesInline
StoreBytesInline:
  c02d  3437           PSHS  Y X B A CC                  
  c02f  AE67           LDX 0x7,S                         
LAB_c031:
  c031  10AE81         LDY ,X++                          
  c034  108CFFFF       CMPY #0xffff                      
  c038  2706           BEQ 0xc040                        
  c03a  A680           LDA ,X+                           
  c03c  A7A4           STA ,Y                            
  c03e  20F1           BRA 0xc031                        
LAB_c040:
  c040  AF67           STX 0x7,S                         
  c042  3537           PULS CC A B X Y                   
  c044  39             RTS                               

; ---- function API_FD1C
API_FD1C:
  c045  3457           PSHS  U X B A CC                  
  c047  1F13           TFR X,U                           
LAB_c049:
  c049  ECC1           LDD ,U++                          
  c04b  1083FFFF       CMPD #0xffff                      
  c04f  2720           BEQ 0xc071                        
  c051  1F01           TFR D,X                           
  c053  E6C0           LDB ,U+                           
  c055  27F2           BEQ 0xc049                        
  c057  C101           CMPB #0x1                         
  c059  270A           BEQ 0xc065                        
  c05b  C102           CMPB #0x2                         
  c05d  270C           BEQ 0xc06b                        
  c05f  4F             CLRA                              
  c060  17FEAF         LBSR 0xbf12                       
  c063  20E4           BRA 0xc049                        
LAB_c065:
  c065  A684           LDA ,X                            
  c067  A7A0           STA ,Y+                           
  c069  20DE           BRA 0xc049                        
LAB_c06b:
  c06b  EC84           LDD ,X                            
  c06d  EDA1           STD ,Y++                          
  c06f  20D8           BRA 0xc049                        
LAB_c071:
  c071  3557           PULS CC A B X U                   
  c073  39             RTS                               

; ---- function API_FD1E
API_FD1E:
  c074  3467           PSHS  U Y B A CC                  
  c076  1F23           TFR Y,U                           
LAB_c078:
  c078  ECC1           LDD ,U++                          
  c07a  1083FFFF       CMPD #0xffff                      
  c07e  2720           BEQ 0xc0a0                        
  c080  1F02           TFR D,Y                           
  c082  E6C0           LDB ,U+                           
  c084  27F2           BEQ 0xc078                        
  c086  C101           CMPB #0x1                         
  c088  270A           BEQ 0xc094                        
  c08a  C102           CMPB #0x2                         
  c08c  270C           BEQ 0xc09a                        
  c08e  4F             CLRA                              
  c08f  17FE80         LBSR 0xbf12                       
  c092  20E4           BRA 0xc078                        
LAB_c094:
  c094  A680           LDA ,X+                           
  c096  A7A4           STA ,Y                            
  c098  20DE           BRA 0xc078                        
LAB_c09a:
  c09a  EC81           LDD ,X++                          
  c09c  EDA4           STD ,Y                            
  c09e  20D8           BRA 0xc078                        
LAB_c0a0:
  c0a0  3567           PULS CC A B Y U                   
  c0a2  39             RTS                               

; ---- function API_FD20
API_FD20:
  c0a3  12             NOP                               
  c0a4  12             NOP                               
  c0a5  12             NOP                               
  c0a6  12             NOP                               
  c0a7  12             NOP                               
  c0a8  12             NOP                               
  c0a9  C3FFFF         ADDD #0xffff                      
  c0ac  26F5           BNE 0xc0a3                        
  c0ae  39             RTS                               

; ---- function API_FD22
API_FD22:
  c0af  3406           PSHS  B A                         
  c0b1  CC6300         LDD #0x6300                       
  c0b4  FD618C         STD 0x618c                        
  c0b7  3506           PULS  A B                         
  c0b9  39             RTS                               

; ---- function API_FD24
API_FD24:
  c0ba  3440           PSHS  U                           
  c0bc  FE618C         LDU 0x618c                        
  c0bf  3604           PSHU  B                           
  c0c1  FF618C         STU 0x618c                        
  c0c4  3540           PULS  U                           
  c0c6  39             RTS                               

; ---- function API_FD26
API_FD26:
  c0c7  3440           PSHS  U                           
  c0c9  FE618C         LDU 0x618c                        
  c0cc  3704           PULU  B                           
  c0ce  FF618C         STU 0x618c                        
  c0d1  3540           PULS  U                           
  c0d3  39             RTS                               

; ---- function API_FD8E
API_FD8E:
  c0d4  3436           PSHS  Y X B A                     
  c0d6  AE66           LDX 0x6,S                         
  c0d8  10AE81         LDY ,X++                          
  c0db  AF66           STX 0x6,S                         
  c0dd  3022           LEAX 0x2,Y                        
  c0df  AFA4           STX ,Y                            
  c0e1  3536           PULS  A B X Y                     
  c0e3  39             RTS                               

; ---- function API_FD90
API_FD90:
  c0e4  3436           PSHS  Y X B A                     
  c0e6  AE66           LDX 0x6,S                         
  c0e8  10AE81         LDY ,X++                          
  c0eb  AF66           STX 0x6,S                         
  c0ed  AEA4           LDX ,Y                            
  c0ef  ED81           STD ,X++                          
  c0f1  AFA4           STX ,Y                            
  c0f3  3536           PULS  A B X Y                     
  c0f5  39             RTS                               

; ---- function API_FD92
API_FD92:
  c0f6  3430           PSHS  Y X                         
  c0f8  AE64           LDX 0x4,S                         
  c0fa  10AE81         LDY ,X++                          
  c0fd  AF64           STX 0x4,S                         
  c0ff  ACA4           CMPX ,Y                           
  c101  270A           BEQ 0xc10d                        
  c103  AEA4           LDX ,Y                            
  c105  EC83           LDD ,--X                          
  c107  AFA4           STX ,Y                            
  c109  1A04           ORCC #0x4                         
  c10b  2002           BRA 0xc10f                        
LAB_c10d:
  c10d  1CFB           ANDCC #0xfb                       
LAB_c10f:
  c10f  3530           PULS  X Y                         
  c111  39             RTS                               

; ---- function API_FD28
API_FD28:
  c112  3420           PSHS  Y                           
  c114  1F02           TFR D,Y                           
  c116  5F             CLRB                              
LAB_c117:
  c117  EB80           ADDB ,X+                          
  c119  313F           LEAY -0x1,Y                       
  c11b  26FA           BNE 0xc117                        
  c11d  4F             CLRA                              
  c11e  5D             TSTB                              
  c11f  3520           PULS  Y                           
  c121  39             RTS                               

;; Kernel API slot $FE0C: D = min(D, inline word)

; ---- function ClampMaxInline
ClampMaxInline:
  c122  3430           PSHS  Y X                         
  c124  327E           LEAS -0x2,S                       
  c126  AE66           LDX 0x6,S                         
  c128  10AE81         LDY ,X++                          
  c12b  AF66           STX 0x6,S                         
  c12d  10AFE4         STY ,S                            
  c130  10A3E4         CMPD ,S                           
  c133  2302           BLS 0xc137                        
  c135  ECE4           LDD ,S                            
LAB_c137:
  c137  3262           LEAS 0x2,S                        
  c139  3530           PULS  X Y                         
  c13b  39             RTS                               

; ---- function FUN_c13c
FUN_c13c:
  c13c  3436           PSHS  Y X B A                     
  c13e  327C           LEAS -0x4,S                       
  c140  AE6A           LDX 0xa,S                         
  c142  EC81           LDD ,X++                          
  c144  EDE4           STD ,S                            
  c146  E680           LDB ,X+                           
  c148  E762           STB 0x2,S                         
  c14a  AF6A           STX 0xa,S                         
  c14c  2019           BRA 0xc167                        
LAB_c14e:
  c14e  A762           STA 0x2,S                         
  c150  AEE4           LDX ,S                            
LAB_c152:
  c152  E684           LDB ,X                            
  c154  E101           CMPB 0x1,X                        
  c156  250A           BCS 0xc162                        
  c158  3402           PSHS  A                           
  c15a  A601           LDA 0x1,X                         
  c15c  A784           STA ,X                            
  c15e  E701           STB 0x1,X                         
  c160  3502           PULS  A                           
LAB_c162:
  c162  3001           LEAX 0x1,X                        
  c164  4A             DECA                              
  c165  26EB           BNE 0xc152                        
LAB_c167:
  c167  A662           LDA 0x2,S                         
  c169  4A             DECA                              
  c16a  26E2           BNE 0xc14e                        
  c16c  3264           LEAS 0x4,S                        
  c16e  3536           PULS  A B X Y                     
  c170  39             RTS                               

; ---- function FUN_c171
FUN_c171:
  c171  3436           PSHS  Y X B A                     
  c173  8D0F           BSR 0xc184                        
  c175  6D61           TST 0x1,S                         
  c177  2605           BNE 0xc17e                        
  c179  53             COMB                              
  c17a  E4A4           ANDB ,Y                           
  c17c  2002           BRA 0xc180                        
LAB_c17e:
  c17e  EAA4           ORB ,Y                            
LAB_c180:
  c180  E7A4           STB ,Y                            
  c182  35B6           PULS  A B X Y PC                  

; ---- function FUN_c184
FUN_c184:
  c184  AE68           LDX 0x8,S                         
  c186  10AE81         LDY ,X++                          
  c189  AF68           STX 0x8,S                         
  c18b  EC64           LDD 0x4,S                         
  c18d  44             LSRA                              
  c18e  56             RORB                              
  c18f  44             LSRA                              
  c190  56             RORB                              
  c191  44             LSRA                              
  c192  56             RORB                              
  c193  31AB           LEAY D,Y                          
  c195  A665           LDA 0x5,S                         
  c197  8407           ANDA #0x7                         
  c199  8EC19F         LDX #0xc19f                       
  c19c  E686           LDB A,X                           
  c19e  39             RTS                               
DAT_c19f:
  c19f  01             ?? 01h                            
  c1a0  .db 02 04 08 10 20 40 80                             ; .... @.

; ---- function FUN_c1a7
FUN_c1a7:
  c1a7  3436           PSHS  Y X B A                     
  c1a9  8DD9           BSR 0xc184                        
  c1ab  E4A4           ANDB ,Y                           
  c1ad  2604           BNE 0xc1b3                        
  c1af  3536           PULS  A B X Y                     
  c1b1  5F             CLRB                              
  c1b2  39             RTS                               
LAB_c1b3:
  c1b3  3536           PULS  A B X Y                     
  c1b5  C6FF           LDB #0xff                         
  c1b7  39             RTS                               

; ---- function API_FD2A
API_FD2A:
  c1b8  3427           PSHS  Y B A CC                    
  c1ba  B6600B         LDA 0x600b                        
  c1bd  3402           PSHS  A                           
  c1bf  EC64           LDD 0x4,S                         
  c1c1  44             LSRA                              
  c1c2  44             LSRA                              
  c1c3  44             LSRA                              
  c1c4  44             LSRA                              
  c1c5  8A80           ORA #0x80                         
  c1c7  B7600B         STA 0x600b                        
  c1ca  B78052         STA 0x8052                        
  c1cd  860F           LDA #0xf                          
  c1cf  A464           ANDA 0x4,S                        
  c1d1  58             LSLB                              
  c1d2  49             ROLA                              
  c1d3  1F02           TFR D,Y                           
  c1d5  EC62           LDD 0x2,S                         
  c1d7  EDA4           STD ,Y                            
  c1d9  3502           PULS  A                           
  c1db  B7600B         STA 0x600b                        
  c1de  B78052         STA 0x8052                        
  c1e1  3527           PULS CC A B Y                     
  c1e3  39             RTS                               

; ---- function API_FD2C
API_FD2C:
  c1e4  3402           PSHS  A                           
  c1e6  B68053         LDA 0x8053                        
  c1e9  8441           ANDA #0x41                        
  c1eb  8141           CMPA #0x41                        
  c1ed  3502           PULS  A                           
  c1ef  39             RTS                               

; ---- function API_FD2E
API_FD2E:
  c1f0  3410           PSHS  X                           
  c1f2  3427           PSHS  Y B A CC                    
  c1f4  B6600B         LDA 0x600b                        
  c1f7  3402           PSHS  A                           
  c1f9  C6FF           LDB #0xff                         
LAB_c1fb:
  c1fb  B68053         LDA 0x8053                        
  c1fe  8441           ANDA #0x41                        
  c200  8141           CMPA #0x41                        
  c202  2703           BEQ 0xc207                        
  c204  5A             DECB                              
  c205  26F4           BNE 0xc1fb                        
LAB_c207:
  c207  8680           LDA #0x80                         
  c209  B7600B         STA 0x600b                        
  c20c  B78052         STA 0x8052                        
  c20f  FC618E         LDD 0x618e                        
  c212  FD0000         STD 0x0000                        
  c215  EC64           LDD 0x4,S                         
  c217  44             LSRA                              
  c218  44             LSRA                              
  c219  44             LSRA                              
  c21a  44             LSRA                              
  c21b  8A80           ORA #0x80                         
  c21d  B7600B         STA 0x600b                        
  c220  B78052         STA 0x8052                        
  c223  860F           LDA #0xf                          
  c225  A464           ANDA 0x4,S                        
  c227  58             LSLB                              
  c228  49             ROLA                              
  c229  1F02           TFR D,Y                           
  c22b  EC62           LDD 0x2,S                         
  c22d  FD618E         STD 0x618e                        
  c230  EDA4           STD ,Y                            
  c232  3502           PULS  A                           
  c234  B7600B         STA 0x600b                        
  c237  B78052         STA 0x8052                        
  c23a  3527           PULS CC A B Y                     
  c23c  3510           PULS  X                           
  c23e  39             RTS                               

;; Kernel API slot $FD30: B = DSP 1-3, X = record key of TMS32010 image; writes via bank $80|B

; ---- function DspLoadProgram
DspLoadProgram:
  c23f  3476           PSHS  U Y X B A                   
  c241  3404           PSHS  B                           
  c243  17028E         LBSR 0xc4d4                       
  c246  1700EE         LBSR 0xc337                       
  c249  E6E4           LDB ,S                            
  c24b  CA80           ORB #0x80                         
  c24d  173C30         LBSR 0xfe80                       
  c250  1F10           TFR X,D                           
  c252  17C666         LBSR 0x88bb                       
  c255  102600C8       LBNE 0xc321                       
  c259  CC0008         LDD #0x8                          
  c25c  17C7B5         LBSR 0x8a14                       
  c25f  102600BE       LBNE 0xc321                       
  c263  17C669         LBSR 0x88cf                       
  c266  102600B7       LBNE 0xc321                       
  c26a  1F98           TFR B,A                           
  c26c  17C660         LBSR 0x88cf                       
  c26f  102600AE       LBNE 0xc321                       
  c273  840F           ANDA #0xf                         
  c275  58             LSLB                              
  c276  49             ROLA                              
  c277  1F02           TFR D,Y                           
LAB_c279:
  c279  FC607A         LDD 0x607a                        
  c27c  843F           ANDA #0x3f                        
  c27e  3406           PSHS  B A                         
  c280  CC3FFF         LDD #0x3fff                       
  c283  A3E1           SUBD ,S++                         
  c285  10B3607D       CMPD 0x607d                       
  c289  2431           BCC 0xc2bc                        
  c28b  C4FE           ANDB #0xfe                        
  c28d  3406           PSHS  B A                         
  c28f  BE607A         LDX 0x607a                        
  c292  8D51           BSR 0xc2e5                        
  c294  FC607D         LDD 0x607d                        
  c297  A3E4           SUBD ,S                           
  c299  FD607D         STD 0x607d                        
  c29c  ECE4           LDD ,S                            
  c29e  FC607A         LDD 0x607a                        
  c2a1  E3E1           ADDD ,S++                         
  c2a3  FD607A         STD 0x607a                        
  c2a6  8D1E           BSR 0xc2c6                        
  c2a8  266D           BNE 0xc317                        
  c2aa  8D1A           BSR 0xc2c6                        
  c2ac  2669           BNE 0xc317                        
  c2ae  8D16           BSR 0xc2c6                        
  c2b0  2665           BNE 0xc317                        
  c2b2  8D12           BSR 0xc2c6                        
  c2b4  2661           BNE 0xc317                        
  c2b6  8D0E           BSR 0xc2c6                        
  c2b8  265D           BNE 0xc317                        
  c2ba  20BD           BRA 0xc279                        
LAB_c2bc:
  c2bc  FC607D         LDD 0x607d                        
  c2bf  BE607A         LDX 0x607a                        
  c2c2  8D21           BSR 0xc2e5                        
  c2c4  2051           BRA 0xc317                        

; ---- function FUN_c2c6
FUN_c2c6:
  c2c6  17C606         LBSR 0x88cf                       
  c2c9  2617           BNE 0xc2e2                        
  c2cb  1F98           TFR B,A                           
  c2cd  2613           BNE 0xc2e2                        
  c2cf  17C5FD         LBSR 0x88cf                       
  c2d2  1F03           TFR D,U                           
  c2d4  8600           LDA #0x0                          
  c2d6  B780A2         STA 0x80a2                        
  c2d9  EFA1           STU ,Y++                          
  c2db  86FF           LDA #0xff                         
  c2dd  B780A2         STA 0x80a2                        
  c2e0  4F             CLRA                              
  c2e1  39             RTS                               
LAB_c2e2:
  c2e2  86FF           LDA #0xff                         
  c2e4  39             RTS                               

; ---- function FUN_c2e5
FUN_c2e5:
  c2e5  F3607A         ADDD 0x607a                       
  c2e8  3406           PSHS  B A                         
  c2ea  B6600B         LDA 0x600b                        
  c2ed  3402           PSHS  A                           
  c2ef  F66079         LDB 0x6079                        
LAB_c2f2:
  c2f2  F7600B         STB 0x600b                        
  c2f5  F78052         STB 0x8052                        
  c2f8  EE81           LDU ,X++                          
  c2fa  A6E4           LDA ,S                            
  c2fc  B7600B         STA 0x600b                        
  c2ff  B78052         STA 0x8052                        
  c302  8600           LDA #0x0                          
  c304  B780A2         STA 0x80a2                        
  c307  EFA1           STU ,Y++                          
  c309  86FF           LDA #0xff                         
  c30b  B780A2         STA 0x80a2                        
  c30e  AC61           CMPX 0x1,S                        
  c310  25E0           BCS 0xc2f2                        
  c312  3502           PULS  A                           
  c314  3506           PULS  A B                         
  c316  39             RTS                               

; ---- function FUN_c317
FUN_c317:
  c317  173B80         LBSR 0xfe9a                       
  c31a  3504           PULS  B                           
  c31c  3576           PULS  A B X Y U                   
  c31e  1A04           ORCC #0x4                         
  c320  39             RTS                               
LAB_c321:
  c321  173B76         LBSR 0xfe9a                       
  c324  3504           PULS  B                           
  c326  3576           PULS  A B X Y U                   
  c328  1CFB           ANDCC #0xfb                       
  c32a  39             RTS                               

; ---- function API_FD32
API_FD32:
  c32b  170192         LBSR 0xc4c0                       
  c32e  17FE87         LBSR 0xc1b8                       
  c331  170182         LBSR 0xc4b6                       
  c334  1A04           ORCC #0x4                         
  c336  39             RTS                               

; ---- function API_FD34
API_FD34:
  c337  3426           PSHS  Y B A                       
  c339  170184         LBSR 0xc4c0                       
  c33c  CC0000         LDD #0x0                          
  c33f  108E0000       LDY #0x0                          
  c343  17FE72         LBSR 0xc1b8                       
  c346  17016D         LBSR 0xc4b6                       
  c349  3526           PULS  A B Y                       
  c34b  39             RTS                               

; ---- function API_FD36
API_FD36:
  c34c  3406           PSHS  B A                         
  c34e  CC0032         LDD #0x32                         
LAB_c351:
  c351  830001         SUBD #0x1                         
  c354  2705           BEQ 0xc35b                        
  c356  17FE8B         LBSR 0xc1e4                       
  c359  26F6           BNE 0xc351                        
LAB_c35b:
  c35b  170162         LBSR 0xc4c0                       

;; Kernel API slot $FD38: inline ([addr] = word)* until $FFFF, through helper

; ---- function StoreWordsInline2
StoreWordsInline2:
  c35e  3437           PSHS  Y X B A CC                  
  c360  AE67           LDX 0x7,S                         
LAB_c362:
  c362  10AE81         LDY ,X++                          
  c365  108CFFFF       CMPY #0xffff                      
  c369  2706           BEQ 0xc371                        
  c36b  EC81           LDD ,X++                          
  c36d  8DBC           BSR 0xc32b                        
  c36f  20F1           BRA 0xc362                        
LAB_c371:
  c371  AF67           STX 0x7,S                         
  c373  3537           PULS CC A B X Y                   
  c375  39             RTS                               

; ---- function API_FD3A
API_FD3A:
  c376  3410           PSHS  X                           
  c378  8E8002         LDX #0x8002                       
  c37b  8D5D           BSR 0xc3da                        
  c37d  3510           PULS  X                           
  c37f  39             RTS                               

; ---- function API_FD3C
API_FD3C:
  c380  3420           PSHS  Y                           
  c382  108E8002       LDY #0x8002                       
  c386  8D7C           BSR 0xc404                        
  c388  3520           PULS  Y                           
  c38a  39             RTS                               

; ---- function API_FD3E
API_FD3E:
  c38b  3410           PSHS  X                           
  c38d  8E8004         LDX #0x8004                       
  c390  8D48           BSR 0xc3da                        
  c392  3510           PULS  X                           
  c394  39             RTS                               

; ---- function API_FD40
API_FD40:
  c395  3420           PSHS  Y                           
  c397  108E8004       LDY #0x8004                       
  c39b  8D67           BSR 0xc404                        
  c39d  3520           PULS  Y                           
  c39f  39             RTS                               

; ---- function API_FD42
API_FD42:
  c3a0  3410           PSHS  X                           
  c3a2  8E8006         LDX #0x8006                       
  c3a5  8D33           BSR 0xc3da                        
  c3a7  3510           PULS  X                           
  c3a9  39             RTS                               

; ---- function API_FD44
API_FD44:
  c3aa  3420           PSHS  Y                           
  c3ac  108E8006       LDY #0x8006                       
  c3b0  8D52           BSR 0xc404                        
  c3b2  3520           PULS  Y                           
  c3b4  39             RTS                               

; ---- function API_FD46
API_FD46:
  c3b5  3410           PSHS  X                           
  c3b7  8E8008         LDX #0x8008                       
  c3ba  8D1E           BSR 0xc3da                        
  c3bc  3510           PULS  X                           
  c3be  39             RTS                               

; ---- function API_FD48
API_FD48:
  c3bf  108E8008       LDY #0x8008                       
  c3c3  2041           BRA 0xc406                        

; ---- function API_FD4A
API_FD4A:
  c3c5  3410           PSHS  X                           
  c3c7  8E8000         LDX #0x8000                       
  c3ca  8D0E           BSR 0xc3da                        
  c3cc  3510           PULS  X                           
  c3ce  39             RTS                               

; ---- function API_FD4C
API_FD4C:
  c3cf  3420           PSHS  Y                           
  c3d1  108E800E       LDY #0x800e                       
  c3d5  8D2D           BSR 0xc404                        
  c3d7  3520           PULS  Y                           
  c3d9  39             RTS                               

; ---- function API_FD4E
API_FD4E:
  c3da  3410           PSHS  X                           
  c3dc  8E0032         LDX #0x32                         
LAB_c3df:
  c3df  B68053         LDA 0x8053                        
  c3e2  8420           ANDA #0x20                        
  c3e4  2706           BEQ 0xc3ec                        
  c3e6  301F           LEAX -0x1,X                       
  c3e8  26F5           BNE 0xc3df                        
  c3ea  2012           BRA 0xc3fe                        
LAB_c3ec:
  c3ec  AEE4           LDX ,S                            
  c3ee  EC84           LDD ,X                            
  c3f0  8E0032         LDX #0x32                         
LAB_c3f3:
  c3f3  B68053         LDA 0x8053                        
  c3f6  8420           ANDA #0x20                        
  c3f8  2704           BEQ 0xc3fe                        
  c3fa  301F           LEAX -0x1,X                       
  c3fc  26F5           BNE 0xc3f3                        
LAB_c3fe:
  c3fe  FC8050         LDD 0x8050                        
  c401  3510           PULS  X                           
  c403  39             RTS                               

; ---- function API_FDE0
API_FDE0:
  c404  3420           PSHS  Y                           
LAB_c406:
  c406  3410           PSHS  X                           
  c408  3406           PSHS  B A                         
  c40a  8E0032         LDX #0x32                         
LAB_c40d:
  c40d  B68053         LDA 0x8053                        
  c410  8420           ANDA #0x20                        
  c412  2704           BEQ 0xc418                        
  c414  301F           LEAX -0x1,X                       
  c416  26F5           BNE 0xc40d                        
LAB_c418:
  c418  3506           PULS  A B                         
  c41a  EDA4           STD ,Y                            
  c41c  3510           PULS  X                           
  c41e  3520           PULS  Y                           
  c420  39             RTS                               

; ---- function API_FD50
API_FD50:
  c421  3426           PSHS  Y B A                       
  c423  8600           LDA #0x0                          
  c425  108E8000       LDY #0x8000                       
  c429  8DD9           BSR 0xc404                        
  c42b  3526           PULS  A B Y                       
  c42d  39             RTS                               

; ---- function API_FD52
API_FD52:
  c42e  3426           PSHS  Y B A                       
  c430  840F           ANDA #0xf                         
  c432  8A20           ORA #0x20                         
  c434  2006           BRA 0xc43c                        

; ---- function API_FD54
API_FD54:
  c436  3426           PSHS  Y B A                       
  c438  840F           ANDA #0xf                         
  c43a  8A30           ORA #0x30                         

; ---- function FUN_c43c
FUN_c43c:
  c43c  108E8000       LDY #0x8000                       
  c440  8DC2           BSR 0xc404                        
  c442  3526           PULS  A B Y                       
  c444  39             RTS                               

; ---- function API_FD56
API_FD56:
  c445  3426           PSHS  Y B A                       
  c447  CC9801         LDD #0x9801                       
  c44a  20F0           BRA 0xc43c                        

; ---- function API_FD58
API_FD58:
  c44c  3426           PSHS  Y B A                       
  c44e  CC9800         LDD #0x9800                       
  c451  20E9           BRA 0xc43c                        

; ---- function API_FD5A
API_FD5A:
  c453  3426           PSHS  Y B A                       
  c455  CC8401         LDD #0x8401                       
  c458  20E2           BRA 0xc43c                        

; ---- function API_FD5C
API_FD5C:
  c45a  3426           PSHS  Y B A                       
  c45c  CC8400         LDD #0x8400                       
  c45f  20DB           BRA 0xc43c                        

; ---- function API_FD5E
API_FD5E:
  c461  3426           PSHS  Y B A                       
  c463  CC8801         LDD #0x8801                       
  c466  20D4           BRA 0xc43c                        

; ---- function API_FD60
API_FD60:
  c468  3426           PSHS  Y B A                       
  c46a  CC8800         LDD #0x8800                       
  c46d  20CD           BRA 0xc43c                        

; ---- function API_FD62
API_FD62:
  c46f  3426           PSHS  Y B A                       
  c471  CC8C01         LDD #0x8c01                       
  c474  20C6           BRA 0xc43c                        

; ---- function API_FD64
API_FD64:
  c476  3426           PSHS  Y B A                       
  c478  CC8C00         LDD #0x8c00                       
  c47b  20BF           BRA 0xc43c                        

; ---- function API_FD66
API_FD66:
  c47d  3426           PSHS  Y B A                       
  c47f  CC9001         LDD #0x9001                       
  c482  20B8           BRA 0xc43c                        

; ---- function API_FD68
API_FD68:
  c484  3426           PSHS  Y B A                       
  c486  CC9000         LDD #0x9000                       
  c489  20B1           BRA 0xc43c                        

; ---- function API_FD6A
API_FD6A:
  c48b  3426           PSHS  Y B A                       
  c48d  CC9401         LDD #0x9401                       
  c490  20AA           BRA 0xc43c                        

; ---- function API_FD6C
API_FD6C:
  c492  3426           PSHS  Y B A                       
  c494  CC9400         LDD #0x9400                       
  c497  20A3           BRA 0xc43c                        

; ---- function API_FD6E
API_FD6E:
  c499  3426           PSHS  Y B A                       
  c49b  CC9C01         LDD #0x9c01                       
  c49e  209C           BRA 0xc43c                        

; ---- function API_FD70
API_FD70:
  c4a0  3426           PSHS  Y B A                       
  c4a2  CC9C00         LDD #0x9c00                       
  c4a5  2095           BRA 0xc43c                        

; ---- function API_FD72
API_FD72:
  c4a7  3426           PSHS  Y B A                       
  c4a9  CC8000         LDD #0x8000                       
  c4ac  208E           BRA 0xc43c                        

; ---- function API_FD74
API_FD74:
  c4ae  F68053         LDB 0x8053                        
  c4b1  39             RTS                               

; ---- function API_FD76
API_FD76:
  c4b2  B78055         STA 0x8055                        
  c4b5  39             RTS                               

; ---- function API_FD78
API_FD78:
  c4b6  3407           PSHS  B A CC                      
  c4b8  86FF           LDA #0xff                         
  c4ba  B780A2         STA 0x80a2                        
  c4bd  3507           PULS CC A B                       
  c4bf  39             RTS                               

; ---- function API_FD7A
API_FD7A:
  c4c0  3407           PSHS  B A CC                      
  c4c2  8600           LDA #0x0                          
  c4c4  B780A2         STA 0x80a2                        
  c4c7  3507           PULS CC A B                       
  c4c9  39             RTS                               

; ---- function API_FD7C
API_FD7C:
  c4ca  3407           PSHS  B A CC                      
  c4cc  8600           LDA #0x0                          
  c4ce  B780A3         STA 0x80a3                        
  c4d1  3507           PULS CC A B                       
  c4d3  39             RTS                               

; ---- function API_FD7E
API_FD7E:
  c4d4  3407           PSHS  B A CC                      
  c4d6  86FF           LDA #0xff                         
  c4d8  B780A3         STA 0x80a3                        
  c4db  3507           PULS CC A B                       
  c4dd  39             RTS                               
  c4de  .db 00 00 00 00 43 4F 50 59 52 49 47 48 54 20 31 39  ; ....COPYRIGHT 19
  c4ee  .db 38 37 20 45 56 45 4E 54 49 44 45 20 49 4E 43 20  ; 87 EVENTIDE INC 

; ---- function FUN_c4fe
FUN_c4fe:
  c4fe  3406           PSHS  B A                         
  c500  F6600B         LDB 0x600b                        
  c503  F76191         STB 0x6191                        
  c506  CCF0F0         LDD #0xf0f0                       
  c509  F76190         STB 0x6190                        
  c50c  17C53E         LBSR 0x8a4d                       
  c50f  2615           BNE 0xc526                        
  c511  7F6190         CLR 0x6190                        
  c514  17D8DD         LBSR 0x9df4                       
  c517  F66079         LDB 0x6079                        
  c51a  F76192         STB 0x6192                        
  c51d  F7600B         STB 0x600b                        
  c520  F76102         STB 0x6102                        
  c523  F78052         STB 0x8052                        
LAB_c526:
  c526  CCC576         LDD #0xc576                       
  c529  17D644         LBSR 0x9b70                       
  c52c  17FAE6         LBSR 0xc015                        ; inline[API_FD18]: [$602A]=$C544 [$6030]=$C54A [$602E]=$C553 [$603A]=$C55C
  c52f  602A           addr 602a                         
  c531  C544           dw C544h                          
  c533  6030           addr 6030                         
  c535  C54A           dw C54Ah                          
  c537  602E           addr 602e                         
  c539  C553           dw C553h                          
  c53b  603A           addr 603a                         
  c53d  C55C           dw C55Ch                          
  c53f  FFFF           dw FFFFh                          
LAB_c541:
  c541  3506           PULS  A B                         
  c543  39             RTS                               

; ---- function FUN_c544
FUN_c544:
  c544  17001E         LBSR 0xc565                       
  c547  16DD19         LBRA 0xa263                       

; ---- function FUN_c54a
FUN_c54a:
  c54a  170018         LBSR 0xc565                       
  c54d  17D865         LBSR 0x9db5                       
  c550  16192D         LBRA 0xde80                       

; ---- function FUN_c553
FUN_c553:
  c553  17000F         LBSR 0xc565                       
  c556  17D85C         LBSR 0x9db5                       
  c559  16E282         LBRA 0xa7de                       

; ---- function FUN_c55c
FUN_c55c:
  c55c  170006         LBSR 0xc565                       
  c55f  17D853         LBSR 0x9db5                       
  c562  16E0B4         LBRA 0xa619                       

; ---- function FUN_c565
FUN_c565:
  c565  3406           PSHS  B A                         
  c567  F66191         LDB 0x6191                        
  c56a  F76102         STB 0x6102                        
  c56d  F7600B         STB 0x600b                        
  c570  F78052         STB 0x8052                        
  c573  3506           PULS  A B                         
  c575  39             RTS                               
  c576  8877C5A5C64B.. addr[11]                          
  c58c  .db FF FF                                            ; ..

; ---- function FUN_c58e
FUN_c58e:
  c58e  3404           PSHS  B                           
  c590  F660B9         LDB 0x60b9                        
  c593  17E137         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$9C05 "(  More  )"
  c596  9C05           addr 9c05                         
  c598  2820204D6F72.. ds "(  More  )"                   
LAB_c5a2:
  c5a2  3504           PULS  B                           
  c5a4  39             RTS                               

; ---- function FUN_c5a5
FUN_c5a5:
  c5a5  17D145         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Factory Functions; Service People only !"
  c5a8  01466163746F.. char[42] 01h,"Factory Functions; Service People only !"
LAB_c5d2:
  c5d2  39             RTS                               

; ---- function FUN_c5d3
FUN_c5d3:
  c5d3  3404           PSHS  B                           
  c5d5  F660B9         LDB 0x60b9                        
  c5d8  17E0F2         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$9B8F "(Factory )"
  c5db  9B8F           addr 9b8f                         
  c5dd  28466163746F.. ds "(Factory )"                   
LAB_c5e7:
  c5e7  3504           PULS  B                           
  c5e9  39             RTS                               

; ---- function FUN_c5ea
FUN_c5ea:
  c5ea  3404           PSHS  B                           
  c5ec  F660B9         LDB 0x60b9                        
  c5ef  17E0DB         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$C601 "(  Info  )"
  c5f2  C601           addr c601                         
  c5f4  282020496E66.. ds "(  Info  )"                   
LAB_c5fe:
  c5fe  3504           PULS  B                           
  c600  39             RTS                               

; ---- function FUN_c601
FUN_c601:
  c601  3406           PSHS  B A                         
  c603  F66190         LDB 0x6190                        
  c606  172965         LBSR 0xef6e                        ; inline[API_FE5E]: $C641 $C633
  c609  C641           dw C641h                          
  c60b  C633           dw C633h                          
LAB_c60d:
  c60d  17D0DD         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}Operating System Rev 1.53 ,{6}"
  c610  020005284F70.. char[33] 02h                      
LAB_c631:
  c631  3586           PULS  A B PC                      
  c633  546573747320.. ds "Tests Present"                
  c641  4E6F20546573.. ds "No Tests "                    

; ---- function FUN_c64b
FUN_c64b:
  c64b  3404           PSHS  B                           
  c64d  F660B9         LDB 0x60b9                        
  c650  17E07A         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$C702 "( Virgin )"
  c653  C702           addr c702                         
  c655  282056697267.. ds "( Virgin )"                   
LAB_c65f:
  c65f  3504           PULS  B                           
  c661  39             RTS                               

; ---- function FUN_c662
FUN_c662:
  c662  3404           PSHS  B                           
  c664  7D6190         TST 0x6190                        
  c667  2612           BNE 0xc67b                        
  c669  F660B9         LDB 0x60b9                        
  c66c  17E05E         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$0010 "(Exercise)"
  c66f  0010           addr 0010                         
  c671  284578657263.. ds "(Exercise)"                   
LAB_c67b:
  c67b  3504           PULS  B                           
  c67d  39             RTS                               

; ---- function FUN_c67e
FUN_c67e:
  c67e  3404           PSHS  B                           
  c680  7D6190         TST 0x6190                        
  c683  2612           BNE 0xc697                        
  c685  F660B9         LDB 0x60b9                        
  c688  17E042         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$0985 "(Selftest)"
  c68b  0985           addr 0985                         
  c68d  2853656C6674.. ds "(Selftest)"                   
LAB_c697:
  c697  3504           PULS  B                           
  c699  39             RTS                               

; ---- function FUN_c69a
FUN_c69a:
  c69a  3404           PSHS  B                           
  c69c  7D6190         TST 0x6190                        
  c69f  2612           BNE 0xc6b3                        
  c6a1  F660B9         LDB 0x60b9                        
  c6a4  17E026         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$0B81 "(Test all)"
  c6a7  0B81           addr 0b81                         
  c6a9  285465737420.. ds "(Test all)"                   
LAB_c6b3:
  c6b3  3504           PULS  B                           
  c6b5  39             RTS                               

; ---- function API_FDFA
API_FDFA:
  c6b6  3416           PSHS  X B A                       
  c6b8  17FE19         LBSR 0xc4d4                       
  c6bb  5F             CLRB                              
  c6bc  8EFE1E         LDX #0xfe1e                       
LAB_c6bf:
  c6bf  17FB7D         LBSR 0xc23f                       
  c6c2  2605           BNE 0xc6c9                        
  c6c4  5C             INCB                              
  c6c5  C108           CMPB #0x8                         
  c6c7  26F6           BNE 0xc6bf                        
LAB_c6c9:
  c6c9  3516           PULS  A B X                       
  c6cb  39             RTS                               
LAB_c6cc:
  c6cc  4C             INCA                              
  c6cd  F65000         LDB 0x5000                        
  c6d0  EE80           LDU ,X+                           
  c6d2  B75000         STA 0x5000                        
  c6d5  20F5           BRA 0xc6cc                        

; ---- function FUN_c6d7
FUN_c6d7:
  c6d7  17D013         LBSR 0x96ed                        ; inline[API_FC38]: "{1}"
  c6da  0100           char[2] 01h                       
LAB_c6dc:
  c6dc  5C             INCB                              
  c6dd  F78052         STB 0x8052                        
  c6e0  F78054         STB 0x8054                        
  c6e3  F78057         STB 0x8057                        
  c6e6  B68056         LDA 0x8056                        
  c6e9  17CF39         LBSR 0x9625                       
  c6ec  20EE           BRA 0xc6dc                        

; ---- function FUN_c6ee
FUN_c6ee:
  c6ee  3436           PSHS  Y X B A                     
  c6f0  8E010B         LDX #0x10b                        
  c6f3  1F12           TFR X,Y                           
  c6f5  C65A           LDB #0x5a                         
  c6f7  17DAD5         LBSR 0xa1cf                       
  c6fa  17DA99         LBSR 0xa196                       
  c6fd  C15A           CMPB #0x5a                        
  c6ff  3536           PULS  A B X Y                     
  c701  39             RTS                               

; ---- function FUN_c702
FUN_c702:
  c702  3436           PSHS  Y X B A                     
  c704  17DF22         LBSR 0xa629                       
  c707  17CFE3         LBSR 0x96ed                        ; inline[API_FC38]: "{1}clear all memory, remove all presets ?"
  c70a  01636C656172.. char[40] 01h,"clear all memory, remove all presets ?"
LAB_c732:
  c732  17DF5B         LBSR 0xa690                        ; inline[API_FE3C]: $C73C $C7A4
  c735  C73C           dw C73Ch                          
  c737  C7A4           dw C7A4h                          
LAB_c739:
  c739  3536           PULS  A B X Y                     
  c73b  39             RTS                               

; ---- function FUN_c73c
FUN_c73c:
  c73c  17DEEA         LBSR 0xa629                       
  c73f  C6A0           LDB #0xa0                         
  c741  17373C         LBSR 0xfe80                       
  c744  108E0000       LDY #0x0                          
  c748  17F811         LBSR 0xbf5c                        ; inline[API_FD0C]: $3FFF FF
  c74b  3FFF           dw 3FFFh                          
  c74d  FF             db FFh                            
LAB_c74e:
  c74e  8E887D         LDX #0x887d                       
  c751  86A0           LDA #0xa0                         
  c753  B7600C         STA 0x600c                        
  c756  108E0300       LDY #0x300                        
  c75a  CC0010         LDD #0x10                         
  c75d  1737B6         LBSR 0xff16                       
  c760  17F8CA         LBSR 0xc02d                        ; inline[API_FD1A]: [$0110]=$00 [$0103]=$00 [$010C]=$80 [$010D]=$00 [$010E]=$00 [$0111]=$00 [$0116]=$FF [$0104]=$00 [$0105]=$00 [$0106]=$00 [$0107]=$00 [$0112]=$00 [$0113]=$00 [$0114]=$00 [$0115]=$00 [$0117]=$03
  c763  0110           addr 0110                         
  c765  00             db 0h                             
  c766  0103           addr 0103                         
  c768  00             db 0h                             
  c769  010C           addr 010c                         
  c76b  80             db 80h                            
  c76c  010D           addr 010d                         
  c76e  00             db 0h                             
  c76f  010E           addr 010e                         
  c771  00             db 0h                             
  c772  0111           addr 0111                         
  c774  00             db 0h                             
  c775  0116           addr 0116                         
  c777  FF             db FFh                            
  c778  0104           addr 0104                         
  c77a  00             db 0h                             
  c77b  0105           addr 0105                         
  c77d  00             db 0h                             
  c77e  0106           addr 0106                         
  c780  00             db 0h                             
  c781  0107           addr 0107                         
  c783  00             db 0h                             
  c784  0112           addr 0112                         
  c786  00             db 0h                             
  c787  0113           addr 0113                         
  c789  00             db 0h                             
  c78a  0114           addr 0114                         
  c78c  00             db 0h                             
  c78d  0115           addr 0115                         
  c78f  00             db 0h                             
  c790  0117           addr 0117                         
  c792  03             db 3h                             
  c793  FFFF           dw FFFFh                          
LAB_c795:
  c795  CC6400         LDD #0x6400                       
  c798  17D5D4         LBSR 0x9d6f                       
  c79b  7F0103         CLR 0x0103                        
  c79e  1736F9         LBSR 0xfe9a                       
  c7a1  16BC5C         LBRA 0x8400                       

; ---- function FUN_c7a4
FUN_c7a4:
  c7a4  3406           PSHS  B A                         
  c7a6  17DE80         LBSR 0xa629                       
  c7a9  17CF41         LBSR 0x96ed                        ; inline[API_FC38]: "{1}memory still the same {2:28}Press something to escape "
  c7ac  016D656D6F72.. char[52] 01h,"memory still the same ",02h,"(Press something to escape "
LAB_c7e0:
  c7e0  3506           PULS  A B                         
  c7e2  39             RTS                               

; ---- function FUN_c7e3
FUN_c7e3:
  c7e3  3404           PSHS  B                           
  c7e5  F660B9         LDB 0x60b9                        
  c7e8  17DEE2         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$C7FD "          "
  c7eb  C7FD           addr c7fd                         
  c7ed  202020202020.. ds "          "                   
LAB_c7f7:
  c7f7  3504           PULS  B                           
  c7f9  7F6193         CLR 0x6193                        
  c7fc  39             RTS                               

; ---- function FUN_c7fd
FUN_c7fd:
  c7fd  3406           PSHS  B A                         
  c7ff  C604           LDB #0x4                          
  c801  F16193         CMPB 0x6193                       
  c804  2705           BEQ 0xc80b                        
  c806  7C6193         INC 0x6193                        
  c809  205B           BRA 0xc866                        
LAB_c80b:
  c80b  17CEDF         LBSR 0x96ed                        ; inline[API_FC38]: "{1}This Engineering Effort is Dedicated to Tony Agnello, A Constant Inspiration    "
  c80e  015468697320.. char[82] 01h,"This Engineering Effort is Dedicated to Tony Agnello, A Constant Inspiration    "
LAB_c860:
  c860  17C7DE         LBSR 0x9041                       
  c863  17D329         LBSR 0x9b8f                       
LAB_c866:
  c866  3586           PULS  A B PC                      

; ---- function FUN_c868
FUN_c868:
  c868  3437           PSHS  Y X B A CC                  
LAB_c86a:
  c86a  17CD57         LBSR 0x95c4                       
LAB_c86d:
  c86d  262B           BNE 0xc89a                        
  c86f  17234F         LBSR 0xebc1                       
  c872  8E6B00         LDX #0x6b00                       
  c875  5D             TSTB                              
  c876  2A0B           BPL 0xc883                        
  c878  C1F0           CMPB #0xf0                        
  c87a  2724           BEQ 0xc8a0                        
  c87c  7F6194         CLR 0x6194                        
  c87f  8601           LDA #0x1                          
  c881  2007           BRA 0xc88a                        
LAB_c883:
  c883  7D6194         TST 0x6194                        
  c886  2628           BNE 0xc8b0                        
  c888  8603           LDA #0x3                          
LAB_c88a:
  c88a  108E0010       LDY #0x10                         
LAB_c88e:
  c88e  AD96           JSR [A,X]                         
  c890  30890028       LEAX 0x28,X                       
  c894  313F           LEAY -0x1,Y                       
  c896  26F6           BNE 0xc88e                        
  c898  20D0           BRA 0xc86a                        
LAB_c89a:
  c89a  170025         LBSR 0xc8c2                       
  c89d  3537           PULS CC A B X Y                   
  c89f  39             RTS                               
LAB_c8a0:
  c8a0  7D6161         TST 0x6161                        
  c8a3  2704           BEQ 0xc8a9                        
  c8a5  8601           LDA #0x1                          
  c8a7  2002           BRA 0xc8ab                        
LAB_c8a9:
  c8a9  86FF           LDA #0xff                         
LAB_c8ab:
  c8ab  B76194         STA 0x6194                        
  c8ae  20BA           BRA 0xc86a                        
LAB_c8b0:
  c8b0  2BB8           BMI 0xc86a                        
  c8b2  172103         LBSR 0xe9b8                        ; inline[addr:E9B8]: $68A0
  c8b5  68A0           addr 68a0                         
LAB_c8b7:
  c8b7  F66102         LDB 0x6102                        
  c8ba  F7600B         STB 0x600b                        
  c8bd  F78052         STB 0x8052                        
  c8c0  20AB           BRA 0xc86d                        

; ---- function FUN_c8c2
FUN_c8c2:
  c8c2  3406           PSHS  B A                         
  c8c4  7D60FC         TST 0x60fc                        
  c8c7  2706           BEQ 0xc8cf                        
  c8c9  17105C         LBSR 0xd928                       
  c8cc  170003         LBSR 0xc8d2                       
LAB_c8cf:
  c8cf  3506           PULS  A B                         
  c8d1  39             RTS                               

; ---- function FUN_c8d2
FUN_c8d2:
  c8d2  3436           PSHS  Y X B A                     
  c8d4  108E0010       LDY #0x10                         
  c8d8  8E6B00         LDX #0x6b00                       
LAB_c8db:
  c8db  EC890016       LDD 0x16,X                        
  c8df  10A3890014     CMPD 0x14,X                       
  c8e4  2708           BEQ 0xc8ee                        
  c8e6  ED890014       STD 0x14,X                        
  c8ea  AD990011       JSR [0x11,X]                      
LAB_c8ee:
  c8ee  30890028       LEAX 0x28,X                       
  c8f2  313F           LEAY -0x1,Y                       
  c8f4  26E5           BNE 0xc8db                        
  c8f6  3536           PULS  A B X Y                     
  c8f8  39             RTS                               

; ---- function FUN_c8f9
FUN_c8f9:
  c8f9  3436           PSHS  Y X B A                     
  c8fb  108E6B00       LDY #0x6b00                       
  c8ff  8E0010         LDX #0x10                         
  c902  CC0000         LDD #0x0                          
LAB_c905:
  c905  EDA90016       STD 0x16,Y                        
  c909  A7A9001E       STA 0x1e,Y                        
  c90d  31A90028       LEAY 0x28,Y                       
  c911  301F           LEAX -0x1,X                       
  c913  26F0           BNE 0xc905                        
  c915  17FFBA         LBSR 0xc8d2                       
  c918  3536           PULS  A B X Y                     
  c91a  39             RTS                               

; ---- function FUN_c91b
FUN_c91b:
  c91b  3437           PSHS  Y X B A CC                  
  c91d  108E6B00       LDY #0x6b00                       
  c921  17F638         LBSR 0xbf5c                        ; inline[API_FD0C]: $0200 00
  c924  0200           dw 200h                           
  c926  00             db 0h                             
LAB_c927:
  c927  108E8877       LDY #0x8877                       
  c92b  C600           LDB #0x0                          
  c92d  8610           LDA #0x10                         
  c92f  8E6B00         LDX #0x6b00                       
LAB_c932:
  c932  E7890000       STB 0x0,X                         
  c936  10AF890001     STY 0x1,X                         
  c93b  10AF890003     STY 0x3,X                         
  c940  10AF890005     STY 0x5,X                         
  c945  10AF890007     STY 0x7,X                         
  c94a  30890028       LEAX 0x28,X                       
  c94e  4A             DECA                              
  c94f  26E1           BNE 0xc932                        
  c951  8DA6           BSR 0xc8f9                        
  c953  3537           PULS CC A B X Y                   
  c955  39             RTS                               

;; Kernel API slot $FD84: inline 15-byte record: index, flags, 8-char name, ?, 2 pointers

; ---- function DefineParameter
DefineParameter:
  c956  3437           PSHS  Y X B A CC                  
  c958  327C           LEAS -0x4,S                       
  c95a  AE6B           LDX 0xb,S                         
  c95c  E680           LDB ,X+                           
  c95e  8628           LDA #0x28                         
  c960  3D             MUL                               
  c961  C36B00         ADDD #0x6b00                      
  c964  1F02           TFR D,Y                           
  c966  E680           LDB ,X+                           
  c968  E761           STB 0x1,S                         
  c96a  3420           PSHS  Y                           
  c96c  31A90009       LEAY 0x9,Y                        
  c970  CC0008         LDD #0x8                          
  c973  17F59C         LBSR 0xbf12                       
  c976  E680           LDB ,X+                           
  c978  3520           PULS  Y                           
  c97a  E7A90013       STB 0x13,Y                        
  c97e  CC0000         LDD #0x0                          
  c981  6D61           TST 0x1,S                         
  c983  2A03           BPL 0xc988                        
  c985  FC600D         LDD 0x600d                        
LAB_c988:
  c988  ED62           STD 0x2,S                         
  c98a  EC81           LDD ,X++                          
  c98c  E362           ADDD 0x2,S                        
  c98e  EDA90011       STD 0x11,Y                        
  c992  EC81           LDD ,X++                          
  c994  E362           ADDD 0x2,S                        
  c996  EDA90007       STD 0x7,Y                         
  c99a  CCC9B3         LDD #0xc9b3                       
  c99d  EDA90005       STD 0x5,Y                         
  c9a1  AF6B           STX 0xb,S                         
  c9a3  1F21           TFR Y,X                           
  c9a5  8601           LDA #0x1                          
  c9a7  A7890000       STA 0x0,X                         
  c9ab  171220         LBSR 0xdbce                       
  c9ae  3264           LEAS 0x4,S                        
  c9b0  3537           PULS CC A B X Y                   
  c9b2  39             RTS                               

; ---- function FUN_c9b3
FUN_c9b3:
  c9b3  3436           PSHS  Y X B A                     
  c9b5  BE6196         LDX 0x6196                        
  c9b8  1703FA         LBSR 0xcdb5                       
  c9bb  C601           LDB #0x1                          
  c9bd  17DD0D         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$C9CF "( Source )"
  c9c0  C9CF           addr c9cf                         
  c9c2  2820536F7572.. ds "( Source )"                   
LAB_c9cc:
  c9cc  3536           PULS  A B X Y                     
  c9ce  39             RTS                               

; ---- function FUN_c9cf
FUN_c9cf:
  c9cf  3436           PSHS  Y X B A                     
  c9d1  BE6196         LDX 0x6196                        
  c9d4  17DC9B         LBSR 0xa672                       
  c9d7  1712E4         LBSR 0xdcbe                       
  c9da  5F             CLRB                              
  c9db  17CCFD         LBSR 0x96db                       
  c9de  1712CB         LBSR 0xdcac                       
  c9e1  1703D1         LBSR 0xcdb5                       
  c9e4  C600           LDB #0x0                          
  c9e6  17DCE4         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$CA11 "( Algorm )"
  c9e9  CA11           addr ca11                         
  c9eb  2820416C676F.. ds "( Algorm )"                   
LAB_c9f5:
  c9f5  C603           LDB #0x3                          
  c9f7  17DCD3         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$DC0E "(  Done  )"
  c9fa  DC0E           addr dc0e                         
  c9fc  282020446F6E.. ds "(  Done  )"                   
LAB_ca06:
  ca06  C600           LDB #0x0                          
  ca08  F760B9         STB 0x60b9                        
  ca0b  170003         LBSR 0xca11                       
  ca0e  3536           PULS  A B X Y                     
  ca10  39             RTS                               

; ---- function FUN_ca11
FUN_ca11:
  ca11  3416           PSHS  X B A                       
  ca13  171C1D         LBSR 0xe633                       
  ca16  F660B9         LDB 0x60b9                        
  ca19  171BD4         LBSR 0xe5f0                       
  ca1c  BE6196         LDX 0x6196                        
  ca1f  8600           LDA #0x0                          
  ca21  171183         LBSR 0xdba7                       
  ca24  4F             CLRA                              
  ca25  FD6074         STD 0x6074                        
  ca28  17C3D1         LBSR 0x8dfc                        ; inline[API_FC16]: 01 20 02 96 01 00 03 00 $002B $0000 $0000 ->$8877 ->$CA49 $0001 $0001 $0000
  ca2b  01             db 1h                             
  ca2c  20             db 20h                            
  ca2d  02             db 2h                             
  ca2e  96             db 96h                            
  ca2f  01             db 1h                             
  ca30  00             db 0h                             
  ca31  03             db 3h                             
  ca32  00             db 0h                             
  ca33  002B           dw 2Bh                            
  ca35  0000           dw 0h                             
  ca37  0000           dw 0h                             
  ca39  8877           addr 8877                         
  ca3b  CA49           addr ca49                         
  ca3d  0001           dw 1h                             
  ca3f  0001           dw 1h                             
  ca41  0000           dw 0h                             
LAB_ca43:
  ca43  170003         LBSR 0xca49                       
  ca46  3516           PULS  A B X                       
  ca48  39             RTS                               

; ---- function FUN_ca49
FUN_ca49:
  ca49  3436           PSHS  Y X B A                     
  ca4b  BE6196         LDX 0x6196                        
  ca4e  FC6074         LDD 0x6074                        
  ca51  8600           LDA #0x0                          
  ca53  171162         LBSR 0xdbb8                       
  ca56  C601           LDB #0x1                          
  ca58  17DC72         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$8877 "          "
  ca5b  8877           addr 8877                         
  ca5d  202020202020.. ds "          "                   
LAB_ca67:
  ca67  C602           LDB #0x2                          
  ca69  17DC61         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$8877 "          "
  ca6c  8877           addr 8877                         
  ca6e  202020202020.. ds "          "                   
LAB_ca78:
  ca78  17033A         LBSR 0xcdb5                       
  ca7b  17110A         LBSR 0xdb88                       
  ca7e  ADB90020       JSR [0x20,Y]                      
  ca82  170981         LBSR 0xd406                       
  ca85  3536           PULS  A B X Y                     
  ca87  39             RTS                               

; ---- function FUN_ca88
FUN_ca88:
  ca88  3406           PSHS  B A                         
  ca8a  C602           LDB #0x2                          
  ca8c  17DC3E         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$CA9E "( Channel)"
  ca8f  CA9E           addr ca9e                         
  ca91  28204368616E.. ds "( Channel)"                   
LAB_ca9b:
  ca9b  3506           PULS  A B                         
  ca9d  39             RTS                               

; ---- function FUN_ca9e
FUN_ca9e:
  ca9e  3416           PSHS  X B A                       
  caa0  171B90         LBSR 0xe633                       
  caa3  F660B9         LDB 0x60b9                        
  caa6  171B47         LBSR 0xe5f0                       
  caa9  BE6196         LDX 0x6196                        
  caac  8601           LDA #0x1                          
  caae  1710F6         LBSR 0xdba7                       
  cab1  4F             CLRA                              
  cab2  FD6074         STD 0x6074                        
  cab5  17C344         LBSR 0x8dfc                        ; inline[API_FC16]: 01 10 02 64 01 00 03 00 $000F $0000 $0000 ->$CAD3 ->$CADD $0001 $0001 $0000
  cab8  01             db 1h                             
  cab9  10             db 10h                            
  caba  02             db 2h                             
  cabb  64             db 64h                            
  cabc  01             db 1h                             
  cabd  00             db 0h                             
  cabe  03             db 3h                             
  cabf  00             db 0h                             
  cac0  000F           dw Fh                             
  cac2  0000           dw 0h                             
  cac4  0000           dw 0h                             
  cac6  CAD3           addr cad3                         
  cac8  CADD           addr cadd                         
  caca  0001           dw 1h                             
  cacc  0001           dw 1h                             
  cace  0000           dw 0h                             
LAB_cad0:
  cad0  3516           PULS  A B X                       
  cad2  39             RTS                               

; ---- function FUN_cad3
FUN_cad3:
  cad3  17CC17         LBSR 0x96ed                        ; inline[API_FC38]: "{2:26}{3:60A1}"
  cad6  02260360A100   char[6] 02h,"&",03h,"`",A1h       
LAB_cadc:
  cadc  39             RTS                               

; ---- function FUN_cadd
FUN_cadd:
  cadd  3416           PSHS  X B A                       
  cadf  FC6074         LDD 0x6074                        
  cae2  BE6196         LDX 0x6196                        
  cae5  8601           LDA #0x1                          
  cae7  1710CE         LBSR 0xdbb8                       
  caea  170919         LBSR 0xd406                       
  caed  3516           PULS  A B X                       
  caef  39             RTS                               

; ---- function FUN_caf0
FUN_caf0:
  caf0  3416           PSHS  X B A                       
  caf2  8601           LDA #0x1                          
  caf4  1710B0         LBSR 0xdba7                       
  caf7  C40F           ANDB #0xf                         
  caf9  4F             CLRA                              
  cafa  3606           PSHU  B A                         
  cafc  17CBEE         LBSR 0x96ed                        ; inline[API_FC38]: "{2:23}Ch+{4:2000}{3:60AB}"
  caff  022343682B04.. char[12] 02h,"#Ch+",04h," "       
LAB_cb0b:
  cb0b  3516           PULS  A B X                       
  cb0d  39             RTS                               

; ---- function FUN_cb0e
FUN_cb0e:
  cb0e  3406           PSHS  B A                         
  cb10  C601           LDB #0x1                          
  cb12  17DBB8         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$CB24 "(  Note  )"
  cb15  CB24           addr cb24                         
  cb17  2820204E6F74.. ds "(  Note  )"                   
LAB_cb21:
  cb21  3506           PULS  A B                         
  cb23  39             RTS                               

; ---- function FUN_cb24
FUN_cb24:
  cb24  3416           PSHS  X B A                       
  cb26  171B0A         LBSR 0xe633                       
  cb29  F660B9         LDB 0x60b9                        
  cb2c  171AC1         LBSR 0xe5f0                       
  cb2f  BE6196         LDX 0x6196                        
  cb32  8602           LDA #0x2                          
  cb34  171070         LBSR 0xdba7                       
  cb37  4F             CLRA                              
  cb38  FD6074         STD 0x6074                        
  cb3b  17C2BE         LBSR 0x8dfc                        ; inline[API_FC16]: 01 10 02 64 00 00 03 00 $007F $0000 $0000 ->$CB59 ->$CB69 $0001 $0001 $0000
  cb3e  01             db 1h                             
  cb3f  10             db 10h                            
  cb40  02             db 2h                             
  cb41  64             db 64h                            
  cb42  00             db 0h                             
  cb43  00             db 0h                             
  cb44  03             db 3h                             
  cb45  00             db 0h                             
  cb46  007F           dw 7Fh                            
  cb48  0000           dw 0h                             
  cb4a  0000           dw 0h                             
  cb4c  CB59           addr cb59                         
  cb4e  CB69           addr cb69                         
  cb50  0001           dw 1h                             
  cb52  0001           dw 1h                             
  cb54  0000           dw 0h                             
LAB_cb56:
  cb56  3516           PULS  A B X                       
  cb58  39             RTS                               

; ---- function FUN_cb59
FUN_cb59:
  cb59  FC6074         LDD 0x6074                        
  cb5c  17117E         LBSR 0xdcdd                       
  cb5f  17CB8B         LBSR 0x96ed                        ; inline[API_FC38]: "{2:10}{3:60A5}"
  cb62  02100360A500   char[6] 02h,10h,03h,"`",A5h       
LAB_cb68:
  cb68  39             RTS                               

; ---- function FUN_cb69
FUN_cb69:
  cb69  3416           PSHS  X B A                       
  cb6b  FC6074         LDD 0x6074                        
  cb6e  BE6196         LDX 0x6196                        
  cb71  8602           LDA #0x2                          
  cb73  171042         LBSR 0xdbb8                       
  cb76  17088D         LBSR 0xd406                       
  cb79  3516           PULS  A B X                       
  cb7b  39             RTS                               

; ---- function FUN_cb7c
FUN_cb7c:
  cb7c  3416           PSHS  X B A                       
  cb7e  8602           LDA #0x2                          
  cb80  171024         LBSR 0xdba7                       
  cb83  C47F           ANDB #0x7f                        
  cb85  171155         LBSR 0xdcdd                       
  cb88  17CB62         LBSR 0x96ed                        ; inline[API_FC38]: "{2:10}{3:60A5}"
  cb8b  02100360A500   char[6] 02h,10h,03h,"`",A5h       
LAB_cb91:
  cb91  3516           PULS  A B X                       
  cb93  39             RTS                               

; ---- function FUN_cb94
FUN_cb94:
  cb94  17FF59         LBSR 0xcaf0                       
  cb97  17FFE2         LBSR 0xcb7c                       
  cb9a  39             RTS                               

; ---- function FUN_cb9b
FUN_cb9b:
  cb9b  17FEEA         LBSR 0xca88                       
  cb9e  17FF6D         LBSR 0xcb0e                       
  cba1  39             RTS                               

; ---- function FUN_cba2
FUN_cba2:
  cba2  3406           PSHS  B A                         
  cba4  C601           LDB #0x1                          
  cba6  17DB24         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$CBB8 "( PW Sens)"
  cba9  CBB8           addr cbb8                         
  cbab  282050572053.. ds "( PW Sens)"                   
LAB_cbb5:
  cbb5  3506           PULS  A B                         
  cbb7  39             RTS                               

; ---- function FUN_cbb8
FUN_cbb8:
  cbb8  3416           PSHS  X B A                       
  cbba  171A76         LBSR 0xe633                       
  cbbd  F660B9         LDB 0x60b9                        
  cbc0  171A2D         LBSR 0xe5f0                       
  cbc3  BE6196         LDX 0x6196                        
  cbc6  8602           LDA #0x2                          
  cbc8  170FDC         LBSR 0xdba7                       
  cbcb  4F             CLRA                              
  cbcc  17F553         LBSR 0xc122                        ; inline[API_FE0C]: $00F0
  cbcf  00F0           dw F0h                            
LAB_cbd1:
  cbd1  FD6074         STD 0x6074                        
  cbd4  17C225         LBSR 0x8dfc                        ; inline[API_FC16]: 01 10 02 1E 01 01 03 00 $00F0 $0000 $0000 ->$CBF2 ->$CB69 $0001 $0001 $0000
  cbd7  01             db 1h                             
  cbd8  10             db 10h                            
  cbd9  02             db 2h                             
  cbda  1E             db 1Eh                            
  cbdb  01             db 1h                             
  cbdc  01             db 1h                             
  cbdd  03             db 3h                             
  cbde  00             db 0h                             
  cbdf  00F0           dw F0h                            
  cbe1  0000           dw 0h                             
  cbe3  0000           dw 0h                             
  cbe5  CBF2           addr cbf2                         
  cbe7  CB69           addr cb69                         
  cbe9  0001           dw 1h                             
  cbeb  0001           dw 1h                             
  cbed  0000           dw 0h                             
LAB_cbef:
  cbef  3516           PULS  A B X                       
  cbf1  39             RTS                               

; ---- function FUN_cbf2
FUN_cbf2:
  cbf2  17CAF8         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1D}{3:609E}"
  cbf5  021D03609E00   char[6] 02h,1Dh,03h,"`",9Eh       
LAB_cbfb:
  cbfb  39             RTS                               

; ---- function FUN_cbfc
FUN_cbfc:
  cbfc  3416           PSHS  X B A                       
  cbfe  8602           LDA #0x2                          
  cc00  170FA4         LBSR 0xdba7                       
  cc03  4F             CLRA                              
  cc04  17F51B         LBSR 0xc122                        ; inline[API_FE0C]: $00F0
  cc07  00F0           dw F0h                            
LAB_cc09:
  cc09  3606           PSHU  B A                         
  cc0b  17CADF         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1D}{4:0100}{3:60A8}"
  cc0e  021D04010003.. char[9] 02h,1Dh,04h,01h           
LAB_cc17:
  cc17  3516           PULS  A B X                       
  cc19  39             RTS                               

; ---- function FUN_cc1a
FUN_cc1a:
  cc1a  17FED3         LBSR 0xcaf0                       
  cc1d  17FFDC         LBSR 0xcbfc                       
  cc20  39             RTS                               

; ---- function FUN_cc21
FUN_cc21:
  cc21  17FE64         LBSR 0xca88                       
  cc24  17FF7B         LBSR 0xcba2                       
  cc27  39             RTS                               

; ---- function FUN_cc28
FUN_cc28:
  cc28  3406           PSHS  B A                         
  cc2a  C601           LDB #0x1                          
  cc2c  17DA9E         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$CC3E "( Cntlr. )"
  cc2f  CC3E           addr cc3e                         
  cc31  2820436E746C.. ds "( Cntlr. )"                   
LAB_cc3b:
  cc3b  3506           PULS  A B                         
  cc3d  39             RTS                               

; ---- function FUN_cc3e
FUN_cc3e:
  cc3e  3416           PSHS  X B A                       
  cc40  1719F0         LBSR 0xe633                       
  cc43  F660B9         LDB 0x60b9                        
  cc46  1719A7         LBSR 0xe5f0                       
  cc49  BE6196         LDX 0x6196                        
  cc4c  8602           LDA #0x2                          
  cc4e  170F56         LBSR 0xdba7                       
  cc51  4F             CLRA                              
  cc52  17F4CD         LBSR 0xc122                        ; inline[API_FE0C]: $0079
  cc55  0079           dw 79h                            
LAB_cc57:
  cc57  FD6074         STD 0x6074                        
  cc5a  17C19F         LBSR 0x8dfc                        ; inline[API_FC16]: 01 10 02 32 01 00 03 00 $0079 $0000 $0000 ->$CC78 ->$CB69 $0001 $0001 $0000
  cc5d  01             db 1h                             
  cc5e  10             db 10h                            
  cc5f  02             db 2h                             
  cc60  32             db 32h                            
  cc61  01             db 1h                             
  cc62  00             db 0h                             
  cc63  03             db 3h                             
  cc64  00             db 0h                             
  cc65  0079           dw 79h                            
  cc67  0000           dw 0h                             
  cc69  0000           dw 0h                             
  cc6b  CC78           addr cc78                         
  cc6d  CB69           addr cb69                         
  cc6f  0001           dw 1h                             
  cc71  0001           dw 1h                             
  cc73  0000           dw 0h                             
LAB_cc75:
  cc75  3516           PULS  A B X                       
  cc77  39             RTS                               

; ---- function FUN_cc78
FUN_cc78:
  cc78  17CA72         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1D}{3:60A0}"
  cc7b  021D0360A000   char[6] 02h,1Dh,03h,"`",A0h       
LAB_cc81:
  cc81  39             RTS                               

; ---- function FUN_cc82
FUN_cc82:
  cc82  3416           PSHS  X B A                       
  cc84  8602           LDA #0x2                          
  cc86  170F1E         LBSR 0xdba7                       
  cc89  4F             CLRA                              
  cc8a  17F495         LBSR 0xc122                        ; inline[API_FE0C]: $0079
  cc8d  0079           dw 79h                            
LAB_cc8f:
  cc8f  3606           PSHU  B A                         
  cc91  17CA59         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}"
  cc94  021D04200003.. char[9] 02h,1Dh,04h," "           
LAB_cc9d:
  cc9d  3516           PULS  A B X                       
  cc9f  39             RTS                               

; ---- function FUN_cca0
FUN_cca0:
  cca0  17FE4D         LBSR 0xcaf0                       
  cca3  17FFDC         LBSR 0xcc82                       
  cca6  39             RTS                               

; ---- function FUN_cca7
FUN_cca7:
  cca7  17FDDE         LBSR 0xca88                       
  ccaa  17FF7B         LBSR 0xcc28                       
  ccad  39             RTS                               

; ---- function FUN_ccae
FUN_ccae:
  ccae  3406           PSHS  B A                         
  ccb0  C601           LDB #0x1                          
  ccb2  17DA18         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$CCC4 "( Cntlr. )"
  ccb5  CCC4           addr ccc4                         
  ccb7  2820436E746C.. ds "( Cntlr. )"                   
LAB_ccc1:
  ccc1  3506           PULS  A B                         
  ccc3  39             RTS                               

; ---- function FUN_ccc4
FUN_ccc4:
  ccc4  3416           PSHS  X B A                       
  ccc6  17196A         LBSR 0xe633                       
  ccc9  F660B9         LDB 0x60b9                        
  cccc  171921         LBSR 0xe5f0                       
  cccf  BE6196         LDX 0x6196                        
  ccd2  8602           LDA #0x2                          
  ccd4  170ED0         LBSR 0xdba7                       
  ccd7  4F             CLRA                              
  ccd8  17F447         LBSR 0xc122                        ; inline[API_FE0C]: $001F
  ccdb  001F           dw 1Fh                            
LAB_ccdd:
  ccdd  FD6074         STD 0x6074                        
  cce0  17C119         LBSR 0x8dfc                        ; inline[API_FC16]: 01 10 02 4B 01 00 03 00 $001F $0000 $0000 ->$CCFE ->$CB69 $0001 $0001 $0000
  cce3  01             db 1h                             
  cce4  10             db 10h                            
  cce5  02             db 2h                             
  cce6  4B             db 4Bh                            
  cce7  01             db 1h                             
  cce8  00             db 0h                             
  cce9  03             db 3h                             
  ccea  00             db 0h                             
  cceb  001F           dw 1Fh                            
  cced  0000           dw 0h                             
  ccef  0000           dw 0h                             
  ccf1  CCFE           addr ccfe                         
  ccf3  CB69           addr cb69                         
  ccf5  0001           dw 1h                             
  ccf7  0001           dw 1h                             
  ccf9  0000           dw 0h                             
LAB_ccfb:
  ccfb  3516           PULS  A B X                       
  ccfd  39             RTS                               

; ---- function FUN_ccfe
FUN_ccfe:
  ccfe  17C9EC         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1D}{3:60A0}"
  cd01  021D0360A000   char[6] 02h,1Dh,03h,"`",A0h       
LAB_cd07:
  cd07  39             RTS                               

; ---- function FUN_cd08
FUN_cd08:
  cd08  3416           PSHS  X B A                       
  cd0a  8602           LDA #0x2                          
  cd0c  170E98         LBSR 0xdba7                       
  cd0f  4F             CLRA                              
  cd10  17F40F         LBSR 0xc122                        ; inline[API_FE0C]: $001F
  cd13  001F           dw 1Fh                            
LAB_cd15:
  cd15  3606           PSHU  B A                         
  cd17  17C9D3         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}"
  cd1a  021D04200003.. char[9] 02h,1Dh,04h," "           
LAB_cd23:
  cd23  3516           PULS  A B X                       
  cd25  39             RTS                               

; ---- function FUN_cd26
FUN_cd26:
  cd26  17FDC7         LBSR 0xcaf0                       
  cd29  17FFDC         LBSR 0xcd08                       
  cd2c  39             RTS                               

; ---- function FUN_cd2d
FUN_cd2d:
  cd2d  17FD58         LBSR 0xca88                       
  cd30  17FF7B         LBSR 0xccae                       
  cd33  39             RTS                               

; ---- function FUN_cd34
FUN_cd34:
  cd34  3406           PSHS  B A                         
  cd36  C601           LDB #0x1                          
  cd38  17D992         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$CD4A "(Threshld)"
  cd3b  CD4A           addr cd4a                         
  cd3d  285468726573.. ds "(Threshld)"                   
LAB_cd47:
  cd47  3506           PULS  A B                         
  cd49  39             RTS                               

; ---- function FUN_cd4a
FUN_cd4a:
  cd4a  3416           PSHS  X B A                       
  cd4c  1718E4         LBSR 0xe633                       
  cd4f  F660B9         LDB 0x60b9                        
  cd52  17189B         LBSR 0xe5f0                       
  cd55  BE6196         LDX 0x6196                        
  cd58  8602           LDA #0x2                          
  cd5a  170E4A         LBSR 0xdba7                       
  cd5d  4F             CLRA                              
  cd5e  FD6074         STD 0x6074                        
  cd61  17C098         LBSR 0x8dfc                        ; inline[API_FC16]: 01 10 02 32 01 00 03 00 $007F $0000 $0000 ->$CD7F ->$CB69 $0001 $0001 $0000
  cd64  01             db 1h                             
  cd65  10             db 10h                            
  cd66  02             db 2h                             
  cd67  32             db 32h                            
  cd68  01             db 1h                             
  cd69  00             db 0h                             
  cd6a  03             db 3h                             
  cd6b  00             db 0h                             
  cd6c  007F           dw 7Fh                            
  cd6e  0000           dw 0h                             
  cd70  0000           dw 0h                             
  cd72  CD7F           addr cd7f                         
  cd74  CB69           addr cb69                         
  cd76  0001           dw 1h                             
  cd78  0001           dw 1h                             
  cd7a  0000           dw 0h                             
LAB_cd7c:
  cd7c  3516           PULS  A B X                       
  cd7e  39             RTS                               

; ---- function FUN_cd7f
FUN_cd7f:
  cd7f  17C96B         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1D}{3:60A0}"
  cd82  021D0360A000   char[6] 02h,1Dh,03h,"`",A0h       
LAB_cd88:
  cd88  39             RTS                               

; ---- function FUN_cd89
FUN_cd89:
  cd89  3416           PSHS  X B A                       
  cd8b  8602           LDA #0x2                          
  cd8d  170E17         LBSR 0xdba7                       
  cd90  4F             CLRA                              
  cd91  17F38E         LBSR 0xc122                        ; inline[API_FE0C]: $007F
  cd94  007F           dw 7Fh                            
LAB_cd96:
  cd96  3606           PSHU  B A                         
  cd98  17C952         LBSR 0x96ed                        ; inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}"
  cd9b  021D04200003.. char[9] 02h,1Dh,04h," "           
LAB_cda4:
  cda4  3516           PULS  A B X                       
  cda6  39             RTS                               

; ---- function FUN_cda7
FUN_cda7:
  cda7  17FD46         LBSR 0xcaf0                       
  cdaa  17FFDC         LBSR 0xcd89                       
  cdad  39             RTS                               

; ---- function FUN_cdae
FUN_cdae:
  cdae  17FCD7         LBSR 0xca88                       
  cdb1  17FF80         LBSR 0xcd34                       
  cdb4  39             RTS                               

; ---- function FUN_cdb5
FUN_cdb5:
  cdb5  3436           PSHS  Y X B A                     
  cdb7  170DCE         LBSR 0xdb88                       
  cdba  3410           PSHS  X                           
  cdbc  C60C           LDB #0xc                          
  cdbe  17C91A         LBSR 0x96db                       
  cdc1  CC001C         LDD #0x1c                         
  cdc4  1F21           TFR Y,X                           
  cdc6  30890000       LEAX 0x0,X                        
  cdca  17C990         LBSR 0x975d                       
  cdcd  3510           PULS  X                           
  cdcf  ADB9001E       JSR [0x1e,Y]                      
  cdd3  3536           PULS  A B X Y                     
  cdd5  39             RTS                               
  cdd6  .db 50 61 74 63 68 20 69 73 20 64 69 73 61 62 6C 65  ; Patch is disable
  cde6  .db 64 20 20 20 20 20 20 20 20 20 20 20 88 77 88 77  ; d           .w.w
  cdf6  .db 88 77 00 00 4D 6F 64 75 6C 61 74 69 6F 6E 20 57  ; .w..Modulation W
  ce06  .db 68 65 65 6C 20 20 20 20 20 20 20 20 20 20 20 20  ; heel            
  ce16  .db D7 81 CA F0 CA 88 01 00 50 69 74 63 68 20 57 68  ; ........Pitch Wh
  ce26  .db 65 65 6C 20 6F 6E 6C 79 20 20 20 20 20 20 20 20  ; eel only        
  ce36  .db 20 20 20 20 D4 2A CA F0 CA 88 00 00 50 69 74 63  ;     .*......Pitc
  ce46  .db 68 20 57 68 65 65 6C 20 50 6F 73 69 74 69 76 65  ; h Wheel Positive
  ce56  .db 20 20 20 20 20 20 20 20 D4 53 CA F0 CA 88 00 00  ;         .S......
  ce66  .db 46 69 72 73 74 20 4E 6F 74 65 20 26 20 50 57 3D  ; First Note & PW=
  ce76  .db 20 20 20 20 20 20 20 20 20 20 20 20 D4 CC CC 1A  ;             ....
  ce86  .db CC 21 00 00 4C 61 73 74 20 4E 6F 74 65 20 26 20  ; .!..Last Note & 
  ce96  .db 20 50 57 3D 20 20 20 20 20 20 20 20 20 20 20 20  ;  PW=            
  cea6  .db D4 89 CC 1A CC 21 00 00 48 69 67 68 20 4E 6F 74  ; .....!..High Not
  ceb6  .db 65 20 26 20 20 50 57 3D 20 20 20 20 20 20 20 20  ; e &  PW=        
  cec6  .db 20 20 20 20 D4 E1 CC 1A CC 21 00 00 4C 6F 77 20  ;     .....!..Low 
  ced6  .db 4E 6F 74 65 20 61 6E 64 20 50 57 3D 20 20 20 20  ; Note and PW=    
  cee6  .db 20 20 20 20 20 20 20 20 D4 F6 CC 1A CC 21 00 00  ;         .....!..
  cef6  .db 4E 6F 74 65 20 4F 66 66 73 65 74 20 20 50 57 3D  ; Note Offset  PW=
  cf06  .db 20 20 20 20 20 20 20 20 20 20 20 20 D5 0B CC 1A  ;             ....
  cf16  .db CC 21 00 00 51 75 61 6E 74 69 74 79 20 6F 66 20  ; .!..Quantity of 
  cf26  .db 4E 6F 74 65 73 20 44 6F 77 6E 20 20 20 20 20 20  ; Notes Down      
  cf36  .db D5 6C CA F0 CA 88 00 00 46 69 72 73 74 20 4E 6F  ; .l......First No
  cf46  .db 74 65 20 56 65 6C 6F 63 69 74 79 20 20 20 20 20  ; te Velocity     
  cf56  .db 20 20 20 20 D5 DD CA F0 CA 88 00 00 4C 61 73 74  ;     ........Last
  cf66  .db 20 4E 6F 74 65 20 56 65 6C 6F 63 69 74 79 20 20  ;  Note Velocity  
  cf76  .db 20 20 20 20 20 20 20 20 D5 A8 CA F0 CA 88 00 00  ;         ........
  cf86  .db 48 69 67 68 20 4E 6F 74 65 20 56 65 6C 6F 63 69  ; High Note Veloci
  cf96  .db 74 79 20 20 20 20 20 20 20 20 20 20 D5 EF CA F0  ; ty          ....
  cfa6  .db CA 88 00 00 4C 6F 77 20 4E 6F 74 65 20 56 65 6C  ; ....Low Note Vel
  cfb6  .db 6F 63 69 74 79 20 20 20 20 20 20 20 20 20 20 20  ; ocity           
  cfc6  .db D6 01 CA F0 CA 88 00 00 4E 6F 74 65 20 20 20 20  ; ........Note    
  cfd6  .db 20 20 20 20 20 20 56 65 6C 6F 63 69 74 79 20 20  ;       Velocity  
  cfe6  .db 20 20 20 20 D6 13 CB 94 CB 9B 00 00 46 69 72 73  ;     ........Firs
  cff6  .db 74 20 4E 6F 74 65 20 50 72 65 73 73 75 72 65 20  ; t Note Pressure 
  d006  .db 20 20 20 20 20 20 20 20 D6 A0 CA F0 CA 88 00 00  ;         ........
  d016  .db 4C 61 73 74 20 4E 6F 74 65 20 50 72 65 73 73 75  ; Last Note Pressu
  d026  .db 72 65 20 20 20 20 20 20 20 20 20 20 D6 4D CA F0  ; re          .M..
  d036  .db CA 88 00 00 48 69 67 68 20 4E 6F 74 65 20 50 72  ; ....High Note Pr
  d046  .db 65 73 73 75 72 65 20 20 20 20 20 20 20 20 20 20  ; essure          
  d056  .db D6 B2 CA F0 CA 88 00 00 4C 6F 77 20 4E 6F 74 65  ; ........Low Note
  d066  .db 20 50 72 65 73 73 75 72 65 20 20 20 20 20 20 20  ;  Pressure       
  d076  .db 20 20 20 20 D6 C4 CA F0 CA 88 00 00 4E 6F 74 65  ;     ........Note
  d086  .db 20 20 20 20 20 20 20 20 20 20 50 72 65 73 73 75  ;           Pressu
  d096  .db 72 65 20 20 20 20 20 20 D6 D6 CB 94 CB 9B 00 00  ; re      ........
  d0a6  .db 47 6C 6F 62 61 6C 20 50 72 65 73 73 75 72 65 20  ; Global Pressure 
  d0b6  .db 20 20 20 20 20 20 20 20 20 20 20 20 D8 07 CA F0  ;             ....
  d0c6  .db CA 88 00 00 4C 61 73 74 20 4E 6F 74 65 20 52 65  ; ....Last Note Re
  d0d6  .db 6C 65 61 73 65 20 20 20 20 20 20 20 20 20 20 20  ; lease           
  d0e6  .db D8 3A CA F0 CA 88 00 00 4E 6F 74 65 20 20 20 20  ; .:......Note    
  d0f6  .db 20 20 20 20 20 20 52 65 6C 65 61 73 65 20 20 20  ;       Release   
  d106  .db 20 20 20 20 D8 4C CB 94 CB 9B 00 00 56 65 6C 6F  ;     .L......Velo
  d116  .db 63 69 74 79 20 61 6E 64 20 52 65 6C 65 61 73 65  ; city and Release
  d126  .db 20 20 20 20 20 20 20 20 D8 67 CA F0 CA 88 00 00  ;         .g......
  d136  .db 42 72 65 61 74 68 20 43 6F 6E 74 72 6F 6C 6C 65  ; Breath Controlle
  d146  .db 72 20 20 20 20 20 20 20 20 20 20 20 D7 81 CA F0  ; r           ....
  d156  .db CA 88 02 00 46 6F 6F 74 20 43 6F 6E 74 72 6F 6C  ; ....Foot Control
  d166  .db 6C 65 72 20 20 20 20 20 20 20 20 20 20 20 20 20  ; ler             
  d176  .db D7 81 CA F0 CA 88 04 00 45 78 70 72 65 73 73 69  ; ........Expressi
  d186  .db 6F 6E 20 43 6F 6E 74 72 6F 6C 6C 65 72 20 20 20  ; on Controller   
  d196  .db 20 20 20 20 D7 81 CA F0 CA 88 0B 00 47 50 20 43  ;     ........GP C
  d1a6  .db 6F 6E 74 72 6F 6C 6C 65 72 20 23 20 31 20 20 20  ; ontroller # 1   
  d1b6  .db 20 20 20 20 20 20 20 20 D7 81 CA F0 CA 88 10 00  ;         ........
  d1c6  .db 47 50 20 43 6F 6E 74 72 6F 6C 6C 65 72 20 23 20  ; GP Controller # 
  d1d6  .db 32 20 20 20 20 20 20 20 20 20 20 20 D7 81 CA F0  ; 2           ....
  d1e6  .db CA 88 11 00 47 50 20 43 6F 6E 74 72 6F 6C 6C 65  ; ....GP Controlle
  d1f6  .db 72 20 23 20 33 20 20 20 20 20 20 20 20 20 20 20  ; r # 3           
  d206  .db D7 81 CA F0 CA 88 12 00 47 50 20 43 6F 6E 74 72  ; ........GP Contr
  d216  .db 6F 6C 6C 65 72 20 23 20 34 20 20 20 20 20 20 20  ; oller # 4       
  d226  .db 20 20 20 20 D7 81 CA F0 CA 88 13 00 47 50 20 43  ;     ........GP C
  d236  .db 6F 6E 74 72 6F 6C 6C 65 72 20 23 20 35 20 20 20  ; ontroller # 5   
  d246  .db 20 20 20 20 20 20 20 20 D7 28 CA F0 CA 88 50 00  ;         .(....P.
  d256  .db 47 50 20 43 6F 6E 74 72 6F 6C 6C 65 72 20 23 20  ; GP Controller # 
  d266  .db 36 20 20 20 20 20 20 20 20 20 20 20 D7 28 CA F0  ; 6           .(..
  d276  .db CA 88 51 00 47 50 20 43 6F 6E 74 72 6F 6C 6C 65  ; ..Q.GP Controlle
  d286  .db 72 20 23 20 37 20 20 20 20 20 20 20 20 20 20 20  ; r # 7           
  d296  .db D7 28 CA F0 CA 88 52 00 47 50 20 43 6F 6E 74 72  ; .(....R.GP Contr
  d2a6  .db 6F 6C 6C 65 72 20 23 20 38 20 20 20 20 20 20 20  ; oller # 8       
  d2b6  .db 20 20 20 20 D7 28 CA F0 CA 88 52 00 44 61 6D 70  ;     .(....R.Damp
  d2c6  .db 65 72 20 50 65 64 61 6C 20 20 20 20 20 20 20 20  ; er Pedal        
  d2d6  .db 20 20 20 20 20 20 20 20 D7 28 CA F0 CA 88 40 00  ;         .(....@.
  d2e6  .db 4E 6F 74 65 73 20 44 6F 77 6E 20 20 20 20 54 68  ; Notes Down    Th
  d2f6  .db 3D 20 20 20 20 20 20 20 20 20 20 20 D5 91 CD A7  ; =           ....
  d306  .db CD AE 00 00 4C 61 73 74 20 56 65 6C 6F 63 69 74  ; ....Last Velocit
  d316  .db 79 20 54 68 3D 20 20 20 20 20 20 20 20 20 20 20  ; y Th=           
  d326  .db D5 D6 CD A7 CD AE 00 00 47 6C 6F 62 61 6C 20 50  ; ........Global P
  d336  .db 72 65 73 73 2E 20 54 68 3D 20 20 20 20 20 20 20  ; ress. Th=       
  d346  .db 20 20 20 20 D8 13 CD A7 CD AE 00 00 50 6F 72 74  ;     ........Port
  d356  .db 61 6D 65 6E 74 6F 20 50 65 64 61 6C 20 20 20 20  ; amento Pedal    
  d366  .db 20 20 20 20 20 20 20 20 D7 28 CA F0 CA 88 41 00  ;         .(....A.
  d376  .db 4D 49 44 49 20 43 6C 6F 63 6B 20 46 72 65 71 75  ; MIDI Clock Frequ
  d386  .db 65 6E 63 79 20 20 20 20 20 20 20 20 D9 00 88 77  ; ency        ...w
  d396  .db 88 77 00 00 4D 49 44 49 20 43 6C 6F 63 6B 20 50  ; .w..MIDI Clock P
  d3a6  .db 65 72 69 6F 64 20 20 20 20 20 20 20 20 20 20 20  ; eriod           
  d3b6  .db D9 14 88 77 88 77 00 00 55 6E 64 65 66 69 6E 65  ; ...w.w..Undefine
  d3c6  .db 64 20 53 6D 61 6C 6C 3D 20 20 20 20 20 20 20 20  ; d Small=        
  d3d6  .db 20 20 20 20 D7 3B CC A0 CC A7 00 00 55 6E 64 65  ;     .;......Unde
  d3e6  .db 66 69 6E 65 64 20 4C 61 72 67 65 3D 20 20 20 20  ; fined Large=    
  d3f6  .db 20 20 20 20 20 20 20 20 D7 9A CD 26 CD 2D 00 00  ;         ...&.-..

; ---- function FUN_d406
FUN_d406:
  d406  3436           PSHS  Y X B A                     
  d408  3420           PSHS  Y                           
  d40a  10BE6196       LDY 0x6196                        
  d40e  31890018       LEAY 0x18,X                       
  d412  17EB47         LBSR 0xbf5c                        ; inline[API_FD0C]: $000E 00
  d415  000E           dw Eh                             
  d417  00             db 0h                             
LAB_d418:
  d418  CCDB7E         LDD #0xdb7e                       
  d41b  ED89001A       STD 0x1a,X                        
  d41f  3520           PULS  Y                           
  d421  170764         LBSR 0xdb88                       
  d424  ADB81C         JSR [0x1c,Y]                      
  d427  3536           PULS  A B X Y                     
  d429  39             RTS                               

; ---- function FUN_d42a
FUN_d42a:
  d42a  3436           PSHS  Y X B A                     
  d42c  170704         LBSR 0xdb33                        ; inline[addr:DB33]: $D436 $0000
  d42f  D436           dw D436h                          
  d431  0000           dw 0h                             
LAB_d433:
  d433  3536           PULS  A B X Y                     
  d435  39             RTS                               

; ---- function FUN_d436
FUN_d436:
  d436  3406           PSHS  B A                         
  d438  170722         LBSR 0xdb5d                       
  d43b  1026073F       LBNE 0xdb7e                       
  d43f  C1E0           CMPB #0xe0                        
  d441  10260739       LBNE 0xdb7e                       
LAB_d445:
  d445  170650         LBSR 0xda98                       
  d448  832000         SUBD #0x2000                      
  d44b  58             LSLB                              
  d44c  49             ROLA                              
  d44d  ED890016       STD 0x16,X                        
  d451  20F2           BRA 0xd445                        

; ---- function FUN_d453
FUN_d453:
  d453  3436           PSHS  Y X B A                     
  d455  1706DB         LBSR 0xdb33                        ; inline[addr:DB33]: $D45F $0000
  d458  D45F           dw D45Fh                          
  d45a  0000           dw 0h                             
LAB_d45c:
  d45c  3536           PULS  A B X Y                     
  d45e  39             RTS                               

; ---- function FUN_d45f
FUN_d45f:
  d45f  3406           PSHS  B A                         
  d461  1706F9         LBSR 0xdb5d                       
  d464  10260716       LBNE 0xdb7e                       
  d468  C1E0           CMPB #0xe0                        
  d46a  10260710       LBNE 0xdb7e                       
LAB_d46e:
  d46e  170627         LBSR 0xda98                       
  d471  10832000       CMPD #0x2000                      
  d475  2407           BCC 0xd47e                        
  d477  3406           PSHS  B A                         
  d479  CC4000         LDD #0x4000                       
  d47c  A3E1           SUBD ,S++                         
LAB_d47e:
  d47e  832000         SUBD #0x2000                      
  d481  58             LSLB                              
  d482  49             ROLA                              
  d483  ED890016       STD 0x16,X                        
  d487  20E5           BRA 0xd46e                        

; ---- function FUN_d489
FUN_d489:
  d489  3406           PSHS  B A                         
  d48b  1706A5         LBSR 0xdb33                        ; inline[addr:DB33]: $D49E $0000
  d48e  D49E           dw D49Eh                          
  d490  0000           dw 0h                             
LAB_d492:
  d492  170679         LBSR 0xdb0e                       
  d495  C600           LDB #0x0                          
  d497  E7890021       STB 0x21,X                        
  d49b  3506           PULS  A B                         
  d49d  39             RTS                               

; ---- function FUN_d49e
FUN_d49e:
  d49e  3406           PSHS  B A                         
  d4a0  1706BA         LBSR 0xdb5d                       
  d4a3  102606D7       LBNE 0xdb7e                       
  d4a7  C1E0           CMPB #0xe0                        
  d4a9  2715           BEQ 0xd4c0                        
LAB_d4ab:
  d4ab  170565         LBSR 0xda13                       
  d4ae  17050A         LBSR 0xd9bb                       
  d4b1  26F8           BNE 0xd4ab                        
  d4b3  3404           PSHS  B                           
  d4b5  170633         LBSR 0xdaeb                       
  d4b8  ED890016       STD 0x16,X                        
  d4bc  3504           PULS  B                           
  d4be  20EB           BRA 0xd4ab                        
LAB_d4c0:
  d4c0  1705D5         LBSR 0xda98                       
  d4c3  170608         LBSR 0xdace                       
  d4c6  ED890016       STD 0x16,X                        
  d4ca  20F4           BRA 0xd4c0                        

; ---- function FUN_d4cc
FUN_d4cc:
  d4cc  3406           PSHS  B A                         
  d4ce  170662         LBSR 0xdb33                        ; inline[addr:DB33]: $D49E $0000
  d4d1  D49E           dw D49Eh                          
  d4d3  0000           dw 0h                             
LAB_d4d5:
  d4d5  170636         LBSR 0xdb0e                       
  d4d8  C602           LDB #0x2                          
  d4da  E7890021       STB 0x21,X                        
  d4de  3506           PULS  A B                         
  d4e0  39             RTS                               

; ---- function FUN_d4e1
FUN_d4e1:
  d4e1  3406           PSHS  B A                         
  d4e3  17064D         LBSR 0xdb33                        ; inline[addr:DB33]: $D49E $0000
  d4e6  D49E           dw D49Eh                          
  d4e8  0000           dw 0h                             
LAB_d4ea:
  d4ea  170621         LBSR 0xdb0e                       
  d4ed  C604           LDB #0x4                          
  d4ef  E7890021       STB 0x21,X                        
  d4f3  3506           PULS  A B                         
  d4f5  39             RTS                               

; ---- function FUN_d4f6
FUN_d4f6:
  d4f6  3406           PSHS  B A                         
  d4f8  170638         LBSR 0xdb33                        ; inline[addr:DB33]: $D49E $0000
  d4fb  D49E           dw D49Eh                          
  d4fd  0000           dw 0h                             
LAB_d4ff:
  d4ff  17060C         LBSR 0xdb0e                       
  d502  C606           LDB #0x6                          
  d504  E7890021       STB 0x21,X                        
  d508  3506           PULS  A B                         
  d50a  39             RTS                               

; ---- function FUN_d50b
FUN_d50b:
  d50b  3406           PSHS  B A                         
  d50d  170623         LBSR 0xdb33                        ; inline[addr:DB33]: $D520 $0000
  d510  D520           dw D520h                          
  d512  0000           dw 0h                             
LAB_d514:
  d514  1705F7         LBSR 0xdb0e                       
  d517  C680           LDB #0x80                         
  d519  E7890021       STB 0x21,X                        
  d51d  3506           PULS  A B                         
  d51f  39             RTS                               

; ---- function FUN_d520
FUN_d520:
  d520  3406           PSHS  B A                         
  d522  170638         LBSR 0xdb5d                       
  d525  10260655       LBNE 0xdb7e                       
  d529  C1E0           CMPB #0xe0                        
  d52b  2733           BEQ 0xd560                        
LAB_d52d:
  d52d  1704E3         LBSR 0xda13                       
  d530  C180           CMPB #0x80                        
  d532  27F9           BEQ 0xd52d                        
  d534  4D             TSTA                              
  d535  27F6           BEQ 0xd52d                        
  d537  A689001E       LDA 0x1e,X                        
  d53b  8101           CMPA #0x1                         
  d53d  2608           BNE 0xd547                        
  d53f  A689001F       LDA 0x1f,X                        
  d543  A7890020       STA 0x20,X                        
LAB_d547:
  d547  3404           PSHS  B                           
  d549  A689001F       LDA 0x1f,X                        
  d54d  A0890020       SUBA 0x20,X                       
  d551  A789001D       STA 0x1d,X                        
  d555  170593         LBSR 0xdaeb                       
  d558  ED890016       STD 0x16,X                        
  d55c  3504           PULS  B                           
  d55e  20CD           BRA 0xd52d                        
LAB_d560:
  d560  170535         LBSR 0xda98                       
  d563  170568         LBSR 0xdace                       
  d566  ED890016       STD 0x16,X                        
  d56a  20F4           BRA 0xd560                        

; ---- function FUN_d56c
FUN_d56c:
  d56c  3406           PSHS  B A                         
  d56e  1705C2         LBSR 0xdb33                        ; inline[addr:DB33]: $D578 $0000
  d571  D578           dw D578h                          
  d573  0000           dw 0h                             
LAB_d575:
  d575  3506           PULS  A B                         
  d577  39             RTS                               

; ---- function FUN_d578
FUN_d578:
  d578  3406           PSHS  B A                         
  d57a  1705E0         LBSR 0xdb5d                       
  d57d  102605FD       LBNE 0xdb7e                       
LAB_d581:
  d581  17048F         LBSR 0xda13                       
  d584  3404           PSHS  B                           
  d586  E689001E       LDB 0x1e,X                        
  d58a  17040E         LBSR 0xd99b                       
  d58d  3504           PULS  B                           
  d58f  20F0           BRA 0xd581                        

; ---- function FUN_d591
FUN_d591:
  d591  3406           PSHS  B A                         
  d593  17FFD6         LBSR 0xd56c                       
LAB_d596:
  d596  8601           LDA #0x1                          
  d598  E7890024       STB 0x24,X                        
  d59c  8602           LDA #0x2                          
  d59e  170606         LBSR 0xdba7                       
  d5a1  E7890019       STB 0x19,X                        
  d5a5  3506           PULS  A B                         
  d5a7  39             RTS                               

; ---- function FUN_d5a8
FUN_d5a8:
  d5a8  3406           PSHS  B A                         
  d5aa  170586         LBSR 0xdb33                        ; inline[addr:DB33]: $D5BA $0000
  d5ad  D5BA           dw D5BAh                          
  d5af  0000           dw 0h                             
LAB_d5b1:
  d5b1  C600           LDB #0x0                          
  d5b3  E7890021       STB 0x21,X                        
  d5b7  3506           PULS  A B                         
  d5b9  39             RTS                               

; ---- function FUN_d5ba
FUN_d5ba:
  d5ba  3406           PSHS  B A                         
  d5bc  17059E         LBSR 0xdb5d                       
  d5bf  102605BB       LBNE 0xdb7e                       
LAB_d5c3:
  d5c3  17044D         LBSR 0xda13                       
  d5c6  1703F2         LBSR 0xd9bb                       
  d5c9  26F8           BNE 0xd5c3                        
  d5cb  E6890020       LDB 0x20,X                        
  d5cf  27F2           BEQ 0xd5c3                        
  d5d1  1703C7         LBSR 0xd99b                       
  d5d4  20ED           BRA 0xd5c3                        

; ---- function FUN_d5d6
FUN_d5d6:
  d5d6  3406           PSHS  B A                         
  d5d8  17FFCD         LBSR 0xd5a8                       
  d5db  20B9           BRA 0xd596                        

; ---- function FUN_d5dd
FUN_d5dd:
  d5dd  3406           PSHS  B A                         
  d5df  170551         LBSR 0xdb33                        ; inline[addr:DB33]: $D5BA $0000
  d5e2  D5BA           dw D5BAh                          
  d5e4  0000           dw 0h                             
LAB_d5e6:
  d5e6  C602           LDB #0x2                          
  d5e8  E7890021       STB 0x21,X                        
  d5ec  3506           PULS  A B                         
  d5ee  39             RTS                               

; ---- function FUN_d5ef
FUN_d5ef:
  d5ef  3406           PSHS  B A                         
  d5f1  17053F         LBSR 0xdb33                        ; inline[addr:DB33]: $D5BA $0000
  d5f4  D5BA           dw D5BAh                          
  d5f6  0000           dw 0h                             
LAB_d5f8:
  d5f8  C604           LDB #0x4                          
  d5fa  E7890021       STB 0x21,X                        
  d5fe  3506           PULS  A B                         
  d600  39             RTS                               

; ---- function FUN_d601
FUN_d601:
  d601  3406           PSHS  B A                         
  d603  17052D         LBSR 0xdb33                        ; inline[addr:DB33]: $D5BA $0000
  d606  D5BA           dw D5BAh                          
  d608  0000           dw 0h                             
LAB_d60a:
  d60a  C606           LDB #0x6                          
  d60c  E7890021       STB 0x21,X                        
  d610  3506           PULS  A B                         
  d612  39             RTS                               

; ---- function FUN_d613
FUN_d613:
  d613  3406           PSHS  B A                         
  d615  17051B         LBSR 0xdb33                        ; inline[addr:DB33]: $D628 $0000
  d618  D628           dw D628h                          
  d61a  0000           dw 0h                             
LAB_d61c:
  d61c  8602           LDA #0x2                          
  d61e  170586         LBSR 0xdba7                       
  d621  E789001D       STB 0x1d,X                        
  d625  3506           PULS  A B                         
  d627  39             RTS                               

; ---- function FUN_d628
FUN_d628:
  d628  3406           PSHS  B A                         
  d62a  170530         LBSR 0xdb5d                       
  d62d  1026054D       LBNE 0xdb7e                       
LAB_d631:
  d631  1703DF         LBSR 0xda13                       
  d634  C180           CMPB #0x80                        
  d636  27F9           BEQ 0xd631                        
  d638  4D             TSTA                              
  d639  27F6           BEQ 0xd631                        
  d63b  E689001F       LDB 0x1f,X                        
  d63f  E189001D       CMPB 0x1d,X                       
  d643  26EC           BNE 0xd631                        
  d645  1F89           TFR A,B                           
  d647  4F             CLRA                              
  d648  170350         LBSR 0xd99b                       
  d64b  20E4           BRA 0xd631                        

; ---- function FUN_d64d
FUN_d64d:
  d64d  3406           PSHS  B A                         
  d64f  1704E1         LBSR 0xdb33                        ; inline[addr:DB33]: $D65F $0000
  d652  D65F           dw D65Fh                          
  d654  0000           dw 0h                             
LAB_d656:
  d656  C600           LDB #0x0                          
  d658  E7890021       STB 0x21,X                        
  d65c  3506           PULS  A B                         
  d65e  39             RTS                               

; ---- function FUN_d65f
FUN_d65f:
  d65f  3406           PSHS  B A                         
  d661  1704F9         LBSR 0xdb5d                       
  d664  10260516       LBNE 0xdb7e                       
  d668  C1A0           CMPB #0xa0                        
  d66a  2713           BEQ 0xd67f                        
LAB_d66c:
  d66c  1703A4         LBSR 0xda13                       
  d66f  170349         LBSR 0xd9bb                       
  d672  20F8           BRA 0xd66c                        
LAB_d674:
  d674  CCD67D         LDD #0xd67d                       
  d677  ED890003       STD 0x3,X                         
  d67b  3586           PULS  A B PC                      

; ---- function FUN_d67d
FUN_d67d:
  d67d  3406           PSHS  B A                         
LAB_d67f:
  d67f  CCD688         LDD #0xd688                       
  d682  ED890003       STD 0x3,X                         
  d686  3586           PULS  A B PC                      

; ---- function FUN_d688
FUN_d688:
  d688  3406           PSHS  B A                         
  d68a  E189001D       CMPB 0x1d,X                       
  d68e  26E4           BNE 0xd674                        
  d690  CCD699         LDD #0xd699                       
  d693  ED890003       STD 0x3,X                         
  d697  3586           PULS  A B PC                      

; ---- function FUN_d699
FUN_d699:
  d699  3406           PSHS  B A                         
  d69b  1702FD         LBSR 0xd99b                       
  d69e  20DF           BRA 0xd67f                        

; ---- function FUN_d6a0
FUN_d6a0:
  d6a0  3406           PSHS  B A                         
  d6a2  17048E         LBSR 0xdb33                        ; inline[addr:DB33]: $D65F $0000
  d6a5  D65F           dw D65Fh                          
  d6a7  0000           dw 0h                             
LAB_d6a9:
  d6a9  C602           LDB #0x2                          
  d6ab  E7890021       STB 0x21,X                        
  d6af  3506           PULS  A B                         
  d6b1  39             RTS                               

; ---- function FUN_d6b2
FUN_d6b2:
  d6b2  3406           PSHS  B A                         
  d6b4  17047C         LBSR 0xdb33                        ; inline[addr:DB33]: $D65F $0000
  d6b7  D65F           dw D65Fh                          
  d6b9  0000           dw 0h                             
LAB_d6bb:
  d6bb  C604           LDB #0x4                          
  d6bd  E7890021       STB 0x21,X                        
  d6c1  3506           PULS  A B                         
  d6c3  39             RTS                               

; ---- function FUN_d6c4
FUN_d6c4:
  d6c4  3406           PSHS  B A                         
  d6c6  17046A         LBSR 0xdb33                        ; inline[addr:DB33]: $D65F $0000
  d6c9  D65F           dw D65Fh                          
  d6cb  0000           dw 0h                             
LAB_d6cd:
  d6cd  C606           LDB #0x6                          
  d6cf  E7890021       STB 0x21,X                        
  d6d3  3506           PULS  A B                         
  d6d5  39             RTS                               

; ---- function FUN_d6d6
FUN_d6d6:
  d6d6  3406           PSHS  B A                         
  d6d8  170458         LBSR 0xdb33                        ; inline[addr:DB33]: $D6EB $0000
  d6db  D6EB           dw D6EBh                          
  d6dd  0000           dw 0h                             
LAB_d6df:
  d6df  C602           LDB #0x2                          
  d6e1  1704C3         LBSR 0xdba7                       
  d6e4  E789001D       STB 0x1d,X                        
  d6e8  3506           PULS  A B                         
  d6ea  39             RTS                               

; ---- function FUN_d6eb
FUN_d6eb:
  d6eb  3406           PSHS  B A                         
  d6ed  17046D         LBSR 0xdb5d                       
  d6f0  1026048A       LBNE 0xdb7e                       
  d6f4  C1A0           CMPB #0xa0                        
  d6f6  10260484       LBNE 0xdb7e                       
  d6fa  200B           BRA 0xd707                        
LAB_d6fc:
  d6fc  CCD705         LDD #0xd705                       
  d6ff  ED890003       STD 0x3,X                         
  d703  3586           PULS  A B PC                      

; ---- function FUN_d705
FUN_d705:
  d705  3406           PSHS  B A                         
LAB_d707:
  d707  CCD710         LDD #0xd710                       
  d70a  ED890003       STD 0x3,X                         
  d70e  3586           PULS  A B PC                      

; ---- function FUN_d710
FUN_d710:
  d710  3406           PSHS  B A                         
  d712  E189001D       CMPB 0x1d,X                       
  d716  26E4           BNE 0xd6fc                        
  d718  CCD721         LDD #0xd721                       
  d71b  ED890003       STD 0x3,X                         
  d71f  3586           PULS  A B PC                      

; ---- function FUN_d721
FUN_d721:
  d721  3406           PSHS  B A                         
  d723  170275         LBSR 0xd99b                       
  d726  20DF           BRA 0xd707                        

; ---- function FUN_d728
FUN_d728:
  d728  3406           PSHS  B A                         
  d72a  E6A822         LDB 0x22,Y                        
LAB_d72d:
  d72d  E789001D       STB 0x1d,X                        
  d731  1703FF         LBSR 0xdb33                        ; inline[addr:DB33]: $D744 $0000
  d734  D744           dw D744h                          
  d736  0000           dw 0h                             
LAB_d738:
  d738  3506           PULS  A B                         
  d73a  39             RTS                               

; ---- function FUN_d73b
FUN_d73b:
  d73b  3406           PSHS  B A                         
  d73d  8602           LDA #0x2                          
  d73f  170465         LBSR 0xdba7                       
  d742  20E9           BRA 0xd72d                        

; ---- function FUN_d744
FUN_d744:
  d744  3406           PSHS  B A                         
  d746  170414         LBSR 0xdb5d                       
  d749  10260431       LBNE 0xdb7e                       
  d74d  C1B0           CMPB #0xb0                        
  d74f  1026042B       LBNE 0xdb7e                       
LAB_d753:
  d753  CCD75C         LDD #0xd75c                       
  d756  ED890003       STD 0x3,X                         
  d75a  3586           PULS  A B PC                      

; ---- function FUN_d75c
FUN_d75c:
  d75c  3406           PSHS  B A                         
  d75e  E189001D       CMPB 0x1d,X                       
  d762  2610           BNE 0xd774                        
  d764  CCD76D         LDD #0xd76d                       
  d767  ED890003       STD 0x3,X                         
  d76b  3586           PULS  A B PC                      

; ---- function FUN_d76d
FUN_d76d:
  d76d  3406           PSHS  B A                         
  d76f  170229         LBSR 0xd99b                       
  d772  20DF           BRA 0xd753                        
LAB_d774:
  d774  CCD77D         LDD #0xd77d                       
  d777  ED890003       STD 0x3,X                         
  d77b  3586           PULS  A B PC                      

; ---- function FUN_d77d
FUN_d77d:
  d77d  3406           PSHS  B A                         
  d77f  20D2           BRA 0xd753                        

; ---- function FUN_d781
FUN_d781:
  d781  3406           PSHS  B A                         
  d783  E6A822         LDB 0x22,Y                        
LAB_d786:
  d786  E789001D       STB 0x1d,X                        
  d78a  CB20           ADDB #0x20                        
  d78c  E789001E       STB 0x1e,X                        
  d790  1703A0         LBSR 0xdb33                        ; inline[addr:DB33]: $D7A3 $0000
  d793  D7A3           dw D7A3h                          
  d795  0000           dw 0h                             
LAB_d797:
  d797  3506           PULS  A B                         
  d799  39             RTS                               

; ---- function FUN_d79a
FUN_d79a:
  d79a  3406           PSHS  B A                         
  d79c  8602           LDA #0x2                          
  d79e  170406         LBSR 0xdba7                       
  d7a1  20E3           BRA 0xd786                        

; ---- function FUN_d7a3
FUN_d7a3:
  d7a3  3406           PSHS  B A                         
  d7a5  1703B5         LBSR 0xdb5d                       
  d7a8  102603D2       LBNE 0xdb7e                       
  d7ac  C1B0           CMPB #0xb0                        
  d7ae  102603CC       LBNE 0xdb7e                       
LAB_d7b2:
  d7b2  CCD7BB         LDD #0xd7bb                       
  d7b5  ED890003       STD 0x3,X                         
  d7b9  3586           PULS  A B PC                      

; ---- function FUN_d7bb
FUN_d7bb:
  d7bb  3406           PSHS  B A                         
  d7bd  E189001D       CMPB 0x1d,X                       
  d7c1  2620           BNE 0xd7e3                        
  d7c3  CCD7CC         LDD #0xd7cc                       
  d7c6  ED890003       STD 0x3,X                         
  d7ca  3586           PULS  A B PC                      

; ---- function FUN_d7cc
FUN_d7cc:
  d7cc  3406           PSHS  B A                         
  d7ce  E789001F       STB 0x1f,X                        
LAB_d7d2:
  d7d2  A689001F       LDA 0x1f,X                        
  d7d6  E689001C       LDB 0x1c,X                        
  d7da  58             LSLB                              
  d7db  44             LSRA                              
  d7dc  56             RORB                              
  d7dd  ED890016       STD 0x16,X                        
  d7e1  20CF           BRA 0xd7b2                        
LAB_d7e3:
  d7e3  E189001E       CMPB 0x1e,X                       
  d7e7  2611           BNE 0xd7fa                        
  d7e9  CCD7F2         LDD #0xd7f2                       
  d7ec  ED890003       STD 0x3,X                         
  d7f0  3586           PULS  A B PC                      

; ---- function FUN_d7f2
FUN_d7f2:
  d7f2  3406           PSHS  B A                         
  d7f4  E789001C       STB 0x1c,X                        
  d7f8  20D8           BRA 0xd7d2                        
LAB_d7fa:
  d7fa  CCD803         LDD #0xd803                       
  d7fd  ED890003       STD 0x3,X                         
  d801  3586           PULS  A B PC                      

; ---- function FUN_d803
FUN_d803:
  d803  3406           PSHS  B A                         
  d805  20AB           BRA 0xd7b2                        

; ---- function FUN_d807
FUN_d807:
  d807  3436           PSHS  Y X B A                     
  d809  170327         LBSR 0xdb33                        ; inline[addr:DB33]: $D81B $0000
  d80c  D81B           dw D81Bh                          
  d80e  0000           dw 0h                             
LAB_d810:
  d810  3536           PULS  A B X Y                     
  d812  39             RTS                               

; ---- function FUN_d813
FUN_d813:
  d813  3406           PSHS  B A                         
  d815  17FFEF         LBSR 0xd807                       
  d818  16FD7B         LBRA 0xd596                       

; ---- function FUN_d81b
FUN_d81b:
  d81b  3406           PSHS  B A                         
  d81d  17033D         LBSR 0xdb5d                       
  d820  1026035A       LBNE 0xdb7e                       
  d824  C1E0           CMPB #0xe0                        
  d826  10260354       LBNE 0xdb7e                       
LAB_d82a:
  d82a  CCD833         LDD #0xd833                       
  d82d  ED890003       STD 0x3,X                         
  d831  3586           PULS  A B PC                      

; ---- function FUN_d833
FUN_d833:
  d833  3406           PSHS  B A                         
  d835  170163         LBSR 0xd99b                       
  d838  20F0           BRA 0xd82a                        

; ---- function FUN_d83a
FUN_d83a:
  d83a  3436           PSHS  Y X B A                     
  d83c  1702F4         LBSR 0xdb33                        ; inline[addr:DB33]: $D879 $0000
  d83f  D879           dw D879h                          
  d841  0000           dw 0h                             
LAB_d843:
  d843  C600           LDB #0x0                          
  d845  E7890021       STB 0x21,X                        
  d849  3536           PULS  A B X Y                     
  d84b  39             RTS                               

; ---- function FUN_d84c
FUN_d84c:
  d84c  3436           PSHS  Y X B A                     
  d84e  1702E2         LBSR 0xdb33                        ; inline[addr:DB33]: $D879 $0000
  d851  D879           dw D879h                          
  d853  0000           dw 0h                             
LAB_d855:
  d855  C601           LDB #0x1                          
  d857  E7890021       STB 0x21,X                        
  d85b  8602           LDA #0x2                          
  d85d  170347         LBSR 0xdba7                       
  d860  E789001D       STB 0x1d,X                        
  d864  3536           PULS  A B X Y                     
  d866  39             RTS                               

; ---- function FUN_d867
FUN_d867:
  d867  3436           PSHS  Y X B A                     
  d869  1702C7         LBSR 0xdb33                        ; inline[addr:DB33]: $D879 $0000
  d86c  D879           dw D879h                          
  d86e  0000           dw 0h                             
LAB_d870:
  d870  C602           LDB #0x2                          
  d872  E7890021       STB 0x21,X                        
  d876  3536           PULS  A B X Y                     
  d878  39             RTS                               

; ---- function FUN_d879
FUN_d879:
  d879  3406           PSHS  B A                         
  d87b  1702DF         LBSR 0xdb5d                       
  d87e  102602FC       LBNE 0xdb7e                       
  d882  C190           CMPB #0x90                        
  d884  273C           BEQ 0xd8c2                        
  d886  C180           CMPB #0x80                        
  d888  102602F2       LBNE 0xdb7e                       
LAB_d88c:
  d88c  CCD895         LDD #0xd895                       
  d88f  ED890003       STD 0x3,X                         
  d893  3586           PULS  A B PC                      

; ---- function FUN_d895
FUN_d895:
  d895  3406           PSHS  B A                         
  d897  A6890021       LDA 0x21,X                        
  d89b  8101           CMPA #0x1                         
  d89d  2606           BNE 0xd8a5                        
  d89f  E189001D       CMPB 0x1d,X                       
  d8a3  2610           BNE 0xd8b5                        
LAB_d8a5:
  d8a5  CCD8AE         LDD #0xd8ae                       
  d8a8  ED890003       STD 0x3,X                         
  d8ac  3586           PULS  A B PC                      

; ---- function FUN_d8ae
FUN_d8ae:
  d8ae  3406           PSHS  B A                         
  d8b0  1700E8         LBSR 0xd99b                       
  d8b3  20D7           BRA 0xd88c                        
LAB_d8b5:
  d8b5  CCD8BE         LDD #0xd8be                       
  d8b8  ED890003       STD 0x3,X                         
  d8bc  3586           PULS  A B PC                      

; ---- function FUN_d8be
FUN_d8be:
  d8be  3406           PSHS  B A                         
  d8c0  20CA           BRA 0xd88c                        

; ---- function FUN_d8c2
FUN_d8c2:
  d8c2  A6890021       LDA 0x21,X                        
  d8c6  8102           CMPA #0x2                         
  d8c8  261E           BNE 0xd8e8                        
  d8ca  CCD8D3         LDD #0xd8d3                       
  d8cd  ED890003       STD 0x3,X                         
  d8d1  3586           PULS  A B PC                      

; ---- function FUN_d8d3
FUN_d8d3:
  d8d3  3406           PSHS  B A                         
  d8d5  CCD8DE         LDD #0xd8de                       
  d8d8  ED890003       STD 0x3,X                         
  d8dc  3586           PULS  A B PC                      

; ---- function FUN_d8de
FUN_d8de:
  d8de  3406           PSHS  B A                         
  d8e0  5D             TSTB                              
  d8e1  27DF           BEQ 0xd8c2                        
  d8e3  1700B5         LBSR 0xd99b                       
  d8e6  20DA           BRA 0xd8c2                        
LAB_d8e8:
  d8e8  CCD8F1         LDD #0xd8f1                       
  d8eb  ED890003       STD 0x3,X                         
  d8ef  3586           PULS  A B PC                      

; ---- function FUN_d8f1
FUN_d8f1:
  d8f1  3406           PSHS  B A                         
  d8f3  CCD8FC         LDD #0xd8fc                       
  d8f6  ED890003       STD 0x3,X                         
  d8fa  3586           PULS  A B PC                      

; ---- function FUN_d8fc
FUN_d8fc:
  d8fc  3406           PSHS  B A                         
  d8fe  20C2           BRA 0xd8c2                        

; ---- function FUN_d900
FUN_d900:
  d900  3406           PSHS  B A                         
  d902  17022E         LBSR 0xdb33                        ; inline[addr:DB33]: $D913 $0000
  d905  D913           dw D913h                          
  d907  0000           dw 0h                             
LAB_d909:
  d909  CC8877         LDD #0x8877                       
  d90c  ED890003       STD 0x3,X                         
  d910  3506           PULS  A B                         
  d912  39             RTS                               
  d913  .db 39 34 06 17 02 1A D9 27 00 00 CC 88 77 ED 89 00  ; 94.....'....w...
  d923  .db 03 35 06 39 39                                   ; .5.99

; ---- function FUN_d928
FUN_d928:
  d928  3476           PSHS  U Y X B A                   
  d92a  17AE36         LBSR 0x8763                       
  d92d  FC60EB         LDD 0x60eb                        
  d930  58             LSLB                              
  d931  49             ROLA                              
  d932  58             LSLB                              
  d933  49             ROLA                              
  d934  58             LSLB                              
  d935  49             ROLA                              
  d936  3606           PSHU  B A                         
  d938  CC50C0         LDD #0x50c0                       
  d93b  3606           PSHU  B A                         
  d93d  17E3EA         LBSR 0xbd2a                       
  d940  3706           PULU  A B                         
  d942  FD60FE         STD 0x60fe                        
  d945  8D4C           BSR 0xd993                        
  d947  FC60EB         LDD 0x60eb                        
  d94a  3606           PSHU  B A                         
  d94c  CC0006         LDD #0x6                          
  d94f  3606           PSHU  B A                         
  d951  17E47D         LBSR 0xbdd1                       
  d954  CC45A9         LDD #0x45a9                       
  d957  3606           PSHU  B A                         
  d959  17E3CE         LBSR 0xbd2a                       
  d95c  3706           PULU  A B                         
  d95e  8D33           BSR 0xd993                        
  d960  FD6100         STD 0x6100                        
  d963  108E0010       LDY #0x10                         
  d967  8E6B00         LDX #0x6b00                       
LAB_d96a:
  d96a  EC890001       LDD 0x1,X                         
  d96e  1083D913       CMPD #0xd913                      
  d972  2708           BEQ 0xd97c                        
  d974  1083D927       CMPD #0xd927                      
  d978  2707           BEQ 0xd981                        
  d97a  200C           BRA 0xd988                        
LAB_d97c:
  d97c  FC60FE         LDD 0x60fe                        
  d97f  2003           BRA 0xd984                        
LAB_d981:
  d981  FC6100         LDD 0x6100                        
LAB_d984:
  d984  ED890016       STD 0x16,X                        
LAB_d988:
  d988  30890028       LEAX 0x28,X                       
  d98c  313F           LEAY -0x1,Y                       
  d98e  26DA           BNE 0xd96a                        
  d990  3576           PULS  A B X Y U                   
  d992  39             RTS                               

; ---- function FUN_d993
FUN_d993:
  d993  85C0           BITA #0xc0                        
  d995  2703           BEQ 0xd99a                        
  d997  CC3FFF         LDD #0x3fff                       
LAB_d99a:
  d99a  39             RTS                               

; ---- function FUN_d99b
FUN_d99b:
  d99b  6D890024       TST 0x24,X                        
  d99f  260A           BNE 0xd9ab                        
  d9a1  1F98           TFR B,A                           
  d9a3  5F             CLRB                              
  d9a4  44             LSRA                              
  d9a5  56             RORB                              
LAB_d9a6:
  d9a6  ED890016       STD 0x16,X                        
  d9aa  39             RTS                               
LAB_d9ab:
  d9ab  E1890019       CMPB 0x19,X                       
  d9af  2405           BCC 0xd9b6                        
  d9b1  CC0000         LDD #0x0                          
  d9b4  20F0           BRA 0xd9a6                        
LAB_d9b6:
  d9b6  CC3FFF         LDD #0x3fff                       
  d9b9  20EB           BRA 0xd9a6                        

; ---- function FUN_d9bb
FUN_d9bb:
  d9bb  3426           PSHS  Y B A                       
  d9bd  C180           CMPB #0x80                        
  d9bf  274E           BEQ 0xda0f                        
  d9c1  4D             TSTA                              
  d9c2  274B           BEQ 0xda0f                        
  d9c4  A789001C       STA 0x1c,X                        
  d9c8  108ED9D4       LDY #0xd9d4                       
  d9cc  E6890021       LDB 0x21,X                        
  d9d0  C406           ANDB #0x6                         
switchD:
  d9d2  6EB5           JMP [B,Y]                         
switchdataD_d9d4:
  d9d4  D9             ?? D9h                            
  d9d5  .db FA                                               ; .
  d9d6  D9F2           addr d9f2                         
  d9d8  D9DC           addr d9dc                         
  d9da  D9E8           addr d9e8                         

; ---- function caseD_4
caseD_4:
  d9dc  E689001D       LDB 0x1d,X                        
  d9e0  E189001F       CMPB 0x1f,X                       
  d9e4  2514           BCS 0xd9fa                        
  d9e6  200A           BRA 0xd9f2                        

; ---- function caseD_6
caseD_6:
  d9e8  E689001D       LDB 0x1d,X                        
  d9ec  E189001F       CMPB 0x1f,X                       
  d9f0  2208           BHI 0xd9fa                        

; ---- function caseD_2
caseD_2:
  d9f2  E689001E       LDB 0x1e,X                        
  d9f6  C101           CMPB #0x1                         
  d9f8  2612           BNE 0xda0c                        
caseD_0:
  d9fa  E689001F       LDB 0x1f,X                        
  d9fe  E789001D       STB 0x1d,X                        
  da02  A689001C       LDA 0x1c,X                        
  da06  A7890020       STA 0x20,X                        
  da0a  1A04           ORCC #0x4                         
LAB_da0c:
  da0c  3526           PULS  A B Y                       
  da0e  39             RTS                               
LAB_da0f:
  da0f  1CFB           ANDCC #0xfb                       
  da11  20F9           BRA 0xda0c                        

; ---- function FUN_da13
FUN_da13:
  da13  E789001C       STB 0x1c,X                        
  da17  3506           PULS  A B                         
  da19  ED89001A       STD 0x1a,X                        
  da1d  E689001C       LDB 0x1c,X                        
  da21  C180           CMPB #0x80                        
  da23  2743           BEQ 0xda68                        
  da25  C190           CMPB #0x90                        
  da27  2703           BEQ 0xda2c                        
  da29  160152         LBRA 0xdb7e                       
LAB_da2c:
  da2c  CCDA35         LDD #0xda35                       
  da2f  ED890003       STD 0x3,X                         
  da33  3586           PULS  A B PC                      

; ---- function FUN_da35
FUN_da35:
  da35  3406           PSHS  B A                         
  da37  E789001C       STB 0x1c,X                        
  da3b  CCDA44         LDD #0xda44                       
  da3e  ED890003       STD 0x3,X                         
  da42  3586           PULS  A B PC                      

; ---- function FUN_da44
FUN_da44:
  da44  3406           PSHS  B A                         
  da46  1F98           TFR B,A                           
  da48  5D             TSTB                              
  da49  2712           BEQ 0xda5d                        
  da4b  6C89001E       INC 0x1e,X                        
  da4f  E689001C       LDB 0x1c,X                        
  da53  E789001F       STB 0x1f,X                        
LAB_da57:
  da57  C690           LDB #0x90                         
  da59  6E99001A       JMP [0x1a,X]                      
LAB_da5d:
  da5d  C602           LDB #0x2                          
  da5f  F5619D         BITB 0x619d                       
  da62  27F3           BEQ 0xda57                        
  da64  8D27           BSR 0xda8d                        
  da66  20EF           BRA 0xda57                        
LAB_da68:
  da68  CCDA71         LDD #0xda71                       
  da6b  ED890003       STD 0x3,X                         
  da6f  3586           PULS  A B PC                      

; ---- function FUN_da71
FUN_da71:
  da71  3406           PSHS  B A                         
  da73  CCDA7C         LDD #0xda7c                       
  da76  ED890003       STD 0x3,X                         
  da7a  3586           PULS  A B PC                      

; ---- function FUN_da7c
FUN_da7c:
  da7c  3406           PSHS  B A                         
  da7e  C601           LDB #0x1                          
  da80  F5619D         BITB 0x619d                       
  da83  2702           BEQ 0xda87                        
  da85  8D06           BSR 0xda8d                        
LAB_da87:
  da87  C680           LDB #0x80                         
  da89  6E99001A       JMP [0x1a,X]                      

; ---- function FUN_da8d
FUN_da8d:
  da8d  6D89001E       TST 0x1e,X                        
  da91  2704           BEQ 0xda97                        
  da93  6A89001E       DEC 0x1e,X                        
LAB_da97:
  da97  39             RTS                               

; ---- function FUN_da98
FUN_da98:
  da98  3506           PULS  A B                         
  da9a  ED89001A       STD 0x1a,X                        
  da9e  CCDAA7         LDD #0xdaa7                       
  daa1  ED890003       STD 0x3,X                         
  daa5  3586           PULS  A B PC                      

; ---- function FUN_daa7
FUN_daa7:
  daa7  3406           PSHS  B A                         
  daa9  E789001C       STB 0x1c,X                        
  daad  CCDAB6         LDD #0xdab6                       
  dab0  ED890003       STD 0x3,X                         
  dab4  3586           PULS  A B PC                      

; ---- function FUN_dab6
FUN_dab6:
  dab6  3406           PSHS  B A                         
  dab8  1F98           TFR B,A                           
  daba  E689001C       LDB 0x1c,X                        
  dabe  58             LSLB                              
  dabf  44             LSRA                              
  dac0  56             RORB                              
  dac1  10830000       CMPD #0x0                         
  dac5  2603           BNE 0xdaca                        
  dac7  CC0001         LDD #0x1                          
LAB_daca:
  daca  6E99001A       JMP [0x1a,X]                      

; ---- function FUN_dace
FUN_dace:
  dace  10830000       CMPD #0x0                         
  dad2  2603           BNE 0xdad7                        
  dad4  CC0001         LDD #0x1                          
LAB_dad7:
  dad7  832000         SUBD #0x2000                      
  dada  3606           PSHU  B A                         
  dadc  EC890024       LDD 0x24,X                        
  dae0  3606           PSHU  B A                         
  dae2  17E245         LBSR 0xbd2a                       
  dae5  3706           PULU  A B                         
  dae7  ED890022       STD 0x22,X                        

; ---- function FUN_daeb
FUN_daeb:
  daeb  A689001D       LDA 0x1d,X                        
  daef  5F             CLRB                              
  daf0  44             LSRA                              
  daf1  56             RORB                              
  daf2  6D890021       TST 0x21,X                        
  daf6  2B11           BMI 0xdb09                        
  daf8  E3890022       ADDD 0x22,X                       
  dafc  2A03           BPL 0xdb01                        
  dafe  CC0000         LDD #0x0                          
LAB_db01:
  db01  8540           BITA #0x40                        
  db03  2703           BEQ 0xdb08                        
  db05  CC3FFF         LDD #0x3fff                       
LAB_db08:
  db08  39             RTS                               
LAB_db09:
  db09  E3890022       ADDD 0x22,X                       
  db0d  39             RTS                               

; ---- function FUN_db0e
FUN_db0e:
  db0e  3406           PSHS  B A                         
  db10  8602           LDA #0x2                          
  db12  170092         LBSR 0xdba7                       
  db15  1F98           TFR B,A                           
  db17  5F             CLRB                              
  db18  44             LSRA                              
  db19  56             RORB                              
  db1a  3606           PSHU  B A                         
  db1c  17E391         LBSR 0xbeb0                        ; inline[API_FE20]: interp table, 5 points
  db1f  02             db 2h                             
  db20  00000CCD199A.. dw[5]                             
LAB_db2a:
  db2a  3706           PULU  A B                         
  db2c  ED890024       STD 0x24,X                        
  db30  3506           PULS  A B                         
  db32  39             RTS                               

; ---- function FUN_db33
FUN_db33:
  db33  3426           PSHS  Y B A                       
  db35  10AE64         LDY 0x4,S                         
  db38  ECA1           LDD ,Y++                          
  db3a  ED890001       STD 0x1,X                         
  db3e  ECA1           LDD ,Y++                          
  db40  ED890016       STD 0x16,X                        
  db44  10AF64         STY 0x4,S                         
  db47  8601           LDA #0x1                          
  db49  17005B         LBSR 0xdba7                       
  db4c  C40F           ANDB #0xf                         
  db4e  E7890018       STB 0x18,X                        
  db52  6F890021       CLR 0x21,X                        
  db56  6F890024       CLR 0x24,X                        
  db5a  3526           PULS  A B Y                       
  db5c  39             RTS                               

; ---- function FUN_db5d
FUN_db5d:
  db5d  3404           PSHS  B                           
  db5f  1F98           TFR B,A                           
  db61  C4F0           ANDB #0xf0                        
  db63  7D608A         TST 0x608a                        
  db66  2B11           BMI 0xdb79                        
  db68  840F           ANDA #0xf                         
  db6a  A7E4           STA ,S                            
  db6c  B6608A         LDA 0x608a                        
  db6f  AB890018       ADDA 0x18,X                       
  db73  840F           ANDA #0xf                         
  db75  A1E4           CMPA ,S                           
  db77  2002           BRA 0xdb7b                        
LAB_db79:
  db79  1A04           ORCC #0x4                         
LAB_db7b:
  db7b  3261           LEAS 0x1,S                        
  db7d  39             RTS                               

; ---- function FUN_db7e
FUN_db7e:
  db7e  CC8877         LDD #0x8877                       
  db81  ED890003       STD 0x3,X                         
  db85  3506           PULS  A B                         
  db87  39             RTS                               

; ---- function FUN_db88
FUN_db88:
  db88  3406           PSHS  B A                         
  db8a  108ECDD6       LDY #0xcdd6                       
  db8e  8600           LDA #0x0                          
  db90  170014         LBSR 0xdba7                       
  db93  170008         LBSR 0xdb9e                       
  db96  8624           LDA #0x24                         
  db98  3D             MUL                               
  db99  31AB           LEAY D,Y                          
  db9b  3506           PULS  A B                         
  db9d  39             RTS                               

; ---- function FUN_db9e
FUN_db9e:
  db9e  C43F           ANDB #0x3f                        
  dba0  C12B           CMPB #0x2b                        
  dba2  2302           BLS 0xdba6                        
  dba4  C62B           LDB #0x2b                         
LAB_dba6:
  dba6  39             RTS                               

; ---- function FUN_dba7
FUN_dba7:
  dba7  3412           PSHS  X A                         
  dba9  AB890013       ADDA 0x13,X                       
  dbad  8E0000         LDX #0x0                          
  dbb0  3086           LEAX A,X                          
  dbb2  17C5E1         LBSR 0xa196                       
  dbb5  3512           PULS  A X                         
  dbb7  39             RTS                               

; ---- function FUN_dbb8
FUN_dbb8:
  dbb8  3430           PSHS  Y X                         
  dbba  3402           PSHS  A                           
  dbbc  AB890013       ADDA 0x13,X                       
  dbc0  108E0000       LDY #0x0                          
  dbc4  31A6           LEAY A,Y                          
  dbc6  17C606         LBSR 0xa1cf                       
  dbc9  3502           PULS  A                           
  dbcb  3530           PULS  X Y                         
  dbcd  39             RTS                               

; ---- function API_FD86
API_FD86:
  dbce  3406           PSHS  B A                         
  dbd0  3410           PSHS  X                           
  dbd2  E6890013       LDB 0x13,X                        
  dbd6  4F             CLRA                              
  dbd7  1F01           TFR D,X                           
  dbd9  17C5BA         LBSR 0xa196                       
  dbdc  AEE4           LDX ,S                            
  dbde  CC8877         LDD #0x8877                       
  dbe1  ED890001       STD 0x1,X                         
  dbe5  ED890003       STD 0x3,X                         
  dbe9  17F81A         LBSR 0xd406                       
  dbec  3510           PULS  X                           
  dbee  3506           PULS  A B                         
  dbf0  39             RTS                               

; ---- function FUN_dbf1
FUN_dbf1:
  dbf1  3416           PSHS  X B A                       
  dbf3  17CA7C         LBSR 0xa672                       
  dbf6  CC9C7A         LDD #0x9c7a                       
  dbf9  FD6030         STD 0x6030                        
  dbfc  CC0000         LDD #0x0                          
  dbff  F76195         STB 0x6195                        
  dc02  FD6196         STD 0x6196                        
  dc05  FD6074         STD 0x6074                        
  dc08  170003         LBSR 0xdc0e                       
  dc0b  3516           PULS  A B X                       
  dc0d  39             RTS                               

; ---- function FUN_dc0e
FUN_dc0e:
  dc0e  3416           PSHS  X B A                       
  dc10  17CA5F         LBSR 0xa672                       
  dc13  F66195         LDB 0x6195                        
  dc16  4F             CLRA                              
  dc17  FD6074         STD 0x6074                        
  dc1a  17B1DF         LBSR 0x8dfc                        ; inline[API_FC16]: 01 20 02 96 01 00 03 00 $000F $0000 $0000 ->$8877 ->$DC4E $0001 $0001 $0000
  dc1d  01             db 1h                             
  dc1e  20             db 20h                            
  dc1f  02             db 2h                             
  dc20  96             db 96h                            
  dc21  01             db 1h                             
  dc22  00             db 0h                             
  dc23  03             db 3h                             
  dc24  00             db 0h                             
  dc25  000F           dw Fh                             
  dc27  0000           dw 0h                             
  dc29  0000           dw 0h                             
  dc2b  8877           addr 8877                         
  dc2d  DC4E           addr dc4e                         
  dc2f  0001           dw 1h                             
  dc31  0001           dw 1h                             
  dc33  0000           dw 0h                             
LAB_dc35:
  dc35  170086         LBSR 0xdcbe                       
  dc38  C600           LDB #0x0                          
  dc3a  17CA90         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$DC0E "( Parmtr )"
  dc3d  DC0E           addr dc0e                         
  dc3f  28205061726D.. ds "( Parmtr )"                   
LAB_dc49:
  dc49  8D03           BSR 0xdc4e                        
  dc4b  3516           PULS  A B X                       
  dc4d  39             RTS                               

; ---- function FUN_dc4e
FUN_dc4e:
  dc4e  3436           PSHS  Y X B A                     
  dc50  FC6074         LDD 0x6074                        
  dc53  8D2D           BSR 0xdc82                        
  dc55  FD6074         STD 0x6074                        
  dc58  17B0C8         LBSR 0x8d23                       
  dc5b  170072         LBSR 0xdcd0                       
  dc5e  F76195         STB 0x6195                        
  dc61  BF6196         STX 0x6196                        
  dc64  3404           PSHS  B                           
  dc66  5F             CLRB                              
  dc67  17BA71         LBSR 0x96db                       
  dc6a  17003F         LBSR 0xdcac                       
  dc6d  3504           PULS  B                           
  dc6f  AD990005       JSR [0x5,X]                       
  dc73  AD990007       JSR [0x7,X]                       
  dc77  1709B9         LBSR 0xe633                       
  dc7a  C600           LDB #0x0                          
  dc7c  170971         LBSR 0xe5f0                       
  dc7f  3536           PULS  A B X Y                     
  dc81  39             RTS                               

; ---- function FUN_dc82
FUN_dc82:
  dc82  3412           PSHS  X A                         
  dc84  B660E2         LDA 0x60e2                        
  dc87  3402           PSHS  A                           
  dc89  860F           LDA #0xf                          
LAB_dc8b:
  dc8b  C40F           ANDB #0xf                         
  dc8d  8D41           BSR 0xdcd0                        
  dc8f  6D890000       TST 0x0,X                         
  dc93  2612           BNE 0xdca7                        
  dc95  6DE4           TST ,S                            
  dc97  250B           BCS 0xdca4                        
  dc99  5C             INCB                              
  dc9a  C110           CMPB #0x10                        
  dc9c  26ED           BNE 0xdc8b                        
  dc9e  60E4           NEG ,S                            
  dca0  C60F           LDB #0xf                          
  dca2  20E7           BRA 0xdc8b                        
LAB_dca4:
  dca4  5A             DECB                              
  dca5  20E4           BRA 0xdc8b                        
LAB_dca7:
  dca7  3502           PULS  A                           
  dca9  3512           PULS  A X                         
  dcab  39             RTS                               

; ---- function FUN_dcac
FUN_dcac:
  dcac  3416           PSHS  X B A                       
  dcae  BE6196         LDX 0x6196                        
  dcb1  30890009       LEAX 0x9,X                        
  dcb5  CC0008         LDD #0x8                          
  dcb8  17BAA2         LBSR 0x975d                       
  dcbb  3516           PULS  A B X                       
  dcbd  39             RTS                               

; ---- function FUN_dcbe
FUN_dcbe:
  dcbe  17BA2C         LBSR 0x96ed                        ; inline[API_FC38]: "{1}         -> "
  dcc1  012020202020.. char[14] 01h,"         -> "       
LAB_dccf:
  dccf  39             RTS                               

; ---- function FUN_dcd0
FUN_dcd0:
  dcd0  3407           PSHS  B A CC                      
  dcd2  8628           LDA #0x28                         
  dcd4  3D             MUL                               
  dcd5  8E6B00         LDX #0x6b00                       
  dcd8  308B           LEAX D,X                          
  dcda  3507           PULS CC A B                       
  dcdc  39             RTS                               

; ---- function FUN_dcdd
FUN_dcdd:
  dcdd  3436           PSHS  Y X B A                     
  dcdf  108E60A4       LDY #0x60a4                       
  dce3  17E276         LBSR 0xbf5c                        ; inline[API_FD0C]: $0009 20
  dce6  0009           dw 9h                             
  dce8  20             db 20h                            
LAB_dce9:
  dce9  8EDD35         LDX #0xdd35                       
LAB_dcec:
  dcec  E184           CMPB ,X                           
  dcee  2612           BNE 0xdd02                        
  dcf0  3406           PSHS  B A                         
  dcf2  3001           LEAX 0x1,X                        
  dcf4  108E60A6       LDY #0x60a6                       
  dcf8  CC0005         LDD #0x5                          
  dcfb  17E214         LBSR 0xbf12                       
  dcfe  3506           PULS  A B                         
  dd00  2009           BRA 0xdd0b                        
LAB_dd02:
  dd02  30890006       LEAX 0x6,X                        
  dd06  8CDD9B         CMPX #0xdd9b                      
  dd09  26E1           BNE 0xdcec                        
LAB_dd0b:
  dd0b  4F             CLRA                              
  dd0c  3606           PSHU  B A                         
  dd0e  CC000C         LDD #0xc                          
  dd11  3606           PSHU  B A                         
  dd13  17DF8E         LBSR 0xbca4                       
  dd16  3706           PULU  A B                         
  dd18  8EDD9B         LDX #0xdd9b                       
  dd1b  E68B           LDB D,X                           
  dd1d  F760AD         STB 0x60ad                        
  dd20  3706           PULU  A B                         
  dd22  8EDDA6         LDX #0xdda6                       
  dd25  58             LSLB                              
  dd26  308B           LEAX D,X                          
  dd28  E680           LDB ,X+                           
  dd2a  F760AB         STB 0x60ab                        
  dd2d  E684           LDB ,X                            
  dd2f  F760AC         STB 0x60ac                        
  dd32  3536           PULS  A B X Y                     
  dd34  39             RTS                               
DAT_dd35:
  dd35  3C             undefined1 3Ch                    
  dd36  .db 4D 69 64 2E 20                                   ; Mid. 
DAT_dd3b:
  dd3b  45             undefined1 45h                    
  dd3c  .db 41 34 34 30 20 51 41 38 38 30 20 5D 41 31 37 36  ; A440 QA880 ]A176
  dd4c  .db 30 69 41 33 35 32 30 75 41 37 30 34 30 39 41 32  ; 0iA3520uA70409A2
  dd5c  .db 32 30 20 2D 41 31 31 30 20 21 41 35 35 20 20 15  ; 20 -A110 !A55  .
  dd6c  4132372E3509.. ds "A27.5\tA13.70TenorHTreb.7Fidl.0Gamt."
  dd90  .db 42 6F 74 2E 20 7F 54 6F 70 20 20                 ; Bot. .Top  
DAT_dd9b:
  dd9b  78             ?? 78h    x                       
  dd9c  .db 30 31 32 33 34 35 36 37 38 39                    ; 0123456789
DAT_dda6:
  dda6  20             ?? 20h                            
DAT_dda7:
  dda7  43             ?? 43h    C                       
  dda8  .db 43 23 20 44 44 23 20 45 20 46 46 23 20 47 47 23  ; C# DD# E FF# GG#
  ddb8  .db 20 41 41 23 20 42                                ;  AA# B

; ---- function FUN_ddbe
FUN_ddbe:
  ddbe  3404           PSHS  B                           
  ddc0  F660B9         LDB 0x60b9                        
  ddc3  17C907         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$DDD5 "(MIDI-Mon)"
  ddc6  DDD5           addr ddd5                         
  ddc8  284D4944492D.. ds "(MIDI-Mon)"                   
LAB_ddd2:
  ddd2  3504           PULS  B                           
  ddd4  39             RTS                               

; ---- function FUN_ddd5
FUN_ddd5:
  ddd5  3436           PSHS  Y X B A                     
  ddd7  C600           LDB #0x0                          
  ddd9  17B8FF         LBSR 0x96db                       
  dddc  17B90E         LBSR 0x96ed                        ; inline[API_FC38]: "{1}MIDI Input in Hex, Bypass to Esc "
  dddf  014D49444920.. char[35] 01h,"MIDI Input in Hex, Bypass to Esc "
LAB_de02:
  de02  17B760         LBSR 0x9565                       
  de05  108E6A80       LDY #0x6a80                       
  de09  17E150         LBSR 0xbf5c                        ; inline[API_FD0C]: $0050 20
  de0c  0050           dw 50h                            
  de0e  20             db 20h                            
LAB_de0f:
  de0f  CCDE75         LDD #0xde75                       
  de12  FD608B         STD 0x608b                        
  de15  FD60F2         STD 0x60f2                        
  de18  17B733         LBSR 0x954e                       
  de1b  1CAF           ANDCC #0xaf                       
LAB_de1d:
  de1d  17B233         LBSR 0x9053                       
  de20  2747           BEQ 0xde69                        
  de22  17B79F         LBSR 0x95c4                       
  de25  26F6           BNE 0xde1d                        
  de27  3404           PSHS  B                           
  de29  8E6A83         LDX #0x6a83                       
  de2c  108E6A80       LDY #0x6a80                       
  de30  CC0025         LDD #0x25                         
  de33  17E0DC         LBSR 0xbf12                       
  de36  3504           PULS  B                           
  de38  17BAC6         LBSR 0x9901                       
  de3b  F76AA7         STB 0x6aa7                        
  de3e  B76AA6         STA 0x6aa6                        
  de41  8620           LDA #0x20                         
  de43  B76AA5         STA 0x6aa5                        
  de46  C628           LDB #0x28                         
  de48  17B890         LBSR 0x96db                       
  de4b  8E6A80         LDX #0x6a80                       
  de4e  C628           LDB #0x28                         
  de50  17B90A         LBSR 0x975d                       
  de53  17A90D         LBSR 0x8763                       
  de56  FC60EB         LDD 0x60eb                        
  de59  3606           PSHU  B A                         
  de5b  17B88F         LBSR 0x96ed                        ; inline[API_FC38]: "{2:21}{4:2000}{3:60A7}"
  de5e  022104200003.. char[9] 02h,"!",04h," "           
LAB_de67:
  de67  20B4           BRA 0xde1d                        
LAB_de69:
  de69  CC8601         LDD #0x8601                       
  de6c  FD60F2         STD 0x60f2                        
  de6f  3536           PULS  A B X Y                     
  de71  17BD1B         LBSR 0x9b8f                       
  de74  39             RTS                               

; ---- function FUN_de75
FUN_de75:
  de75  3404           PSHS  B                           
  de77  17A79E         LBSR 0x8618                       
  de7a  3504           PULS  B                           
  de7c  17A8CF         LBSR 0x874e                       
  de7f  39             RTS                               

; ---- function FUN_de80
FUN_de80:
  de80  3477           PSHS  U Y X B A CC                
  de82  17C897         LBSR 0xa71c                       
  de85  17C7A1         LBSR 0xa629                       
  de88  CC6980         LDD #0x6980                       
  de8b  17BCE2         LBSR 0x9b70                       
  de8e  3577           PULS CC A B X Y U                 
  de90  39             RTS                               

; ---- function FUN_de91
FUN_de91:
  de91  3406           PSHS  B A                         
  de93  C690           LDB #0x90                         
  de95  F760FB         STB 0x60fb                        
  de98  17C78E         LBSR 0xa629                       
  de9b  17B84F         LBSR 0x96ed                        ; inline[API_FC38]: "{1}{2:06} Adjust Contrast With Knob. "
  de9e  010206204164.. char[32] 01h,02h,06h," Adjust Contrast With Knob. "
LAB_debe:
  debe  17007F         LBSR 0xdf40                       
  dec1  CC9C05         LDD #0x9c05                       
  dec4  FD6030         STD 0x6030                        
  dec7  CC9BE2         LDD #0x9be2                       
  deca  FD6036         STD 0x6036                        
  decd  3506           PULS  A B                         
  decf  39             RTS                               

; ---- function API_FC86
API_FC86:
  ded0  3436           PSHS  Y X B A                     
  ded2  8EDEE2         LDX #0xdee2                       
  ded5  108E6980       LDY #0x6980                       
  ded9  CC005E         LDD #0x5e                         
  dedc  17E033         LBSR 0xbf12                       
  dedf  3536           PULS  A B X Y                     
  dee1  39             RTS                               
  dee2  8877DE918877.. addr[46]                          
  df3e  .db FF FF                                            ; ..

; ---- function FUN_df40
FUN_df40:
  df40  3436           PSHS  Y X B A                     
  df42  8E0103         LDX #0x103                        
  df45  17C24E         LBSR 0xa196                       
  df48  4F             CLRA                              
  df49  3404           PSHS  B                           
  df4b  C63F           LDB #0x3f                         
  df4d  E0E0           SUBB ,S+                          
  df4f  FD6074         STD 0x6074                        
  df52  17AEA7         LBSR 0x8dfc                        ; inline[API_FC16]: 01 08 02 0A 00 00 03 00 $003F $0000 $0000 ->$8877 ->$DF70 $0001 $0001 $0000
  df55  01             db 1h                             
  df56  08             db 8h                             
  df57  02             db 2h                             
  df58  0A             db Ah                             
  df59  00             db 0h                             
  df5a  00             db 0h                             
  df5b  03             db 3h                             
  df5c  00             db 0h                             
  df5d  003F           dw 3Fh                            
  df5f  0000           dw 0h                             
  df61  0000           dw 0h                             
  df63  8877           addr 8877                         
  df65  DF70           addr df70                         
  df67  0001           dw 1h                             
  df69  0001           dw 1h                             
  df6b  0000           dw 0h                             
LAB_df6d:
  df6d  3536           PULS  A B X Y                     
  df6f  39             RTS                               

; ---- function FUN_df70
FUN_df70:
  df70  3436           PSHS  Y X B A                     
  df72  FC6074         LDD 0x6074                        
  df75  3404           PSHS  B                           
  df77  C63F           LDB #0x3f                         
  df79  E0E0           SUBB ,S+                          
  df7b  17B9C1         LBSR 0x993f                       
  df7e  17B76C         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}[{(<-{2:22}-~>)}]{2:28}[{(<-:**************************:-~>)}]"
  df81  02005B7B283C.. char[59] 02h                      
LAB_dfbc:
  dfbc  3536           PULS  A B X Y                     
  dfbe  39             RTS                               

; ---- function FUN_dfbf
FUN_dfbf:
  dfbf  3406           PSHS  B A                         
  dfc1  C691           LDB #0x91                         
  dfc3  F760FB         STB 0x60fb                        
  dfc6  17C660         LBSR 0xa629                       
  dfc9  17B721         LBSR 0x96ed                        ; inline[API_FC38]: "{1}MIDI Modulation of Parameters "
  dfcc  014D49444920.. char[32] 01h,"MIDI Modulation of Parameters "
LAB_dfec:
  dfec  CC9C05         LDD #0x9c05                       
  dfef  FD6030         STD 0x6030                        
  dff2  CC9BE2         LDD #0x9be2                       
  dff5  FD6036         STD 0x6036                        
  dff8  3506           PULS  A B                         
  dffa  39             RTS                               

; ---- function FUN_dffb
FUN_dffb:
  dffb  3404           PSHS  B                           
  dffd  F660B9         LDB 0x60b9                        
  e000  17C6CA         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$DBF1 "(MIDI-Mod)"
  e003  DBF1           addr dbf1                         
  e005  284D4944492D.. ds "(MIDI-Mod)"                   
LAB_e00f:
  e00f  3504           PULS  B                           
  e011  39             RTS                               

; ---- function FUN_e012
FUN_e012:
  e012  3436           PSHS  Y X B A                     
  e014  F660B9         LDB 0x60b9                        
  e017  17C6B3         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$E036 "( Mod=   )"
  e01a  E036           addr e036                         
  e01c  28204D6F643D.. ds "( Mod=   )"                   

; ---- function FUN_e026
FUN_e026:
  e026  170F5C         LBSR 0xef85                       
  e029  CB06           ADDB #0x6                         
  e02b  1F98           TFR B,A                           
  e02d  F660FC         LDB 0x60fc                        
  e030  170EE2         LBSR 0xef15                       
  e033  3536           PULS  A B X Y                     
  e035  39             RTS                               

; ---- function FUN_e036
FUN_e036:
  e036  3436           PSHS  Y X B A                     
  e038  F660FC         LDB 0x60fc                        
  e03b  170F19         LBSR 0xef57                       
  e03e  F760FC         STB 0x60fc                        
  e041  170EE8         LBSR 0xef2c                       
  e044  17B6A6         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}Modulation by MIDI {6}"
  e047  020005284D6F.. char[25] 02h                      
LAB_e060:
  e060  108E0111       LDY #0x111                        
  e064  17C168         LBSR 0xa1cf                       
  e067  20BD           BRA 0xe026                        

; ---- function FUN_e069
FUN_e069:
  e069  3404           PSHS  B                           
  e06b  F660B9         LDB 0x60b9                        
  e06e  17C65C         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$E080 "(ModReset)"
  e071  E080           addr e080                         
  e073  284D6F645265.. ds "(ModReset)"                   
LAB_e07d:
  e07d  3504           PULS  B                           
  e07f  39             RTS                               

; ---- function FUN_e080
FUN_e080:
  e080  3406           PSHS  B A                         
  e082  17E874         LBSR 0xc8f9                       
  e085  17B665         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}MIDI Modulation has been Reset "
  e088  020005284D49.. char[36] 02h                      
LAB_e0ac:
  e0ac  3506           PULS  A B                         
  e0ae  39             RTS                               

; ---- function FUN_e0af
FUN_e0af:
  e0af  3404           PSHS  B                           
  e0b1  F660B9         LDB 0x60b9                        
  e0b4  17C616         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$C4FE "          "
  e0b7  C4FE           addr c4fe                         
  e0b9  202020202020.. ds "          "                   
LAB_e0c3:
  e0c3  3504           PULS  B                           
  e0c5  39             RTS                               

; ---- function FUN_e0c6
FUN_e0c6:
  e0c6  3416           PSHS  X B A                       
  e0c8  8E010C         LDX #0x10c                        
  e0cb  17C0C8         LBSR 0xa196                       
  e0ce  F7608A         STB 0x608a                        
  e0d1  3516           PULS  A B X                       
  e0d3  39             RTS                               

; ---- function FUN_e0d4
FUN_e0d4:
  e0d4  3406           PSHS  B A                         
  e0d6  C692           LDB #0x92                         
  e0d8  F760FB         STB 0x60fb                        
  e0db  17C54B         LBSR 0xa629                       
  e0de  17B60C         LBSR 0x96ed                        ; inline[API_FC38]: "{1}MIDI System Functions "
  e0e1  014D49444920.. char[24] 01h,"MIDI System Functions "
LAB_e0f9:
  e0f9  CC9C05         LDD #0x9c05                       
  e0fc  FD6030         STD 0x6030                        
  e0ff  CC9BE2         LDD #0x9be2                       
  e102  FD6036         STD 0x6036                        
  e105  3506           PULS  A B                         
  e107  39             RTS                               

; ---- function FUN_e108
FUN_e108:
  e108  3406           PSHS  B A                         
  e10a  F660B9         LDB 0x60b9                        
  e10d  17C5BD         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$E136 "(Base=   )"
  e110  E136           addr e136                         
  e112  28426173653D.. ds "(Base=   )"                   
LAB_e11c:
  e11c  F6608A         LDB 0x608a                        
  e11f  4F             CLRA                              
  e120  C40F           ANDB #0xf                         
  e122  C30001         ADDD #0x1                         
  e125  3606           PSHU  B A                         
  e127  17B5C3         LBSR 0x96ed                        ; inline[API_FC38]: "{2:2F}{4:2000}{3:60AB}"
  e12a  022F04200003.. char[9] 02h,"/",04h," "           
LAB_e133:
  e133  3506           PULS  A B                         
  e135  39             RTS                               

; ---- function FUN_e136
FUN_e136:
  e136  3406           PSHS  B A                         
  e138  C692           LDB #0x92                         
  e13a  F760FB         STB 0x60fb                        
  e13d  1704F3         LBSR 0xe633                       
  e140  F660B9         LDB 0x60b9                        
  e143  1704AA         LBSR 0xe5f0                       
  e146  F6608A         LDB 0x608a                        
  e149  C40F           ANDB #0xf                         
  e14b  4F             CLRA                              
  e14c  C30001         ADDD #0x1                         
  e14f  FD6074         STD 0x6074                        
  e152  17ACA7         LBSR 0x8dfc                        ; inline[API_FC16]: 01 10 02 64 01 00 02 00 $0010 $0001 $0000 ->$E172 ->$E199 $0001 $0001 $0000
  e155  01             db 1h                             
  e156  10             db 10h                            
  e157  02             db 2h                             
  e158  64             db 64h                            
  e159  01             db 1h                             
  e15a  00             db 0h                             
  e15b  02             db 2h                             
  e15c  00             db 0h                             
  e15d  0010           dw 10h                            
  e15f  0001           dw 1h                             
  e161  0000           dw 0h                             
  e163  E172           addr e172                         
  e165  E199           addr e199                         
  e167  0001           dw 1h                             
WORD_e169:
  e169  0001           dw 1h                             
  e16b  0000           dw 0h                             
LAB_e16d:
  e16d  8D03           BSR 0xe172                        
  e16f  3506           PULS  A B                         
  e171  39             RTS                               

; ---- function FUN_e172
FUN_e172:
  e172  17B578         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}MIDI Base Channel = {5:14}{2:14}{3:60A1}{2:2F}{3:60A1}"
  e175  02004D494449.. char[35] 02h                      
LAB_e198:
  e198  39             RTS                               

; ---- function FUN_e199
FUN_e199:
  e199  3426           PSHS  Y B A                       
  e19b  F6608A         LDB 0x608a                        
  e19e  C4F0           ANDB #0xf0                        
  e1a0  3404           PSHS  B                           
  e1a2  F66075         LDB 0x6075                        
  e1a5  5A             DECB                              
  e1a6  C40F           ANDB #0xf                         
  e1a8  EAE0           ORB ,S+                           
  e1aa  F7608A         STB 0x608a                        
  e1ad  108E010C       LDY #0x10c                        
  e1b1  17C01B         LBSR 0xa1cf                       
  e1b4  3526           PULS  A B Y                       
  e1b6  39             RTS                               

; ---- function FUN_e1b7
FUN_e1b7:
  e1b7  3404           PSHS  B                           
  e1b9  F660B9         LDB 0x60b9                        
  e1bc  17C50E         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$E1DB "( MIDI=  )"
  e1bf  E1DB           addr e1db                         
  e1c1  28204D494449.. ds "( MIDI=  )"                   
LAB_e1cb:
  e1cb  170DB7         LBSR 0xef85                       
  e1ce  CB07           ADDB #0x7                         
  e1d0  1F98           TFR B,A                           
  e1d2  F6619C         LDB 0x619c                        
  e1d5  170D3D         LBSR 0xef15                       
  e1d8  3504           PULS  B                           
  e1da  39             RTS                               

; ---- function FUN_e1db
FUN_e1db:
  e1db  3436           PSHS  Y X B A                     
  e1dd  F6619C         LDB 0x619c                        
  e1e0  170D74         LBSR 0xef57                       
  e1e3  F7619C         STB 0x619c                        
  e1e6  170D43         LBSR 0xef2c                       
  e1e9  17B501         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}All MIDI input {6}"
  e1ec  02000528416C.. char[21] 02h                      
LAB_e201:
  e201  108E0116       LDY #0x116                        
  e205  17BFC7         LBSR 0xa1cf                       
  e208  8DAD           BSR 0xe1b7                        
  e20a  3536           PULS  A B X Y                     
  e20c  39             RTS                               

; ---- function FUN_e20d
FUN_e20d:
  e20d  3426           PSHS  Y B A                       
  e20f  F660B9         LDB 0x60b9                        
  e212  17C4B8         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$E235 "(Omni=   )"
  e215  E235           addr e235                         
  e217  284F6D6E693D.. ds "(Omni=   )"                   

; ---- function FUN_e221
FUN_e221:
  e221  F6608A         LDB 0x608a                        
  e224  C480           ANDB #0x80                        
  e226  170D37         LBSR 0xef60                       
  e229  17B4C1         LBSR 0x96ed                        ; inline[API_FC38]: "{2:38}{5:03}{6}"
  e22c  023805030600   char[6] 02h,"8",05h,03h,06h       
LAB_e232:
  e232  3526           PULS  A B Y                       
  e234  39             RTS                               

; ---- function FUN_e235
FUN_e235:
  e235  3426           PSHS  Y B A                       
  e237  F6608A         LDB 0x608a                        
  e23a  C880           EORB #0x80                        
  e23c  F7608A         STB 0x608a                        
  e23f  3404           PSHS  B                           
  e241  .db C4                                               ; .

; ---- function FUN_e242
FUN_e242:
  e242  8017           SUBA #0x17                        
  e244  0D1A           TST <0x1a                         
  e246  17B4A4         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}We are now in Omni {6} Mode "
  e249  020005285765.. char[31] 02h                      
LAB_e268:
  e268  3504           PULS  B                           
  e26a  108E010C       LDY #0x10c                        
  e26e  17BF5E         LBSR 0xa1cf                       
  e271  20AE           BRA 0xe221                        

; ---- function FUN_e273
FUN_e273:
  e273  3404           PSHS  B                           
  e275  F660B9         LDB 0x60b9                        
  e278  17C452         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$E28A "( Expert )"
  e27b  E28A           addr e28a                         
  e27d  282045787065.. ds "( Expert )"                   
LAB_e287:
  e287  3504           PULS  B                           
  e289  39             RTS                               

; ---- function FUN_e28a
FUN_e28a:
  e28a  3406           PSHS  B A                         
  e28c  CCE295         LDD #0xe295                       
  e28f  17B994         LBSR 0x9c26                       
  e292  3506           PULS  A B                         
  e294  39             RTS                               
  e295  8877E2A3E2C9.. addr[6]                           
  e2a1  .db FF FF                                            ; ..

; ---- function FUN_e2a3
FUN_e2a3:
  e2a3  3406           PSHS  B A                         
  e2a5  17B445         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Expert MIDI Functions "
  e2a8  014578706572.. char[24] 01h,"Expert MIDI Functions "
LAB_e2c0:
  e2c0  CC9C52         LDD #0x9c52                       
  e2c3  FD6030         STD 0x6030                        
  e2c6  3506           PULS  A B                         
  e2c8  39             RTS                               

; ---- function FUN_e2c9
FUN_e2c9:
  e2c9  3406           PSHS  B A                         
  e2cb  C6A0           LDB #0xa0                         
  e2cd  171BB0         LBSR 0xfe80                       
  e2d0  F660B9         LDB 0x60b9                        
  e2d3  17C3F7         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$E2FC "(Dev =   )"
  e2d6  E2FC           addr e2fc                         
  e2d8  28446576203D.. ds "(Dev =   )"                   
LAB_e2e2:
  e2e2  F60110         LDB 0x0110                        
  e2e5  4F             CLRA                              
  e2e6  C4FF           ANDB #0xff                        
  e2e8  3606           PSHU  B A                         
  e2ea  17B400         LBSR 0x96ed                        ; inline[API_FC38]: "{2:2F}{4:2000}{3:60AB}"
  e2ed  022F04200003.. char[9] 02h,"/",04h," "           
LAB_e2f6:
  e2f6  171BA1         LBSR 0xfe9a                       
  e2f9  3506           PULS  A B                         
  e2fb  39             RTS                               

; ---- function FUN_e2fc
FUN_e2fc:
  e2fc  3406           PSHS  B A                         
  e2fe  C693           LDB #0x93                         
  e300  F760FB         STB 0x60fb                        
  e303  17032D         LBSR 0xe633                       
  e306  F660B9         LDB 0x60b9                        
  e309  1702E4         LBSR 0xe5f0                       
  e30c  C6A0           LDB #0xa0                         
  e30e  171B6F         LBSR 0xfe80                       
  e311  F60110         LDB 0x0110                        
  e314  C47F           ANDB #0x7f                        
  e316  4F             CLRA                              
  e317  FD6074         STD 0x6074                        
  e31a  17AADF         LBSR 0x8dfc                        ; inline[API_FC16]: 01 01 02 1E 01 00 02 00 $0063 $0000 $0000 ->$E33D ->$E376 $0001 $0001 $0000
  e31d  01             db 1h                             
  e31e  01             db 1h                             
  e31f  02             db 2h                             
  e320  1E             db 1Eh                            
  e321  01             db 1h                             
  e322  00             db 0h                             
  e323  02             db 2h                             
  e324  00             db 0h                             
  e325  0063           dw 63h                            
  e327  0000           dw 0h                             
  e329  0000           dw 0h                             
  e32b  E33D           addr e33d                         
  e32d  E376           addr e376                         
  e32f  0001           dw 1h                             
  e331  0001           dw 1h                             
  e333  0000           dw 0h                             
LAB_e335:
  e335  8D06           BSR 0xe33d                        
  e337  171B60         LBSR 0xfe9a                       
  e33a  3506           PULS  A B                         
  e33c  39             RTS                               

; ---- function FUN_e33d
FUN_e33d:
  e33d  17B3AD         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}Device Number =    ( System Exclusive ) {2:10}{3:60A1}{2:2F}{3:60A1}"
  e340  020044657669.. char[53] 02h                      
LAB_e375:
  e375  39             RTS                               

; ---- function FUN_e376
FUN_e376:
  e376  3426           PSHS  Y B A                       
  e378  F66075         LDB 0x6075                        
  e37b  108E0110       LDY #0x110                        
  e37f  17BE4D         LBSR 0xa1cf                       
  e382  3526           PULS  A B Y                       
  e384  39             RTS                               

; ---- function FUN_e385
FUN_e385:
  e385  3406           PSHS  B A                         
  e387  F660B9         LDB 0x60b9                        
  e38a  17C340         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$E3A9 "(Error=  )"
  e38d  E3A9           addr e3a9                         
  e38f  284572726F72.. ds "(Error=  )"                   
LAB_e399:
  e399  170BE9         LBSR 0xef85                       
  e39c  CB07           ADDB #0x7                         
  e39e  1F98           TFR B,A                           
  e3a0  F66087         LDB 0x6087                        
  e3a3  170B6F         LBSR 0xef15                       
  e3a6  3506           PULS  A B                         
  e3a8  39             RTS                               

; ---- function FUN_e3a9
FUN_e3a9:
  e3a9  7F6087         CLR 0x6087                        
  e3ac  17B33E         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}MIDI Overrun Catcher Has been Reset"
  e3af  020005284D49.. char[40] 02h                      
LAB_e3d7:
  e3d7  8DAC           BSR 0xe385                        
  e3d9  39             RTS                               

; ---- function FUN_e3da
FUN_e3da:
  e3da  3406           PSHS  B A                         
  e3dc  F660B9         LDB 0x60b9                        
  e3df  17C2EB         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$E41E "(Off=    )"
  e3e2  E41E           addr e41e                         
  e3e4  284F66663D20.. ds "(Off=    )"                   
LAB_e3ee:
  e3ee  8D02           BSR 0xe3f2                        
  e3f0  3586           PULS  A B PC                      

; ---- function FUN_e3f2
FUN_e3f2:
  e3f2  3406           PSHS  B A                         
  e3f4  F6619D         LDB 0x619d                        
  e3f7  C403           ANDB #0x3                         
  e3f9  8605           LDA #0x5                          
  e3fb  3D             MUL                               
  e3fc  C3E40A         ADDD #0xe40a                      
  e3ff  3606           PSHU  B A                         
  e401  17B2E9         LBSR 0x96ed                        ; inline[API_FC38]: "{2:4B}{6}"
  e404  024B0600       char[4] 02h,"K",06h               
LAB_e408:
  e408  3586           PULS  A B PC                      
  e40a  .db 4E 6F 6E 65 00 4F 66 66 20 00 5A 65 72 6F 00 42  ; None.Off .Zero.B
  e41a  .db 6F 74 68 00                                      ; oth.

; ---- function FUN_e41e
FUN_e41e:
  e41e  3406           PSHS  B A                         
  e420  170210         LBSR 0xe633                       
  e423  F660B9         LDB 0x60b9                        
  e426  1701C7         LBSR 0xe5f0                       
  e429  F6619D         LDB 0x619d                        
  e42c  5A             DECB                              
  e42d  C403           ANDB #0x3                         
  e42f  4F             CLRA                              
  e430  FD6074         STD 0x6074                        
  e433  17A9C6         LBSR 0x8dfc                        ; inline[API_FC16]: 01 40 01 1E 00 00 01 00 $0002 $0000 $0000 ->$8877 ->$E457 $0001 $0001 $0000
  e436  01             db 1h                             
  e437  40             db 40h                            
  e438  01             db 1h                             
  e439  1E             db 1Eh                            
  e43a  00             db 0h                             
  e43b  00             db 0h                             
  e43c  01             db 1h                             
  e43d  00             db 0h                             
  e43e  0002           dw 2h                             
  e440  0000           dw 0h                             
  e442  0000           dw 0h                             
  e444  8877           addr 8877                         
  e446  E457           addr e457                         
  e448  0001           dw 1h                             
  e44a  0001           dw 1h                             
  e44c  0000           dw 0h                             
LAB_e44e:
  e44e  17001F         LBSR 0xe470                       
  e451  17FF9E         LBSR 0xe3f2                       
  e454  3506           PULS  A B                         
  e456  39             RTS                               

; ---- function FUN_e457
FUN_e457:
  e457  3426           PSHS  Y B A                       
  e459  F66075         LDB 0x6075                        
  e45c  5C             INCB                              
  e45d  F7619D         STB 0x619d                        
  e460  108E0117       LDY #0x117                        
  e464  17BD68         LBSR 0xa1cf                       
  e467  170006         LBSR 0xe470                       
  e46a  17FF85         LBSR 0xe3f2                       
  e46d  3526           PULS  A B Y                       
  e46f  39             RTS                               

; ---- function FUN_e470
FUN_e470:
  e470  3406           PSHS  B A                         
  e472  17B278         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}MIDI Note Off is "
  e475  020005284D49.. char[22] 02h                      
LAB_e48b:
  e48b  F6619D         LDB 0x619d                        
  e48e  5A             DECB                              
  e48f  C403           ANDB #0x3                         
  e491  8616           LDA #0x16                         
  e493  3D             MUL                               
  e494  C3E4A2         ADDD #0xe4a2                      
  e497  3606           PSHU  B A                         
  e499  17B251         LBSR 0x96ed                        ; inline[API_FC38]: "{2:11}{6}"
  e49c  02110600       char[4] 02h,11h,06h               
LAB_e4a0:
  e4a0  3586           PULS  A B PC                      
  e4a2  4E6F7465204F.. ds "Note Off Command     "        
  e4b8  4E6F7465204F.. ds "Note On Zero Velocity"        
  e4ce  426F74682020.. ds "Both  Off and Zero   "        

;; Kernel API slot $FE00: inline 6 module-relative handlers -> $60E3..$60E9, $603A, $6036

; ---- function SetModuleHandlers
SetModuleHandlers:
  e4e4  3416           PSHS  X B A                       
  e4e6  AE64           LDX 0x4,S                         
  e4e8  EC81           LDD ,X++                          
  e4ea  F3600D         ADDD 0x600d                       
  e4ed  FD60E3         STD 0x60e3                        
  e4f0  EC81           LDD ,X++                          
  e4f2  F3600D         ADDD 0x600d                       
  e4f5  FD60E5         STD 0x60e5                        
  e4f8  EC81           LDD ,X++                          
  e4fa  F3600D         ADDD 0x600d                       
  e4fd  FD60E7         STD 0x60e7                        
  e500  EC81           LDD ,X++                          
  e502  F3600D         ADDD 0x600d                       
  e505  FD60E9         STD 0x60e9                        
  e508  EC81           LDD ,X++                          
  e50a  F3600D         ADDD 0x600d                       
  e50d  FD603A         STD 0x603a                        
  e510  EC81           LDD ,X++                          
  e512  F3600D         ADDD 0x600d                       
  e515  FD6036         STD 0x6036                        
  e518  AF64           STX 0x4,S                         
  e51a  3516           PULS  A B X                       
  e51c  39             RTS                               

;; Kernel API slot $FE02: inline 4 labels (00/01 or 8 chars)

; ---- function SoftKeyLabels4Inline
SoftKeyLabels4Inline:
  e51d  3416           PSHS  X B A                       
  e51f  AE64           LDX 0x4,S                         
  e521  C629           LDB #0x29                         
  e523  170017         LBSR 0xe53d                       
  e526  C633           LDB #0x33                         
  e528  170012         LBSR 0xe53d                       
  e52b  C63D           LDB #0x3d                         
  e52d  17000D         LBSR 0xe53d                       
  e530  C647           LDB #0x47                         
  e532  170008         LBSR 0xe53d                       
  e535  1700FB         LBSR 0xe633                       
  e538  AF64           STX 0x4,S                         
  e53a  3516           PULS  A B X                       
  e53c  39             RTS                               

; ---- function FUN_e53d
FUN_e53d:
  e53d  3406           PSHS  B A                         
  e53f  17B199         LBSR 0x96db                       
  e542  A684           LDA ,X                            
  e544  8100           CMPA #0x0                         
  e546  270B           BEQ 0xe553                        
  e548  8101           CMPA #0x1                         
  e54a  270B           BEQ 0xe557                        
  e54c  C608           LDB #0x8                          
  e54e  17B20C         LBSR 0x975d                       
  e551  2012           BRA 0xe565                        
LAB_e553:
  e553  3001           LEAX 0x1,X                        
  e555  200E           BRA 0xe565                        
LAB_e557:
  e557  17B193         LBSR 0x96ed                        ; inline[API_FC38]: "        "
  e55a  202020202020.. char[9] "        "                
LAB_e563:
  e563  3001           LEAX 0x1,X                        
LAB_e565:
  e565  3506           PULS  A B                         
  e567  39             RTS                               

; ---- function FUN_e568
FUN_e568:
  e568  3406           PSHS  B A                         
  e56a  CCE585         LDD #0xe585                       
  e56d  FD603C         STD 0x603c                        
  e570  CCE58D         LDD #0xe58d                       
  e573  FD603E         STD 0x603e                        
  e576  CCE595         LDD #0xe595                       
  e579  FD6040         STD 0x6040                        
  e57c  CCE59D         LDD #0xe59d                       
  e57f  FD6042         STD 0x6042                        
  e582  3506           PULS  A B                         
  e584  39             RTS                               

; ---- function FUN_e585
FUN_e585:
  e585  17001D         LBSR 0xe5a5                       
  e588  AD9F60E3       JSR [0x60e3]                      
  e58c  39             RTS                               

; ---- function FUN_e58d
FUN_e58d:
  e58d  17001F         LBSR 0xe5af                       
  e590  AD9F60E5       JSR [0x60e5]                      
  e594  39             RTS                               

; ---- function FUN_e595
FUN_e595:
  e595  170021         LBSR 0xe5b9                       
  e598  AD9F60E7       JSR [0x60e7]                      
  e59c  39             RTS                               

; ---- function FUN_e59d
FUN_e59d:
  e59d  170023         LBSR 0xe5c3                       
  e5a0  AD9F60E9       JSR [0x60e9]                      
  e5a4  39             RTS                               

; ---- function API_FDE8
API_FDE8:
  e5a5  3406           PSHS  B A                         
  e5a7  C628           LDB #0x28                         
  e5a9  170021         LBSR 0xe5cd                       
  e5ac  3506           PULS  A B                         
  e5ae  39             RTS                               

; ---- function API_FDEA
API_FDEA:
  e5af  3406           PSHS  B A                         
  e5b1  C632           LDB #0x32                         
  e5b3  170017         LBSR 0xe5cd                       
  e5b6  3506           PULS  A B                         
  e5b8  39             RTS                               

; ---- function API_FDEC
API_FDEC:
  e5b9  3406           PSHS  B A                         
  e5bb  C63C           LDB #0x3c                         
  e5bd  17000D         LBSR 0xe5cd                       
  e5c0  3506           PULS  A B                         
  e5c2  39             RTS                               

; ---- function API_FDEE
API_FDEE:
  e5c3  3406           PSHS  B A                         
  e5c5  C646           LDB #0x46                         
  e5c7  170003         LBSR 0xe5cd                       
  e5ca  3506           PULS  A B                         
  e5cc  39             RTS                               

; ---- function API_FDE6
API_FDE6:
  e5cd  3406           PSHS  B A                         
  e5cf  17007A         LBSR 0xe64c                       
  e5d2  2619           BNE 0xe5ed                        
  e5d4  17005C         LBSR 0xe633                       
LAB_e5d7:
  e5d7  1F98           TFR B,A                           
  e5d9  17B0FF         LBSR 0x96db                       
  e5dc  C608           LDB #0x8                          
  e5de  17B044         LBSR 0x9625                       
  e5e1  1F89           TFR A,B                           
  e5e3  CB09           ADDB #0x9                         
  e5e5  17B0F3         LBSR 0x96db                       
  e5e8  C609           LDB #0x9                          
  e5ea  17B038         LBSR 0x9625                       
LAB_e5ed:
  e5ed  3506           PULS  A B                         
  e5ef  39             RTS                               

; ---- function FUN_e5f0
FUN_e5f0:
  e5f0  3406           PSHS  B A                         
  e5f2  C403           ANDB #0x3                         
  e5f4  860A           LDA #0xa                          
  e5f6  3D             MUL                               
  e5f7  CB28           ADDB #0x28                        
  e5f9  20DC           BRA 0xe5d7                        

; ---- function API_FDF0
API_FDF0:
  e5fb  3406           PSHS  B A                         
  e5fd  17004C         LBSR 0xe64c                       
  e600  2618           BNE 0xe61a                        
  e602  1F98           TFR B,A                           
  e604  17B0D4         LBSR 0x96db                       
  e607  C628           LDB #0x28                         
  e609  17B019         LBSR 0x9625                       
  e60c  1F89           TFR A,B                           
  e60e  CB09           ADDB #0x9                         
  e610  17B0C8         LBSR 0x96db                       
  e613  C629           LDB #0x29                         
  e615  17B00D         LBSR 0x9625                       
  e618  2016           BRA 0xe630                        
LAB_e61a:
  e61a  1F98           TFR B,A                           
  e61c  17B0BC         LBSR 0x96db                       
  e61f  C620           LDB #0x20                         
  e621  17B001         LBSR 0x9625                       
  e624  1F89           TFR A,B                           
  e626  CB09           ADDB #0x9                         
  e628  17B0B0         LBSR 0x96db                       
  e62b  C614           LDB #0x14                         
  e62d  17AFF5         LBSR 0x9625                       
LAB_e630:
  e630  3506           PULS  A B                         
  e632  39             RTS                               

; ---- function API_FDF2
API_FDF2:
  e633  3406           PSHS  B A                         
  e635  C628           LDB #0x28                         
  e637  17FFC1         LBSR 0xe5fb                       
  e63a  C632           LDB #0x32                         
  e63c  17FFBC         LBSR 0xe5fb                       
  e63f  C63C           LDB #0x3c                         
  e641  17FFB7         LBSR 0xe5fb                       
  e644  C646           LDB #0x46                         
  e646  17FFB2         LBSR 0xe5fb                       
  e649  3506           PULS  A B                         
  e64b  39             RTS                               

; ---- function API_FDF4
API_FDF4:
  e64c  3406           PSHS  B A                         
  e64e  CB01           ADDB #0x1                         
  e650  17B088         LBSR 0x96db                       
  e653  8600           LDA #0x0                          
LAB_e655:
  e655  4C             INCA                              
  e656  17AFD9         LBSR 0x9632                       
  e659  C120           CMPB #0x20                        
  e65b  2609           BNE 0xe666                        
  e65d  8108           CMPA #0x8                         
  e65f  2DF4           BLT 0xe655                        
  e661  CCFFFF         LDD #0xffff                       
  e664  2003           BRA 0xe669                        
LAB_e666:
  e666  CC0000         LDD #0x0                          
LAB_e669:
  e669  3506           PULS  A B                         
  e66b  39             RTS                               

; ---- function API_FDF6
API_FDF6:
  e66c  17B2A7         LBSR 0x9916                        ; inline[API_FC48]: 08 "........"
  e66f  08             db 8h                             
  e670  1E1C1818181C.. ds 1Eh,1Ch,18h,18h,18h,1Ch,1Eh    
LAB_e678:
  e678  17B29B         LBSR 0x9916                        ; inline[API_FC48]: 09 "........"
  e67b  09             db 9h                             
  e67c  0F0703030307.. ds 0Fh,"\a",03h,03h,03h,"\a",0Fh  
LAB_e684:
  e684  17B28F         LBSR 0x9916                        ; inline[API_FC48]: 0A "........"
  e687  0A             db Ah                             
  e688  1C1C1C1C1C1C.. ds 1Ch,1Ch,1Ch,1Ch,1Ch,1Ch,1Ch    
LAB_e690:
  e690  17B283         LBSR 0x9916                        ; inline[API_FC48]: 0B "........"
  e693  0B             db Bh                             
  e694  070707070707.. ds "\a\a\a\a\a\a\a"               
LAB_e69c:
  e69c  39             RTS                               

;; Kernel API slot $FE04: inline (param, $70xx offset) pairs

; ---- function LoadParamsSigned
LoadParamsSigned:
  e69d  3476           PSHS  U Y X B A                   
  e69f  EE68           LDU 0x8,S                         
LAB_e6a1:
  e6a1  E6C0           LDB ,U+                           
  e6a3  2712           BEQ 0xe6b7                        
  e6a5  4F             CLRA                              
  e6a6  1F01           TFR D,X                           
  e6a8  E6C0           LDB ,U+                           
  e6aa  C37000         ADDD #0x7000                      
  e6ad  1F02           TFR D,Y                           
  e6af  17BAE4         LBSR 0xa196                       
  e6b2  1D             SEX                               
  e6b3  EDA4           STD ,Y                            
  e6b5  20EA           BRA 0xe6a1                        
LAB_e6b7:
  e6b7  EF68           STU 0x8,S                         
  e6b9  3576           PULS  A B X Y U                   
  e6bb  39             RTS                               

;; Kernel API slot $FE06: inline (param, $70xx offset) pairs

; ---- function LoadParamsUnsigned
LoadParamsUnsigned:
  e6bc  3476           PSHS  U Y X B A                   
  e6be  EE68           LDU 0x8,S                         
LAB_e6c0:
  e6c0  E6C0           LDB ,U+                           
  e6c2  2712           BEQ 0xe6d6                        
  e6c4  4F             CLRA                              
  e6c5  1F01           TFR D,X                           
  e6c7  E6C0           LDB ,U+                           
  e6c9  C37000         ADDD #0x7000                      
  e6cc  1F02           TFR D,Y                           
  e6ce  17BAC5         LBSR 0xa196                       
  e6d1  4F             CLRA                              
  e6d2  EDA4           STD ,Y                            
  e6d4  20EA           BRA 0xe6c0                        
LAB_e6d6:
  e6d6  EF68           STU 0x8,S                         
  e6d8  3576           PULS  A B X Y U                   
  e6da  39             RTS                               

;; Kernel API slot $FE08: inline (param, $70xx offset) pairs

; ---- function LoadParamsScaled
LoadParamsScaled:
  e6db  3476           PSHS  U Y X B A                   
  e6dd  EE68           LDU 0x8,S                         
LAB_e6df:
  e6df  E6C0           LDB ,U+                           
  e6e1  2711           BEQ 0xe6f4                        
  e6e3  4F             CLRA                              
  e6e4  1F01           TFR D,X                           
  e6e6  E6C0           LDB ,U+                           
  e6e8  C37000         ADDD #0x7000                      
  e6eb  1F02           TFR D,Y                           
  e6ed  17BABD         LBSR 0xa1ad                       
  e6f0  EDA4           STD ,Y                            
  e6f2  20EB           BRA 0xe6df                        
LAB_e6f4:
  e6f4  EF68           STU 0x8,S                         
  e6f6  3576           PULS  A B X Y U                   
  e6f8  39             RTS                               

; ---- function API_FDFE
API_FDFE:
  e6f9  3416           PSHS  X B A                       
  e6fb  10A384         CMPD ,X                           
  e6fe  2E04           BGT 0xe704                        
  e700  2D15           BLT 0xe717                        
  e702  202F           BRA 0xe733                        
LAB_e704:
  e704  3406           PSHS  B A                         
  e706  1F30           TFR U,D                           
  e708  E384           ADDD ,X                           
  e70a  ED84           STD ,X                            
  e70c  3506           PULS  A B                         
  e70e  10A384         CMPD ,X                           
  e711  2C1B           BGE 0xe72e                        
  e713  ED84           STD ,X                            
  e715  2017           BRA 0xe72e                        
LAB_e717:
  e717  3406           PSHS  B A                         
  e719  3440           PSHS  U                           
  e71b  EC84           LDD ,X                            
  e71d  A3E4           SUBD ,S                           
  e71f  ED84           STD ,X                            
  e721  3540           PULS  U                           
  e723  3506           PULS  A B                         
  e725  10A384         CMPD ,X                           
  e728  2F04           BLE 0xe72e                        
  e72a  ED84           STD ,X                            
  e72c  2000           BRA 0xe72e                        
LAB_e72e:
  e72e  EC84           LDD ,X                            
  e730  17DABD         LBSR 0xc1f0                       
LAB_e733:
  e733  3516           PULS  A B X                       
  e735  39             RTS                               

; ---- function FUN_e736
FUN_e736:
  e736  17FDE4         LBSR 0xe51d                        ; inline[API_FE02]: [-] [-] " range  " "perclick"
  e739  00             db 0h                             
  e73a  00             db 0h                             
  e73b  2072616E6765.. ds " range  "                     
  e743  706572636C69.. ds "perclick"                     
LAB_e74b:
  e74b  17FEE5         LBSR 0xe633                       
  e74e  CCE76F         LDD #0xe76f                       
  e751  FD60E7         STD 0x60e7                        
  e754  CCE77F         LDD #0xe77f                       
  e757  FD60E9         STD 0x60e9                        
  e75a  CCE595         LDD #0xe595                       
  e75d  FD6040         STD 0x6040                        
  e760  CCE59D         LDD #0xe59d                       
  e763  FD6042         STD 0x6042                        
  e766  1F10           TFR X,D                           
  e768  F3600D         ADDD 0x600d                       
  e76b  FD619E         STD 0x619e                        
  e76e  39             RTS                               

; ---- function FUN_e76f
FUN_e76f:
  e76f  3436           PSHS  Y X B A                     
  e771  BE619E         LDX 0x619e                        
  e774  CC0001         LDD #0x1                          
  e777  FD60DC         STD 0x60dc                        
  e77a  FD60DE         STD 0x60de                        
  e77d  2010           BRA 0xe78f                        

; ---- function FUN_e77f
FUN_e77f:
  e77f  3436           PSHS  Y X B A                     
  e781  BE619E         LDX 0x619e                        
  e784  CC0080         LDD #0x80                         
  e787  FD60DC         STD 0x60dc                        
  e78a  FD60DE         STD 0x60de                        
  e78d  2000           BRA 0xe78f                        

; ---- function FUN_e78f
FUN_e78f:
  e78f  10AE04         LDY 0x4,X                         
  e792  EC26           LDD 0x6,Y                         
  e794  FD6074         STD 0x6074                        
  e797  CC0001         LDD #0x1                          
  e79a  F76066         STB 0x6066                        
  e79d  F76067         STB 0x6067                        
  e7a0  F760E0         STB 0x60e0                        
  e7a3  F76068         STB 0x6068                        
  e7a6  C602           LDB #0x2                          
  e7a8  F76058         STB 0x6058                        
  e7ab  E60C           LDB 0xc,X                         
  e7ad  F76099         STB 0x6099                        
  e7b0  E60D           LDB 0xd,X                         
  e7b2  F76069         STB 0x6069                        
  e7b5  EC0A           LDD 0xa,X                         
  e7b7  FD606C         STD 0x606c                        
  e7ba  EC08           LDD 0x8,X                         
  e7bc  FD606E         STD 0x606e                        
  e7bf  CCE813         LDD #0xe813                       
  e7c2  FD6070         STD 0x6070                        
  e7c5  CCE7FA         LDD #0xe7fa                       
  e7c8  FD6072         STD 0x6072                        
  e7cb  17A555         LBSR 0x8d23                       
  e7ce  C60B           LDB #0xb                          
  e7d0  17AF08         LBSR 0x96db                       
  e7d3  17AF17         LBSR 0x96ed                        ; inline[API_FC38]: "midi range:      [    /click]"
  e7d6  6D6964692072.. char[30] "midi range:      [    /click]"
LAB_e7f4:
  e7f4  17001C         LBSR 0xe813                       
  e7f7  3536           PULS  A B X Y                     
  e7f9  39             RTS                               

; ---- function FUN_e7fa
FUN_e7fa:
  e7fa  3436           PSHS  Y X B A                     
  e7fc  BE619E         LDX 0x619e                        
  e7ff  FC6074         LDD 0x6074                        
  e802  10AE04         LDY 0x4,X                         
  e805  ED26           STD 0x6,Y                         
  e807  10AE06         LDY 0x6,X                         
  e80a  17B9D9         LBSR 0xa1e6                       
  e80d  170003         LBSR 0xe813                       
  e810  3536           PULS  A B X Y                     
  e812  39             RTS                               

; ---- function FUN_e813
FUN_e813:
  e813  3476           PSHS  U Y X B A                   
  e815  BE619E         LDX 0x619e                        
  e818  3410           PSHS  X                           
  e81a  C617           LDB #0x17                         
  e81c  17AEBC         LBSR 0x96db                       
  e81f  4F             CLRA                              
  e820  E60D           LDB 0xd,X                         
  e822  3406           PSHS  B A                         
  e824  CC609A         LDD #0x609a                       
  e827  C30009         ADDD #0x9                         
  e82a  A3E4           SUBD ,S                           
  e82c  1F01           TFR D,X                           
  e82e  3506           PULS  A B                         
  e830  17AF2A         LBSR 0x975d                       
  e833  3510           PULS  X                           
  e835  C61D           LDB #0x1d                         
  e837  17AEA1         LBSR 0x96db                       
  e83a  10AE04         LDY 0x4,X                         
  e83d  EC26           LDD 0x6,Y                         
  e83f  58             LSLB                              
  e840  49             ROLA                              
  e841  1F89           TFR A,B                           
  e843  1D             SEX                               
  e844  3606           PSHU  B A                         
  e846  4F             CLRA                              
  e847  5F             CLRB                              
  e848  108E61A0       LDY #0x61a0                       
  e84c  17AF3A         LBSR 0x9789                       
  e84f  C604           LDB #0x4                          
  e851  8E61A5         LDX #0x61a5                       
  e854  17AF06         LBSR 0x975d                       
  e857  3576           PULS  A B X Y U                   
  e859  39             RTS                               

;; Kernel API slot $FE1C: X = module-relative parameter descriptor

; ---- function ParamDescriptorCall
ParamDescriptorCall:
  e85a  3476           PSHS  U Y X B A                   
  e85c  58             LSLB                              
  e85d  49             ROLA                              
  e85e  3606           PSHU  B A                         
  e860  FC600D         LDD 0x600d                        
  e863  308B           LEAX D,X                          
  e865  10AE04         LDY 0x4,X                         
  e868  EC26           LDD 0x6,Y                         
  e86a  3606           PSHU  B A                         
  e86c  17D4BB         LBSR 0xbd2a                       
  e86f  3706           PULU  A B                         
  e871  ED22           STD 0x2,Y                         
  e873  EC02           LDD 0x2,X                         
  e875  F3600D         ADDD 0x600d                       
  e878  1F02           TFR D,Y                           
  e87a  ADA4           JSR ,Y                            
  e87c  EC84           LDD ,X                            
  e87e  F3600D         ADDD 0x600d                       
  e881  10B36070       CMPD 0x6070                       
  e885  2602           BNE 0xe889                        
  e887  8D03           BSR 0xe88c                        
LAB_e889:
  e889  3576           PULS  A B X Y U                   
  e88b  39             RTS                               

; ---- function FUN_e88c
FUN_e88c:
  e88c  3476           PSHS  U Y X B A                   
  e88e  10AE04         LDY 0x4,X                         
  e891  EC24           LDD 0x4,Y                         
  e893  3606           PSHU  B A                         
  e895  108E609A       LDY #0x609a                       
  e899  A60C           LDA 0xc,X                         
  e89b  17AEEB         LBSR 0x9789                       
  e89e  EC84           LDD ,X                            
  e8a0  F3600D         ADDD 0x600d                       
  e8a3  1F02           TFR D,Y                           
  e8a5  ADA4           JSR ,Y                            
  e8a7  3576           PULS  A B X Y U                   
  e8a9  39             RTS                               

; ---- function FUN_e8aa
FUN_e8aa:
  e8aa  8D03           BSR 0xe8af                         ; inline[API_FE24]: $68A0
  e8ac  68A0           dw 68A0h                          
LAB_e8ae:
  e8ae  39             RTS                               

; ---- function FUN_e8af
FUN_e8af:
  e8af  3426           PSHS  Y B A                       
  e8b1  3276           LEAS -0xa,S                       
  e8b3  AF62           STX 0x2,S                         
  e8b5  AE6E           LDX 0xe,S                         
  e8b7  10AE81         LDY ,X++                          
  e8ba  AF6E           STX 0xe,S                         
  e8bc  AE62           LDX 0x2,S                         
  e8be  ED64           STD 0x4,S                         
LAB_e8c0:
  e8c0  C63A           LDB #0x3a                         
  e8c2  6F67           CLR 0x7,S                         
  e8c4  170087         LBSR 0xe94e                       
  e8c7  EC64           LDD 0x4,S                         
  e8c9  10830020       CMPD #0x20                        
  e8cd  2303           BLS 0xe8d2                        
  e8cf  CC0020         LDD #0x20                         
LAB_e8d2:
  e8d2  E766           STB 0x6,S                         
  e8d4  ED62           STD 0x2,S                         
  e8d6  EC64           LDD 0x4,S                         
  e8d8  A362           SUBD 0x2,S                        
  e8da  ED64           STD 0x4,S                         
  e8dc  E666           LDB 0x6,S                         
  e8de  6F67           CLR 0x7,S                         
  e8e0  170036         LBSR 0xe919                       
  e8e3  1F10           TFR X,D                           
  e8e5  1E89           EXG A,B                           
  e8e7  17002F         LBSR 0xe919                       
  e8ea  1E89           EXG A,B                           
  e8ec  17002A         LBSR 0xe919                       
  e8ef  5F             CLRB                              
  e8f0  170026         LBSR 0xe919                       
LAB_e8f3:
  e8f3  E680           LDB ,X+                           
  e8f5  170021         LBSR 0xe919                       
  e8f8  6A66           DEC 0x6,S                         
  e8fa  26F7           BNE 0xe8f3                        
  e8fc  E667           LDB 0x7,S                         
  e8fe  50             NEGB                              
  e8ff  170017         LBSR 0xe919                       
  e902  C60D           LDB #0xd                          
  e904  170047         LBSR 0xe94e                       
  e907  C60A           LDB #0xa                          
  e909  170042         LBSR 0xe94e                       
  e90c  EC64           LDD 0x4,S                         
  e90e  10830000       CMPD #0x0                         
  e912  26AC           BNE 0xe8c0                        
  e914  326A           LEAS 0xa,S                        
  e916  3526           PULS  A B Y                       
  e918  39             RTS                               

; ---- function FUN_e919
FUN_e919:
  e919  3404           PSHS  B                           
  e91b  E66A           LDB 0xa,S                         
  e91d  EBE4           ADDB ,S                           
  e91f  E76A           STB 0xa,S                         
  e921  E6E4           LDB ,S                            
  e923  2002           BRA 0xe927                        

; ---- function FUN_e925
FUN_e925:
  e925  3404           PSHS  B                           
LAB_e927:
  e927  54             LSRB                              
  e928  54             LSRB                              
  e929  54             LSRB                              
  e92a  54             LSRB                              
LAB_e92b:
  e92b  17AF50         LBSR 0x987e                       
  e92e  ADB90000       JSR [0x0,Y]                       
  e932  2705           BEQ 0xe939                        
  e934  179C64         LBSR 0x859b                       
  e937  20F2           BRA 0xe92b                        
LAB_e939:
  e939  E6E4           LDB ,S                            
  e93b  C40F           ANDB #0xf                         
  e93d  17AF3E         LBSR 0x987e                       
LAB_e940:
  e940  ADB90000       JSR [0x0,Y]                       
  e944  2705           BEQ 0xe94b                        
  e946  179C52         LBSR 0x859b                       
  e949  20F5           BRA 0xe940                        
LAB_e94b:
  e94b  3504           PULS  B                           
  e94d  39             RTS                               

; ---- function FUN_e94e
FUN_e94e:
  e94e  3404           PSHS  B                           
  e950  20EE           BRA 0xe940                        

; ---- function FUN_e952
FUN_e952:
  e952  3436           PSHS  Y X B A                     
  e954  3276           LEAS -0xa,S                       
  e956  AEE810         LDX 0x10,S                        
  e959  10AE81         LDY ,X++                          
  e95c  AFE810         STX 0x10,S                        
  e95f  ED62           STD 0x2,S                         
  e961  C65C           LDB #0x5c                         
  e963  17FFE8         LBSR 0xe94e                       
LAB_e966:
  e966  E662           LDB 0x2,S                         
  e968  17FFBA         LBSR 0xe925                       
  e96b  E663           LDB 0x3,S                         
  e96d  17FFB5         LBSR 0xe925                       
  e970  E662           LDB 0x2,S                         
  e972  EB63           ADDB 0x3,S                        
  e974  50             NEGB                              
  e975  17FFAD         LBSR 0xe925                       
  e978  C60D           LDB #0xd                          
  e97a  17FFD1         LBSR 0xe94e                       
  e97d  C60A           LDB #0xa                          
  e97f  17FFCC         LBSR 0xe94e                       
  e982  326A           LEAS 0xa,S                        
  e984  3536           PULS  A B X Y                     
  e986  39             RTS                               

; ---- function FUN_e987
FUN_e987:
  e987  3436           PSHS  Y X B A                     
  e989  3276           LEAS -0xa,S                       
  e98b  ED62           STD 0x2,S                         
  e98d  AEE810         LDX 0x10,S                        
  e990  10AE81         LDY ,X++                          
  e993  AFE810         STX 0x10,S                        
  e996  C67C           LDB #0x7c                         
  e998  17FFB3         LBSR 0xe94e                       
  e99b  20C9           BRA 0xe966                        

; ---- function FUN_e99d
FUN_e99d:
  e99d  3436           PSHS  Y X B A                     
  e99f  AE66           LDX 0x6,S                         
  e9a1  10AE81         LDY ,X++                          
  e9a4  AF66           STX 0x6,S                         
  e9a6  1F98           TFR B,A                           
  e9a8  E62B           LDB 0xb,Y                         
  e9aa  1714D3         LBSR 0xfe80                       
  e9ad  1F89           TFR A,B                           
  e9af  ADB802         JSR [0x2,Y]                       
  e9b2  1714E5         LBSR 0xfe9a                       
  e9b5  3536           PULS  A B X Y                     
  e9b7  39             RTS                               

; ---- function FUN_e9b8
FUN_e9b8:
  e9b8  3432           PSHS  Y X A                       
  e9ba  AE65           LDX 0x5,S                         
  e9bc  10AE81         LDY ,X++                          
  e9bf  AF65           STX 0x5,S                         
  e9c1  1F98           TFR B,A                           
  e9c3  E62B           LDB 0xb,Y                         
  e9c5  1714B8         LBSR 0xfe80                       
  e9c8  1F89           TFR A,B                           
LAB_e9ca:
  e9ca  ADB802         JSR [0x2,Y]                       
  e9cd  17ABF4         LBSR 0x95c4                       
  e9d0  2611           BNE 0xe9e3                        
  e9d2  5D             TSTB                              
  e9d3  2C02           BGE 0xe9d7                        
  e9d5  200E           BRA 0xe9e5                        
LAB_e9d7:
  e9d7  A62B           LDA 0xb,Y                         
  e9d9  B7600B         STA 0x600b                        
  e9dc  B78052         STA 0x8052                        
  e9df  1F98           TFR B,A                           
  e9e1  20E7           BRA 0xe9ca                        
LAB_e9e3:
  e9e3  C6F0           LDB #0xf0                         
LAB_e9e5:
  e9e5  1714B2         LBSR 0xfe9a                       
  e9e8  3532           PULS  A X Y                       
  e9ea  39             RTS                               

; ---- function FUN_e9eb
FUN_e9eb:
  e9eb  C13A           CMPB #0x3a                        
  e9ed  102700B7       LBEQ 0xeaa8                       
  e9f1  C15C           CMPB #0x5c                        
  e9f3  2714           BEQ 0xea09                        
  e9f5  C17C           CMPB #0x7c                        
  e9f7  2738           BEQ 0xea31                        
  e9f9  A726           STA 0x6,Y                         
  e9fb  AF28           STX 0x8,Y                         
  e9fd  CCEA03         LDD #0xea03                       
  ea00  ED22           STD 0x2,Y                         
  ea02  39             RTS                               

; ---- function FUN_ea03
FUN_ea03:
  ea03  A626           LDA 0x6,Y                         
  ea05  AE28           LDX 0x8,Y                         
  ea07  20E2           BRA 0xe9eb                        
LAB_ea09:
  ea09  8D6E           BSR 0xea79                        
  ea0b  1F98           TFR B,A                           
  ea0d  8D6A           BSR 0xea79                        
  ea0f  EDA814         STD 0x14,Y                        
  ea12  8D65           BSR 0xea79                        
  ea14  EBA814         ADDB 0x14,Y                       
  ea17  EBA815         ADDB 0x15,Y                       
  ea1a  2605           BNE 0xea21                        
  ea1c  ECA814         LDD 0x14,Y                        
  ea1f  8D2C           BSR 0xea4d                        
LAB_ea21:
  ea21  A726           STA 0x6,Y                         
  ea23  AF28           STX 0x8,Y                         
  ea25  CCEA2B         LDD #0xea2b                       
  ea28  ED22           STD 0x2,Y                         
  ea2a  39             RTS                               

; ---- function FUN_ea2b
FUN_ea2b:
  ea2b  A626           LDA 0x6,Y                         
  ea2d  AE28           LDX 0x8,Y                         
  ea2f  20BA           BRA 0xe9eb                        
LAB_ea31:
  ea31  8D46           BSR 0xea79                        
  ea33  1F98           TFR B,A                           
  ea35  8D42           BSR 0xea79                        
  ea37  EDA814         STD 0x14,Y                        
  ea3a  8D3D           BSR 0xea79                        
  ea3c  EBA814         ADDB 0x14,Y                       
  ea3f  EBA815         ADDB 0x15,Y                       
  ea42  26DD           BNE 0xea21                        
  ea44  AEA814         LDX 0x14,Y                        
  ea47  EC84           LDD ,X                            
  ea49  8D02           BSR 0xea4d                        
  ea4b  20D4           BRA 0xea21                        

; ---- function FUN_ea4d
FUN_ea4d:
  ea4d  3476           PSHS  U Y X B A                   
  ea4f  327E           LEAS -0x2,S                       
  ea51  EDE4           STD ,S                            
  ea53  EC2C           LDD 0xc,Y                         
  ea55  AE2E           LDX 0xe,Y                         
  ea57  EEA812         LDU 0x12,Y                        
  ea5a  3420           PSHS  Y                           
  ea5c  10AEA810       LDY 0x10,Y                        
  ea60  ADF802         JSR [0x2,S]                       
  ea63  3420           PSHS  Y                           
  ea65  10AE62         LDY 0x2,S                         
  ea68  EFA812         STU 0x12,Y                        
  ea6b  AF2E           STX 0xe,Y                         
  ea6d  ED2C           STD 0xc,Y                         
  ea6f  ECE4           LDD ,S                            
  ea71  EDA810         STD 0x10,Y                        
  ea74  3266           LEAS 0x6,S                        
  ea76  3576           PULS  A B X Y U                   
  ea78  39             RTS                               

; ---- function FUN_ea79
FUN_ea79:
  ea79  A726           STA 0x6,Y                         
  ea7b  3506           PULS  A B                         
  ea7d  ED24           STD 0x4,Y                         
LAB_ea7f:
  ea7f  AF28           STX 0x8,Y                         
  ea81  CCEA87         LDD #0xea87                       
  ea84  ED22           STD 0x2,Y                         
  ea86  39             RTS                               

; ---- function FUN_ea87
FUN_ea87:
  ea87  AE28           LDX 0x8,Y                         
  ea89  8D50           BSR 0xeadb                        
  ea8b  26F2           BNE 0xea7f                        
  ea8d  58             LSLB                              
  ea8e  58             LSLB                              
  ea8f  58             LSLB                              
  ea90  58             LSLB                              
  ea91  E727           STB 0x7,Y                         
LAB_ea93:
  ea93  AF28           STX 0x8,Y                         
  ea95  CCEA9B         LDD #0xea9b                       
  ea98  ED22           STD 0x2,Y                         
  ea9a  39             RTS                               

; ---- function FUN_ea9b
FUN_ea9b:
  ea9b  A626           LDA 0x6,Y                         
  ea9d  AE28           LDX 0x8,Y                         
  ea9f  8D3A           BSR 0xeadb                        
  eaa1  26F0           BNE 0xea93                        
  eaa3  EA27           ORB 0x7,Y                         
  eaa5  6EB804         JMP [0x4,Y]                       
LAB_eaa8:
  eaa8  8DCF           BSR 0xea79                        
  eaaa  E72A           STB 0xa,Y                         
  eaac  8DCB           BSR 0xea79                        
  eaae  1F98           TFR B,A                           
  eab0  8DC7           BSR 0xea79                        
  eab2  1F01           TFR D,X                           
  eab4  8DC3           BSR 0xea79                        
  eab6  260C           BNE 0xeac4                        
LAB_eab8:
  eab8  8DBF           BSR 0xea79                        
  eaba  E780           STB ,X+                           
  eabc  6A2A           DEC 0xa,Y                         
  eabe  26F8           BNE 0xeab8                        
  eac0  8DB7           BSR 0xea79                        
  eac2  2006           BRA 0xeaca                        
LAB_eac4:
  eac4  8DB3           BSR 0xea79                        
  eac6  6A2A           DEC 0xa,Y                         
  eac8  26FA           BNE 0xeac4                        
LAB_eaca:
  eaca  A726           STA 0x6,Y                         
  eacc  AF28           STX 0x8,Y                         
  eace  CCEAD4         LDD #0xead4                       
  ead1  ED22           STD 0x2,Y                         
  ead3  39             RTS                               

; ---- function FUN_ead4
FUN_ead4:
  ead4  A626           LDA 0x6,Y                         
  ead6  AE28           LDX 0x8,Y                         
  ead8  16FF10         LBRA 0xe9eb                       

; ---- function FUN_eadb
FUN_eadb:
  eadb  C130           CMPB #0x30                        
  eadd  2515           BCS 0xeaf4                        
  eadf  C139           CMPB #0x39                        
  eae1  2204           BHI 0xeae7                        
  eae3  C030           SUBB #0x30                        
  eae5  200A           BRA 0xeaf1                        
LAB_eae7:
  eae7  C141           CMPB #0x41                        
  eae9  2509           BCS 0xeaf4                        
  eaeb  C146           CMPB #0x46                        
  eaed  2205           BHI 0xeaf4                        
  eaef  C037           SUBB #0x37                        
LAB_eaf1:
  eaf1  1A04           ORCC #0x4                         
  eaf3  39             RTS                               
LAB_eaf4:
  eaf4  5F             CLRB                              
  eaf5  1CFB           ANDCC #0xfb                       
  eaf7  39             RTS                               

; ---- function FUN_eaf8
FUN_eaf8:
  eaf8  3436           PSHS  Y X B A                     
  eafa  AE66           LDX 0x6,S                         
  eafc  10AE81         LDY ,X++                          
  eaff  AF66           STX 0x6,S                         
  eb01  EDA4           STD ,Y                            
  eb03  30A816         LEAX 0x16,Y                       
  eb06  AFA812         STX 0x12,Y                        
  eb09  3536           PULS  A B X Y                     
  eb0b  39             RTS                               

; ---- function FUN_eb0c
FUN_eb0c:
  eb0c  3436           PSHS  Y X B A                     
  eb0e  AE66           LDX 0x6,S                         
  eb10  10AE81         LDY ,X++                          
  eb13  AF66           STX 0x6,S                         
  eb15  CCE9EB         LDD #0xe9eb                       
  eb18  ED22           STD 0x2,Y                         
  eb1a  3536           PULS  A B X Y                     
  eb1c  39             RTS                               

; ---- function FUN_eb1d
FUN_eb1d:
  eb1d  7D61AD         TST 0x61ad                        
  eb20  2702           BEQ 0xeb24                        
  eb22  8D09           BSR 0xeb2d                        
LAB_eb24:
  eb24  39             RTS                               

; ---- function FUN_eb25
FUN_eb25:
  eb25  7D61AE         TST 0x61ae                        
  eb28  2702           BEQ 0xeb2c                        
  eb2a  8D01           BSR 0xeb2d                        
LAB_eb2c:
  eb2c  39             RTS                               

; ---- function FUN_eb2d
FUN_eb2d:
  eb2d  3406           PSHS  B A                         
  eb2f  3420           PSHS  Y                           
  eb31  327E           LEAS -0x2,S                       
  eb33  6F61           CLR 0x1,S                         
  eb35  6D62           TST 0x2,S                         
  eb37  2A04           BPL 0xeb3d                        
  eb39  C602           LDB #0x2                          
  eb3b  E761           STB 0x1,S                         
LAB_eb3d:
  eb3d  F6608A         LDB 0x608a                        
  eb40  C40F           ANDB #0xf                         
  eb42  CAB0           ORB #0xb0                         
  eb44  E7E4           STB ,S                            
  eb46  17AAB4         LBSR 0x95fd                       
  eb49  C663           LDB #0x63                         
  eb4b  EB61           ADDB 0x1,S                        
  eb4d  17AAAD         LBSR 0x95fd                       
  eb50  EC62           LDD 0x2,S                         
  eb52  58             LSLB                              
  eb53  49             ROLA                              
  eb54  1F89           TFR A,B                           
  eb56  C47F           ANDB #0x7f                        
  eb58  17AAA2         LBSR 0x95fd                       
  eb5b  E6E4           LDB ,S                            
  eb5d  17AA9D         LBSR 0x95fd                       
  eb60  C662           LDB #0x62                         
  eb62  EB61           ADDB 0x1,S                        
  eb64  17AA96         LBSR 0x95fd                       
  eb67  E663           LDB 0x3,S                         
  eb69  C47F           ANDB #0x7f                        
  eb6b  17AA8F         LBSR 0x95fd                       
  eb6e  E6E4           LDB ,S                            
  eb70  17AA8A         LBSR 0x95fd                       
  eb73  C606           LDB #0x6                          
  eb75  17AA85         LBSR 0x95fd                       
  eb78  EC64           LDD 0x4,S                         
  eb7a  58             LSLB                              
  eb7b  49             ROLA                              
  eb7c  1F89           TFR A,B                           
  eb7e  C47F           ANDB #0x7f                        
  eb80  17AA7A         LBSR 0x95fd                       
  eb83  E6E4           LDB ,S                            
  eb85  17AA75         LBSR 0x95fd                       
  eb88  C626           LDB #0x26                         
  eb8a  17AA70         LBSR 0x95fd                       
  eb8d  E665           LDB 0x5,S                         
  eb8f  C47F           ANDB #0x7f                        
  eb91  17AA69         LBSR 0x95fd                       
  eb94  3506           PULS  A B                         
  eb96  3520           PULS  Y                           
  eb98  3506           PULS  A B                         
  eb9a  39             RTS                               

; ---- function FUN_eb9b
FUN_eb9b:
  eb9b  3406           PSHS  B A                         
  eb9d  1083007F       CMPD #0x7f                        
  eba1  220F           BHI 0xebb2                        
  eba3  F6608A         LDB 0x608a                        
  eba6  C40F           ANDB #0xf                         
  eba8  CAC0           ORB #0xc0                         
  ebaa  17AA50         LBSR 0x95fd                       
  ebad  E661           LDB 0x1,S                         
  ebaf  17AA4B         LBSR 0x95fd                       
LAB_ebb2:
  ebb2  3506           PULS  A B                         
  ebb4  39             RTS                               

; ---- function FUN_ebb5
FUN_ebb5:
  ebb5  3406           PSHS  B A                         
  ebb7  7D61AD         TST 0x61ad                        
  ebba  2702           BEQ 0xebbe                        
  ebbc  8DDD           BSR 0xeb9b                        
LAB_ebbe:
  ebbe  3506           PULS  A B                         
  ebc0  39             RTS                               

; ---- function FUN_ebc1
FUN_ebc1:
  ebc1  3406           PSHS  B A                         
  ebc3  3404           PSHS  B                           
  ebc5  5D             TSTB                              
  ebc6  2B06           BMI 0xebce                        
  ebc8  AD9F61AA       JSR [0x61aa]                      
  ebcc  2027           BRA 0xebf5                        
LAB_ebce:
  ebce  E6E4           LDB ,S                            
  ebd0  C4F0           ANDB #0xf0                        
  ebd2  C1B0           CMPB #0xb0                        
  ebd4  2619           BNE 0xebef                        
  ebd6  F6608A         LDB 0x608a                        
  ebd9  2B0C           BMI 0xebe7                        
  ebdb  C40F           ANDB #0xf                         
  ebdd  A6E4           LDA ,S                            
  ebdf  840F           ANDA #0xf                         
  ebe1  A7E4           STA ,S                            
  ebe3  E1E4           CMPB ,S                           
  ebe5  2608           BNE 0xebef                        
LAB_ebe7:
  ebe7  CCEBFA         LDD #0xebfa                       
  ebea  FD61AA         STD 0x61aa                        
  ebed  2006           BRA 0xebf5                        
LAB_ebef:
  ebef  CC8877         LDD #0x8877                       
  ebf2  FD61AA         STD 0x61aa                        
LAB_ebf5:
  ebf5  3504           PULS  B                           
  ebf7  3506           PULS  A B                         
  ebf9  39             RTS                               

; ---- function FUN_ebfa
FUN_ebfa:
  ebfa  C163           CMPB #0x63                        
  ebfc  2725           BEQ 0xec23                        
  ebfe  C162           CMPB #0x62                        
  ec00  2738           BEQ 0xec3a                        
  ec02  C165           CMPB #0x65                        
  ec04  2711           BEQ 0xec17                        
  ec06  C164           CMPB #0x64                        
  ec08  270D           BEQ 0xec17                        
  ec0a  C106           CMPB #0x6                         
  ec0c  273A           BEQ 0xec48                        
  ec0e  C126           CMPB #0x26                        
  ec10  274D           BEQ 0xec5f                        
LAB_ec12:
  ec12  CCEC1C         LDD #0xec1c                       
  ec15  2008           BRA 0xec1f                        
LAB_ec17:
  ec17  7F61AC         CLR 0x61ac                        
  ec1a  20F6           BRA 0xec12                        

; ---- function FUN_ec1c
FUN_ec1c:
  ec1c  CCEBFA         LDD #0xebfa                       
LAB_ec1f:
  ec1f  FD61AA         STD 0x61aa                        
  ec22  39             RTS                               
LAB_ec23:
  ec23  CCEC28         LDD #0xec28                       
  ec26  20F7           BRA 0xec1f                        

; ---- function FUN_ec28
FUN_ec28:
  ec28  FC6103         LDD 0x6103                        
  ec2b  58             LSLB                              
  ec2c  A662           LDA 0x2,S                         
  ec2e  44             LSRA                              
  ec2f  56             RORB                              
LAB_ec30:
  ec30  FD6103         STD 0x6103                        
  ec33  86FF           LDA #0xff                         
  ec35  B761AC         STA 0x61ac                        
  ec38  20E2           BRA 0xec1c                        
LAB_ec3a:
  ec3a  CCEC3F         LDD #0xec3f                       
  ec3d  20E0           BRA 0xec1f                        

; ---- function FUN_ec3f
FUN_ec3f:
  ec3f  FC6103         LDD 0x6103                        
  ec42  C480           ANDB #0x80                        
  ec44  EA62           ORB 0x2,S                         
  ec46  20E8           BRA 0xec30                        
LAB_ec48:
  ec48  7D61AC         TST 0x61ac                        
  ec4b  27C5           BEQ 0xec12                        
  ec4d  CCEC52         LDD #0xec52                       
  ec50  20CD           BRA 0xec1f                        

; ---- function FUN_ec52
FUN_ec52:
  ec52  FC60F9         LDD 0x60f9                        
  ec55  58             LSLB                              
  ec56  A662           LDA 0x2,S                         
  ec58  44             LSRA                              
  ec59  56             RORB                              
  ec5a  FD60F9         STD 0x60f9                        
  ec5d  20BD           BRA 0xec1c                        
LAB_ec5f:
  ec5f  7D61AC         TST 0x61ac                        
  ec62  27AE           BEQ 0xec12                        
  ec64  CCEC69         LDD #0xec69                       
  ec67  20B6           BRA 0xec1f                        

; ---- function FUN_ec69
FUN_ec69:
  ec69  FC60F9         LDD 0x60f9                        
  ec6c  C480           ANDB #0x80                        
  ec6e  EA62           ORB 0x2,S                         
  ec70  FD60F9         STD 0x60f9                        
  ec73  BDEC78         JSR 0xec78                        
  ec76  20A4           BRA 0xec1c                        

; ---- function FUN_ec78
FUN_ec78:
  ec78  3436           PSHS  Y X B A                     
  ec7a  FC6103         LDD 0x6103                        
  ec7d  8520           BITA #0x20                        
  ec7f  272F           BEQ 0xecb0                        
  ec81  851F           BITA #0x1f                        
  ec83  2702           BEQ 0xec87                        
  ec85  2057           BRA 0xecde                        
LAB_ec87:
  ec87  7D61B0         TST 0x61b0                        
  ec8a  2712           BEQ 0xec9e                        
  ec8c  C407           ANDB #0x7                         
  ec8e  58             LSLB                              
  ec8f  8EECA0         LDX #0xeca0                       
  ec92  3085           LEAX B,X                          
  ec94  FC60F9         LDD 0x60f9                        
  ec97  8D48           BSR 0xece1                        
  ec99  FD60F9         STD 0x60f9                        
  ec9c  AD94           JSR [,X]                          
LAB_ec9e:
  ec9e  203E           BRA 0xecde                        
  eca0  A4A6A4E3A50A.. addr[8]                           
LAB_ecb0:
  ecb0  7D61AF         TST 0x61af                        
  ecb3  2729           BEQ 0xecde                        
  ecb5  FC6103         LDD 0x6103                        
  ecb8  10B360F7       CMPD 0x60f7                       
  ecbc  2420           BCC 0xecde                        
  ecbe  FC6103         LDD 0x6103                        
  ecc1  58             LSLB                              
  ecc2  49             ROLA                              
  ecc3  F360F5         ADDD 0x60f5                       
  ecc6  2716           BEQ 0xecde                        
  ecc8  F3600D         ADDD 0x600d                       
  eccb  1F01           TFR D,X                           
  eccd  EC84           LDD ,X                            
  eccf  F3600D         ADDD 0x600d                       
  ecd2  1F01           TFR D,X                           
  ecd4  FC60F9         LDD 0x60f9                        
  ecd7  8D08           BSR 0xece1                        
  ecd9  FD60F9         STD 0x60f9                        
  ecdc  AD84           JSR ,X                            
LAB_ecde:
  ecde  3536           PULS  A B X Y                     
  ece0  39             RTS                               

; ---- function FUN_ece1
FUN_ece1:
  ece1  8520           BITA #0x20                        
  ece3  2702           BEQ 0xece7                        
  ece5  8AC0           ORA #0xc0                         
LAB_ece7:
  ece7  39             RTS                               

; ---- function FUN_ece8
FUN_ece8:
  ece8  3406           PSHS  B A                         
  ecea  CC8877         LDD #0x8877                       
  eced  FD61AA         STD 0x61aa                        
  ecf0  7F61AC         CLR 0x61ac                        
  ecf3  CC0000         LDD #0x0                          
  ecf6  FD60F5         STD 0x60f5                        
  ecf9  FD60F7         STD 0x60f7                        
  ecfc  3506           PULS  A B                         
  ecfe  39             RTS                               

; ---- function FUN_ecff
FUN_ecff:
  ecff  3436           PSHS  Y X B A                     
  ed01  8E0113         LDX #0x113                        
  ed04  17B48F         LBSR 0xa196                       
  ed07  F761AE         STB 0x61ae                        
  ed0a  8E0112         LDX #0x112                        
  ed0d  17B486         LBSR 0xa196                       
  ed10  F761AD         STB 0x61ad                        
  ed13  8E0115         LDX #0x115                        
  ed16  17B47D         LBSR 0xa196                       
  ed19  F761B0         STB 0x61b0                        
  ed1c  8E0114         LDX #0x114                        
  ed1f  17B474         LBSR 0xa196                       
  ed22  F761AF         STB 0x61af                        
  ed25  3536           PULS  A B X Y                     
  ed27  39             RTS                               

; ---- function FUN_ed28
FUN_ed28:
  ed28  17B8FE         LBSR 0xa629                       
  ed2b  CC9C05         LDD #0x9c05                       
  ed2e  FD6030         STD 0x6030                        
  ed31  CC9BE2         LDD #0x9be2                       
  ed34  FD6036         STD 0x6036                        
  ed37  17A9B3         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Enables for Transmitting MIDI Sequences "
  ed3a  01456E61626C.. char[42] 01h,"Enables for Transmitting MIDI Sequences "
LAB_ed64:
  ed64  39             RTS                               

; ---- function FUN_ed65
FUN_ed65:
  ed65  3404           PSHS  B                           
  ed67  F660B9         LDB 0x60b9                        
  ed6a  17B960         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$ED89 "(Levels=#)"
  ed6d  ED89           addr ed89                         
  ed6f  284C6576656C.. ds "(Levels=#)"                   
LAB_ed79:
  ed79  170209         LBSR 0xef85                       
  ed7c  CB08           ADDB #0x8                         
  ed7e  1F98           TFR B,A                           
  ed80  F661AE         LDB 0x61ae                        
  ed83  17018F         LBSR 0xef15                       
  ed86  3504           PULS  B                           
  ed88  39             RTS                               

; ---- function FUN_ed89
FUN_ed89:
  ed89  3436           PSHS  Y X B A                     
  ed8b  F661AE         LDB 0x61ae                        
  ed8e  1701C6         LBSR 0xef57                       
  ed91  F761AE         STB 0x61ae                        
  ed94  170195         LBSR 0xef2c                       
  ed97  17A953         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}Outputing Levels Info {6}"
  ed9a  020005284F75.. char[28] 02h                      
LAB_edb6:
  edb6  108E0113       LDY #0x113                        
  edba  17B412         LBSR 0xa1cf                       
  edbd  8DA6           BSR 0xed65                        
  edbf  3536           PULS  A B X Y                     
  edc1  39             RTS                               

; ---- function FUN_edc2
FUN_edc2:
  edc2  3404           PSHS  B                           
  edc4  F660B9         LDB 0x60b9                        
  edc7  17B903         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$EDE6 "( Pgm=#  )"
  edca  EDE6           addr ede6                         
  edcc  282050676D3D.. ds "( Pgm=#  )"                   
LAB_edd6:
  edd6  1701AC         LBSR 0xef85                       
  edd9  CB06           ADDB #0x6                         
  eddb  1F98           TFR B,A                           
  eddd  F661AD         LDB 0x61ad                        
  ede0  170132         LBSR 0xef15                       
  ede3  3504           PULS  B                           
  ede5  39             RTS                               

; ---- function FUN_ede6
FUN_ede6:
  ede6  3436           PSHS  Y X B A                     
  ede8  F661AD         LDB 0x61ad                        
  edeb  170169         LBSR 0xef57                       
  edee  F761AD         STB 0x61ad                        
  edf1  170138         LBSR 0xef2c                       
  edf4  17A8F6         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}Program Info Output {6}"
  edf7  020005285072.. char[26] 02h                      
LAB_ee11:
  ee11  108E0112       LDY #0x112                        
  ee15  17B3B7         LBSR 0xa1cf                       
  ee18  8DA8           BSR 0xedc2                        
  ee1a  3536           PULS  A B X Y                     
  ee1c  39             RTS                               

; ---- function FUN_ee1d
FUN_ee1d:
  ee1d  39             RTS                               

; ---- function FUN_ee1e
FUN_ee1e:
  ee1e  39             RTS                               

; ---- function FUN_ee1f
FUN_ee1f:
  ee1f  17B807         LBSR 0xa629                       
  ee22  CC9C05         LDD #0x9c05                       
  ee25  FD6030         STD 0x6030                        
  ee28  CC9BE2         LDD #0x9be2                       
  ee2b  FD6036         STD 0x6036                        
  ee2e  17A8BC         LBSR 0x96ed                        ; inline[API_FC38]: "{1}Enables for Receiving MIDI Sequences"
  ee31  01456E61626C.. char[38] 01h,"Enables for Receiving MIDI Sequences"
LAB_ee57:
  ee57  39             RTS                               

; ---- function FUN_ee58
FUN_ee58:
  ee58  3404           PSHS  B                           
  ee5a  F660B9         LDB 0x60b9                        
  ee5d  17B86D         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$EE7C "(Levels=#)"
  ee60  EE7C           addr ee7c                         
  ee62  284C6576656C.. ds "(Levels=#)"                   
LAB_ee6c:
  ee6c  170116         LBSR 0xef85                       
  ee6f  CB08           ADDB #0x8                         
  ee71  1F98           TFR B,A                           
  ee73  F661B0         LDB 0x61b0                        
  ee76  17009C         LBSR 0xef15                       
  ee79  3504           PULS  B                           
  ee7b  39             RTS                               

; ---- function FUN_ee7c
FUN_ee7c:
  ee7c  3436           PSHS  Y X B A                     
  ee7e  F661B0         LDB 0x61b0                        
  ee81  1700D3         LBSR 0xef57                       
  ee84  F761B0         STB 0x61b0                        
  ee87  1700A2         LBSR 0xef2c                       
  ee8a  17A860         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}Receiving Levels Info {6}"
  ee8d  020005285265.. char[28] 02h                      
LAB_eea9:
  eea9  108E0115       LDY #0x115                        
  eead  17B31F         LBSR 0xa1cf                       
  eeb0  8DA6           BSR 0xee58                        
  eeb2  3536           PULS  A B X Y                     
  eeb4  39             RTS                               

; ---- function FUN_eeb5
FUN_eeb5:
  eeb5  3404           PSHS  B                           
  eeb7  F660B9         LDB 0x60b9                        
  eeba  17B810         LBSR 0xa6cd                        ; inline[API_FC8A]: ->$EED9 "( Pgm=#  )"
  eebd  EED9           addr eed9                         
  eebf  282050676D3D.. ds "( Pgm=#  )"                   
LAB_eec9:
  eec9  1700B9         LBSR 0xef85                       
  eecc  CB06           ADDB #0x6                         
  eece  1F98           TFR B,A                           
  eed0  F661AF         LDB 0x61af                        
  eed3  17003F         LBSR 0xef15                       
  eed6  3504           PULS  B                           
  eed8  39             RTS                               

; ---- function FUN_eed9
FUN_eed9:
  eed9  3436           PSHS  Y X B A                     
  eedb  F661AF         LDB 0x61af                        
  eede  170076         LBSR 0xef57                       
  eee1  F761AF         STB 0x61af                        
  eee4  170045         LBSR 0xef2c                       
  eee7  17A803         LBSR 0x96ed                        ; inline[API_FC38]: "{2:00}{5:28}Program Info Receiving {6}"
  eeea  020005285072.. char[29] 02h                      
LAB_ef07:
  ef07  108E0114       LDY #0x114                        
  ef0b  17B2C1         LBSR 0xa1cf                       
  ef0e  8DA5           BSR 0xeeb5                        
  ef10  3536           PULS  A B X Y                     
  ef12  39             RTS                               

; ---- function FUN_ef13
FUN_ef13:
  ef13  39             RTS                               

; ---- function FUN_ef14
FUN_ef14:
  ef14  39             RTS                               

; ---- function FUN_ef15
FUN_ef15:
  ef15  3406           PSHS  B A                         
  ef17  1F89           TFR A,B                           
  ef19  17A7BF         LBSR 0x96db                       
  ef1c  6D61           TST 0x1,S                         
  ef1e  2604           BNE 0xef24                        
  ef20  C64E           LDB #0x4e                         
  ef22  2002           BRA 0xef26                        
LAB_ef24:
  ef24  C659           LDB #0x59                         
LAB_ef26:
  ef26  17A6FC         LBSR 0x9625                       
  ef29  3506           PULS  A B                         
  ef2b  39             RTS                               

; ---- function FUN_ef2c
FUN_ef2c:
  ef2c  8D40           BSR 0xef6e                         ; inline[API_FE5E]: $EF45 $EF33
  ef2e  EF45           dw EF45h                          
  ef30  EF33           dw EF33h                          
LAB_ef32:
  ef32  39             RTS                               
  ef33  .db 68 61 73 20 62 65 65 6E 20 44 69 73 61 62 6C 65  ; has been Disable
  ef43  .db 64 00                                            ; d.
  ef45  686173206265.. ds "has been Enabled "            

; ---- function FUN_ef57
FUN_ef57:
  ef57  5D             TSTB                              
  ef58  2703           BEQ 0xef5d                        
  ef5a  5F             CLRB                              
  ef5b  2002           BRA 0xef5f                        
LAB_ef5d:
  ef5d  C6FF           LDB #0xff                         
LAB_ef5f:
  ef5f  39             RTS                               

; ---- function FUN_ef60
FUN_ef60:
  ef60  8D0C           BSR 0xef6e                         ; inline[API_FE5E]: $EF67 $EF6A
  ef62  EF67           dw EF67h                          
  ef64  EF6A           dw EF6Ah                          
LAB_ef66:
  ef66  39             RTS                               
  ef67  .db 4F 6E 00 4F 66 66 00                             ; On.Off.

; ---- function FUN_ef6e
FUN_ef6e:
  ef6e  3436           PSHS  Y X B A                     
  ef70  AE66           LDX 0x6,S                         
  ef72  3104           LEAY 0x4,X                        
  ef74  10AF66         STY 0x6,S                         
  ef77  5D             TSTB                              
  ef78  2604           BNE 0xef7e                        
  ef7a  EC02           LDD 0x2,X                         
  ef7c  2002           BRA 0xef80                        
LAB_ef7e:
  ef7e  EC84           LDD ,X                            
LAB_ef80:
  ef80  3606           PSHU  B A                         
  ef82  3536           PULS  A B X Y                     
  ef84  39             RTS                               

; ---- function FUN_ef85
FUN_ef85:
  ef85  3402           PSHS  A                           
  ef87  F660B9         LDB 0x60b9                        
  ef8a  860A           LDA #0xa                          
  ef8c  3D             MUL                               
  ef8d  CB28           ADDB #0x28                        
  ef8f  3502           PULS  A                           
  ef91  39             RTS                               
  ef92  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  efa2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  efb2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  efc2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  efd2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  efe2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  eff2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f002  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f012  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f022  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f032  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f042  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f052  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f062  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f072  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f082  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f092  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f0a2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f0b2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f0c2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f0d2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f0e2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f0f2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f102  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f112  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f122  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f132  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f142  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f152  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f162  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f172  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f182  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f192  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f1a2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f1b2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f1c2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f1d2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f1e2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f1f2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f202  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f212  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f222  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f232  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f242  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f252  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f262  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f272  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f282  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f292  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f2a2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f2b2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f2c2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f2d2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f2e2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f2f2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f302  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f312  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f322  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f332  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f342  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f352  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f362  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f372  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f382  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f392  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f3a2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f3b2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f3c2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f3d2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f3e2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f3f2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f402  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f412  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f422  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f432  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f442  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f452  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f462  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f472  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f482  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f492  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f4a2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f4b2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f4c2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f4d2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f4e2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f4f2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f502  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f512  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f522  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f532  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f542  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f552  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f562  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f572  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f582  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f592  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f5a2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f5b2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f5c2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f5d2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f5e2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f5f2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f602  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f612  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f622  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f632  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f642  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f652  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f662  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f672  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f682  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f692  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f6a2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f6b2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f6c2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f6d2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f6e2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f6f2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f702  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f712  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f722  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f732  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f742  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f752  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f762  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f772  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f782  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f792  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f7a2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f7b2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f7c2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f7d2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f7e2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f7f2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f802  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f812  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f822  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f832  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f842  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f852  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f862  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f872  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f882  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f892  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f8a2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f8b2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f8c2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f8d2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f8e2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f8f2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f902  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f912  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f922  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f932  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f942  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f952  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f962  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f972  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f982  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f992  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f9a2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f9b2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f9c2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f9d2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f9e2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  f9f2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fa02  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fa12  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fa22  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fa32  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fa42  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fa52  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fa62  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fa72  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fa82  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fa92  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  faa2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fab2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fac2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fad2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fae2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  faf2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fb02  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fb12  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fb22  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fb32  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fb42  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fb52  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fb62  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fb72  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fb82  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fb92  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fba2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fbb2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fbc2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fbd2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fbe2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fbf2  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF        ; ..............
KernelApiTable:
  fc00  887588BB88CF.. addr[256]                         
PTR_ARRAY_fe00:
  fe00  E4E4E51DE69D.. addr[50]                          
  fe64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  fe74  .db FF FF FF FF FF FF FF FF FF FF FF FF              ; ............

;; Kernel API slot $FC9C: push current bank on caller stack, select bank B

; ---- function BankPushSelect
BankPushSelect:
  fe80  3402           PSHS  A                           
  fe82  3403           PSHS  A CC                        
  fe84  A663           LDA 0x3,S                         
  fe86  A762           STA 0x2,S                         
  fe88  A664           LDA 0x4,S                         
  fe8a  A763           STA 0x3,S                         
  fe8c  B6600B         LDA 0x600b                        
  fe8f  A764           STA 0x4,S                         
  fe91  F7600B         STB 0x600b                        
  fe94  F78052         STB 0x8052                        
  fe97  3503           PULS CC A                         
  fe99  39             RTS                               

;; Kernel API slot $FC9E: pop bank pushed by BankPushSelect

; ---- function BankPop
BankPop:
  fe9a  3402           PSHS  A                           
  fe9c  A663           LDA 0x3,S                         
  fe9e  B7600B         STA 0x600b                        
  fea1  B78052         STA 0x8052                        
  fea4  A662           LDA 0x2,S                         
  fea6  A763           STA 0x3,S                         
  fea8  A661           LDA 0x1,S                         
  feaa  A762           STA 0x2,S                         
  feac  A6E1           LDA ,S++                          
  feae  39             RTS                               

; ---- function API_FCA0
API_FCA0:
  feaf  3403           PSHS  A CC                        
  feb1  B6600B         LDA 0x600b                        
  feb4  3402           PSHS  A                           
  feb6  B6600C         LDA 0x600c                        
  feb9  B7600B         STA 0x600b                        
  febc  B78052         STA 0x8052                        
  febf  E684           LDB ,X                            
  fec1  3502           PULS  A                           
  fec3  B7600B         STA 0x600b                        
  fec6  B78052         STA 0x8052                        
  fec9  3503           PULS CC A                         
  fecb  39             RTS                               

; ---- function API_FCA2
API_FCA2:
  fecc  3403           PSHS  A CC                        
  fece  B6600B         LDA 0x600b                        
  fed1  3402           PSHS  A                           
  fed3  B6600C         LDA 0x600c                        
  fed6  B7600B         STA 0x600b                        
  fed9  B78052         STA 0x8052                        
  fedc  E7A4           STB ,Y                            
  fede  3502           PULS  A                           
  fee0  B7600B         STA 0x600b                        
  fee3  B78052         STA 0x8052                        
  fee6  3503           PULS CC A                         
  fee8  39             RTS                               

; ---- function API_FDDC
API_FDDC:
  fee9  3447           PSHS  U B A CC                    
  feeb  327F           LEAS -0x1,S                       
  feed  1F23           TFR Y,U                           
  feef  1F02           TFR D,Y                           
  fef1  B6600B         LDA 0x600b                        
  fef4  A7E4           STA ,S                            
LAB_fef6:
  fef6  B6600C         LDA 0x600c                        
  fef9  B7600B         STA 0x600b                        
  fefc  B78052         STA 0x8052                        
  feff  E680           LDB ,X+                           
  ff01  A6E4           LDA ,S                            
  ff03  B7600B         STA 0x600b                        
  ff06  B78052         STA 0x8052                        
  ff09  E7C0           STB ,U+                           
  ff0b  313F           LEAY -0x1,Y                       
  ff0d  26E7           BNE 0xfef6                        
  ff0f  1F32           TFR U,Y                           
  ff11  3261           LEAS 0x1,S                        
  ff13  3547           PULS CC A B U                     
  ff15  39             RTS                               

; ---- function API_FDDE
API_FDDE:
  ff16  3447           PSHS  U B A CC                    
  ff18  327F           LEAS -0x1,S                       
  ff1a  1F23           TFR Y,U                           
  ff1c  1F02           TFR D,Y                           
  ff1e  B6600B         LDA 0x600b                        
  ff21  A7E4           STA ,S                            
LAB_ff23:
  ff23  A6E4           LDA ,S                            
  ff25  B7600B         STA 0x600b                        
  ff28  B78052         STA 0x8052                        
  ff2b  E680           LDB ,X+                           
  ff2d  B6600C         LDA 0x600c                        
  ff30  B7600B         STA 0x600b                        
  ff33  B78052         STA 0x8052                        
  ff36  E7C0           STB ,U+                           
  ff38  313F           LEAY -0x1,Y                       
  ff3a  26E7           BNE 0xff23                        
  ff3c  A6E4           LDA ,S                            
  ff3e  B7600B         STA 0x600b                        
  ff41  B78052         STA 0x8052                        
  ff44  1F32           TFR U,Y                           
  ff46  3261           LEAS 0x1,S                        
  ff48  3547           PULS CC A B U                     
  ff4a  39             RTS                               

;; Kernel API slot $FCFE: inline ptr to ring buffer descriptor

; ---- function RingBufInit
RingBufInit:
  ff4b  3436           PSHS  Y X B A                     
  ff4d  AE66           LDX 0x6,S                         
  ff4f  10AE81         LDY ,X++                          
  ff52  AF66           STX 0x6,S                         
  ff54  EDA4           STD ,Y                            
  ff56  3028           LEAX 0x8,Y                        
  ff58  AF22           STX 0x2,Y                         
  ff5a  AF24           STX 0x4,Y                         
  ff5c  6F27           CLR 0x7,Y                         
  ff5e  86FF           LDA #0xff                         
  ff60  A726           STA 0x6,Y                         
  ff62  3536           PULS  A B X Y                     
  ff64  39             RTS                               

;; Kernel API slot $FD00: inline descriptor; B = byte

; ---- function RingBufPut
RingBufPut:
  ff65  3436           PSHS  Y X B A                     
  ff67  AE66           LDX 0x6,S                         
  ff69  10AE81         LDY ,X++                          
  ff6c  AF66           STX 0x6,S                         
  ff6e  6D27           TST 0x7,Y                         
  ff70  2623           BNE 0xff95                        
  ff72  AE22           LDX 0x2,Y                         
  ff74  E780           STB ,X+                           
  ff76  3401           PSHS  CC                          
  ff78  1A50           ORCC #0x50                        
  ff7a  AF22           STX 0x2,Y                         
  ff7c  1F20           TFR Y,D                           
  ff7e  E3A4           ADDD ,Y                           
  ff80  10A322         CMPD 0x2,Y                        
  ff83  2604           BNE 0xff89                        
  ff85  3028           LEAX 0x8,Y                        
  ff87  AF22           STX 0x2,Y                         
LAB_ff89:
  ff89  AC24           CMPX 0x4,Y                        
  ff8b  2604           BNE 0xff91                        
  ff8d  C6FF           LDB #0xff                         
  ff8f  E727           STB 0x7,Y                         
LAB_ff91:
  ff91  3501           PULS CC                           
  ff93  6F26           CLR 0x6,Y                         
LAB_ff95:
  ff95  3536           PULS  A B X Y                     
  ff97  39             RTS                               

;; Kernel API slot $FD02: inline descriptor; B = byte

; ---- function RingBufGet
RingBufGet:
  ff98  3432           PSHS  Y X A                       
  ff9a  AE65           LDX 0x5,S                         
  ff9c  10AE81         LDY ,X++                          
  ff9f  AF65           STX 0x5,S                         
  ffa1  6D26           TST 0x6,Y                         
  ffa3  2623           BNE 0xffc8                        
  ffa5  AE24           LDX 0x4,Y                         
  ffa7  E680           LDB ,X+                           
  ffa9  3405           PSHS  B CC                        
  ffab  1A50           ORCC #0x50                        
  ffad  AF24           STX 0x4,Y                         
  ffaf  1F20           TFR Y,D                           
  ffb1  E3A4           ADDD ,Y                           
  ffb3  10A324         CMPD 0x4,Y                        
  ffb6  2604           BNE 0xffbc                        
  ffb8  3028           LEAX 0x8,Y                        
  ffba  AF24           STX 0x4,Y                         
LAB_ffbc:
  ffbc  AC22           CMPX 0x2,Y                        
  ffbe  2604           BNE 0xffc4                        
  ffc0  C6FF           LDB #0xff                         
  ffc2  E726           STB 0x6,Y                         
LAB_ffc4:
  ffc4  3505           PULS CC B                         
  ffc6  6F27           CLR 0x7,Y                         
LAB_ffc8:
  ffc8  3532           PULS  A X Y                       
  ffca  39             RTS                               
  ffcb  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  ffdb  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  ffeb  .db FF                                               ; .
DAT_ffec:
  ffec  FF             ?? FFh                            
DAT_ffed:
  ffed  FF             ?? FFh                            
DAT_ffee:
  ffee  FF             ?? FFh                            
DAT_ffef:
  ffef  FF             ?? FFh                            
VEC_RESERVED:
  fff0  0000           addr 0000                         
VEC_SWI3:
  fff2  67C0           addr 67c0                         
VEC_SWI2:
  fff4  6780           addr 6780                         
VEC_FIRQ:
  fff6  8878           addr 8878                         
VEC_IRQ:
  fff8  85C2           addr 85c2                         
VEC_SWI:
  fffa  6700           addr 6700                         
VEC_NMI:
  fffc  8823           addr 8823                         
VEC_RESET:
  fffe  8400           addr 8400                         
