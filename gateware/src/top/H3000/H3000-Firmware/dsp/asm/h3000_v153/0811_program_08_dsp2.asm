; Eventide h3000_v153 DSP microcode
; key 0811  algorithm 08 (program 08)  DSP 2
; source H3000_153_BigROM.BIN offset 0ACA7, 289 program words loaded at 800
;
  800  6880        LARP  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6E00        LDPK  0
  804  7E01        LACK  0x01
  805  5006        SACL  0x06
  806  2906        LAC   0x06,9
  807  5004        SACL  0x04
  808  2E06        LAC   0x06,14
  809  5009        SACL  0x09
  80A  2206        LAC   0x06,2
  80B  5005        SACL  0x05
  80C  2F06        LAC   0x06,15
  80D  500B        SACL  0x0B
  80E  5011        SACL  0x11
  80F  7F89        ZAC
  810  5008        SACL  0x08
  811  1006        SUB   0x06
  812  5807        SACH  0x07
  813  7EFF        LACK  0xFF
  814  5015        SACL  0x15
  815  5041        SACL  0x41
  816  5042        SACL  0x42
  817  500D        SACL  0x0D
  818  5002        SACL  0x02
  819  2702        LAC   0x02,7
  81A  7A02        OR    0x02
  81B  500A        SACL  0x0A
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
  82E  5003        SACL  0x03
  82F  5000        SACL  0x00
  830  5001        SACL  0x01
  831  500F        SACL  0x0F
  832  7F80        NOP
  833  7F80        NOP
  834  7F80        NOP
  835  7F80        NOP
  836  7F80        NOP
  837  7F80        NOP
  838  7F80        NOP
L839:
  839  7F80        NOP
  83A  7F80        NOP
  83B  7F80        NOP
  83C  7F80        NOP
  83D  0006        ADD   0x06
  83E  5003        SACL  0x03
  83F  4502        IN    0x02,PA5
  840  6881        LARP  1
  841  6602        ZALS  0x02
  842  7904        AND   0x04
  843  FE00 0848   BNZ   L848
  845  6880        LARP  0
  846  F900 084A   B     L84A

L848:
  848  3902        LAR   AR1,0x02
  849  4680        IN    *,PA6,AR0
L84A:
  84A  7F80        NOP
  84B  7F80        NOP
  84C  7F80        NOP
  84D  7F80        NOP
  84E  6603        ZALS  0x03
  84F  0006        ADD   0x06
  850  5003        SACL  0x03
  851  6603        ZALS  0x03
  852  FE00 0839   BNZ   L839
L854:
  854  F600 0858   BIOZ  L858
  856  F900 0854   B     L854

L858:
  858  F600 0858   BIOZ  L858
  85A  4002        IN    0x02,PA0
  85B  6502        ZALH  0x02
  85C  FD00 085F   BGEZ  L85F
  85E  7F80        NOP
L85F:
  85F  7000        LARK  AR0,0x00
  860  650A        ZALH  0x0A
  861  5817        SACH  0x17
  862  7F80        NOP
L863:
  863  F600 0867   BIOZ  L867
  865  F900 0863   B     L863

L867:
  867  F600 0867   BIOZ  L867
L869:
  869  7F80        NOP
  86A  7F80        NOP
  86B  7F80        NOP
  86C  7F80        NOP
  86D  7F80        NOP
  86E  7F80        NOP
  86F  7F80        NOP
  870  7F80        NOP
  871  430E        IN    0x0E,PA3
  872  6615        ZALS  0x15
  873  630E        SUBS  0x0E
  874  FC00 08CA   BGZ   L8CA
  876  4002        IN    0x02,PA0
  877  6605        ZALS  0x05
  878  7902        AND   0x02
  879  FE00 087D   BNZ   L87D
  87B  F900 087E   B     L87E

L87D:
  87D  4EA8        OUT   *+,PA6
L87E:
  87E  7F80        NOP
  87F  7F80        NOP
  880  420F        IN    0x0F,PA2
  881  7F80        NOP
  882  7F80        NOP
  883  7F80        NOP
  884  7F80        NOP
  885  4502        IN    0x02,PA5
  886  6881        LARP  1
  887  6602        ZALS  0x02
  888  7904        AND   0x04
  889  FE00 088E   BNZ   L88E
  88B  6880        LARP  0
  88C  F900 0890   B     L890

L88E:
  88E  3902        LAR   AR1,0x02
  88F  4680        IN    *,PA6,AR0
L890:
  890  7F80        NOP
  891  7F80        NOP
  892  7F80        NOP
  893  6516        ZALH  0x16
  894  6042        ADDH  0x42
  895  5816        SACH  0x16
  896  4002        IN    0x02,PA0
  897  6605        ZALS  0x05
  898  7902        AND   0x02
  899  FE00 089D   BNZ   L89D
  89B  F900 089E   B     L89E

L89D:
  89D  4EA8        OUT   *+,PA6
L89E:
  89E  3003        SAR   AR0,0x03
  89F  6615        ZALS  0x15
  8A0  6103        ADDS  0x03
  8A1  6106        ADDS  0x06
  8A2  5015        SACL  0x15
  8A3  610F        ADDS  0x0F
  8A4  7F80        NOP
  8A5  5012        SACL  0x12
  8A6  610D        ADDS  0x0D
  8A7  5013        SACL  0x13
  8A8  3808        LAR   AR0,0x08
  8A9  4F12        OUT   0x12,PA7
  8AA  441A        IN    0x1A,PA4
  8AB  441B        IN    0x1B,PA4
  8AC  4F13        OUT   0x13,PA7
  8AD  441C        IN    0x1C,PA4
  8AE  441D        IN    0x1D,PA4
  8AF  6A17        LT    0x17
  8B0  6D1C        MPY   0x1C
  8B1  7F8E        PAC
  8B2  6D1A        MPY   0x1A
  8B3  7F90        SPAC
  8B4  0F1A        ADD   0x1A,15
  8B5  5900        SACH  0x00,1
  8B6  4002        IN    0x02,PA0
  8B7  6605        ZALS  0x05
  8B8  7902        AND   0x02
  8B9  FE00 08BD   BNZ   L8BD
  8BB  F900 08BE   B     L8BE

L8BD:
  8BD  4EA8        OUT   *+,PA6
L8BE:
  8BE  6A17        LT    0x17
  8BF  6D1D        MPY   0x1D
  8C0  7F8E        PAC
  8C1  6D1B        MPY   0x1B
  8C2  7F90        SPAC
  8C3  0F1B        ADD   0x1B,15
  8C4  5901        SACH  0x01,1
  8C5  2F16        LAC   0x16,15
  8C6  6009        ADDH  0x09
  8C7  5817        SACH  0x17
  8C8  F900 0869   B     L869

L8CA:
  8CA  4002        IN    0x02,PA0
  8CB  6605        ZALS  0x05
  8CC  7902        AND   0x02
  8CD  FE00 08D1   BNZ   L8D1
  8CF  F900 08D2   B     L8D2

L8D1:
  8D1  4EA8        OUT   *+,PA6
L8D2:
  8D2  7F80        NOP
  8D3  7F80        NOP
  8D4  420F        IN    0x0F,PA2
  8D5  7F80        NOP
  8D6  7F80        NOP
  8D7  7F80        NOP
  8D8  7F80        NOP
  8D9  4502        IN    0x02,PA5
  8DA  6881        LARP  1
  8DB  6602        ZALS  0x02
  8DC  7904        AND   0x04
  8DD  FE00 08E2   BNZ   L8E2
  8DF  6880        LARP  0
  8E0  F900 08E4   B     L8E4

L8E2:
  8E2  3902        LAR   AR1,0x02
  8E3  4680        IN    *,PA6,AR0
L8E4:
  8E4  7F80        NOP
  8E5  7F80        NOP
  8E6  7F80        NOP
  8E7  650A        ZALH  0x0A
  8E8  7F80        NOP
  8E9  5816        SACH  0x16
  8EA  4002        IN    0x02,PA0
  8EB  6605        ZALS  0x05
  8EC  7902        AND   0x02
  8ED  FE00 08F1   BNZ   L8F1
  8EF  F900 08F2   B     L8F2

L8F1:
  8F1  4EA8        OUT   *+,PA6
L8F2:
  8F2  3003        SAR   AR0,0x03
  8F3  6615        ZALS  0x15
  8F4  630E        SUBS  0x0E
  8F5  6103        ADDS  0x03
  8F6  6106        ADDS  0x06
  8F7  5015        SACL  0x15
  8F8  610F        ADDS  0x0F
  8F9  7F80        NOP
  8FA  610E        ADDS  0x0E
  8FB  5013        SACL  0x13
  8FC  3808        LAR   AR0,0x08
  8FD  4F13        OUT   0x13,PA7
  8FE  4400        IN    0x00,PA4
  8FF  4401        IN    0x01,PA4
  900  660E        ZALS  0x0E
  901  500D        SACL  0x0D
  902  7F80        NOP
  903  7F80        NOP
  904  7F80        NOP
  905  7F80        NOP
  906  7F80        NOP
  907  7F80        NOP
  908  7F80        NOP
  909  7F80        NOP
  90A  7F80        NOP
  90B  7F80        NOP
  90C  7F80        NOP
  90D  4002        IN    0x02,PA0
  90E  6605        ZALS  0x05
  90F  7902        AND   0x02
  910  FE00 0914   BNZ   L914
  912  F900 0915   B     L915

L914:
  914  4EA8        OUT   *+,PA6
L915:
  915  7F80        NOP
  916  7F80        NOP
  917  7F80        NOP
  918  7F80        NOP
  919  7F80        NOP
  91A  7F80        NOP
  91B  7F80        NOP
  91C  650A        ZALH  0x0A
  91D  7F80        NOP
  91E  5817        SACH  0x17
  91F  F900 0869   B     L869

