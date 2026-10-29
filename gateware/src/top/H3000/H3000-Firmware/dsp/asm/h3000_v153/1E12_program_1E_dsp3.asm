; Eventide h3000_v153 DSP microcode
; key 1E12  algorithm 1E (program 1E)  DSP 3
; source H3000_153_BigROM.BIN offset 0A6A7, 481 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5000        SACL  0x00
  806  2A00        LAC   0x00,10
  807  5004        SACL  0x04
  808  7EFF        LACK  0xFF
  809  5001        SACL  0x01
  80A  2701        LAC   0x01,7
  80B  7A01        OR    0x01
  80C  5001        SACL  0x01
  80D  7E11        LACK  0x11
  80E  5024        SACL  0x24
  80F  7E0D        LACK  0x0D
  810  5025        SACL  0x25
L811:
  811  F600 0815   BIOZ  L815
  813  F900 0811   B     L811

L815:
  815  4002        IN    0x02,PA0
  816  6502        ZALH  0x02
  817  FD00 081A   BGEZ  L81A
  819  7F80        NOP
L81A:
  81A  F600 081A   BIOZ  L81A
  81C  7F89        ZAC
  81D  5003        SACL  0x03
  81E  5005        SACL  0x05
  81F  7F80        NOP
  820  7F80        NOP
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
  824  7F80        NOP
  825  7F80        NOP
  826  7F80        NOP
  827  7F80        NOP
  828  7F80        NOP
  829  7F80        NOP
  82A  7F80        NOP
  82B  7F80        NOP
  82C  7F80        NOP
  82D  7F80        NOP
  82E  7F80        NOP
  82F  7F80        NOP
  830  7F80        NOP
  831  7F80        NOP
  832  7F80        NOP
  833  7F80        NOP
L834:
  834  7F80        NOP
  835  7F80        NOP
  836  7F80        NOP
  837  7F80        NOP
  838  0000        ADD   0x00
  839  5003        SACL  0x03
  83A  4502        IN    0x02,PA5
  83B  6881        LARP  1
  83C  6602        ZALS  0x02
  83D  7904        AND   0x04
  83E  FE00 0843   BNZ   L843
  840  6880        LARP  0
  841  F900 0845   B     L845

L843:
  843  3902        LAR   AR1,0x02
  844  4680        IN    *,PA6,AR0
L845:
  845  7F80        NOP
  846  7F80        NOP
  847  7F80        NOP
  848  7F80        NOP
  849  6603        ZALS  0x03
  84A  0000        ADD   0x00
  84B  5003        SACL  0x03
  84C  6603        ZALS  0x03
  84D  FE00 0834   BNZ   L834
L84F:
  84F  F600 0853   BIOZ  L853
  851  F900 084F   B     L84F

L853:
  853  4002        IN    0x02,PA0
  854  6502        ZALH  0x02
  855  FA00 0858   BLZ   L858
  857  7F80        NOP
L858:
  858  F600 0858   BIOZ  L858
L85A:
  85A  4502        IN    0x02,PA5
  85B  6881        LARP  1
  85C  6602        ZALS  0x02
  85D  7904        AND   0x04
  85E  FE00 0863   BNZ   L863
  860  6880        LARP  0
  861  F900 0865   B     L865

L863:
  863  3902        LAR   AR1,0x02
  864  4680        IN    *,PA6,AR0
L865:
  865  6605        ZALS  0x05
  866  4F05        OUT   0x05,PA7
  867  4F0D        OUT   0x0D,PA7
  868  4F0E        OUT   0x0E,PA7
  869  4F0F        OUT   0x0F,PA7
  86A  4F10        OUT   0x10,PA7
  86B  4F11        OUT   0x11,PA7
  86C  4F06        OUT   0x06,PA7
  86D  1000        SUB   0x00
  86E  5005        SACL  0x05
  86F  4F07        OUT   0x07,PA7
  870  6158        ADDS  0x58
  871  5006        SACL  0x06
  872  4F08        OUT   0x08,PA7
  873  6605        ZALS  0x05
  874  6147        ADDS  0x47
  875  4F09        OUT   0x09,PA7
  876  500D        SACL  0x0D
  877  6159        ADDS  0x59
  878  4F0A        OUT   0x0A,PA7
  879  5007        SACL  0x07
  87A  6605        ZALS  0x05
  87B  4F0B        OUT   0x0B,PA7
  87C  6148        ADDS  0x48
  87D  500E        SACL  0x0E
  87E  615A        ADDS  0x5A
  87F  5008        SACL  0x08
  880  7F80        NOP
  881  6605        ZALS  0x05
  882  6149        ADDS  0x49
  883  500F        SACL  0x0F
  884  615B        ADDS  0x5B
  885  5009        SACL  0x09
  886  6605        ZALS  0x05
  887  614A        ADDS  0x4A
  888  5010        SACL  0x10
  889  615C        ADDS  0x5C
  88A  500A        SACL  0x0A
  88B  6605        ZALS  0x05
  88C  614B        ADDS  0x4B
  88D  5011        SACL  0x11
  88E  615D        ADDS  0x5D
  88F  500B        SACL  0x0B
  890  655E        ZALH  0x5E
  891  6258        SUBH  0x58
  892  FC00 08A0   BGZ   L8A0
  894  655E        ZALH  0x5E
  895  6258        SUBH  0x58
  896  FA00 08AC   BLZ   L8AC
  898  7F80        NOP
  899  6D52        MPY   0x52
  89A  7F8E        PAC
  89B  7F88        ABS
  89C  0F4C        ADD   0x4C,15
  89D  595E        SACH  0x5E,1
  89E  F900 08B4   B     L8B4

L8A0:
  8A0  2F58        LAC   0x58,15
  8A1  611E        ADDS  0x1E
  8A2  0040        ADD   0x40
  8A3  5958        SACH  0x58,1
  8A4  7901        AND   0x01
  8A5  501E        SACL  0x1E
  8A6  7F80        NOP
  8A7  7F80        NOP
  8A8  7F80        NOP
  8A9  7F80        NOP
  8AA  F900 08B4   B     L8B4

L8AC:
  8AC  2F58        LAC   0x58,15
  8AD  611E        ADDS  0x1E
  8AE  1040        SUB   0x40
  8AF  5958        SACH  0x58,1
  8B0  7901        AND   0x01
  8B1  501E        SACL  0x1E
  8B2  7F80        NOP
  8B3  7F80        NOP
L8B4:
  8B4  6561        ZALH  0x61
  8B5  625B        SUBH  0x5B
  8B6  FC00 08C4   BGZ   L8C4
  8B8  6561        ZALH  0x61
  8B9  625B        SUBH  0x5B
  8BA  FA00 08D0   BLZ   L8D0
  8BC  7F80        NOP
  8BD  6D55        MPY   0x55
  8BE  7F8E        PAC
  8BF  7F88        ABS
  8C0  0F4F        ADD   0x4F,15
  8C1  5961        SACH  0x61,1
  8C2  F900 08D8   B     L8D8

L8C4:
  8C4  2F5B        LAC   0x5B,15
  8C5  6121        ADDS  0x21
  8C6  0043        ADD   0x43
  8C7  595B        SACH  0x5B,1
  8C8  7901        AND   0x01
  8C9  5021        SACL  0x21
  8CA  7F80        NOP
  8CB  7F80        NOP
  8CC  7F80        NOP
  8CD  7F80        NOP
  8CE  F900 08D8   B     L8D8

L8D0:
  8D0  2F5B        LAC   0x5B,15
  8D1  6121        ADDS  0x21
  8D2  1043        SUB   0x43
  8D3  595B        SACH  0x5B,1
  8D4  7901        AND   0x01
  8D5  5021        SACL  0x21
  8D6  7F80        NOP
  8D7  7F80        NOP
L8D8:
  8D8  7F80        NOP
  8D9  4920        OUT   0x20,PA1
  8DA  4A23        OUT   0x23,PA2
  8DB  7F80        NOP
  8DC  7F80        NOP
  8DD  6624        ZALS  0x24
  8DE  0025        ADD   0x25
  8DF  5025        SACL  0x25
  8E0  0024        ADD   0x24
  8E1  5024        SACL  0x24
  8E2  6A24        LT    0x24
  8E3  7F80        NOP
  8E4  7F80        NOP
  8E5  7F80        NOP
  8E6  7F80        NOP
  8E7  6605        ZALS  0x05
  8E8  4F05        OUT   0x05,PA7
  8E9  4F0D        OUT   0x0D,PA7
  8EA  4F0E        OUT   0x0E,PA7
  8EB  4F0F        OUT   0x0F,PA7
  8EC  4F10        OUT   0x10,PA7
  8ED  4F11        OUT   0x11,PA7
  8EE  4F06        OUT   0x06,PA7
  8EF  1000        SUB   0x00
  8F0  5005        SACL  0x05
  8F1  4F07        OUT   0x07,PA7
  8F2  6158        ADDS  0x58
  8F3  5006        SACL  0x06
  8F4  4F08        OUT   0x08,PA7
  8F5  6605        ZALS  0x05
  8F6  6147        ADDS  0x47
  8F7  4F09        OUT   0x09,PA7
  8F8  500D        SACL  0x0D
  8F9  6159        ADDS  0x59
  8FA  4F0A        OUT   0x0A,PA7
  8FB  5007        SACL  0x07
  8FC  6605        ZALS  0x05
  8FD  4F0B        OUT   0x0B,PA7
  8FE  6148        ADDS  0x48
  8FF  500E        SACL  0x0E
  900  615A        ADDS  0x5A
  901  5008        SACL  0x08
  902  7F80        NOP
  903  6605        ZALS  0x05
  904  6149        ADDS  0x49
  905  500F        SACL  0x0F
  906  615B        ADDS  0x5B
  907  5009        SACL  0x09
  908  6605        ZALS  0x05
  909  614A        ADDS  0x4A
  90A  5010        SACL  0x10
  90B  615C        ADDS  0x5C
  90C  500A        SACL  0x0A
  90D  6605        ZALS  0x05
  90E  614B        ADDS  0x4B
  90F  5011        SACL  0x11
  910  615D        ADDS  0x5D
  911  500B        SACL  0x0B
  912  655F        ZALH  0x5F
  913  6259        SUBH  0x59
  914  FC00 0922   BGZ   L922
  916  655F        ZALH  0x5F
  917  6259        SUBH  0x59
  918  FA00 092E   BLZ   L92E
  91A  7F80        NOP
  91B  6D53        MPY   0x53
  91C  7F8E        PAC
  91D  7F88        ABS
  91E  0F4D        ADD   0x4D,15
  91F  595F        SACH  0x5F,1
  920  F900 0936   B     L936

L922:
  922  2F59        LAC   0x59,15
  923  611F        ADDS  0x1F
  924  0041        ADD   0x41
  925  5959        SACH  0x59,1
  926  7901        AND   0x01
  927  501F        SACL  0x1F
  928  7F80        NOP
  929  7F80        NOP
  92A  7F80        NOP
  92B  7F80        NOP
  92C  F900 0936   B     L936

L92E:
  92E  2F59        LAC   0x59,15
  92F  611F        ADDS  0x1F
  930  1041        SUB   0x41
  931  5959        SACH  0x59,1
  932  7901        AND   0x01
  933  501F        SACL  0x1F
  934  7F80        NOP
  935  7F80        NOP
L936:
  936  6562        ZALH  0x62
  937  625C        SUBH  0x5C
  938  FC00 0946   BGZ   L946
  93A  6562        ZALH  0x62
  93B  625C        SUBH  0x5C
  93C  FA00 0952   BLZ   L952
  93E  7F80        NOP
  93F  6D56        MPY   0x56
  940  7F8E        PAC
  941  7F88        ABS
  942  0F50        ADD   0x50,15
  943  5962        SACH  0x62,1
  944  F900 095A   B     L95A

L946:
  946  2F5C        LAC   0x5C,15
  947  6122        ADDS  0x22
  948  0044        ADD   0x44
  949  595C        SACH  0x5C,1
  94A  7901        AND   0x01
  94B  5022        SACL  0x22
  94C  7F80        NOP
  94D  7F80        NOP
  94E  7F80        NOP
  94F  7F80        NOP
  950  F900 095A   B     L95A

L952:
  952  2F5C        LAC   0x5C,15
  953  6122        ADDS  0x22
  954  1044        SUB   0x44
  955  595C        SACH  0x5C,1
  956  7901        AND   0x01
  957  5022        SACL  0x22
  958  7F80        NOP
  959  7F80        NOP
L95A:
  95A  7F80        NOP
  95B  491E        OUT   0x1E,PA1
  95C  4A21        OUT   0x21,PA2
  95D  7F80        NOP
  95E  7F80        NOP
  95F  6624        ZALS  0x24
  960  0025        ADD   0x25
  961  5025        SACL  0x25
  962  0024        ADD   0x24
  963  5024        SACL  0x24
  964  6A24        LT    0x24
  965  7F80        NOP
  966  7F80        NOP
  967  7F80        NOP
  968  7F80        NOP
  969  6605        ZALS  0x05
  96A  4F05        OUT   0x05,PA7
  96B  4F0D        OUT   0x0D,PA7
  96C  4F0E        OUT   0x0E,PA7
  96D  4F0F        OUT   0x0F,PA7
  96E  4F10        OUT   0x10,PA7
  96F  4F11        OUT   0x11,PA7
  970  4F06        OUT   0x06,PA7
  971  1000        SUB   0x00
  972  5005        SACL  0x05
  973  4F07        OUT   0x07,PA7
  974  6158        ADDS  0x58
  975  5006        SACL  0x06
  976  4F08        OUT   0x08,PA7
  977  6605        ZALS  0x05
  978  6147        ADDS  0x47
  979  4F09        OUT   0x09,PA7
  97A  500D        SACL  0x0D
  97B  6159        ADDS  0x59
  97C  4F0A        OUT   0x0A,PA7
  97D  5007        SACL  0x07
  97E  6605        ZALS  0x05
  97F  4F0B        OUT   0x0B,PA7
  980  6148        ADDS  0x48
  981  500E        SACL  0x0E
  982  615A        ADDS  0x5A
  983  5008        SACL  0x08
  984  7F80        NOP
  985  6605        ZALS  0x05
  986  6149        ADDS  0x49
  987  500F        SACL  0x0F
  988  615B        ADDS  0x5B
  989  5009        SACL  0x09
  98A  6605        ZALS  0x05
  98B  614A        ADDS  0x4A
  98C  5010        SACL  0x10
  98D  615C        ADDS  0x5C
  98E  500A        SACL  0x0A
  98F  6605        ZALS  0x05
  990  614B        ADDS  0x4B
  991  5011        SACL  0x11
  992  615D        ADDS  0x5D
  993  500B        SACL  0x0B
  994  6560        ZALH  0x60
  995  625A        SUBH  0x5A
  996  FC00 09A4   BGZ   L9A4
  998  6560        ZALH  0x60
  999  625A        SUBH  0x5A
  99A  FA00 09B0   BLZ   L9B0
  99C  7F80        NOP
  99D  6D54        MPY   0x54
  99E  7F8E        PAC
  99F  7F88        ABS
  9A0  0F4E        ADD   0x4E,15
  9A1  5960        SACH  0x60,1
  9A2  F900 09B8   B     L9B8

L9A4:
  9A4  2F5A        LAC   0x5A,15
  9A5  6120        ADDS  0x20
  9A6  0042        ADD   0x42
  9A7  595A        SACH  0x5A,1
  9A8  7901        AND   0x01
  9A9  5020        SACL  0x20
  9AA  7F80        NOP
  9AB  7F80        NOP
  9AC  7F80        NOP
  9AD  7F80        NOP
  9AE  F900 09B8   B     L9B8

L9B0:
  9B0  2F5A        LAC   0x5A,15
  9B1  6120        ADDS  0x20
  9B2  1042        SUB   0x42
  9B3  595A        SACH  0x5A,1
  9B4  7901        AND   0x01
  9B5  5020        SACL  0x20
  9B6  7F80        NOP
  9B7  7F80        NOP
L9B8:
  9B8  6563        ZALH  0x63
  9B9  625D        SUBH  0x5D
  9BA  FC00 09C8   BGZ   L9C8
  9BC  6563        ZALH  0x63
  9BD  625D        SUBH  0x5D
  9BE  FA00 09D4   BLZ   L9D4
  9C0  7F80        NOP
  9C1  6D57        MPY   0x57
  9C2  7F8E        PAC
  9C3  7F88        ABS
  9C4  0F51        ADD   0x51,15
  9C5  5963        SACH  0x63,1
  9C6  F900 09DC   B     L9DC

L9C8:
  9C8  2F5D        LAC   0x5D,15
  9C9  6123        ADDS  0x23
  9CA  0045        ADD   0x45
  9CB  595D        SACH  0x5D,1
  9CC  7901        AND   0x01
  9CD  5023        SACL  0x23
  9CE  7F80        NOP
  9CF  7F80        NOP
  9D0  7F80        NOP
  9D1  7F80        NOP
  9D2  F900 09DC   B     L9DC

L9D4:
  9D4  2F5D        LAC   0x5D,15
  9D5  6123        ADDS  0x23
  9D6  1045        SUB   0x45
  9D7  595D        SACH  0x5D,1
  9D8  7901        AND   0x01
  9D9  5023        SACL  0x23
  9DA  7F80        NOP
  9DB  7F80        NOP
L9DC:
  9DC  7F80        NOP
  9DD  491F        OUT   0x1F,PA1
  9DE  4A22        OUT   0x22,PA2
  9DF  F900 085A   B     L85A

