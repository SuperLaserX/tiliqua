; Eventide h3500 DSP microcode
; key 1E12  algorithm 1E (program 1E)  DSP 3
; source H3000-Upgrade_ROM2.BIN offset 026E2, 502 program words loaded at 800
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
  80D  2A00        LAC   0x00,10
  80E  5004        SACL  0x04
  80F  7EFF        LACK  0xFF
  810  5001        SACL  0x01
  811  2701        LAC   0x01,7
  812  7A01        OR    0x01
  813  5001        SACL  0x01
  814  7E11        LACK  0x11
  815  5024        SACL  0x24
  816  7E0D        LACK  0x0D
  817  5025        SACL  0x25
  818  7F89        ZAC
  819  5003        SACL  0x03
L81A:
  81A  F600 081E   BIOZ  L81E
  81C  F900 081A   B     L81A

L81E:
  81E  4002        IN    0x02,PA0
  81F  6502        ZALH  0x02
  820  FD00 0823   BGEZ  L823
  822  7F80        NOP
L823:
  823  F600 0823   BIOZ  L823
L825:
  825  4502        IN    0x02,PA5
  826  6881        LARP  1
  827  6602        ZALS  0x02
  828  7904        AND   0x04
  829  FE00 082E   BNZ   L82E
  82B  6880        LARP  0
  82C  F900 0830   B     L830

L82E:
  82E  3902        LAR   AR1,0x02
  82F  4680        IN    *,PA6,AR0
L830:
  830  7E15        LACK  0x15
  831  6103        ADDS  0x03
  832  5003        SACL  0x03
  833  4C26        OUT   0x26,PA4
  834  4C26        OUT   0x26,PA4
  835  4C26        OUT   0x26,PA4
  836  4C26        OUT   0x26,PA4
  837  4C26        OUT   0x26,PA4
  838  4C26        OUT   0x26,PA4
  839  4C26        OUT   0x26,PA4
  83A  4C26        OUT   0x26,PA4
  83B  4C26        OUT   0x26,PA4
  83C  4C26        OUT   0x26,PA4
  83D  4C26        OUT   0x26,PA4
  83E  4C26        OUT   0x26,PA4
  83F  4C26        OUT   0x26,PA4
  840  4C26        OUT   0x26,PA4
  841  4C26        OUT   0x26,PA4
  842  4C26        OUT   0x26,PA4
  843  4C26        OUT   0x26,PA4
  844  4C26        OUT   0x26,PA4
  845  4C26        OUT   0x26,PA4
  846  4C26        OUT   0x26,PA4
  847  4C26        OUT   0x26,PA4
  848  4C26        OUT   0x26,PA4
  849  4C26        OUT   0x26,PA4
  84A  4C26        OUT   0x26,PA4
  84B  4C26        OUT   0x26,PA4
  84C  4C26        OUT   0x26,PA4
  84D  4C26        OUT   0x26,PA4
  84E  4C26        OUT   0x26,PA4
  84F  4C26        OUT   0x26,PA4
  850  4C26        OUT   0x26,PA4
  851  4C26        OUT   0x26,PA4
  852  4C26        OUT   0x26,PA4
  853  4C26        OUT   0x26,PA4
  854  4C26        OUT   0x26,PA4
  855  4C26        OUT   0x26,PA4
  856  4C26        OUT   0x26,PA4
  857  4C26        OUT   0x26,PA4
  858  4C26        OUT   0x26,PA4
  859  4C26        OUT   0x26,PA4
  85A  4C26        OUT   0x26,PA4
  85B  4C26        OUT   0x26,PA4
  85C  4C26        OUT   0x26,PA4
  85D  7F80        NOP
  85E  7F80        NOP
  85F  7F80        NOP
  860  7F80        NOP
  861  2003        LAC   0x03
  862  FC00 0825   BGZ   L825
L864:
  864  F600 0868   BIOZ  L868
  866  F900 0864   B     L864

L868:
  868  4002        IN    0x02,PA0
  869  6502        ZALH  0x02
  86A  FA00 086D   BLZ   L86D
  86C  7F80        NOP
L86D:
  86D  F600 086D   BIOZ  L86D
L86F:
  86F  4502        IN    0x02,PA5
  870  6881        LARP  1
  871  6602        ZALS  0x02
  872  7904        AND   0x04
  873  FE00 0878   BNZ   L878
  875  6880        LARP  0
  876  F900 087A   B     L87A

L878:
  878  3902        LAR   AR1,0x02
  879  4680        IN    *,PA6,AR0
L87A:
  87A  6605        ZALS  0x05
  87B  4F05        OUT   0x05,PA7
  87C  4F0D        OUT   0x0D,PA7
  87D  4F0E        OUT   0x0E,PA7
  87E  4F0F        OUT   0x0F,PA7
  87F  4F10        OUT   0x10,PA7
  880  4F11        OUT   0x11,PA7
  881  4F06        OUT   0x06,PA7
  882  1000        SUB   0x00
  883  5005        SACL  0x05
  884  4F07        OUT   0x07,PA7
  885  6158        ADDS  0x58
  886  5006        SACL  0x06
  887  4F08        OUT   0x08,PA7
  888  6605        ZALS  0x05
  889  6147        ADDS  0x47
  88A  4F09        OUT   0x09,PA7
  88B  500D        SACL  0x0D
  88C  6159        ADDS  0x59
  88D  4F0A        OUT   0x0A,PA7
  88E  5007        SACL  0x07
  88F  6605        ZALS  0x05
  890  4F0B        OUT   0x0B,PA7
  891  6148        ADDS  0x48
  892  500E        SACL  0x0E
  893  615A        ADDS  0x5A
  894  5008        SACL  0x08
  895  7F80        NOP
  896  6605        ZALS  0x05
  897  6149        ADDS  0x49
  898  500F        SACL  0x0F
  899  615B        ADDS  0x5B
  89A  5009        SACL  0x09
  89B  6605        ZALS  0x05
  89C  614A        ADDS  0x4A
  89D  5010        SACL  0x10
  89E  615C        ADDS  0x5C
  89F  500A        SACL  0x0A
  8A0  6605        ZALS  0x05
  8A1  614B        ADDS  0x4B
  8A2  5011        SACL  0x11
  8A3  615D        ADDS  0x5D
  8A4  500B        SACL  0x0B
  8A5  655E        ZALH  0x5E
  8A6  6258        SUBH  0x58
  8A7  FC00 08B5   BGZ   L8B5
  8A9  655E        ZALH  0x5E
  8AA  6258        SUBH  0x58
  8AB  FA00 08C1   BLZ   L8C1
  8AD  7F80        NOP
  8AE  6D52        MPY   0x52
  8AF  7F8E        PAC
  8B0  7F88        ABS
  8B1  0F4C        ADD   0x4C,15
  8B2  595E        SACH  0x5E,1
  8B3  F900 08C9   B     L8C9

L8B5:
  8B5  2F58        LAC   0x58,15
  8B6  611E        ADDS  0x1E
  8B7  0040        ADD   0x40
  8B8  5958        SACH  0x58,1
  8B9  7901        AND   0x01
  8BA  501E        SACL  0x1E
  8BB  7F80        NOP
  8BC  7F80        NOP
  8BD  7F80        NOP
  8BE  7F80        NOP
  8BF  F900 08C9   B     L8C9

L8C1:
  8C1  2F58        LAC   0x58,15
  8C2  611E        ADDS  0x1E
  8C3  1040        SUB   0x40
  8C4  5958        SACH  0x58,1
  8C5  7901        AND   0x01
  8C6  501E        SACL  0x1E
  8C7  7F80        NOP
  8C8  7F80        NOP
L8C9:
  8C9  6561        ZALH  0x61
  8CA  625B        SUBH  0x5B
  8CB  FC00 08D9   BGZ   L8D9
  8CD  6561        ZALH  0x61
  8CE  625B        SUBH  0x5B
  8CF  FA00 08E5   BLZ   L8E5
  8D1  7F80        NOP
  8D2  6D55        MPY   0x55
  8D3  7F8E        PAC
  8D4  7F88        ABS
  8D5  0F4F        ADD   0x4F,15
  8D6  5961        SACH  0x61,1
  8D7  F900 08ED   B     L8ED

L8D9:
  8D9  2F5B        LAC   0x5B,15
  8DA  6121        ADDS  0x21
  8DB  0043        ADD   0x43
  8DC  595B        SACH  0x5B,1
  8DD  7901        AND   0x01
  8DE  5021        SACL  0x21
  8DF  7F80        NOP
  8E0  7F80        NOP
  8E1  7F80        NOP
  8E2  7F80        NOP
  8E3  F900 08ED   B     L8ED

L8E5:
  8E5  2F5B        LAC   0x5B,15
  8E6  6121        ADDS  0x21
  8E7  1043        SUB   0x43
  8E8  595B        SACH  0x5B,1
  8E9  7901        AND   0x01
  8EA  5021        SACL  0x21
  8EB  7F80        NOP
  8EC  7F80        NOP
L8ED:
  8ED  7F80        NOP
  8EE  4920        OUT   0x20,PA1
  8EF  4A23        OUT   0x23,PA2
  8F0  7F80        NOP
  8F1  7F80        NOP
  8F2  6624        ZALS  0x24
  8F3  0025        ADD   0x25
  8F4  5025        SACL  0x25
  8F5  0024        ADD   0x24
  8F6  5024        SACL  0x24
  8F7  6A24        LT    0x24
  8F8  7F80        NOP
  8F9  7F80        NOP
  8FA  7F80        NOP
  8FB  7F80        NOP
  8FC  6605        ZALS  0x05
  8FD  4F05        OUT   0x05,PA7
  8FE  4F0D        OUT   0x0D,PA7
  8FF  4F0E        OUT   0x0E,PA7
  900  4F0F        OUT   0x0F,PA7
  901  4F10        OUT   0x10,PA7
  902  4F11        OUT   0x11,PA7
  903  4F06        OUT   0x06,PA7
  904  1000        SUB   0x00
  905  5005        SACL  0x05
  906  4F07        OUT   0x07,PA7
  907  6158        ADDS  0x58
  908  5006        SACL  0x06
  909  4F08        OUT   0x08,PA7
  90A  6605        ZALS  0x05
  90B  6147        ADDS  0x47
  90C  4F09        OUT   0x09,PA7
  90D  500D        SACL  0x0D
  90E  6159        ADDS  0x59
  90F  4F0A        OUT   0x0A,PA7
  910  5007        SACL  0x07
  911  6605        ZALS  0x05
  912  4F0B        OUT   0x0B,PA7
  913  6148        ADDS  0x48
  914  500E        SACL  0x0E
  915  615A        ADDS  0x5A
  916  5008        SACL  0x08
  917  7F80        NOP
  918  6605        ZALS  0x05
  919  6149        ADDS  0x49
  91A  500F        SACL  0x0F
  91B  615B        ADDS  0x5B
  91C  5009        SACL  0x09
  91D  6605        ZALS  0x05
  91E  614A        ADDS  0x4A
  91F  5010        SACL  0x10
  920  615C        ADDS  0x5C
  921  500A        SACL  0x0A
  922  6605        ZALS  0x05
  923  614B        ADDS  0x4B
  924  5011        SACL  0x11
  925  615D        ADDS  0x5D
  926  500B        SACL  0x0B
  927  655F        ZALH  0x5F
  928  6259        SUBH  0x59
  929  FC00 0937   BGZ   L937
  92B  655F        ZALH  0x5F
  92C  6259        SUBH  0x59
  92D  FA00 0943   BLZ   L943
  92F  7F80        NOP
  930  6D53        MPY   0x53
  931  7F8E        PAC
  932  7F88        ABS
  933  0F4D        ADD   0x4D,15
  934  595F        SACH  0x5F,1
  935  F900 094B   B     L94B

L937:
  937  2F59        LAC   0x59,15
  938  611F        ADDS  0x1F
  939  0041        ADD   0x41
  93A  5959        SACH  0x59,1
  93B  7901        AND   0x01
  93C  501F        SACL  0x1F
  93D  7F80        NOP
  93E  7F80        NOP
  93F  7F80        NOP
  940  7F80        NOP
  941  F900 094B   B     L94B

L943:
  943  2F59        LAC   0x59,15
  944  611F        ADDS  0x1F
  945  1041        SUB   0x41
  946  5959        SACH  0x59,1
  947  7901        AND   0x01
  948  501F        SACL  0x1F
  949  7F80        NOP
  94A  7F80        NOP
L94B:
  94B  6562        ZALH  0x62
  94C  625C        SUBH  0x5C
  94D  FC00 095B   BGZ   L95B
  94F  6562        ZALH  0x62
  950  625C        SUBH  0x5C
  951  FA00 0967   BLZ   L967
  953  7F80        NOP
  954  6D56        MPY   0x56
  955  7F8E        PAC
  956  7F88        ABS
  957  0F50        ADD   0x50,15
  958  5962        SACH  0x62,1
  959  F900 096F   B     L96F

L95B:
  95B  2F5C        LAC   0x5C,15
  95C  6122        ADDS  0x22
  95D  0044        ADD   0x44
  95E  595C        SACH  0x5C,1
  95F  7901        AND   0x01
  960  5022        SACL  0x22
  961  7F80        NOP
  962  7F80        NOP
  963  7F80        NOP
  964  7F80        NOP
  965  F900 096F   B     L96F

L967:
  967  2F5C        LAC   0x5C,15
  968  6122        ADDS  0x22
  969  1044        SUB   0x44
  96A  595C        SACH  0x5C,1
  96B  7901        AND   0x01
  96C  5022        SACL  0x22
  96D  7F80        NOP
  96E  7F80        NOP
L96F:
  96F  7F80        NOP
  970  491E        OUT   0x1E,PA1
  971  4A21        OUT   0x21,PA2
  972  7F80        NOP
  973  7F80        NOP
  974  6624        ZALS  0x24
  975  0025        ADD   0x25
  976  5025        SACL  0x25
  977  0024        ADD   0x24
  978  5024        SACL  0x24
  979  6A24        LT    0x24
  97A  7F80        NOP
  97B  7F80        NOP
  97C  7F80        NOP
  97D  7F80        NOP
  97E  6605        ZALS  0x05
  97F  4F05        OUT   0x05,PA7
  980  4F0D        OUT   0x0D,PA7
  981  4F0E        OUT   0x0E,PA7
  982  4F0F        OUT   0x0F,PA7
  983  4F10        OUT   0x10,PA7
  984  4F11        OUT   0x11,PA7
  985  4F06        OUT   0x06,PA7
  986  1000        SUB   0x00
  987  5005        SACL  0x05
  988  4F07        OUT   0x07,PA7
  989  6158        ADDS  0x58
  98A  5006        SACL  0x06
  98B  4F08        OUT   0x08,PA7
  98C  6605        ZALS  0x05
  98D  6147        ADDS  0x47
  98E  4F09        OUT   0x09,PA7
  98F  500D        SACL  0x0D
  990  6159        ADDS  0x59
  991  4F0A        OUT   0x0A,PA7
  992  5007        SACL  0x07
  993  6605        ZALS  0x05
  994  4F0B        OUT   0x0B,PA7
  995  6148        ADDS  0x48
  996  500E        SACL  0x0E
  997  615A        ADDS  0x5A
  998  5008        SACL  0x08
  999  7F80        NOP
  99A  6605        ZALS  0x05
  99B  6149        ADDS  0x49
  99C  500F        SACL  0x0F
  99D  615B        ADDS  0x5B
  99E  5009        SACL  0x09
  99F  6605        ZALS  0x05
  9A0  614A        ADDS  0x4A
  9A1  5010        SACL  0x10
  9A2  615C        ADDS  0x5C
  9A3  500A        SACL  0x0A
  9A4  6605        ZALS  0x05
  9A5  614B        ADDS  0x4B
  9A6  5011        SACL  0x11
  9A7  615D        ADDS  0x5D
  9A8  500B        SACL  0x0B
  9A9  6560        ZALH  0x60
  9AA  625A        SUBH  0x5A
  9AB  FC00 09B9   BGZ   L9B9
  9AD  6560        ZALH  0x60
  9AE  625A        SUBH  0x5A
  9AF  FA00 09C5   BLZ   L9C5
  9B1  7F80        NOP
  9B2  6D54        MPY   0x54
  9B3  7F8E        PAC
  9B4  7F88        ABS
  9B5  0F4E        ADD   0x4E,15
  9B6  5960        SACH  0x60,1
  9B7  F900 09CD   B     L9CD

L9B9:
  9B9  2F5A        LAC   0x5A,15
  9BA  6120        ADDS  0x20
  9BB  0042        ADD   0x42
  9BC  595A        SACH  0x5A,1
  9BD  7901        AND   0x01
  9BE  5020        SACL  0x20
  9BF  7F80        NOP
  9C0  7F80        NOP
  9C1  7F80        NOP
  9C2  7F80        NOP
  9C3  F900 09CD   B     L9CD

L9C5:
  9C5  2F5A        LAC   0x5A,15
  9C6  6120        ADDS  0x20
  9C7  1042        SUB   0x42
  9C8  595A        SACH  0x5A,1
  9C9  7901        AND   0x01
  9CA  5020        SACL  0x20
  9CB  7F80        NOP
  9CC  7F80        NOP
L9CD:
  9CD  6563        ZALH  0x63
  9CE  625D        SUBH  0x5D
  9CF  FC00 09DD   BGZ   L9DD
  9D1  6563        ZALH  0x63
  9D2  625D        SUBH  0x5D
  9D3  FA00 09E9   BLZ   L9E9
  9D5  7F80        NOP
  9D6  6D57        MPY   0x57
  9D7  7F8E        PAC
  9D8  7F88        ABS
  9D9  0F51        ADD   0x51,15
  9DA  5963        SACH  0x63,1
  9DB  F900 09F1   B     L9F1

L9DD:
  9DD  2F5D        LAC   0x5D,15
  9DE  6123        ADDS  0x23
  9DF  0045        ADD   0x45
  9E0  595D        SACH  0x5D,1
  9E1  7901        AND   0x01
  9E2  5023        SACL  0x23
  9E3  7F80        NOP
  9E4  7F80        NOP
  9E5  7F80        NOP
  9E6  7F80        NOP
  9E7  F900 09F1   B     L9F1

L9E9:
  9E9  2F5D        LAC   0x5D,15
  9EA  6123        ADDS  0x23
  9EB  1045        SUB   0x45
  9EC  595D        SACH  0x5D,1
  9ED  7901        AND   0x01
  9EE  5023        SACL  0x23
  9EF  7F80        NOP
  9F0  7F80        NOP
L9F1:
  9F1  7F80        NOP
  9F2  491F        OUT   0x1F,PA1
  9F3  4A22        OUT   0x22,PA2
  9F4  F900 086F   B     L86F

