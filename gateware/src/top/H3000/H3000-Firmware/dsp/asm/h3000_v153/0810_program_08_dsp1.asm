; Eventide h3000_v153 DSP microcode
; key 0810  algorithm 08 (program 08)  DSP 1
; source H3000_153_BigROM.BIN offset 0AA73, 277 program words loaded at 800
;
  800  6880        LARP  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6E00        LDPK  0
  804  7E01        LACK  0x01
  805  5006        SACL  0x06
  806  2806        LAC   0x06,8
  807  5004        SACL  0x04
  808  2306        LAC   0x06,3
  809  5005        SACL  0x05
  80A  2E06        LAC   0x06,14
  80B  5009        SACL  0x09
  80C  2F06        LAC   0x06,15
  80D  500B        SACL  0x0B
  80E  7F89        ZAC
  80F  5008        SACL  0x08
  810  1006        SUB   0x06
  811  5807        SACH  0x07
  812  7EFF        LACK  0xFF
  813  5013        SACL  0x13
  814  5041        SACL  0x41
  815  5042        SACL  0x42
  816  500D        SACL  0x0D
  817  5002        SACL  0x02
  818  2702        LAC   0x02,7
  819  7A02        OR    0x02
  81A  500A        SACL  0x0A
  81B  7F80        NOP
L81C:
  81C  F600 0820   BIOZ  L820
  81E  F900 081C   B     L81C

L820:
  820  F600 0820   BIOZ  L820
  822  4002        IN    0x02,PA0
  823  6502        ZALH  0x02
  824  FD00 0827   BGEZ  L827
  826  7F80        NOP
L827:
  827  F600 082B   BIOZ  L82B
  829  F900 0827   B     L827

L82B:
  82B  F600 082B   BIOZ  L82B
  82D  7F89        ZAC
  82E  5008        SACL  0x08
  82F  5003        SACL  0x03
  830  500F        SACL  0x0F
  831  5016        SACL  0x16
  832  5017        SACL  0x17
  833  5000        SACL  0x00
  834  5001        SACL  0x01
  835  4D08        OUT   0x08,PA5
  836  4E08        OUT   0x08,PA6
L837:
  837  4F03        OUT   0x03,PA7
  838  4C08        OUT   0x08,PA4
  839  0006        ADD   0x06
  83A  5003        SACL  0x03
  83B  4502        IN    0x02,PA5
  83C  6881        LARP  1
  83D  6602        ZALS  0x02
  83E  7904        AND   0x04
  83F  FE00 0844   BNZ   L844
  841  6880        LARP  0
  842  F900 0846   B     L846

L844:
  844  3902        LAR   AR1,0x02
  845  4680        IN    *,PA6,AR0
L846:
  846  4F03        OUT   0x03,PA7
  847  4C08        OUT   0x08,PA4
  848  6603        ZALS  0x03
  849  0006        ADD   0x06
  84A  5003        SACL  0x03
  84B  6603        ZALS  0x03
  84C  FE00 0837   BNZ   L837
L84E:
  84E  F600 0852   BIOZ  L852
  850  F900 084E   B     L84E

L852:
  852  F600 0852   BIOZ  L852
  854  4002        IN    0x02,PA0
  855  6502        ZALH  0x02
  856  FD00 0859   BGEZ  L859
  858  7F80        NOP
L859:
  859  7000        LARK  AR0,0x00
  85A  650A        ZALH  0x0A
  85B  5814        SACH  0x14
  85C  2F14        LAC   0x14,15
L85D:
  85D  F600 0861   BIOZ  L861
  85F  F900 085D   B     L85D

L861:
  861  F600 0861   BIOZ  L861
L863:
  863  6009        ADDH  0x09
  864  4717        IN    0x17,PA7
  865  5815        SACH  0x15
  866  7F80        NOP
  867  7F80        NOP
  868  7F80        NOP
  869  410E        IN    0x0E,PA1
  86A  6613        ZALS  0x13
  86B  630E        SUBS  0x0E
  86C  FC00 08C0   BGZ   L8C0
  86E  4002        IN    0x02,PA0
  86F  6605        ZALS  0x05
  870  7902        AND   0x02
  871  FE00 0875   BNZ   L875
  873  F900 0876   B     L876

L875:
  875  4DA8        OUT   *+,PA5
L876:
  876  3003        SAR   AR0,0x03
  877  6613        ZALS  0x13
  878  6103        ADDS  0x03
  879  6106        ADDS  0x06
  87A  5013        SACL  0x13
  87B  610F        ADDS  0x0F
  87C  7F80        NOP
  87D  5010        SACL  0x10
  87E  610D        ADDS  0x0D
  87F  5011        SACL  0x11
  880  4F10        OUT   0x10,PA7
  881  4418        IN    0x18,PA4
  882  4419        IN    0x19,PA4
  883  4F11        OUT   0x11,PA7
  884  441A        IN    0x1A,PA4
  885  441B        IN    0x1B,PA4
  886  3808        LAR   AR0,0x08
  887  6A15        LT    0x15
  888  6D1A        MPY   0x1A
  889  7F8E        PAC
  88A  6D18        MPY   0x18
  88B  7F90        SPAC
  88C  0F18        ADD   0x18,15
  88D  5900        SACH  0x00,1
  88E  4002        IN    0x02,PA0
  88F  6605        ZALS  0x05
  890  7902        AND   0x02
  891  FE00 0895   BNZ   L895
  893  F900 0896   B     L896

L895:
  895  4DA8        OUT   *+,PA5
L896:
  896  6A15        LT    0x15
  897  6D1B        MPY   0x1B
  898  7F8E        PAC
  899  6D19        MPY   0x19
  89A  7F90        SPAC
  89B  0F19        ADD   0x19,15
  89C  5901        SACH  0x01,1
  89D  4502        IN    0x02,PA5
  89E  6881        LARP  1
  89F  6602        ZALS  0x02
  8A0  7904        AND   0x04
  8A1  FE00 08A6   BNZ   L8A6
  8A3  6880        LARP  0
  8A4  F900 08A8   B     L8A8

L8A6:
  8A6  3902        LAR   AR1,0x02
  8A7  4680        IN    *,PA6,AR0
L8A8:
  8A8  2F16        LAC   0x16,15
  8A9  4A0F        OUT   0x0F,PA2
  8AA  0F17        ADD   0x17,15
  8AB  580C        SACH  0x0C
  8AC  4F0F        OUT   0x0F,PA7
  8AD  4C0C        OUT   0x0C,PA4
  8AE  4002        IN    0x02,PA0
  8AF  6605        ZALS  0x05
  8B0  7902        AND   0x02
  8B1  FE00 08B5   BNZ   L8B5
  8B3  F900 08B6   B     L8B6

L8B5:
  8B5  4DA8        OUT   *+,PA5
L8B6:
  8B6  660F        ZALS  0x0F
  8B7  1006        SUB   0x06
  8B8  500F        SACL  0x0F
  8B9  4716        IN    0x16,PA7
  8BA  6514        ZALH  0x14
  8BB  6042        ADDH  0x42
  8BC  5814        SACH  0x14
  8BD  2F14        LAC   0x14,15
  8BE  F900 0863   B     L863

L8C0:
  8C0  4002        IN    0x02,PA0
  8C1  6605        ZALS  0x05
  8C2  7902        AND   0x02
  8C3  FE00 08C7   BNZ   L8C7
  8C5  F900 08C8   B     L8C8

L8C7:
  8C7  4DA8        OUT   *+,PA5
L8C8:
  8C8  3003        SAR   AR0,0x03
  8C9  6613        ZALS  0x13
  8CA  630E        SUBS  0x0E
  8CB  6103        ADDS  0x03
  8CC  6106        ADDS  0x06
  8CD  5013        SACL  0x13
  8CE  610F        ADDS  0x0F
  8CF  7F80        NOP
  8D0  610E        ADDS  0x0E
  8D1  5011        SACL  0x11
  8D2  4F11        OUT   0x11,PA7
  8D3  4400        IN    0x00,PA4
  8D4  4401        IN    0x01,PA4
  8D5  660E        ZALS  0x0E
  8D6  500D        SACL  0x0D
  8D7  3808        LAR   AR0,0x08
  8D8  7F80        NOP
  8D9  7F80        NOP
  8DA  7F80        NOP
  8DB  7F80        NOP
  8DC  7F80        NOP
  8DD  7F80        NOP
  8DE  7F80        NOP
  8DF  7F80        NOP
  8E0  7F80        NOP
  8E1  7F80        NOP
  8E2  7F80        NOP
  8E3  4002        IN    0x02,PA0
  8E4  6605        ZALS  0x05
  8E5  7902        AND   0x02
  8E6  FE00 08EA   BNZ   L8EA
  8E8  F900 08EB   B     L8EB

L8EA:
  8EA  4DA8        OUT   *+,PA5
L8EB:
  8EB  7F80        NOP
  8EC  7F80        NOP
  8ED  7F80        NOP
  8EE  7F80        NOP
  8EF  7F80        NOP
  8F0  7F80        NOP
  8F1  7F80        NOP
  8F2  4502        IN    0x02,PA5
  8F3  6881        LARP  1
  8F4  6602        ZALS  0x02
  8F5  7904        AND   0x04
  8F6  FE00 08FB   BNZ   L8FB
  8F8  6880        LARP  0
  8F9  F900 08FD   B     L8FD

L8FB:
  8FB  3902        LAR   AR1,0x02
  8FC  4680        IN    *,PA6,AR0
L8FD:
  8FD  2F16        LAC   0x16,15
  8FE  4A0F        OUT   0x0F,PA2
  8FF  0F17        ADD   0x17,15
  900  580C        SACH  0x0C
  901  4F0F        OUT   0x0F,PA7
  902  4C0C        OUT   0x0C,PA4
  903  4002        IN    0x02,PA0
  904  6605        ZALS  0x05
  905  7902        AND   0x02
  906  FE00 090A   BNZ   L90A
  908  F900 090B   B     L90B

L90A:
  90A  4DA8        OUT   *+,PA5
L90B:
  90B  660F        ZALS  0x0F
  90C  1006        SUB   0x06
  90D  500F        SACL  0x0F
  90E  4716        IN    0x16,PA7
  90F  650A        ZALH  0x0A
  910  7F80        NOP
  911  5814        SACH  0x14
  912  2F14        LAC   0x14,15
  913  F900 0863   B     L863

