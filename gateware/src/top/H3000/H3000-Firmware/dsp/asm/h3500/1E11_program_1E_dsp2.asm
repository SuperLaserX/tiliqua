; Eventide h3500 DSP microcode
; key 1E11  algorithm 1E (program 1E)  DSP 2
; source H3000-Upgrade_ROM2.BIN offset 0251E, 221 program words loaded at 800
;
  800  7F8B        SOVM
  801  6E00        LDPK  0
  802  7F81        DINT
  803  6880        LARP  0
  804  708F        LARK  AR0,0x8F
  805  7F89        ZAC
L806:
  806  5888        SACH  *
  807  F400 0806   BANZ  L806
  809  7000        LARK  AR0,0x00
  80A  7100        LARK  AR1,0x00
  80B  7E01        LACK  0x01
  80C  5000        SACL  0x00
  80D  2900        LAC   0x00,9
  80E  5003        SACL  0x03
  80F  7EFF        LACK  0xFF
  810  5001        SACL  0x01
  811  2701        LAC   0x01,7
  812  7A01        OR    0x01
  813  5020        SACL  0x20
  814  7F80        NOP
  815  7F80        NOP
  816  7F80        NOP
  817  7F80        NOP
  818  6620        ZALS  0x20
  819  5002        SACL  0x02
L81A:
  81A  F600 081E   BIOZ  L81E
  81C  F900 081A   B     L81A

L81E:
  81E  4001        IN    0x01,PA0
  81F  6501        ZALH  0x01
  820  FD00 0823   BGEZ  L823
  822  7F80        NOP
L823:
  823  F600 0823   BIOZ  L823
L825:
  825  4501        IN    0x01,PA5
  826  6881        LARP  1
  827  6601        ZALS  0x01
  828  7903        AND   0x03
  829  FE00 082E   BNZ   L82E
  82B  6880        LARP  0
  82C  F900 0830   B     L830

L82E:
  82E  3901        LAR   AR1,0x01
  82F  4680        IN    *,PA6,AR0
L830:
  830  7F80        NOP
  831  6602        ZALS  0x02
  832  6100        ADDS  0x00
  833  5002        SACL  0x02
  834  4F02        OUT   0x02,PA7
  835  6100        ADDS  0x00
  836  5002        SACL  0x02
  837  4F02        OUT   0x02,PA7
  838  6100        ADDS  0x00
  839  5002        SACL  0x02
  83A  4F02        OUT   0x02,PA7
  83B  6100        ADDS  0x00
  83C  5002        SACL  0x02
  83D  4F02        OUT   0x02,PA7
  83E  6100        ADDS  0x00
  83F  5002        SACL  0x02
  840  4F02        OUT   0x02,PA7
  841  6100        ADDS  0x00
  842  5002        SACL  0x02
  843  4F02        OUT   0x02,PA7
  844  6100        ADDS  0x00
  845  5002        SACL  0x02
  846  4F02        OUT   0x02,PA7
  847  6100        ADDS  0x00
  848  5002        SACL  0x02
  849  4F02        OUT   0x02,PA7
  84A  6100        ADDS  0x00
  84B  5002        SACL  0x02
  84C  4F02        OUT   0x02,PA7
  84D  6100        ADDS  0x00
  84E  5002        SACL  0x02
  84F  4F02        OUT   0x02,PA7
  850  6100        ADDS  0x00
  851  5002        SACL  0x02
  852  4F02        OUT   0x02,PA7
  853  6100        ADDS  0x00
  854  5002        SACL  0x02
  855  4F02        OUT   0x02,PA7
  856  6100        ADDS  0x00
  857  5002        SACL  0x02
  858  4F02        OUT   0x02,PA7
  859  6100        ADDS  0x00
  85A  5002        SACL  0x02
  85B  4F02        OUT   0x02,PA7
  85C  6100        ADDS  0x00
  85D  5002        SACL  0x02
  85E  4F02        OUT   0x02,PA7
  85F  6100        ADDS  0x00
  860  5002        SACL  0x02
  861  4F02        OUT   0x02,PA7
  862  6100        ADDS  0x00
  863  5002        SACL  0x02
  864  4F02        OUT   0x02,PA7
  865  6100        ADDS  0x00
  866  5002        SACL  0x02
  867  4F02        OUT   0x02,PA7
  868  6100        ADDS  0x00
  869  5002        SACL  0x02
  86A  4F02        OUT   0x02,PA7
  86B  6100        ADDS  0x00
  86C  5002        SACL  0x02
  86D  4F02        OUT   0x02,PA7
  86E  6100        ADDS  0x00
  86F  5002        SACL  0x02
  870  4F02        OUT   0x02,PA7
  871  7F80        NOP
  872  7F80        NOP
  873  7F80        NOP
  874  7F80        NOP
  875  7F80        NOP
  876  2002        LAC   0x02
  877  FA00 0825   BLZ   L825
L879:
  879  F600 087D   BIOZ  L87D
  87B  F900 0879   B     L879

L87D:
  87D  4001        IN    0x01,PA0
  87E  6501        ZALH  0x01
  87F  FA00 0882   BLZ   L882
  881  7F80        NOP
L882:
  882  F600 0882   BIOZ  L882
L884:
  884  4501        IN    0x01,PA5
  885  6881        LARP  1
  886  6601        ZALS  0x01
  887  7903        AND   0x03
  888  FE00 088D   BNZ   L88D
  88A  6880        LARP  0
  88B  F900 088F   B     L88F

L88D:
  88D  3901        LAR   AR1,0x01
  88E  4680        IN    *,PA6,AR0
L88F:
  88F  6A04        LT    0x04
  890  6D41        MPY   0x41
  891  4C05        OUT   0x05,PA4
  892  4C06        OUT   0x06,PA4
  893  4C07        OUT   0x07,PA4
  894  4C08        OUT   0x08,PA4
  895  4C09        OUT   0x09,PA4
  896  4C0A        OUT   0x0A,PA4
  897  7F8E        PAC
  898  1E0B        SUB   0x0B,14
  899  0E0C        ADD   0x0C,14
  89A  0F0D        ADD   0x0D,15
  89B  0F0E        ADD   0x0E,15
  89C  0F0F        ADD   0x0F,15
  89D  0F10        ADD   0x10,15
  89E  5805        SACH  0x05
  89F  7F8E        PAC
  8A0  1F0B        SUB   0x0B,15
  8A1  0F0C        ADD   0x0C,15
  8A2  0E0D        ADD   0x0D,14
  8A3  0E0E        ADD   0x0E,14
  8A4  1F0F        SUB   0x0F,15
  8A5  1F10        SUB   0x10,15
  8A6  5806        SACH  0x06
  8A7  7F8E        PAC
  8A8  0E0B        ADD   0x0B,14
  8A9  0E0C        ADD   0x0C,14
  8AA  0F0D        ADD   0x0D,15
  8AB  1F0E        SUB   0x0E,15
  8AC  0F0F        ADD   0x0F,15
  8AD  1F10        SUB   0x10,15
  8AE  5807        SACH  0x07
  8AF  7F8E        PAC
  8B0  0F0B        ADD   0x0B,15
  8B1  0F0C        ADD   0x0C,15
  8B2  0E0D        ADD   0x0D,14
  8B3  1E0E        SUB   0x0E,14
  8B4  1F0F        SUB   0x0F,15
  8B5  0F10        ADD   0x10,15
  8B6  5808        SACH  0x08
  8B7  7F8E        PAC
  8B8  0F0B        ADD   0x0B,15
  8B9  0F0C        ADD   0x0C,15
  8BA  1F0D        SUB   0x0D,15
  8BB  0F0E        ADD   0x0E,15
  8BC  0E0F        ADD   0x0F,14
  8BD  1E10        SUB   0x10,14
  8BE  5809        SACH  0x09
  8BF  7F8E        PAC
  8C0  0F0B        ADD   0x0B,15
  8C1  1F0C        SUB   0x0C,15
  8C2  0F0D        ADD   0x0D,15
  8C3  0F0E        ADD   0x0E,15
  8C4  1E0F        SUB   0x0F,14
  8C5  1E10        SUB   0x10,14
  8C6  580A        SACH  0x0A
  8C7  4704        IN    0x04,PA7
  8C8  6A40        LT    0x40
  8C9  6D1D        MPY   0x1D
  8CA  7F8E        PAC
  8CB  590B        SACH  0x0B,1
  8CC  6D1E        MPY   0x1E
  8CD  431D        IN    0x1D,PA3
  8CE  431E        IN    0x1E,PA3
  8CF  430D        IN    0x0D,PA3
  8D0  430E        IN    0x0E,PA3
  8D1  430F        IN    0x0F,PA3
  8D2  4310        IN    0x10,PA3
  8D3  4B40        OUT   0x40,PA3
  8D4  4E1D        OUT   0x1D,PA6
  8D5  4D1E        OUT   0x1E,PA5
  8D6  7F8E        PAC
  8D7  590C        SACH  0x0C,1
  8D8  7F80        NOP
  8D9  7F80        NOP
  8DA  7F80        NOP
  8DB  F900 0884   B     L884

