; Eventide h3000_v153 DSP microcode
; key 2812  algorithm 28 (program 28)  DSP 3
; source H3000_153_BigROM.BIN offset 0A0CF, 216 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5000        SACL  0x00
  806  2A00        LAC   0x00,10
  807  5004        SACL  0x04
  808  5840        SACH  0x40
  809  5845        SACH  0x45
  80A  5842        SACH  0x42
  80B  5847        SACH  0x47
  80C  7EFF        LACK  0xFF
  80D  5001        SACL  0x01
  80E  2701        LAC   0x01,7
  80F  7A01        OR    0x01
  810  5001        SACL  0x01
  811  5041        SACL  0x41
  812  5046        SACL  0x46
L813:
  813  F600 0817   BIOZ  L817
  815  F900 0813   B     L813

L817:
  817  4002        IN    0x02,PA0
  818  6502        ZALH  0x02
  819  FD00 081C   BGEZ  L81C
  81B  7F80        NOP
L81C:
  81C  F600 081C   BIOZ  L81C
  81E  7F89        ZAC
  81F  5003        SACL  0x03
  820  7F80        NOP
  821  7F80        NOP
  822  500E        SACL  0x0E
  823  500F        SACL  0x0F
  824  5010        SACL  0x10
  825  5011        SACL  0x11
  826  5013        SACL  0x13
  827  5014        SACL  0x14
  828  5015        SACL  0x15
  829  5016        SACL  0x16
  82A  5017        SACL  0x17
  82B  5018        SACL  0x18
  82C  501D        SACL  0x1D
  82D  501E        SACL  0x1E
  82E  500D        SACL  0x0D
  82F  5012        SACL  0x12
  830  7F80        NOP
  831  7F80        NOP
L832:
  832  7F80        NOP
  833  7F80        NOP
  834  7F80        NOP
  835  7F80        NOP
  836  0000        ADD   0x00
  837  5003        SACL  0x03
  838  4502        IN    0x02,PA5
  839  6881        LARP  1
  83A  6602        ZALS  0x02
  83B  7904        AND   0x04
  83C  FE00 0841   BNZ   L841
  83E  6880        LARP  0
  83F  F900 0843   B     L843

L841:
  841  3902        LAR   AR1,0x02
  842  4680        IN    *,PA6,AR0
L843:
  843  7F80        NOP
  844  7F80        NOP
  845  7F80        NOP
  846  7F80        NOP
  847  6603        ZALS  0x03
  848  0000        ADD   0x00
  849  5003        SACL  0x03
  84A  6603        ZALS  0x03
  84B  FE00 0832   BNZ   L832
L84D:
  84D  F600 0851   BIOZ  L851
  84F  F900 084D   B     L84D

L851:
  851  4002        IN    0x02,PA0
  852  6502        ZALH  0x02
  853  FA00 0856   BLZ   L856
  855  7F80        NOP
L856:
  856  F600 0856   BIOZ  L856
L858:
  858  4502        IN    0x02,PA5
  859  6881        LARP  1
  85A  6602        ZALS  0x02
  85B  7904        AND   0x04
  85C  FE00 0861   BNZ   L861
  85E  6880        LARP  0
  85F  F900 0863   B     L863

L861:
  861  3902        LAR   AR1,0x02
  862  4680        IN    *,PA6,AR0
L863:
  863  650D        ZALH  0x0D
  864  4F05        OUT   0x05,PA7
  865  0F17        ADD   0x17,15
  866  4F06        OUT   0x06,PA7
  867  4417        IN    0x17,PA4
  868  4F07        OUT   0x07,PA7
  869  5819        SACH  0x19
  86A  6512        ZALH  0x12
  86B  4F08        OUT   0x08,PA7
  86C  0F17        ADD   0x17,15
  86D  581A        SACH  0x1A
  86E  4F09        OUT   0x09,PA7
  86F  6605        ZALS  0x05
  870  1000        SUB   0x00
  871  4F0A        OUT   0x0A,PA7
  872  440D        IN    0x0D,PA4
  873  5005        SACL  0x05
  874  614B        ADDS  0x4B
  875  4F0B        OUT   0x0B,PA7
  876  4412        IN    0x12,PA4
  877  4F0C        OUT   0x0C,PA7
  878  5006        SACL  0x06
  879  4910        OUT   0x10,PA1
  87A  4A15        OUT   0x15,PA2
  87B  614C        ADDS  0x4C
  87C  5007        SACL  0x07
  87D  614D        ADDS  0x4D
  87E  5008        SACL  0x08
  87F  614E        ADDS  0x4E
  880  5009        SACL  0x09
  881  614F        ADDS  0x4F
  882  500A        SACL  0x0A
  883  6150        ADDS  0x50
  884  500B        SACL  0x0B
  885  6151        ADDS  0x51
  886  500C        SACL  0x0C
  887  4E19        OUT   0x19,PA6
  888  4D1A        OUT   0x1A,PA5
  889  654A        ZALH  0x4A
  88A  FF00 08B2   BZ    L8B2
  88C  2F10        LAC   0x10,15
  88D  6A0F        LT    0x0F
  88E  6D47        MPY   0x47
  88F  6B0E        LTD   0x0E
  890  6D46        MPY   0x46
  891  1F0E        SUB   0x0E,15
  892  6B0D        LTD   0x0D
  893  6D45        MPY   0x45
  894  6C11        LTA   0x11
  895  6D49        MPY   0x49
  896  6B10        LTD   0x10
  897  6D48        MPY   0x48
  898  7F8F        APAC
  899  581B        SACH  0x1B
  89A  501C        SACL  0x1C
  89B  601B        ADDH  0x1B
  89C  611C        ADDS  0x1C
  89D  5810        SACH  0x10
  89E  2F15        LAC   0x15,15
  89F  6A14        LT    0x14
  8A0  6D47        MPY   0x47
  8A1  6B13        LTD   0x13
  8A2  6D46        MPY   0x46
  8A3  1F13        SUB   0x13,15
  8A4  6B12        LTD   0x12
  8A5  6D45        MPY   0x45
  8A6  6C16        LTA   0x16
  8A7  6D49        MPY   0x49
  8A8  6B15        LTD   0x15
  8A9  6D48        MPY   0x48
  8AA  7F8F        APAC
  8AB  581B        SACH  0x1B
  8AC  501C        SACL  0x1C
  8AD  601B        ADDH  0x1B
  8AE  611C        ADDS  0x1C
  8AF  5815        SACH  0x15
  8B0  F900 0858   B     L858

L8B2:
  8B2  2F10        LAC   0x10,15
  8B3  6A0F        LT    0x0F
  8B4  6D42        MPY   0x42
  8B5  6B0E        LTD   0x0E
  8B6  6D41        MPY   0x41
  8B7  1F0E        SUB   0x0E,15
  8B8  6B0D        LTD   0x0D
  8B9  6D40        MPY   0x40
  8BA  6C11        LTA   0x11
  8BB  6D44        MPY   0x44
  8BC  6B10        LTD   0x10
  8BD  6D43        MPY   0x43
  8BE  7F8F        APAC
  8BF  581B        SACH  0x1B
  8C0  501C        SACL  0x1C
  8C1  601B        ADDH  0x1B
  8C2  611C        ADDS  0x1C
  8C3  5810        SACH  0x10
  8C4  2F15        LAC   0x15,15
  8C5  6A14        LT    0x14
  8C6  6D42        MPY   0x42
  8C7  6B13        LTD   0x13
  8C8  6D41        MPY   0x41
  8C9  1F13        SUB   0x13,15
  8CA  6B12        LTD   0x12
  8CB  6D40        MPY   0x40
  8CC  6C16        LTA   0x16
  8CD  6D44        MPY   0x44
  8CE  6B15        LTD   0x15
  8CF  6D43        MPY   0x43
  8D0  7F8F        APAC
  8D1  581B        SACH  0x1B
  8D2  501C        SACL  0x1C
  8D3  601B        ADDH  0x1B
  8D4  611C        ADDS  0x1C
  8D5  5815        SACH  0x15
  8D6  F900 0858   B     L858

