; Eventide h3500 DSP microcode
; key 1412  algorithm 14 (program 14)  DSP 3
; source H3000-Upgrade_ROM2.BIN offset 0E956, 515 program words loaded at 800
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
  864  7F80        NOP
L865:
  865  F600 0869   BIOZ  L869
  867  F900 0865   B     L865

L869:
  869  4002        IN    0x02,PA0
  86A  6502        ZALH  0x02
  86B  FA00 086E   BLZ   L86E
  86D  7F80        NOP
L86E:
  86E  F600 086E   BIOZ  L86E
L870:
  870  4502        IN    0x02,PA5
  871  6881        LARP  1
  872  6602        ZALS  0x02
  873  7904        AND   0x04
  874  FE00 0879   BNZ   L879
  876  6880        LARP  0
  877  F900 087B   B     L87B

L879:
  879  3902        LAR   AR1,0x02
  87A  4680        IN    *,PA6,AR0
L87B:
  87B  6605        ZALS  0x05
  87C  4F0F        OUT   0x0F,PA7
  87D  4F10        OUT   0x10,PA7
  87E  4F11        OUT   0x11,PA7
  87F  4F09        OUT   0x09,PA7
  880  4922        OUT   0x22,PA1
  881  4F0A        OUT   0x0A,PA7
  882  6149        ADDS  0x49
  883  500F        SACL  0x0F
  884  4F0B        OUT   0x0B,PA7
  885  615B        ADDS  0x5B
  886  5009        SACL  0x09
  887  6605        ZALS  0x05
  888  614A        ADDS  0x4A
  889  5010        SACL  0x10
  88A  615C        ADDS  0x5C
  88B  4F05        OUT   0x05,PA7
  88C  4F0D        OUT   0x0D,PA7
  88D  4F0E        OUT   0x0E,PA7
  88E  4F06        OUT   0x06,PA7
  88F  500A        SACL  0x0A
  890  6605        ZALS  0x05
  891  4F07        OUT   0x07,PA7
  892  614B        ADDS  0x4B
  893  5011        SACL  0x11
  894  4F08        OUT   0x08,PA7
  895  491F        OUT   0x1F,PA1
  896  615D        ADDS  0x5D
  897  500B        SACL  0x0B
  898  6605        ZALS  0x05
  899  6147        ADDS  0x47
  89A  500D        SACL  0x0D
  89B  6159        ADDS  0x59
  89C  5007        SACL  0x07
  89D  6605        ZALS  0x05
  89E  6148        ADDS  0x48
  89F  500E        SACL  0x0E
  8A0  615A        ADDS  0x5A
  8A1  5008        SACL  0x08
  8A2  6605        ZALS  0x05
  8A3  500C        SACL  0x0C
  8A4  6158        ADDS  0x58
  8A5  5006        SACL  0x06
  8A6  6605        ZALS  0x05
  8A7  6300        SUBS  0x00
  8A8  5005        SACL  0x05
  8A9  665E        ZALS  0x5E
  8AA  6358        SUBS  0x58
  8AB  FC00 08BA   BGZ   L8BA
  8AD  665E        ZALS  0x5E
  8AE  6358        SUBS  0x58
  8AF  FA00 08C7   BLZ   L8C7
  8B1  581E        SACH  0x1E
  8B2  6A24        LT    0x24
  8B3  6D52        MPY   0x52
  8B4  7F8E        PAC
  8B5  7F88        ABS
  8B6  0F4C        ADD   0x4C,15
  8B7  595E        SACH  0x5E,1
  8B8  F900 08D0   B     L8D0

L8BA:
  8BA  2F58        LAC   0x58,15
  8BB  611E        ADDS  0x1E
  8BC  0040        ADD   0x40
  8BD  5958        SACH  0x58,1
  8BE  7901        AND   0x01
  8BF  501E        SACL  0x1E
  8C0  6624        ZALS  0x24
  8C1  0025        ADD   0x25
  8C2  5025        SACL  0x25
  8C3  0024        ADD   0x24
  8C4  5024        SACL  0x24
  8C5  F900 08D0   B     L8D0

L8C7:
  8C7  2F58        LAC   0x58,15
  8C8  611E        ADDS  0x1E
  8C9  1040        SUB   0x40
  8CA  5958        SACH  0x58,1
  8CB  7901        AND   0x01
  8CC  501E        SACL  0x1E
  8CD  7F80        NOP
  8CE  7F80        NOP
  8CF  7F80        NOP
L8D0:
  8D0  6661        ZALS  0x61
  8D1  635B        SUBS  0x5B
  8D2  FC00 08E1   BGZ   L8E1
  8D4  6661        ZALS  0x61
  8D5  635B        SUBS  0x5B
  8D6  FA00 08EE   BLZ   L8EE
  8D8  5821        SACH  0x21
  8D9  6A25        LT    0x25
  8DA  6D55        MPY   0x55
  8DB  7F8E        PAC
  8DC  7F88        ABS
  8DD  0F4F        ADD   0x4F,15
  8DE  5961        SACH  0x61,1
  8DF  F900 08F7   B     L8F7

L8E1:
  8E1  2F5B        LAC   0x5B,15
  8E2  6121        ADDS  0x21
  8E3  0043        ADD   0x43
  8E4  595B        SACH  0x5B,1
  8E5  7901        AND   0x01
  8E6  5021        SACL  0x21
  8E7  6624        ZALS  0x24
  8E8  0025        ADD   0x25
  8E9  5025        SACL  0x25
  8EA  0024        ADD   0x24
  8EB  5024        SACL  0x24
  8EC  F900 08F7   B     L8F7

L8EE:
  8EE  2F5B        LAC   0x5B,15
  8EF  6121        ADDS  0x21
  8F0  1043        SUB   0x43
  8F1  595B        SACH  0x5B,1
  8F2  7901        AND   0x01
  8F3  5021        SACL  0x21
  8F4  7F80        NOP
  8F5  7F80        NOP
  8F6  7F80        NOP
L8F7:
  8F7  6624        ZALS  0x24
  8F8  0025        ADD   0x25
  8F9  5025        SACL  0x25
  8FA  0024        ADD   0x24
  8FB  5024        SACL  0x24
  8FC  7F80        NOP
  8FD  7F80        NOP
  8FE  7F80        NOP
  8FF  7F80        NOP
  900  7F80        NOP
  901  6605        ZALS  0x05
  902  4F0F        OUT   0x0F,PA7
  903  4F10        OUT   0x10,PA7
  904  4F11        OUT   0x11,PA7
  905  4F09        OUT   0x09,PA7
  906  4923        OUT   0x23,PA1
  907  4F0A        OUT   0x0A,PA7
  908  6149        ADDS  0x49
  909  500F        SACL  0x0F
  90A  4F0B        OUT   0x0B,PA7
  90B  615B        ADDS  0x5B
  90C  5009        SACL  0x09
  90D  6605        ZALS  0x05
  90E  614A        ADDS  0x4A
  90F  5010        SACL  0x10
  910  615C        ADDS  0x5C
  911  4F05        OUT   0x05,PA7
  912  4F0D        OUT   0x0D,PA7
  913  4F0E        OUT   0x0E,PA7
  914  4F06        OUT   0x06,PA7
  915  500A        SACL  0x0A
  916  6605        ZALS  0x05
  917  4F07        OUT   0x07,PA7
  918  614B        ADDS  0x4B
  919  5011        SACL  0x11
  91A  4F08        OUT   0x08,PA7
  91B  4920        OUT   0x20,PA1
  91C  615D        ADDS  0x5D
  91D  500B        SACL  0x0B
  91E  6605        ZALS  0x05
  91F  500C        SACL  0x0C
  920  6158        ADDS  0x58
  921  5006        SACL  0x06
  922  6605        ZALS  0x05
  923  6147        ADDS  0x47
  924  500D        SACL  0x0D
  925  6159        ADDS  0x59
  926  5007        SACL  0x07
  927  6605        ZALS  0x05
  928  6148        ADDS  0x48
  929  500E        SACL  0x0E
  92A  615A        ADDS  0x5A
  92B  5008        SACL  0x08
  92C  6605        ZALS  0x05
  92D  6300        SUBS  0x00
  92E  5005        SACL  0x05
  92F  665F        ZALS  0x5F
  930  6359        SUBS  0x59
  931  FC00 0940   BGZ   L940
  933  665F        ZALS  0x5F
  934  6359        SUBS  0x59
  935  FA00 094D   BLZ   L94D
  937  581F        SACH  0x1F
  938  6A24        LT    0x24
  939  6D53        MPY   0x53
  93A  7F8E        PAC
  93B  7F88        ABS
  93C  0F4D        ADD   0x4D,15
  93D  595F        SACH  0x5F,1
  93E  F900 0956   B     L956

L940:
  940  2F59        LAC   0x59,15
  941  611F        ADDS  0x1F
  942  0041        ADD   0x41
  943  5959        SACH  0x59,1
  944  7901        AND   0x01
  945  501F        SACL  0x1F
  946  6624        ZALS  0x24
  947  0025        ADD   0x25
  948  5025        SACL  0x25
  949  0024        ADD   0x24
  94A  5024        SACL  0x24
  94B  F900 0956   B     L956

L94D:
  94D  2F59        LAC   0x59,15
  94E  611F        ADDS  0x1F
  94F  1041        SUB   0x41
  950  5959        SACH  0x59,1
  951  7901        AND   0x01
  952  501F        SACL  0x1F
  953  7F80        NOP
  954  7F80        NOP
  955  7F80        NOP
L956:
  956  6662        ZALS  0x62
  957  635C        SUBS  0x5C
  958  FC00 0967   BGZ   L967
  95A  6662        ZALS  0x62
  95B  635C        SUBS  0x5C
  95C  FA00 0974   BLZ   L974
  95E  5822        SACH  0x22
  95F  6A25        LT    0x25
  960  6D56        MPY   0x56
  961  7F8E        PAC
  962  7F88        ABS
  963  0F50        ADD   0x50,15
  964  5962        SACH  0x62,1
  965  F900 097D   B     L97D

L967:
  967  2F5C        LAC   0x5C,15
  968  6122        ADDS  0x22
  969  0044        ADD   0x44
  96A  595C        SACH  0x5C,1
  96B  7901        AND   0x01
  96C  5022        SACL  0x22
  96D  6624        ZALS  0x24
  96E  0025        ADD   0x25
  96F  5025        SACL  0x25
  970  0024        ADD   0x24
  971  5024        SACL  0x24
  972  F900 097D   B     L97D

L974:
  974  2F5C        LAC   0x5C,15
  975  6122        ADDS  0x22
  976  1044        SUB   0x44
  977  595C        SACH  0x5C,1
  978  7901        AND   0x01
  979  5022        SACL  0x22
  97A  7F80        NOP
  97B  7F80        NOP
  97C  7F80        NOP
L97D:
  97D  6624        ZALS  0x24
  97E  0025        ADD   0x25
  97F  5025        SACL  0x25
  980  0024        ADD   0x24
  981  5024        SACL  0x24
  982  7F80        NOP
  983  7F80        NOP
  984  7F80        NOP
  985  7F80        NOP
  986  7F80        NOP
  987  6605        ZALS  0x05
  988  4F0F        OUT   0x0F,PA7
  989  4F10        OUT   0x10,PA7
  98A  4F11        OUT   0x11,PA7
  98B  4F09        OUT   0x09,PA7
  98C  4921        OUT   0x21,PA1
  98D  4F0A        OUT   0x0A,PA7
  98E  6149        ADDS  0x49
  98F  500F        SACL  0x0F
  990  4F0B        OUT   0x0B,PA7
  991  615B        ADDS  0x5B
  992  5009        SACL  0x09
  993  6605        ZALS  0x05
  994  614A        ADDS  0x4A
  995  5010        SACL  0x10
  996  615C        ADDS  0x5C
  997  4F05        OUT   0x05,PA7
  998  4F0D        OUT   0x0D,PA7
  999  4F0E        OUT   0x0E,PA7
  99A  4F06        OUT   0x06,PA7
  99B  500A        SACL  0x0A
  99C  6605        ZALS  0x05
  99D  4F07        OUT   0x07,PA7
  99E  614B        ADDS  0x4B
  99F  5011        SACL  0x11
  9A0  4F08        OUT   0x08,PA7
  9A1  491E        OUT   0x1E,PA1
  9A2  615D        ADDS  0x5D
  9A3  500B        SACL  0x0B
  9A4  6605        ZALS  0x05
  9A5  500C        SACL  0x0C
  9A6  6158        ADDS  0x58
  9A7  5006        SACL  0x06
  9A8  6605        ZALS  0x05
  9A9  6147        ADDS  0x47
  9AA  500D        SACL  0x0D
  9AB  6159        ADDS  0x59
  9AC  5007        SACL  0x07
  9AD  6605        ZALS  0x05
  9AE  6148        ADDS  0x48
  9AF  500E        SACL  0x0E
  9B0  615A        ADDS  0x5A
  9B1  5008        SACL  0x08
  9B2  6605        ZALS  0x05
  9B3  6300        SUBS  0x00
  9B4  5005        SACL  0x05
  9B5  6660        ZALS  0x60
  9B6  635A        SUBS  0x5A
  9B7  FC00 09C6   BGZ   L9C6
  9B9  6660        ZALS  0x60
  9BA  635A        SUBS  0x5A
  9BB  FA00 09D3   BLZ   L9D3
  9BD  5820        SACH  0x20
  9BE  6A24        LT    0x24
  9BF  6D54        MPY   0x54
  9C0  7F8E        PAC
  9C1  7F88        ABS
  9C2  0F4E        ADD   0x4E,15
  9C3  5960        SACH  0x60,1
  9C4  F900 09DC   B     L9DC

L9C6:
  9C6  2F5A        LAC   0x5A,15
  9C7  6120        ADDS  0x20
  9C8  0042        ADD   0x42
  9C9  595A        SACH  0x5A,1
  9CA  7901        AND   0x01
  9CB  5020        SACL  0x20
  9CC  7F80        NOP
  9CD  7F80        NOP
  9CE  7F80        NOP
  9CF  7F80        NOP
  9D0  7F80        NOP
  9D1  F900 09DC   B     L9DC

L9D3:
  9D3  2F5A        LAC   0x5A,15
  9D4  6120        ADDS  0x20
  9D5  1042        SUB   0x42
  9D6  595A        SACH  0x5A,1
  9D7  7901        AND   0x01
  9D8  5020        SACL  0x20
  9D9  7F80        NOP
  9DA  7F80        NOP
  9DB  7F80        NOP
L9DC:
  9DC  6663        ZALS  0x63
  9DD  635D        SUBS  0x5D
  9DE  FC00 09ED   BGZ   L9ED
  9E0  6663        ZALS  0x63
  9E1  635D        SUBS  0x5D
  9E2  FA00 09FA   BLZ   L9FA
  9E4  5823        SACH  0x23
  9E5  6A24        LT    0x24
  9E6  6D57        MPY   0x57
  9E7  7F8E        PAC
  9E8  7F88        ABS
  9E9  0F51        ADD   0x51,15
  9EA  5963        SACH  0x63,1
  9EB  F900 0870   B     L870

L9ED:
  9ED  2F5D        LAC   0x5D,15
  9EE  6123        ADDS  0x23
  9EF  0045        ADD   0x45
  9F0  595D        SACH  0x5D,1
  9F1  7901        AND   0x01
  9F2  5023        SACL  0x23
  9F3  7F80        NOP
  9F4  7F80        NOP
  9F5  7F80        NOP
  9F6  7F80        NOP
  9F7  7F80        NOP
  9F8  F900 0870   B     L870

L9FA:
  9FA  2F5D        LAC   0x5D,15
  9FB  6123        ADDS  0x23
  9FC  1045        SUB   0x45
  9FD  595D        SACH  0x5D,1
  9FE  7901        AND   0x01
  9FF  5023        SACL  0x23
  A00  7F80        NOP
  A01  F900 0870   B     L870

