; Eventide h3000_v153 DSP microcode
; key 1412  algorithm 14 (program 14)  DSP 3
; source H3000_153_BigROM.BIN offset 0F829, 478 program words loaded at 800
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
  81D  5005        SACL  0x05
  81E  7F80        NOP
  81F  7F80        NOP
  820  7F80        NOP
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
L824:
  824  7F80        NOP
  825  7F80        NOP
  826  7F80        NOP
  827  7F80        NOP
  828  0000        ADD   0x00
  829  5003        SACL  0x03
  82A  4502        IN    0x02,PA5
  82B  6881        LARP  1
  82C  6602        ZALS  0x02
  82D  7904        AND   0x04
  82E  FE00 0833   BNZ   L833
  830  6880        LARP  0
  831  F900 0835   B     L835

L833:
  833  3902        LAR   AR1,0x02
  834  4680        IN    *,PA6,AR0
L835:
  835  7F80        NOP
  836  7F80        NOP
  837  7F80        NOP
  838  7F80        NOP
  839  6603        ZALS  0x03
  83A  0000        ADD   0x00
  83B  5003        SACL  0x03
  83C  6603        ZALS  0x03
  83D  FE00 0824   BNZ   L824
  83F  7F80        NOP
L840:
  840  F600 0844   BIOZ  L844
  842  F900 0840   B     L840

L844:
  844  4002        IN    0x02,PA0
  845  6502        ZALH  0x02
  846  FA00 0849   BLZ   L849
  848  7F80        NOP
L849:
  849  F600 0849   BIOZ  L849
L84B:
  84B  4502        IN    0x02,PA5
  84C  6881        LARP  1
  84D  6602        ZALS  0x02
  84E  7904        AND   0x04
  84F  FE00 0854   BNZ   L854
  851  6880        LARP  0
  852  F900 0856   B     L856

L854:
  854  3902        LAR   AR1,0x02
  855  4680        IN    *,PA6,AR0
L856:
  856  6605        ZALS  0x05
  857  4F0F        OUT   0x0F,PA7
  858  4F10        OUT   0x10,PA7
  859  4F11        OUT   0x11,PA7
  85A  4F09        OUT   0x09,PA7
  85B  4922        OUT   0x22,PA1
  85C  4F0A        OUT   0x0A,PA7
  85D  6149        ADDS  0x49
  85E  500F        SACL  0x0F
  85F  4F0B        OUT   0x0B,PA7
  860  615B        ADDS  0x5B
  861  5009        SACL  0x09
  862  6605        ZALS  0x05
  863  614A        ADDS  0x4A
  864  5010        SACL  0x10
  865  615C        ADDS  0x5C
  866  4F05        OUT   0x05,PA7
  867  4F0D        OUT   0x0D,PA7
  868  4F0E        OUT   0x0E,PA7
  869  4F06        OUT   0x06,PA7
  86A  500A        SACL  0x0A
  86B  6605        ZALS  0x05
  86C  4F07        OUT   0x07,PA7
  86D  614B        ADDS  0x4B
  86E  5011        SACL  0x11
  86F  4F08        OUT   0x08,PA7
  870  491F        OUT   0x1F,PA1
  871  615D        ADDS  0x5D
  872  500B        SACL  0x0B
  873  6605        ZALS  0x05
  874  6147        ADDS  0x47
  875  500D        SACL  0x0D
  876  6159        ADDS  0x59
  877  5007        SACL  0x07
  878  6605        ZALS  0x05
  879  6148        ADDS  0x48
  87A  500E        SACL  0x0E
  87B  615A        ADDS  0x5A
  87C  5008        SACL  0x08
  87D  6605        ZALS  0x05
  87E  500C        SACL  0x0C
  87F  6158        ADDS  0x58
  880  5006        SACL  0x06
  881  6605        ZALS  0x05
  882  6300        SUBS  0x00
  883  5005        SACL  0x05
  884  665E        ZALS  0x5E
  885  6358        SUBS  0x58
  886  FC00 0895   BGZ   L895
  888  665E        ZALS  0x5E
  889  6358        SUBS  0x58
  88A  FA00 08A2   BLZ   L8A2
  88C  581E        SACH  0x1E
  88D  6A24        LT    0x24
  88E  6D52        MPY   0x52
  88F  7F8E        PAC
  890  7F88        ABS
  891  0F4C        ADD   0x4C,15
  892  595E        SACH  0x5E,1
  893  F900 08AB   B     L8AB

L895:
  895  2F58        LAC   0x58,15
  896  611E        ADDS  0x1E
  897  0040        ADD   0x40
  898  5958        SACH  0x58,1
  899  7901        AND   0x01
  89A  501E        SACL  0x1E
  89B  6624        ZALS  0x24
  89C  0025        ADD   0x25
  89D  5025        SACL  0x25
  89E  0024        ADD   0x24
  89F  5024        SACL  0x24
  8A0  F900 08AB   B     L8AB

L8A2:
  8A2  2F58        LAC   0x58,15
  8A3  611E        ADDS  0x1E
  8A4  1040        SUB   0x40
  8A5  5958        SACH  0x58,1
  8A6  7901        AND   0x01
  8A7  501E        SACL  0x1E
  8A8  7F80        NOP
  8A9  7F80        NOP
  8AA  7F80        NOP
L8AB:
  8AB  6661        ZALS  0x61
  8AC  635B        SUBS  0x5B
  8AD  FC00 08BC   BGZ   L8BC
  8AF  6661        ZALS  0x61
  8B0  635B        SUBS  0x5B
  8B1  FA00 08C9   BLZ   L8C9
  8B3  5821        SACH  0x21
  8B4  6A25        LT    0x25
  8B5  6D55        MPY   0x55
  8B6  7F8E        PAC
  8B7  7F88        ABS
  8B8  0F4F        ADD   0x4F,15
  8B9  5961        SACH  0x61,1
  8BA  F900 08D2   B     L8D2

L8BC:
  8BC  2F5B        LAC   0x5B,15
  8BD  6121        ADDS  0x21
  8BE  0043        ADD   0x43
  8BF  595B        SACH  0x5B,1
  8C0  7901        AND   0x01
  8C1  5021        SACL  0x21
  8C2  6624        ZALS  0x24
  8C3  0025        ADD   0x25
  8C4  5025        SACL  0x25
  8C5  0024        ADD   0x24
  8C6  5024        SACL  0x24
  8C7  F900 08D2   B     L8D2

L8C9:
  8C9  2F5B        LAC   0x5B,15
  8CA  6121        ADDS  0x21
  8CB  1043        SUB   0x43
  8CC  595B        SACH  0x5B,1
  8CD  7901        AND   0x01
  8CE  5021        SACL  0x21
  8CF  7F80        NOP
  8D0  7F80        NOP
  8D1  7F80        NOP
L8D2:
  8D2  6624        ZALS  0x24
  8D3  0025        ADD   0x25
  8D4  5025        SACL  0x25
  8D5  0024        ADD   0x24
  8D6  5024        SACL  0x24
  8D7  7F80        NOP
  8D8  7F80        NOP
  8D9  7F80        NOP
  8DA  7F80        NOP
  8DB  7F80        NOP
  8DC  6605        ZALS  0x05
  8DD  4F0F        OUT   0x0F,PA7
  8DE  4F10        OUT   0x10,PA7
  8DF  4F11        OUT   0x11,PA7
  8E0  4F09        OUT   0x09,PA7
  8E1  4923        OUT   0x23,PA1
  8E2  4F0A        OUT   0x0A,PA7
  8E3  6149        ADDS  0x49
  8E4  500F        SACL  0x0F
  8E5  4F0B        OUT   0x0B,PA7
  8E6  615B        ADDS  0x5B
  8E7  5009        SACL  0x09
  8E8  6605        ZALS  0x05
  8E9  614A        ADDS  0x4A
  8EA  5010        SACL  0x10
  8EB  615C        ADDS  0x5C
  8EC  4F05        OUT   0x05,PA7
  8ED  4F0D        OUT   0x0D,PA7
  8EE  4F0E        OUT   0x0E,PA7
  8EF  4F06        OUT   0x06,PA7
  8F0  500A        SACL  0x0A
  8F1  6605        ZALS  0x05
  8F2  4F07        OUT   0x07,PA7
  8F3  614B        ADDS  0x4B
  8F4  5011        SACL  0x11
  8F5  4F08        OUT   0x08,PA7
  8F6  4920        OUT   0x20,PA1
  8F7  615D        ADDS  0x5D
  8F8  500B        SACL  0x0B
  8F9  6605        ZALS  0x05
  8FA  500C        SACL  0x0C
  8FB  6158        ADDS  0x58
  8FC  5006        SACL  0x06
  8FD  6605        ZALS  0x05
  8FE  6147        ADDS  0x47
  8FF  500D        SACL  0x0D
  900  6159        ADDS  0x59
  901  5007        SACL  0x07
  902  6605        ZALS  0x05
  903  6148        ADDS  0x48
  904  500E        SACL  0x0E
  905  615A        ADDS  0x5A
  906  5008        SACL  0x08
  907  6605        ZALS  0x05
  908  6300        SUBS  0x00
  909  5005        SACL  0x05
  90A  665F        ZALS  0x5F
  90B  6359        SUBS  0x59
  90C  FC00 091B   BGZ   L91B
  90E  665F        ZALS  0x5F
  90F  6359        SUBS  0x59
  910  FA00 0928   BLZ   L928
  912  581F        SACH  0x1F
  913  6A24        LT    0x24
  914  6D53        MPY   0x53
  915  7F8E        PAC
  916  7F88        ABS
  917  0F4D        ADD   0x4D,15
  918  595F        SACH  0x5F,1
  919  F900 0931   B     L931

L91B:
  91B  2F59        LAC   0x59,15
  91C  611F        ADDS  0x1F
  91D  0041        ADD   0x41
  91E  5959        SACH  0x59,1
  91F  7901        AND   0x01
  920  501F        SACL  0x1F
  921  6624        ZALS  0x24
  922  0025        ADD   0x25
  923  5025        SACL  0x25
  924  0024        ADD   0x24
  925  5024        SACL  0x24
  926  F900 0931   B     L931

L928:
  928  2F59        LAC   0x59,15
  929  611F        ADDS  0x1F
  92A  1041        SUB   0x41
  92B  5959        SACH  0x59,1
  92C  7901        AND   0x01
  92D  501F        SACL  0x1F
  92E  7F80        NOP
  92F  7F80        NOP
  930  7F80        NOP
L931:
  931  6662        ZALS  0x62
  932  635C        SUBS  0x5C
  933  FC00 0942   BGZ   L942
  935  6662        ZALS  0x62
  936  635C        SUBS  0x5C
  937  FA00 094F   BLZ   L94F
  939  5822        SACH  0x22
  93A  6A25        LT    0x25
  93B  6D56        MPY   0x56
  93C  7F8E        PAC
  93D  7F88        ABS
  93E  0F50        ADD   0x50,15
  93F  5962        SACH  0x62,1
  940  F900 0958   B     L958

L942:
  942  2F5C        LAC   0x5C,15
  943  6122        ADDS  0x22
  944  0044        ADD   0x44
  945  595C        SACH  0x5C,1
  946  7901        AND   0x01
  947  5022        SACL  0x22
  948  6624        ZALS  0x24
  949  0025        ADD   0x25
  94A  5025        SACL  0x25
  94B  0024        ADD   0x24
  94C  5024        SACL  0x24
  94D  F900 0958   B     L958

L94F:
  94F  2F5C        LAC   0x5C,15
  950  6122        ADDS  0x22
  951  1044        SUB   0x44
  952  595C        SACH  0x5C,1
  953  7901        AND   0x01
  954  5022        SACL  0x22
  955  7F80        NOP
  956  7F80        NOP
  957  7F80        NOP
L958:
  958  6624        ZALS  0x24
  959  0025        ADD   0x25
  95A  5025        SACL  0x25
  95B  0024        ADD   0x24
  95C  5024        SACL  0x24
  95D  7F80        NOP
  95E  7F80        NOP
  95F  7F80        NOP
  960  7F80        NOP
  961  7F80        NOP
  962  6605        ZALS  0x05
  963  4F0F        OUT   0x0F,PA7
  964  4F10        OUT   0x10,PA7
  965  4F11        OUT   0x11,PA7
  966  4F09        OUT   0x09,PA7
  967  4921        OUT   0x21,PA1
  968  4F0A        OUT   0x0A,PA7
  969  6149        ADDS  0x49
  96A  500F        SACL  0x0F
  96B  4F0B        OUT   0x0B,PA7
  96C  615B        ADDS  0x5B
  96D  5009        SACL  0x09
  96E  6605        ZALS  0x05
  96F  614A        ADDS  0x4A
  970  5010        SACL  0x10
  971  615C        ADDS  0x5C
  972  4F05        OUT   0x05,PA7
  973  4F0D        OUT   0x0D,PA7
  974  4F0E        OUT   0x0E,PA7
  975  4F06        OUT   0x06,PA7
  976  500A        SACL  0x0A
  977  6605        ZALS  0x05
  978  4F07        OUT   0x07,PA7
  979  614B        ADDS  0x4B
  97A  5011        SACL  0x11
  97B  4F08        OUT   0x08,PA7
  97C  491E        OUT   0x1E,PA1
  97D  615D        ADDS  0x5D
  97E  500B        SACL  0x0B
  97F  6605        ZALS  0x05
  980  500C        SACL  0x0C
  981  6158        ADDS  0x58
  982  5006        SACL  0x06
  983  6605        ZALS  0x05
  984  6147        ADDS  0x47
  985  500D        SACL  0x0D
  986  6159        ADDS  0x59
  987  5007        SACL  0x07
  988  6605        ZALS  0x05
  989  6148        ADDS  0x48
  98A  500E        SACL  0x0E
  98B  615A        ADDS  0x5A
  98C  5008        SACL  0x08
  98D  6605        ZALS  0x05
  98E  6300        SUBS  0x00
  98F  5005        SACL  0x05
  990  6660        ZALS  0x60
  991  635A        SUBS  0x5A
  992  FC00 09A1   BGZ   L9A1
  994  6660        ZALS  0x60
  995  635A        SUBS  0x5A
  996  FA00 09AE   BLZ   L9AE
  998  5820        SACH  0x20
  999  6A24        LT    0x24
  99A  6D54        MPY   0x54
  99B  7F8E        PAC
  99C  7F88        ABS
  99D  0F4E        ADD   0x4E,15
  99E  5960        SACH  0x60,1
  99F  F900 09B7   B     L9B7

L9A1:
  9A1  2F5A        LAC   0x5A,15
  9A2  6120        ADDS  0x20
  9A3  0042        ADD   0x42
  9A4  595A        SACH  0x5A,1
  9A5  7901        AND   0x01
  9A6  5020        SACL  0x20
  9A7  7F80        NOP
  9A8  7F80        NOP
  9A9  7F80        NOP
  9AA  7F80        NOP
  9AB  7F80        NOP
  9AC  F900 09B7   B     L9B7

L9AE:
  9AE  2F5A        LAC   0x5A,15
  9AF  6120        ADDS  0x20
  9B0  1042        SUB   0x42
  9B1  595A        SACH  0x5A,1
  9B2  7901        AND   0x01
  9B3  5020        SACL  0x20
  9B4  7F80        NOP
  9B5  7F80        NOP
  9B6  7F80        NOP
L9B7:
  9B7  6663        ZALS  0x63
  9B8  635D        SUBS  0x5D
  9B9  FC00 09C8   BGZ   L9C8
  9BB  6663        ZALS  0x63
  9BC  635D        SUBS  0x5D
  9BD  FA00 09D5   BLZ   L9D5
  9BF  5823        SACH  0x23
  9C0  6A24        LT    0x24
  9C1  6D57        MPY   0x57
  9C2  7F8E        PAC
  9C3  7F88        ABS
  9C4  0F51        ADD   0x51,15
  9C5  5963        SACH  0x63,1
  9C6  F900 084B   B     L84B

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
  9D2  7F80        NOP
  9D3  F900 084B   B     L84B

L9D5:
  9D5  2F5D        LAC   0x5D,15
  9D6  6123        ADDS  0x23
  9D7  1045        SUB   0x45
  9D8  595D        SACH  0x5D,1
  9D9  7901        AND   0x01
  9DA  5023        SACL  0x23
  9DB  7F80        NOP
  9DC  F900 084B   B     L84B

