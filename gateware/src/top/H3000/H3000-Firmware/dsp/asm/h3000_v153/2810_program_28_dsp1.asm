; Eventide h3000_v153 DSP microcode
; key 2810  algorithm 28 (program 28)  DSP 1
; source H3000_153_BigROM.BIN offset 09BD3, 260 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5000        SACL  0x00
  806  2800        LAC   0x00,8
  807  5003        SACL  0x03
  808  5840        SACH  0x40
  809  5845        SACH  0x45
  80A  5842        SACH  0x42
  80B  5847        SACH  0x47
  80C  7EFF        LACK  0xFF
  80D  5001        SACL  0x01
  80E  2701        LAC   0x01,7
  80F  7A01        OR    0x01
  810  5041        SACL  0x41
  811  5046        SACL  0x46
  812  7F80        NOP
L813:
  813  F600 0817   BIOZ  L817
  815  F900 0813   B     L813

L817:
  817  4001        IN    0x01,PA0
  818  6501        ZALH  0x01
  819  FD00 081C   BGEZ  L81C
  81B  7F80        NOP
L81C:
  81C  F600 081C   BIOZ  L81C
  81E  7F89        ZAC
  81F  5007        SACL  0x07
  820  5002        SACL  0x02
  821  7F80        NOP
  822  500B        SACL  0x0B
  823  500C        SACL  0x0C
  824  500D        SACL  0x0D
  825  500E        SACL  0x0E
  826  5010        SACL  0x10
  827  5011        SACL  0x11
  828  5012        SACL  0x12
  829  5013        SACL  0x13
  82A  5015        SACL  0x15
  82B  5016        SACL  0x16
  82C  5017        SACL  0x17
  82D  5018        SACL  0x18
  82E  501A        SACL  0x1A
  82F  501B        SACL  0x1B
  830  501C        SACL  0x1C
  831  501D        SACL  0x1D
L832:
  832  4F02        OUT   0x02,PA7
  833  4C07        OUT   0x07,PA4
  834  0000        ADD   0x00
  835  5002        SACL  0x02
  836  4501        IN    0x01,PA5
  837  6881        LARP  1
  838  6601        ZALS  0x01
  839  7903        AND   0x03
  83A  FE00 083F   BNZ   L83F
  83C  6880        LARP  0
  83D  F900 0841   B     L841

L83F:
  83F  3901        LAR   AR1,0x01
  840  4680        IN    *,PA6,AR0
L841:
  841  4F02        OUT   0x02,PA7
  842  4C07        OUT   0x07,PA4
  843  6602        ZALS  0x02
  844  0000        ADD   0x00
  845  5002        SACL  0x02
  846  6602        ZALS  0x02
  847  FE00 0832   BNZ   L832
L849:
  849  F600 084D   BIOZ  L84D
  84B  F900 0849   B     L849

L84D:
  84D  4001        IN    0x01,PA0
  84E  6501        ZALH  0x01
  84F  FA00 0852   BLZ   L852
  851  7F80        NOP
L852:
  852  F600 0852   BIOZ  L852
L854:
  854  4501        IN    0x01,PA5
  855  6881        LARP  1
  856  6601        ZALS  0x01
  857  7903        AND   0x03
  858  FE00 085D   BNZ   L85D
  85A  6880        LARP  0
  85B  F900 085F   B     L85F

L85D:
  85D  3901        LAR   AR1,0x01
  85E  4680        IN    *,PA6,AR0
L85F:
  85F  490D        OUT   0x0D,PA1
  860  7F80        NOP
  861  4A12        OUT   0x12,PA2
  862  654A        ZALH  0x4A
  863  440A        IN    0x0A,PA4
  864  FF00 08B5   BZ    L8B5
  866  440F        IN    0x0F,PA4
  867  2F0D        LAC   0x0D,15
  868  6A0C        LT    0x0C
  869  4414        IN    0x14,PA4
  86A  6D47        MPY   0x47
  86B  6B0B        LTD   0x0B
  86C  4419        IN    0x19,PA4
  86D  6D46        MPY   0x46
  86E  1F0B        SUB   0x0B,15
  86F  6B0A        LTD   0x0A
  870  4917        OUT   0x17,PA1
  871  4A1C        OUT   0x1C,PA2
  872  6D45        MPY   0x45
  873  6C0E        LTA   0x0E
  874  6D49        MPY   0x49
  875  6B0D        LTD   0x0D
  876  6D48        MPY   0x48
  877  7F8F        APAC
  878  5805        SACH  0x05
  879  5006        SACL  0x06
  87A  6005        ADDH  0x05
  87B  6106        ADDS  0x06
  87C  580D        SACH  0x0D
  87D  2F12        LAC   0x12,15
  87E  6A11        LT    0x11
  87F  6D47        MPY   0x47
  880  6B10        LTD   0x10
  881  6D46        MPY   0x46
  882  1F10        SUB   0x10,15
  883  6B0F        LTD   0x0F
  884  6D45        MPY   0x45
  885  6C13        LTA   0x13
  886  6D49        MPY   0x49
  887  6B12        LTD   0x12
  888  6D48        MPY   0x48
  889  7F8F        APAC
  88A  5805        SACH  0x05
  88B  5006        SACL  0x06
  88C  6005        ADDH  0x05
  88D  6106        ADDS  0x06
  88E  5812        SACH  0x12
  88F  2F17        LAC   0x17,15
  890  6A16        LT    0x16
  891  6D47        MPY   0x47
  892  6B15        LTD   0x15
  893  6D46        MPY   0x46
  894  1F15        SUB   0x15,15
  895  6B14        LTD   0x14
  896  6D45        MPY   0x45
  897  6C18        LTA   0x18
  898  6D49        MPY   0x49
  899  6B17        LTD   0x17
  89A  6D48        MPY   0x48
  89B  7F8F        APAC
  89C  5805        SACH  0x05
  89D  5006        SACL  0x06
  89E  6005        ADDH  0x05
  89F  6106        ADDS  0x06
  8A0  5817        SACH  0x17
  8A1  2F1C        LAC   0x1C,15
  8A2  6A1B        LT    0x1B
  8A3  6D47        MPY   0x47
  8A4  6B1A        LTD   0x1A
  8A5  6D46        MPY   0x46
  8A6  1F1A        SUB   0x1A,15
  8A7  6B19        LTD   0x19
  8A8  6D45        MPY   0x45
  8A9  6C1D        LTA   0x1D
  8AA  6D49        MPY   0x49
  8AB  6B1C        LTD   0x1C
  8AC  6D48        MPY   0x48
  8AD  7F8F        APAC
  8AE  5805        SACH  0x05
  8AF  5006        SACL  0x06
  8B0  6005        ADDH  0x05
  8B1  6106        ADDS  0x06
  8B2  581C        SACH  0x1C
  8B3  F900 0854   B     L854

L8B5:
  8B5  440F        IN    0x0F,PA4
  8B6  2F0D        LAC   0x0D,15
  8B7  6A0C        LT    0x0C
  8B8  4414        IN    0x14,PA4
  8B9  6D42        MPY   0x42
  8BA  6B0B        LTD   0x0B
  8BB  4419        IN    0x19,PA4
  8BC  6D41        MPY   0x41
  8BD  1F0B        SUB   0x0B,15
  8BE  6B0A        LTD   0x0A
  8BF  4917        OUT   0x17,PA1
  8C0  4A1C        OUT   0x1C,PA2
  8C1  6D40        MPY   0x40
  8C2  6C0E        LTA   0x0E
  8C3  6D44        MPY   0x44
  8C4  6B0D        LTD   0x0D
  8C5  6D43        MPY   0x43
  8C6  7F8F        APAC
  8C7  5805        SACH  0x05
  8C8  5006        SACL  0x06
  8C9  6005        ADDH  0x05
  8CA  6106        ADDS  0x06
  8CB  580D        SACH  0x0D
  8CC  2F12        LAC   0x12,15
  8CD  6A11        LT    0x11
  8CE  6D42        MPY   0x42
  8CF  6B10        LTD   0x10
  8D0  6D41        MPY   0x41
  8D1  1F10        SUB   0x10,15
  8D2  6B0F        LTD   0x0F
  8D3  6D40        MPY   0x40
  8D4  6C13        LTA   0x13
  8D5  6D44        MPY   0x44
  8D6  6B12        LTD   0x12
  8D7  6D43        MPY   0x43
  8D8  7F8F        APAC
  8D9  5805        SACH  0x05
  8DA  5006        SACL  0x06
  8DB  6005        ADDH  0x05
  8DC  6106        ADDS  0x06
  8DD  5812        SACH  0x12
  8DE  2F17        LAC   0x17,15
  8DF  6A16        LT    0x16
  8E0  6D42        MPY   0x42
  8E1  6B15        LTD   0x15
  8E2  6D41        MPY   0x41
  8E3  1F15        SUB   0x15,15
  8E4  6B14        LTD   0x14
  8E5  6D40        MPY   0x40
  8E6  6C18        LTA   0x18
  8E7  6D44        MPY   0x44
  8E8  6B17        LTD   0x17
  8E9  6D43        MPY   0x43
  8EA  7F8F        APAC
  8EB  5805        SACH  0x05
  8EC  5006        SACL  0x06
  8ED  6005        ADDH  0x05
  8EE  6106        ADDS  0x06
  8EF  5817        SACH  0x17
  8F0  2F1C        LAC   0x1C,15
  8F1  6A1B        LT    0x1B
  8F2  6D42        MPY   0x42
  8F3  6B1A        LTD   0x1A
  8F4  6D41        MPY   0x41
  8F5  1F1A        SUB   0x1A,15
  8F6  6B19        LTD   0x19
  8F7  6D40        MPY   0x40
  8F8  6C1D        LTA   0x1D
  8F9  6D44        MPY   0x44
  8FA  6B1C        LTD   0x1C
  8FB  6D43        MPY   0x43
  8FC  7F8F        APAC
  8FD  5805        SACH  0x05
  8FE  5006        SACL  0x06
  8FF  6005        ADDH  0x05
  900  6106        ADDS  0x06
  901  581C        SACH  0x1C
  902  F900 0854   B     L854

