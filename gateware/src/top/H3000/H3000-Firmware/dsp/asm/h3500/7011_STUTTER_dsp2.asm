; Eventide h3500 DSP microcode
; key 7011  algorithm 70 (STUTTER)  DSP 2
; source H3000-Upgrade_ROM4.BIN offset 37B41, 468 program words loaded at 800
;
  800  6880        LARP  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6E00        LDPK  0
  804  7E01        LACK  0x01
  805  5008        SACL  0x08
  806  5047        SACL  0x47
  807  2908        LAC   0x08,9
  808  5006        SACL  0x06
  809  2308        LAC   0x08,3
  80A  5007        SACL  0x07
  80B  2E08        LAC   0x08,14
  80C  500B        SACL  0x0B
  80D  2F08        LAC   0x08,15
  80E  500D        SACL  0x0D
  80F  7F89        ZAC
  810  500A        SACL  0x0A
  811  5011        SACL  0x11
  812  5022        SACL  0x22
  813  5049        SACL  0x49
  814  1008        SUB   0x08
  815  5809        SACH  0x09
  816  5821        SACH  0x21
  817  7EFF        LACK  0xFF
  818  5014        SACL  0x14
  819  5041        SACL  0x41
  81A  5042        SACL  0x42
  81B  500F        SACL  0x0F
  81C  5002        SACL  0x02
  81D  2702        LAC   0x02,7
  81E  7A02        OR    0x02
  81F  500C        SACL  0x0C
  820  7000        LARK  AR0,0x00
  821  650C        ZALH  0x0C
  822  5815        SACH  0x15
  823  5816        SACH  0x16
  824  F800 099E   CALL  L99E
L826:
  826  F600 082A   BIOZ  L82A
  828  F900 0826   B     L826

L82A:
  82A  4002        IN    0x02,PA0
  82B  6502        ZALH  0x02
  82C  FD00 082F   BGEZ  L82F
  82E  7F80        NOP
L82F:
  82F  F600 082F   BIOZ  L82F
  831  7F80        NOP
L832:
  832  4717        IN    0x17,PA7
  833  6614        ZALS  0x14
  834  6322        SUBS  0x22
  835  FA00 0944   BLZ   L944
  837  4110        IN    0x10,PA1
  838  6310        SUBS  0x10
  839  7F80        NOP
  83A  FC00 0949   BGZ   L949
  83C  4002        IN    0x02,PA0
  83D  6607        ZALS  0x07
  83E  7902        AND   0x02
  83F  FE00 0843   BNZ   L843
  841  F900 0844   B     L844

L843:
  843  4DA8        OUT   *+,PA5
L844:
  844  3003        SAR   AR0,0x03
  845  6614        ZALS  0x14
  846  6303        SUBS  0x03
  847  6147        ADDS  0x47
  848  5014        SACL  0x14
  849  6111        ADDS  0x11
  84A  5012        SACL  0x12
  84B  380A        LAR   AR0,0x0A
  84C  7F80        NOP
  84D  7F80        NOP
  84E  4F12        OUT   0x12,PA7
  84F  4401        IN    0x01,PA4
  850  4400        IN    0x00,PA4
  851  2F17        LAC   0x17,15
  852  0F18        ADD   0x18,15
  853  580E        SACH  0x0E
  854  7F80        NOP
  855  7F80        NOP
  856  7F80        NOP
  857  7F80        NOP
  858  7F80        NOP
  859  7F80        NOP
  85A  7F80        NOP
  85B  7F80        NOP
  85C  7F80        NOP
  85D  7F80        NOP
  85E  7F80        NOP
  85F  4002        IN    0x02,PA0
  860  6607        ZALS  0x07
  861  7902        AND   0x02
  862  FE00 0866   BNZ   L866
  864  F900 0867   B     L867

L866:
  866  4DA8        OUT   *+,PA5
L867:
  867  7F80        NOP
  868  4502        IN    0x02,PA5
  869  6881        LARP  1
  86A  6602        ZALS  0x02
  86B  7906        AND   0x06
  86C  FE00 0871   BNZ   L871
  86E  6880        LARP  0
  86F  F900 0873   B     L873

L871:
  871  3902        LAR   AR1,0x02
  872  4680        IN    *,PA6,AR0
L873:
  873  4718        IN    0x18,PA7
  874  7F80        NOP
  875  6611        ZALS  0x11
  876  6347        SUBS  0x47
  877  5011        SACL  0x11
  878  6549        ZALH  0x49
  879  4A11        OUT   0x11,PA2
  87A  4F11        OUT   0x11,PA7
  87B  4C0E        OUT   0x0E,PA4
  87C  FC00 08A0   BGZ   L8A0
  87E  4002        IN    0x02,PA0
  87F  6607        ZALS  0x07
  880  7902        AND   0x02
  881  FE00 0885   BNZ   L885
  883  F900 0886   B     L886

L885:
  885  4DA8        OUT   *+,PA5
L886:
  886  6521        ZALH  0x21
  887  FD00 0897   BGEZ  L897
  889  6622        ZALS  0x22
  88A  6341        SUBS  0x41
  88B  FC00 0892   BGZ   L892
  88D  6641        ZALS  0x41
  88E  5022        SACL  0x22
  88F  7F80        NOP
  890  F900 0832   B     L832

L892:
  892  6622        ZALS  0x22
  893  104A        SUB   0x4A
  894  5022        SACL  0x22
  895  F900 0832   B     L832

L897:
  897  6611        ZALS  0x11
  898  6148        ADDS  0x48
  899  6323        SUBS  0x23
  89A  7909        AND   0x09
  89B  1508        SUB   0x08,5
  89C  5821        SACH  0x21
  89D  7F80        NOP
  89E  F900 0832   B     L832

L8A0:
  8A0  4002        IN    0x02,PA0
  8A1  6607        ZALS  0x07
  8A2  7902        AND   0x02
  8A3  FE00 08A7   BNZ   L8A7
  8A5  F900 08A8   B     L8A8

L8A7:
  8A7  4DA8        OUT   *+,PA5
L8A8:
  8A8  6521        ZALH  0x21
  8A9  FA00 08B4   BLZ   L8B4
  8AB  6611        ZALS  0x11
  8AC  6148        ADDS  0x48
  8AD  6323        SUBS  0x23
  8AE  7909        AND   0x09
  8AF  1508        SUB   0x08,5
  8B0  5821        SACH  0x21
  8B1  7F80        NOP
  8B2  F900 0832   B     L832

L8B4:
  8B4  6549        ZALH  0x49
  8B5  6208        SUBH  0x08
  8B6  5849        SACH  0x49
  8B7  7F89        ZAC
  8B8  6248        SUBH  0x48
  8B9  5810        SACH  0x10
  8BA  6648        ZALS  0x48
  8BB  6122        ADDS  0x22
  8BC  5022        SACL  0x22
  8BD  4717        IN    0x17,PA7
  8BE  6508        ZALH  0x08
  8BF  5821        SACH  0x21
  8C0  6511        ZALH  0x11
  8C1  5823        SACH  0x23
  8C2  7F80        NOP
  8C3  7F80        NOP
  8C4  7F80        NOP
  8C5  7F80        NOP
  8C6  F900 0949   B     L949

L8C8:
  8C8  4002        IN    0x02,PA0
  8C9  6607        ZALS  0x07
  8CA  7902        AND   0x02
  8CB  FE00 08CF   BNZ   L8CF
  8CD  F900 08D0   B     L8D0

L8CF:
  8CF  4DA8        OUT   *+,PA5
L8D0:
  8D0  3003        SAR   AR0,0x03
  8D1  6614        ZALS  0x14
  8D2  6303        SUBS  0x03
  8D3  6147        ADDS  0x47
  8D4  5014        SACL  0x14
  8D5  6111        ADDS  0x11
  8D6  5012        SACL  0x12
  8D7  000F        ADD   0x0F
  8D8  5013        SACL  0x13
  8D9  380A        LAR   AR0,0x0A
  8DA  4F12        OUT   0x12,PA7
  8DB  441A        IN    0x1A,PA4
  8DC  4419        IN    0x19,PA4
  8DD  4F13        OUT   0x13,PA7
  8DE  441C        IN    0x1C,PA4
  8DF  441B        IN    0x1B,PA4
  8E0  6A16        LT    0x16
  8E1  6D19        MPY   0x19
  8E2  7F8E        PAC
  8E3  6D1B        MPY   0x1B
  8E4  7F90        SPAC
  8E5  0F1B        ADD   0x1B,15
  8E6  5900        SACH  0x00,1
  8E7  7F80        NOP
  8E8  4002        IN    0x02,PA0
  8E9  6607        ZALS  0x07
  8EA  7902        AND   0x02
  8EB  FE00 08EF   BNZ   L8EF
  8ED  F900 08F0   B     L8F0

L8EF:
  8EF  4DA8        OUT   *+,PA5
L8F0:
  8F0  6A16        LT    0x16
  8F1  6D1A        MPY   0x1A
  8F2  7F8E        PAC
  8F3  6D1C        MPY   0x1C
  8F4  7F90        SPAC
  8F5  0F1C        ADD   0x1C,15
  8F6  5901        SACH  0x01,1
  8F7  2F17        LAC   0x17,15
  8F8  0F18        ADD   0x18,15
  8F9  580E        SACH  0x0E
  8FA  7F80        NOP
  8FB  4718        IN    0x18,PA7
  8FC  7F80        NOP
  8FD  6611        ZALS  0x11
  8FE  6347        SUBS  0x47
  8FF  5011        SACL  0x11
  900  6521        ZALH  0x21
  901  4A11        OUT   0x11,PA2
  902  4F11        OUT   0x11,PA7
  903  4C0E        OUT   0x0E,PA4
  904  FD00 0925   BGEZ  L925
  906  4002        IN    0x02,PA0
  907  6607        ZALS  0x07
  908  7902        AND   0x02
  909  FE00 090D   BNZ   L90D
  90B  F900 090E   B     L90E

L90D:
  90D  4DA8        OUT   *+,PA5
L90E:
  90E  7F80        NOP
  90F  7F80        NOP
  910  7F80        NOP
  911  7F80        NOP
  912  7F80        NOP
  913  7F80        NOP
  914  7F80        NOP
  915  6516        ZALH  0x16
  916  6042        ADDH  0x42
  917  5816        SACH  0x16
  918  F500 0832   BV    L832
  91A  4717        IN    0x17,PA7
  91B  7F80        NOP
  91C  7F80        NOP
  91D  7F80        NOP
  91E  7F80        NOP
  91F  7F80        NOP
  920  7F80        NOP
  921  7F80        NOP
  922  7F80        NOP
  923  F900 08C8   B     L8C8

L925:
  925  4002        IN    0x02,PA0
  926  6607        ZALS  0x07
  927  7902        AND   0x02
  928  FE00 092C   BNZ   L92C
  92A  F900 092D   B     L92D

L92C:
  92C  4DA8        OUT   *+,PA5
L92D:
  92D  6611        ZALS  0x11
  92E  6148        ADDS  0x48
  92F  6323        SUBS  0x23
  930  7909        AND   0x09
  931  1508        SUB   0x08,5
  932  5821        SACH  0x21
  933  7F80        NOP
  934  6516        ZALH  0x16
  935  6042        ADDH  0x42
  936  5816        SACH  0x16
  937  F500 0832   BV    L832
L939:
  939  4717        IN    0x17,PA7
  93A  7F80        NOP
  93B  7F80        NOP
  93C  7F80        NOP
  93D  7F80        NOP
  93E  7F80        NOP
  93F  7F80        NOP
  940  7F80        NOP
  941  7F80        NOP
  942  F900 08C8   B     L8C8

L944:
  944  4110        IN    0x10,PA1
  945  7F89        ZAC
  946  6210        SUBH  0x10
  947  5810        SACH  0x10
  948  7F80        NOP
L949:
  949  4002        IN    0x02,PA0
  94A  6607        ZALS  0x07
  94B  7902        AND   0x02
  94C  FE00 0950   BNZ   L950
  94E  F900 0951   B     L951

L950:
  950  4DA8        OUT   *+,PA5
L951:
  951  3003        SAR   AR0,0x03
  952  6614        ZALS  0x14
  953  6303        SUBS  0x03
  954  6147        ADDS  0x47
  955  5014        SACL  0x14
  956  6111        ADDS  0x11
  957  5012        SACL  0x12
  958  7F80        NOP
  959  7F80        NOP
  95A  380A        LAR   AR0,0x0A
  95B  4F12        OUT   0x12,PA7
  95C  4401        IN    0x01,PA4
  95D  4400        IN    0x00,PA4
  95E  6614        ZALS  0x14
  95F  1010        SUB   0x10
  960  5014        SACL  0x14
  961  6610        ZALS  0x10
  962  500F        SACL  0x0F
  963  7F80        NOP
  964  7F80        NOP
  965  7F80        NOP
  966  7F80        NOP
  967  7F80        NOP
  968  7F80        NOP
  969  7F80        NOP
  96A  7F80        NOP
  96B  7F80        NOP
  96C  4002        IN    0x02,PA0
  96D  6607        ZALS  0x07
  96E  7902        AND   0x02
  96F  FE00 0973   BNZ   L973
  971  F900 0974   B     L974

L973:
  973  4DA8        OUT   *+,PA5
L974:
  974  7F80        NOP
  975  7F80        NOP
  976  7F80        NOP
  977  7F80        NOP
  978  7F80        NOP
  979  7F80        NOP
  97A  7F80        NOP
  97B  7F80        NOP
  97C  2F17        LAC   0x17,15
  97D  0F18        ADD   0x18,15
  97E  580E        SACH  0x0E
  97F  4718        IN    0x18,PA7
  980  7F80        NOP
  981  7F80        NOP
  982  6611        ZALS  0x11
  983  6347        SUBS  0x47
  984  5011        SACL  0x11
  985  4A11        OUT   0x11,PA2
  986  4F11        OUT   0x11,PA7
  987  4C0E        OUT   0x0E,PA4
  988  7F80        NOP
  989  7F80        NOP
  98A  4002        IN    0x02,PA0
  98B  6607        ZALS  0x07
  98C  7902        AND   0x02
  98D  FE00 0991   BNZ   L991
  98F  F900 0992   B     L992

L991:
  991  4DA8        OUT   *+,PA5
L992:
  992  7F89        ZAC
  993  5816        SACH  0x16
  994  7F80        NOP
  995  7F80        NOP
  996  7F80        NOP
  997  7F80        NOP
  998  7F80        NOP
  999  7F80        NOP
  99A  7F80        NOP
  99B  7F80        NOP
  99C  F900 0939   B     L939

L99E:
  99E  F600 09A2   BIOZ  L9A2
  9A0  F900 099E   B     L99E

L9A2:
  9A2  4002        IN    0x02,PA0
  9A3  6502        ZALH  0x02
  9A4  FD00 09A7   BGEZ  L9A7
  9A6  7F80        NOP
L9A7:
  9A7  F600 09A7   BIOZ  L9A7
  9A9  7F80        NOP
  9AA  7F89        ZAC
  9AB  5004        SACL  0x04
  9AC  5005        SACL  0x05
  9AD  7F80        NOP
  9AE  7F80        NOP
  9AF  7F80        NOP
  9B0  7F80        NOP
  9B1  7F80        NOP
  9B2  7F80        NOP
  9B3  7F80        NOP
  9B4  7F80        NOP
  9B5  7F80        NOP
  9B6  7F80        NOP
  9B7  7F80        NOP
  9B8  7F80        NOP
  9B9  7F80        NOP
  9BA  7F80        NOP
L9BB:
  9BB  4F04        OUT   0x04,PA7
  9BC  4C05        OUT   0x05,PA4
  9BD  0008        ADD   0x08
  9BE  5004        SACL  0x04
  9BF  4502        IN    0x02,PA5
  9C0  6881        LARP  1
  9C1  6602        ZALS  0x02
  9C2  7906        AND   0x06
  9C3  FE00 09C8   BNZ   L9C8
  9C5  6880        LARP  0
  9C6  F900 09CA   B     L9CA

L9C8:
  9C8  3902        LAR   AR1,0x02
  9C9  4680        IN    *,PA6,AR0
L9CA:
  9CA  4F04        OUT   0x04,PA7
  9CB  4C05        OUT   0x05,PA4
  9CC  6604        ZALS  0x04
  9CD  0008        ADD   0x08
  9CE  5004        SACL  0x04
  9CF  6604        ZALS  0x04
  9D0  FE00 09BB   BNZ   L9BB
  9D2  6E00        LDPK  0
  9D3  7F8D        RET

