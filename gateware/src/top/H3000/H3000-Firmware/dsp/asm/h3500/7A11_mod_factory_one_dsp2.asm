; Eventide h3500 DSP microcode
; key 7A11  algorithm 7A (mod factory|one)  DSP 2
; source H3000-Upgrade_ROM3.BIN offset 046BE, 1238 program words loaded at 800
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
  80C  5008        SACL  0x08
  80D  2908        LAC   0x08,9
  80E  500A        SACL  0x0A
  80F  2F08        LAC   0x08,15
  810  5003        SACL  0x03
  811  7F89        ZAC
  812  5001        SACL  0x01
  813  1008        SUB   0x08
  814  5809        SACH  0x09
  815  7EFF        LACK  0xFF
  816  500B        SACL  0x0B
L817:
  817  270B        LAC   0x0B,7
  818  7A0B        OR    0x0B
  819  5002        SACL  0x02
  81A  6A08        LT    0x08
  81B  8AD4        MPYK  2772
  81C  7F8E        PAC
  81D  5029        SACL  0x29
  81E  8BD5        MPYK  3029
  81F  7F8E        PAC
  820  502A        SACL  0x2A
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
  824  7F80        NOP
L825:
  825  F600 0829   BIOZ  L829
  827  F900 0825   B     L825

L829:
  829  400B        IN    0x0B,PA0
  82A  650B        ZALH  0x0B
  82B  FD00 082E   BGEZ  L82E
  82D  7F80        NOP
L82E:
  82E  F600 082E   BIOZ  L82E
  830  2C08        LAC   0x08,12
  831  500B        SACL  0x0B
  832  7E00        LACK  0x00
  833  500C        SACL  0x0C
  834  7E10        LACK  0x10
  835  500D        SACL  0x0D
  836  7E02        LACK  0x02
  837  500E        SACL  0x0E
  838  7E03        LACK  0x03
  839  500F        SACL  0x0F
  83A  7F80        NOP
  83B  480D        OUT   0x0D,PA0
  83C  7F80        NOP
  83D  4F01        OUT   0x01,PA7
  83E  4C0F        OUT   0x0F,PA4
  83F  7F80        NOP
  840  480C        OUT   0x0C,PA0
  841  7F80        NOP
  842  4F01        OUT   0x01,PA7
  843  4C0E        OUT   0x0E,PA4
  844  7F80        NOP
  845  480B        OUT   0x0B,PA0
  846  7F80        NOP
  847  4F01        OUT   0x01,PA7
  848  4C08        OUT   0x08,PA4
  849  7F80        NOP
  84A  480D        OUT   0x0D,PA0
  84B  4F01        OUT   0x01,PA7
  84C  440D        IN    0x0D,PA4
  84D  480C        OUT   0x0C,PA0
  84E  4F01        OUT   0x01,PA7
  84F  440C        IN    0x0C,PA4
  850  480B        OUT   0x0B,PA0
  851  4F01        OUT   0x01,PA7
  852  440B        IN    0x0B,PA4
  853  7E03        LACK  0x03
  854  630D        SUBS  0x0D
  855  FE00 0868   BNZ   L868
  857  7E3F        LACK  0x3F
  858  502E        SACL  0x2E
  859  7E20        LACK  0x20
  85A  502D        SACL  0x2D
  85B  7F89        ZAC
  85C  502C        SACL  0x2C
  85D  7E02        LACK  0x02
  85E  7F80        NOP
  85F  7F80        NOP
  860  7F80        NOP
  861  7F80        NOP
  862  7F80        NOP
  863  7F80        NOP
  864  7F80        NOP
  865  7F80        NOP
  866  F900 088F   B     L88F

L868:
  868  7E02        LACK  0x02
  869  630C        SUBS  0x0C
  86A  FE00 0879   BNZ   L879
  86C  7E0F        LACK  0x0F
  86D  502E        SACL  0x2E
  86E  7E08        LACK  0x08
  86F  502D        SACL  0x2D
  870  7F89        ZAC
  871  502C        SACL  0x2C
  872  7E01        LACK  0x01
  873  7F80        NOP
  874  7F80        NOP
  875  7F80        NOP
  876  7F80        NOP
  877  F900 088F   B     L88F

L879:
  879  7E01        LACK  0x01
  87A  630B        SUBS  0x0B
  87B  FE00 0886   BNZ   L886
  87D  7F89        ZAC
  87E  502E        SACL  0x2E
  87F  7F89        ZAC
  880  502D        SACL  0x2D
  881  6603        ZALS  0x03
  882  502C        SACL  0x2C
  883  7E00        LACK  0x00
  884  F900 088F   B     L88F

L886:
  886  7EFF        LACK  0xFF
  887  7F80        NOP
  888  7F80        NOP
  889  7F80        NOP
  88A  7F80        NOP
  88B  7F80        NOP
  88C  7F80        NOP
  88D  7F80        NOP
  88E  7F80        NOP
L88F:
  88F  500B        SACL  0x0B
  890  4A0B        OUT   0x0B,PA2
  891  4801        OUT   0x01,PA0
  892  6602        ZALS  0x02
  893  500C        SACL  0x0C
L894:
  894  F600 0898   BIOZ  L898
  896  F900 0894   B     L894

L898:
  898  400B        IN    0x0B,PA0
  899  650B        ZALH  0x0B
  89A  FD00 089D   BGEZ  L89D
  89C  7F80        NOP
L89D:
  89D  F600 089D   BIOZ  L89D
L89F:
  89F  450B        IN    0x0B,PA5
  8A0  6881        LARP  1
  8A1  660B        ZALS  0x0B
  8A2  790A        AND   0x0A
  8A3  FE00 08A8   BNZ   L8A8
  8A5  6880        LARP  0
  8A6  F900 08AA   B     L8AA

L8A8:
  8A8  390B        LAR   AR1,0x0B
  8A9  4680        IN    *,PA6,AR0
L8AA:
  8AA  7F80        NOP
  8AB  660C        ZALS  0x0C
  8AC  6108        ADDS  0x08
  8AD  500C        SACL  0x0C
  8AE  4F0C        OUT   0x0C,PA7
  8AF  6108        ADDS  0x08
  8B0  500C        SACL  0x0C
  8B1  4F0C        OUT   0x0C,PA7
  8B2  6108        ADDS  0x08
  8B3  500C        SACL  0x0C
  8B4  4F0C        OUT   0x0C,PA7
  8B5  6108        ADDS  0x08
  8B6  500C        SACL  0x0C
  8B7  4F0C        OUT   0x0C,PA7
  8B8  6108        ADDS  0x08
  8B9  500C        SACL  0x0C
  8BA  4F0C        OUT   0x0C,PA7
  8BB  6108        ADDS  0x08
  8BC  500C        SACL  0x0C
  8BD  4F0C        OUT   0x0C,PA7
  8BE  6108        ADDS  0x08
  8BF  500C        SACL  0x0C
  8C0  4F0C        OUT   0x0C,PA7
  8C1  6108        ADDS  0x08
  8C2  500C        SACL  0x0C
  8C3  4F0C        OUT   0x0C,PA7
  8C4  6108        ADDS  0x08
  8C5  500C        SACL  0x0C
  8C6  4F0C        OUT   0x0C,PA7
  8C7  6108        ADDS  0x08
  8C8  500C        SACL  0x0C
  8C9  4F0C        OUT   0x0C,PA7
  8CA  6108        ADDS  0x08
  8CB  500C        SACL  0x0C
  8CC  4F0C        OUT   0x0C,PA7
  8CD  6108        ADDS  0x08
  8CE  500C        SACL  0x0C
  8CF  4F0C        OUT   0x0C,PA7
  8D0  6108        ADDS  0x08
  8D1  500C        SACL  0x0C
  8D2  4F0C        OUT   0x0C,PA7
  8D3  6108        ADDS  0x08
  8D4  500C        SACL  0x0C
  8D5  4F0C        OUT   0x0C,PA7
  8D6  6108        ADDS  0x08
  8D7  500C        SACL  0x0C
  8D8  4F0C        OUT   0x0C,PA7
  8D9  6108        ADDS  0x08
  8DA  500C        SACL  0x0C
  8DB  4F0C        OUT   0x0C,PA7
  8DC  6108        ADDS  0x08
  8DD  500C        SACL  0x0C
  8DE  4F0C        OUT   0x0C,PA7
  8DF  6108        ADDS  0x08
  8E0  500C        SACL  0x0C
  8E1  4F0C        OUT   0x0C,PA7
  8E2  6108        ADDS  0x08
  8E3  500C        SACL  0x0C
  8E4  4F0C        OUT   0x0C,PA7
  8E5  6108        ADDS  0x08
  8E6  500C        SACL  0x0C
  8E7  4F0C        OUT   0x0C,PA7
  8E8  6108        ADDS  0x08
  8E9  500C        SACL  0x0C
  8EA  4F0C        OUT   0x0C,PA7
  8EB  7F80        NOP
  8EC  7F80        NOP
  8ED  7F80        NOP
  8EE  7F80        NOP
  8EF  7F80        NOP
  8F0  200C        LAC   0x0C
  8F1  FA00 089F   BLZ   L89F
  8F3  482D        OUT   0x2D,PA0
  8F4  6602        ZALS  0x02
  8F5  500C        SACL  0x0C
L8F6:
  8F6  F600 08FA   BIOZ  L8FA
  8F8  F900 08F6   B     L8F6

L8FA:
  8FA  400B        IN    0x0B,PA0
  8FB  650B        ZALH  0x0B
  8FC  FD00 08FF   BGEZ  L8FF
  8FE  7F80        NOP
L8FF:
  8FF  F600 08FF   BIOZ  L8FF
L901:
  901  450B        IN    0x0B,PA5
  902  6881        LARP  1
  903  660B        ZALS  0x0B
  904  790A        AND   0x0A
  905  FE00 090A   BNZ   L90A
  907  6880        LARP  0
  908  F900 090C   B     L90C

L90A:
  90A  390B        LAR   AR1,0x0B
  90B  4680        IN    *,PA6,AR0
L90C:
  90C  7F80        NOP
  90D  660C        ZALS  0x0C
  90E  6108        ADDS  0x08
  90F  500C        SACL  0x0C
  910  4F0C        OUT   0x0C,PA7
  911  6108        ADDS  0x08
  912  500C        SACL  0x0C
  913  4F0C        OUT   0x0C,PA7
  914  6108        ADDS  0x08
  915  500C        SACL  0x0C
  916  4F0C        OUT   0x0C,PA7
  917  6108        ADDS  0x08
  918  500C        SACL  0x0C
  919  4F0C        OUT   0x0C,PA7
  91A  6108        ADDS  0x08
  91B  500C        SACL  0x0C
  91C  4F0C        OUT   0x0C,PA7
  91D  6108        ADDS  0x08
  91E  500C        SACL  0x0C
  91F  4F0C        OUT   0x0C,PA7
  920  6108        ADDS  0x08
  921  500C        SACL  0x0C
  922  4F0C        OUT   0x0C,PA7
  923  6108        ADDS  0x08
  924  500C        SACL  0x0C
  925  4F0C        OUT   0x0C,PA7
  926  6108        ADDS  0x08
  927  500C        SACL  0x0C
  928  4F0C        OUT   0x0C,PA7
  929  6108        ADDS  0x08
  92A  500C        SACL  0x0C
  92B  4F0C        OUT   0x0C,PA7
  92C  6108        ADDS  0x08
  92D  500C        SACL  0x0C
  92E  4F0C        OUT   0x0C,PA7
  92F  6108        ADDS  0x08
  930  500C        SACL  0x0C
  931  4F0C        OUT   0x0C,PA7
  932  6108        ADDS  0x08
  933  500C        SACL  0x0C
  934  4F0C        OUT   0x0C,PA7
  935  6108        ADDS  0x08
  936  500C        SACL  0x0C
  937  4F0C        OUT   0x0C,PA7
  938  6108        ADDS  0x08
  939  500C        SACL  0x0C
  93A  4F0C        OUT   0x0C,PA7
  93B  6108        ADDS  0x08
  93C  500C        SACL  0x0C
  93D  4F0C        OUT   0x0C,PA7
  93E  6108        ADDS  0x08
  93F  500C        SACL  0x0C
  940  4F0C        OUT   0x0C,PA7
  941  6108        ADDS  0x08
  942  500C        SACL  0x0C
  943  4F0C        OUT   0x0C,PA7
  944  6108        ADDS  0x08
  945  500C        SACL  0x0C
  946  4F0C        OUT   0x0C,PA7
  947  6108        ADDS  0x08
  948  500C        SACL  0x0C
  949  4F0C        OUT   0x0C,PA7
  94A  6108        ADDS  0x08
  94B  500C        SACL  0x0C
  94C  4F0C        OUT   0x0C,PA7
  94D  7F80        NOP
  94E  7F80        NOP
  94F  7F80        NOP
  950  7F80        NOP
  951  7F80        NOP
  952  200C        LAC   0x0C
  953  FA00 0901   BLZ   L901
L955:
  955  F600 0959   BIOZ  L959
  957  F900 0955   B     L955

L959:
  959  400B        IN    0x0B,PA0
  95A  650B        ZALH  0x0B
  95B  FD00 095E   BGEZ  L95E
  95D  7F80        NOP
L95E:
  95E  F600 095E   BIOZ  L95E
L960:
  960  450B        IN    0x0B,PA5
  961  390B        LAR   AR1,0x0B
  962  4681        IN    *,PA6,AR1
  963  6A21        LT    0x21
  964  6D5D        MPY   0x5D
  965  7F8E        PAC
  966  590B        SACH  0x0B,1
  967  7902        AND   0x02
  968  500C        SACL  0x0C
  969  6A0C        LT    0x0C
  96A  652B        ZALH  0x2B
  96B  6110        ADDS  0x10
  96C  1208        SUB   0x08,2
  96D  5010        SACL  0x10
  96E  582B        SACH  0x2B
  96F  065C        ADD   0x5C,6
  970  000B        ADD   0x0B
  971  500B        SACL  0x0B
  972  580C        SACH  0x0C
  973  662E        ZALS  0x2E
  974  792B        AND   0x2B
  975  502B        SACL  0x2B
  976  662E        ZALS  0x2E
  977  790C        AND   0x0C
  978  500C        SACL  0x0C
  979  482B        OUT   0x2B,PA0
  97A  7180        LARK  AR1,0x80
  97B  4F10        OUT   0x10,PA7
  97C  4CA8        OUT   *+,PA4
  97D  440F        IN    0x0F,PA4
  97E  4CA8        OUT   *+,PA4
  97F  440F        IN    0x0F,PA4
  980  4CA8        OUT   *+,PA4
  981  440F        IN    0x0F,PA4
  982  4CA8        OUT   *+,PA4
  983  7F80        NOP
  984  480C        OUT   0x0C,PA0
  985  4F0B        OUT   0x0B,PA7
  986  440B        IN    0x0B,PA4
  987  440C        IN    0x0C,PA4
  988  440D        IN    0x0D,PA4
  989  440E        IN    0x0E,PA4
  98A  440F        IN    0x0F,PA4
  98B  7F80        NOP
  98C  2F0E        LAC   0x0E,15
  98D  6D0E        MPY   0x0E
  98E  7F90        SPAC
  98F  6D0F        MPY   0x0F
  990  7F8F        APAC
  991  5915        SACH  0x15,1
  992  4915        OUT   0x15,PA1
  993  4920        OUT   0x20,PA1
  994  4927        OUT   0x27,PA1
  995  7F80        NOP
  996  7F80        NOP
  997  7F80        NOP
  998  2F0D        LAC   0x0D,15
  999  6D0D        MPY   0x0D
  99A  7F90        SPAC
  99B  6D0E        MPY   0x0E
  99C  7F8F        APAC
  99D  5916        SACH  0x16,1
  99E  4113        IN    0x13,PA1
  99F  7F80        NOP
  9A0  411A        IN    0x1A,PA1
  9A1  7F80        NOP
  9A2  4122        IN    0x22,PA1
  9A3  7F80        NOP
  9A4  2F0C        LAC   0x0C,15
  9A5  6D0C        MPY   0x0C
  9A6  7F90        SPAC
  9A7  6D0D        MPY   0x0D
  9A8  7F8F        APAC
  9A9  5917        SACH  0x17,1
  9AA  2F0B        LAC   0x0B,15
  9AB  6D0B        MPY   0x0B
  9AC  7F90        SPAC
  9AD  6D0C        MPY   0x0C
  9AE  7F8F        APAC
  9AF  5918        SACH  0x18,1
  9B0  7F80        NOP
  9B1  7F80        NOP
  9B2  7F80        NOP
  9B3  7F80        NOP
  9B4  6A22        LT    0x22
  9B5  6D5F        MPY   0x5F
  9B6  7F8E        PAC
  9B7  590B        SACH  0x0B,1
  9B8  7902        AND   0x02
  9B9  500C        SACL  0x0C
  9BA  6A0C        LT    0x0C
  9BB  662B        ZALS  0x2B
  9BC  002D        ADD   0x2D
  9BD  792E        AND   0x2E
  9BE  500D        SACL  0x0D
  9BF  652B        ZALH  0x2B
  9C0  6110        ADDS  0x10
  9C1  612C        ADDS  0x2C
  9C2  500E        SACL  0x0E
  9C3  065E        ADD   0x5E,6
  9C4  000B        ADD   0x0B
  9C5  500B        SACL  0x0B
  9C6  580C        SACH  0x0C
  9C7  660C        ZALS  0x0C
  9C8  002D        ADD   0x2D
  9C9  792E        AND   0x2E
  9CA  500C        SACL  0x0C
  9CB  480D        OUT   0x0D,PA0
  9CC  7184        LARK  AR1,0x84
  9CD  4F0E        OUT   0x0E,PA7
  9CE  4CA8        OUT   *+,PA4
  9CF  440F        IN    0x0F,PA4
  9D0  4CA8        OUT   *+,PA4
  9D1  440F        IN    0x0F,PA4
  9D2  4CA8        OUT   *+,PA4
  9D3  440F        IN    0x0F,PA4
  9D4  4CA8        OUT   *+,PA4
  9D5  7F80        NOP
  9D6  480C        OUT   0x0C,PA0
  9D7  4F0B        OUT   0x0B,PA7
  9D8  440B        IN    0x0B,PA4
  9D9  440C        IN    0x0C,PA4
  9DA  440D        IN    0x0D,PA4
  9DB  440E        IN    0x0E,PA4
  9DC  440F        IN    0x0F,PA4
  9DD  7F80        NOP
  9DE  2F0E        LAC   0x0E,15
  9DF  6D0E        MPY   0x0E
  9E0  7F90        SPAC
  9E1  6D0F        MPY   0x0F
  9E2  7F8F        APAC
  9E3  591D        SACH  0x1D,1
  9E4  4916        OUT   0x16,PA1
  9E5  491D        OUT   0x1D,PA1
  9E6  4906        OUT   0x06,PA1
  9E7  7F80        NOP
  9E8  7F80        NOP
  9E9  7F80        NOP
  9EA  2F0D        LAC   0x0D,15
  9EB  6D0D        MPY   0x0D
  9EC  7F90        SPAC
  9ED  6D0E        MPY   0x0E
  9EE  7F8F        APAC
  9EF  591E        SACH  0x1E,1
  9F0  4114        IN    0x14,PA1
  9F1  7F80        NOP
  9F2  411B        IN    0x1B,PA1
  9F3  7F80        NOP
  9F4  4123        IN    0x23,PA1
  9F5  7F80        NOP
  9F6  2F0C        LAC   0x0C,15
  9F7  6D0C        MPY   0x0C
  9F8  7F90        SPAC
  9F9  6D0D        MPY   0x0D
  9FA  7F8F        APAC
  9FB  591F        SACH  0x1F,1
  9FC  2F0B        LAC   0x0B,15
  9FD  6D0B        MPY   0x0B
  9FE  7F90        SPAC
  9FF  6D0C        MPY   0x0C
  A00  7F8F        APAC
  A01  5920        SACH  0x20,1
  A02  7180        LARK  AR1,0x80
  A03  6A4D        LT    0x4D
  A04  6514        ZALH  0x14
  A05  6D18        MPY   0x18
  A06  7F8F        APAC
  A07  7F8F        APAC
  A08  58A8        SACH  *+
  A09  6513        ZALH  0x13
  A0A  6D17        MPY   0x17
  A0B  7F8F        APAC
  A0C  7F8F        APAC
  A0D  58A8        SACH  *+
  A0E  6512        ZALH  0x12
  A0F  6D16        MPY   0x16
  A10  7F8F        APAC
  A11  7F8F        APAC
  A12  58A8        SACH  *+
  A13  6511        ZALH  0x11
  A14  6D15        MPY   0x15
  A15  7F8F        APAC
  A16  7F8F        APAC
  A17  58A8        SACH  *+
  A18  6523        ZALH  0x23
  A19  7F88        ABS
  A1A  6206        SUBH  0x06
  A1B  FD00 0A27   BGEZ  LA27
  A1D  580B        SACH  0x0B
  A1E  6506        ZALH  0x06
  A1F  6125        ADDS  0x25
  A20  6A69        LT    0x69
  A21  6D0B        MPY   0x0B
  A22  7F8F        APAC
  A23  5806        SACH  0x06
  A24  5025        SACL  0x25
  A25  F900 0A31   B     LA31

LA27:
  A27  580B        SACH  0x0B
  A28  6506        ZALH  0x06
  A29  6125        ADDS  0x25
  A2A  6A68        LT    0x68
  A2B  6D0B        MPY   0x0B
  A2C  7F8F        APAC
  A2D  5806        SACH  0x06
  A2E  5025        SACL  0x25
  A2F  7F80        NOP
  A30  7F80        NOP
LA31:
  A31  2806        LAC   0x06,8
  A32  590B        SACH  0x0B,1
  A33  7902        AND   0x02
  A34  500C        SACL  0x0C
  A35  660B        ZALS  0x0B
  A36  6129        ADDS  0x29
  A37  670D        TBLR  0x0D
  A38  6108        ADDS  0x08
  A39  670E        TBLR  0x0E
  A3A  2F0D        LAC   0x0D,15
  A3B  6A0C        LT    0x0C
  A3C  6D0D        MPY   0x0D
  A3D  7F90        SPAC
  A3E  6D0E        MPY   0x0E
  A3F  7F8F        APAC
  A40  590B        SACH  0x0B,1
  A41  650B        ZALH  0x0B
  A42  626A        SUBH  0x6A
  A43  FC00 0A4A   BGZ   LA4A
  A45  7F80        NOP
  A46  7F89        ZAC
  A47  580C        SACH  0x0C
  A48  F900 0A4F   B     LA4F

LA4A:
  A4A  580B        SACH  0x0B
  A4B  6A0B        LT    0x0B
  A4C  6D6B        MPY   0x6B
  A4D  7F8E        PAC
  A4E  590C        SACH  0x0C,1
LA4F:
  A4F  280C        LAC   0x0C,8
  A50  0802        ADD   0x02,8
  A51  4917        OUT   0x17,PA1
  A52  491E        OUT   0x1E,PA1
  A53  4928        OUT   0x28,PA1
  A54  7F88        ABS
  A55  590B        SACH  0x0B,1
  A56  7902        AND   0x02
  A57  500C        SACL  0x0C
  A58  660B        ZALS  0x0B
  A59  612A        ADDS  0x2A
  A5A  670D        TBLR  0x0D
  A5B  4111        IN    0x11,PA1
  A5C  7F80        NOP
  A5D  411C        IN    0x1C,PA1
  A5E  7F80        NOP
  A5F  4124        IN    0x24,PA1
  A60  6108        ADDS  0x08
  A61  670E        TBLR  0x0E
  A62  2F0D        LAC   0x0D,15
  A63  6A0C        LT    0x0C
  A64  6D0D        MPY   0x0D
  A65  7F90        SPAC
  A66  6D0E        MPY   0x0E
  A67  7F8F        APAC
  A68  5927        SACH  0x27,1
  A69  7F80        NOP
  A6A  7F80        NOP
  A6B  7184        LARK  AR1,0x84
  A6C  6A4E        LT    0x4E
  A6D  651C        ZALH  0x1C
  A6E  6D20        MPY   0x20
  A6F  7F8F        APAC
  A70  7F8F        APAC
  A71  58A8        SACH  *+
  A72  651B        ZALH  0x1B
  A73  6D1F        MPY   0x1F
  A74  7F8F        APAC
  A75  7F8F        APAC
  A76  58A8        SACH  *+
  A77  651A        ZALH  0x1A
  A78  6D1E        MPY   0x1E
  A79  7F8F        APAC
  A7A  7F8F        APAC
  A7B  58A8        SACH  *+
  A7C  6519        ZALH  0x19
  A7D  6D1D        MPY   0x1D
  A7E  7F8F        APAC
  A7F  7F8F        APAC
  A80  58A8        SACH  *+
  A81  6524        ZALH  0x24
  A82  7F88        ABS
  A83  6207        SUBH  0x07
  A84  FD00 0A90   BGEZ  LA90
  A86  580B        SACH  0x0B
  A87  6507        ZALH  0x07
  A88  6126        ADDS  0x26
  A89  6A6D        LT    0x6D
  A8A  6D0B        MPY   0x0B
  A8B  7F8F        APAC
  A8C  5807        SACH  0x07
  A8D  5026        SACL  0x26
  A8E  F900 0A9A   B     LA9A

LA90:
  A90  580B        SACH  0x0B
  A91  6507        ZALH  0x07
  A92  6126        ADDS  0x26
  A93  6A6C        LT    0x6C
  A94  6D0B        MPY   0x0B
  A95  7F8F        APAC
  A96  5807        SACH  0x07
  A97  5026        SACL  0x26
  A98  7F80        NOP
  A99  7F80        NOP
LA9A:
  A9A  2807        LAC   0x07,8
  A9B  590B        SACH  0x0B,1
  A9C  7902        AND   0x02
  A9D  500C        SACL  0x0C
  A9E  660B        ZALS  0x0B
  A9F  6129        ADDS  0x29
  AA0  670D        TBLR  0x0D
  AA1  6108        ADDS  0x08
  AA2  670E        TBLR  0x0E
  AA3  2F0D        LAC   0x0D,15
  AA4  6A0C        LT    0x0C
  AA5  6D0D        MPY   0x0D
  AA6  7F90        SPAC
  AA7  6D0E        MPY   0x0E
  AA8  7F8F        APAC
  AA9  590B        SACH  0x0B,1
  AAA  650B        ZALH  0x0B
  AAB  626E        SUBH  0x6E
  AAC  FC00 0AB3   BGZ   LAB3
  AAE  7F80        NOP
  AAF  7F89        ZAC
  AB0  580C        SACH  0x0C
  AB1  F900 0AB8   B     LAB8

LAB3:
  AB3  580B        SACH  0x0B
  AB4  6A0B        LT    0x0B
  AB5  6D6F        MPY   0x6F
  AB6  7F8E        PAC
  AB7  590C        SACH  0x0C,1
LAB8:
  AB8  280C        LAC   0x0C,8
  AB9  0802        ADD   0x02,8
  ABA  4918        OUT   0x18,PA1
  ABB  491F        OUT   0x1F,PA1
  ABC  4907        OUT   0x07,PA1
  ABD  7F88        ABS
  ABE  590B        SACH  0x0B,1
  ABF  7902        AND   0x02
  AC0  500C        SACL  0x0C
  AC1  660B        ZALS  0x0B
  AC2  612A        ADDS  0x2A
  AC3  670D        TBLR  0x0D
  AC4  4112        IN    0x12,PA1
  AC5  7F80        NOP
  AC6  4119        IN    0x19,PA1
  AC7  7F80        NOP
  AC8  4121        IN    0x21,PA1
  AC9  6108        ADDS  0x08
  ACA  670E        TBLR  0x0E
  ACB  2F0D        LAC   0x0D,15
  ACC  6A0C        LT    0x0C
  ACD  6D0D        MPY   0x0D
  ACE  7F90        SPAC
  ACF  6D0E        MPY   0x0E
  AD0  7F8F        APAC
  AD1  5928        SACH  0x28,1
  AD2  F900 0960   B     L960

  AD4  8000        MPYK  0
  AD5  C000        .word 0xC000
  AD6  C800        .word 0xC800
  AD7  CCAE        .word 0xCCAE
  AD8  D000        .word 0xD000
  AD9  D293        .word 0xD293
  ADA  D4AE        .word 0xD4AE
  ADB  D675        .word 0xD675
  ADC  D800        .word 0xD800
  ADD  D95C        .word 0xD95C
  ADE  DA93        .word 0xDA93
  ADF  DBAD        .word 0xDBAD
  AE0  DCAE        .word 0xDCAE
  AE1  DD9B        .word 0xDD9B
  AE2  DE75        .word 0xDE75
  AE3  DF41        .word 0xDF41
  AE4  E000        .word 0xE000
  AE5  E0B3        .word 0xE0B3
  AE6  E15C        .word 0xE15C
  AE7  E1FC        .word 0xE1FC
  AE8  E293        .word 0xE293
  AE9  E323        .word 0xE323
  AEA  E3AD        .word 0xE3AD
  AEB  E430        .word 0xE430
  AEC  E4AE        .word 0xE4AE
  AED  E527        .word 0xE527
  AEE  E59B        .word 0xE59B
  AEF  E60A        .word 0xE60A
  AF0  E675        .word 0xE675
  AF1  E6DD        .word 0xE6DD
  AF2  E741        .word 0xE741
  AF3  E7A2        .word 0xE7A2
  AF4  E800        .word 0xE800
  AF5  E85B        .word 0xE85B
  AF6  E8B3        .word 0xE8B3
  AF7  E909        .word 0xE909
  AF8  E95C        .word 0xE95C
  AF9  E9AD        .word 0xE9AD
  AFA  E9FC        .word 0xE9FC
  AFB  EA49        .word 0xEA49
  AFC  EA93        .word 0xEA93
  AFD  EADC        .word 0xEADC
  AFE  EB23        .word 0xEB23
  AFF  EB69        .word 0xEB69
  B00  EBAD        .word 0xEBAD
  B01  EBEF        .word 0xEBEF
  B02  EC30        .word 0xEC30
  B03  EC70        .word 0xEC70
  B04  ECAE        .word 0xECAE
  B05  ECEB        .word 0xECEB
  B06  ED27        .word 0xED27
  B07  ED61        .word 0xED61
  B08  ED9B        .word 0xED9B
  B09  EDD3        .word 0xEDD3
  B0A  EE0A        .word 0xEE0A
  B0B  EE40        .word 0xEE40
  B0C  EE75        .word 0xEE75
  B0D  EEAA        .word 0xEEAA
  B0E  EEDD        .word 0xEEDD
  B0F  EF10        .word 0xEF10
  B10  EF41        .word 0xEF41
  B11  EF72        .word 0xEF72
LB12:
  B12  EFA2        .word 0xEFA2
  B13  EFD1        .word 0xEFD1
  B14  F000        .word 0xF000
  B15  F02E        .word 0xF02E
  B16  F05B        .word 0xF05B
  B17  F087        .word 0xF087
  B18  F0B3        .word 0xF0B3
  B19  F0DE        .word 0xF0DE
  B1A  F109        .word 0xF109
  B1B  F133        .word 0xF133
  B1C  F15C        .word 0xF15C
  B1D  F185        .word 0xF185
  B1E  F1AD        .word 0xF1AD
  B1F  F1D5        .word 0xF1D5
  B20  F1FC        .word 0xF1FC
  B21  F222        .word 0xF222
  B22  F249        .word 0xF249
  B23  F26E        .word 0xF26E
  B24  F293        .word 0xF293
  B25  F2B8        .word 0xF2B8
  B26  F2DC        .word 0xF2DC
  B27  F300        .word 0xF300
  B28  F323        .word 0xF323
  B29  F346        .word 0xF346
  B2A  F369        .word 0xF369
  B2B  F38B        .word 0xF38B
  B2C  F3AD        .word 0xF3AD
  B2D  F3CE        .word 0xF3CE
  B2E  F3EF        .word 0xF3EF
  B2F  F410        .word 0xF410
  B30  F430        .word 0xF430
  B31  F450        .word 0xF450
  B32  F470        .word 0xF470
  B33  F48F        .word 0xF48F
  B34  F4AE        .word 0xF4AE
  B35  F4CD        .word 0xF4CD
  B36  F4EB        .word 0xF4EB
  B37  F509        .word 0xF509
  B38  F527        .word 0xF527
  B39  F544        .word 0xF544
  B3A  F561        .word 0xF561
  B3B  F57E        .word 0xF57E
  B3C  F59B        .word 0xF59B
  B3D  F5B7        .word 0xF5B7
  B3E  F5D3        .word 0xF5D3
  B3F  F5EF        .word 0xF5EF
  B40  F60A        .word 0xF60A
  B41  F625        .word 0xF625
  B42  F640        .word 0xF640
  B43  F65B        .word 0xF65B
  B44  F675        .word 0xF675
  B45  F690        .word 0xF690
  B46  F6AA        .word 0xF6AA
  B47  F6C4        .word 0xF6C4
  B48  F6DD        .word 0xF6DD
  B49  F6F7        .word 0xF6F7
  B4A  F710        .word 0xF710
  B4B  F729        .word 0xF729
  B4C  F741        .word 0xF741
  B4D  F75A        .word 0xF75A
  B4E  F772        .word 0xF772
  B4F  F78A        .word 0xF78A
  B50  F7A2        .word 0xF7A2
  B51  F7BA        .word 0xF7BA
  B52  F7D1        .word 0xF7D1
  B53  F7E9        .word 0xF7E9
  B54  F800 F817   CALL  L817
  B56  F82E        .word 0xF82E
  B57  F844        .word 0xF844
  B58  F85B        .word 0xF85B
  B59  F871        .word 0xF871
  B5A  F887        .word 0xF887
  B5B  F89D        .word 0xF89D
  B5C  F8B3        .word 0xF8B3
  B5D  F8C9        .word 0xF8C9
  B5E  F8DE        .word 0xF8DE
  B5F  F8F4        .word 0xF8F4
  B60  F909        .word 0xF909
  B61  F91E        .word 0xF91E
  B62  F933        .word 0xF933
  B63  F947        .word 0xF947
  B64  F95C        .word 0xF95C
  B65  F970        .word 0xF970
  B66  F985        .word 0xF985
  B67  F999        .word 0xF999
  B68  F9AD        .word 0xF9AD
  B69  F9C1        .word 0xF9C1
  B6A  F9D5        .word 0xF9D5
  B6B  F9E8        .word 0xF9E8
  B6C  F9FC        .word 0xF9FC
  B6D  FA0F        .word 0xFA0F
  B6E  FA22        .word 0xFA22
  B6F  FA36        .word 0xFA36
  B70  FA49        .word 0xFA49
  B71  FA5B        .word 0xFA5B
  B72  FA6E        .word 0xFA6E
  B73  FA81        .word 0xFA81
  B74  FA93        .word 0xFA93
  B75  FAA6        .word 0xFAA6
  B76  FAB8        .word 0xFAB8
  B77  FACA        .word 0xFACA
  B78  FADC        .word 0xFADC
  B79  FAEE        .word 0xFAEE
  B7A  FB00 FB12   BLEZ  LB12
  B7C  FB23        .word 0xFB23
  B7D  FB35        .word 0xFB35
  B7E  FB46        .word 0xFB46
  B7F  FB58        .word 0xFB58
  B80  FB69        .word 0xFB69
  B81  FB7A        .word 0xFB7A
  B82  FB8B        .word 0xFB8B
  B83  FB9C        .word 0xFB9C
  B84  FBAD        .word 0xFBAD
  B85  FBBE        .word 0xFBBE
  B86  FBCE        .word 0xFBCE
  B87  FBDF        .word 0xFBDF
  B88  FBEF        .word 0xFBEF
  B89  FC00 FC10   BGZ   LC10
  B8B  FC20        .word 0xFC20
  B8C  FC30        .word 0xFC30
  B8D  FC40        .word 0xFC40
  B8E  FC50        .word 0xFC50
  B8F  FC60        .word 0xFC60
  B90  FC70        .word 0xFC70
  B91  FC7F        .word 0xFC7F
  B92  FC8F        .word 0xFC8F
  B93  FC9F        .word 0xFC9F
  B94  FCAE        .word 0xFCAE
  B95  FCBD        .word 0xFCBD
  B96  FCCD        .word 0xFCCD
  B97  FCDC        .word 0xFCDC
  B98  FCEB        .word 0xFCEB
  B99  FCFA        .word 0xFCFA
  B9A  FD09        .word 0xFD09
  B9B  FD18        .word 0xFD18
  B9C  FD27        .word 0xFD27
  B9D  FD35        .word 0xFD35
  B9E  FD44        .word 0xFD44
  B9F  FD53        .word 0xFD53
  BA0  FD61        .word 0xFD61
  BA1  FD70        .word 0xFD70
  BA2  FD7E        .word 0xFD7E
  BA3  FD8C        .word 0xFD8C
  BA4  FD9B        .word 0xFD9B
  BA5  FDA9        .word 0xFDA9
  BA6  FDB7        .word 0xFDB7
  BA7  FDC5        .word 0xFDC5
  BA8  FDD3        .word 0xFDD3
  BA9  FDE1        .word 0xFDE1
  BAA  FDEF        .word 0xFDEF
  BAB  FDFC        .word 0xFDFC
  BAC  FE0A        .word 0xFE0A
  BAD  FE18        .word 0xFE18
  BAE  FE25        .word 0xFE25
  BAF  FE33        .word 0xFE33
  BB0  FE40        .word 0xFE40
  BB1  FE4E        .word 0xFE4E
  BB2  FE5B        .word 0xFE5B
  BB3  FE68        .word 0xFE68
  BB4  FE75        .word 0xFE75
  BB5  FE83        .word 0xFE83
  BB6  FE90        .word 0xFE90
  BB7  FE9D        .word 0xFE9D
  BB8  FEAA        .word 0xFEAA
  BB9  FEB7        .word 0xFEB7
  BBA  FEC4        .word 0xFEC4
  BBB  FED0        .word 0xFED0
  BBC  FEDD        .word 0xFEDD
  BBD  FEEA        .word 0xFEEA
  BBE  FEF7        .word 0xFEF7
  BBF  FF03        .word 0xFF03
  BC0  FF10        .word 0xFF10
  BC1  FF1C        .word 0xFF1C
  BC2  FF29        .word 0xFF29
  BC3  FF35        .word 0xFF35
  BC4  FF41        .word 0xFF41
  BC5  FF4E        .word 0xFF4E
  BC6  FF5A        .word 0xFF5A
  BC7  FF66        .word 0xFF66
  BC8  FF72        .word 0xFF72
  BC9  FF7E        .word 0xFF7E
  BCA  FF8A        .word 0xFF8A
  BCB  FF96        .word 0xFF96
  BCC  FFA2        .word 0xFFA2
  BCD  FFAE        .word 0xFFAE
  BCE  FFBA        .word 0xFFBA
  BCF  FFC6        .word 0xFFC6
  BD0  FFD1        .word 0xFFD1
  BD1  FFDD        .word 0xFFDD
  BD2  FFE9        .word 0xFFE9
  BD3  FFF4        .word 0xFFF4
  BD4  0000        ADD   0x00
  BD5  0000        ADD   0x00
  BD6  0001        ADD   0x01
  BD7  0001        ADD   0x01
  BD8  0001        ADD   0x01
  BD9  0001        ADD   0x01
  BDA  0001        ADD   0x01
  BDB  0001        ADD   0x01
  BDC  0001        ADD   0x01
  BDD  0001        ADD   0x01
  BDE  0001        ADD   0x01
  BDF  0001        ADD   0x01
  BE0  0001        ADD   0x01
  BE1  0001        ADD   0x01
  BE2  0001        ADD   0x01
  BE3  0001        ADD   0x01
  BE4  0001        ADD   0x01
  BE5  0001        ADD   0x01
  BE6  0001        ADD   0x01
  BE7  0001        ADD   0x01
  BE8  0001        ADD   0x01
  BE9  0001        ADD   0x01
  BEA  0001        ADD   0x01
  BEB  0001        ADD   0x01
  BEC  0001        ADD   0x01
  BED  0001        ADD   0x01
  BEE  0001        ADD   0x01
  BEF  0002        ADD   0x02
  BF0  0002        ADD   0x02
  BF1  0002        ADD   0x02
  BF2  0002        ADD   0x02
  BF3  0002        ADD   0x02
  BF4  0002        ADD   0x02
  BF5  0002        ADD   0x02
  BF6  0002        ADD   0x02
  BF7  0002        ADD   0x02
  BF8  0002        ADD   0x02
  BF9  0002        ADD   0x02
  BFA  0002        ADD   0x02
  BFB  0003        ADD   0x03
  BFC  0003        ADD   0x03
  BFD  0003        ADD   0x03
  BFE  0003        ADD   0x03
  BFF  0003        ADD   0x03
  C00  0003        ADD   0x03
  C01  0003        ADD   0x03
  C02  0004        ADD   0x04
  C03  0004        ADD   0x04
  C04  0004        ADD   0x04
  C05  0004        ADD   0x04
  C06  0004        ADD   0x04
  C07  0004        ADD   0x04
  C08  0005        ADD   0x05
  C09  0005        ADD   0x05
  C0A  0005        ADD   0x05
  C0B  0005        ADD   0x05
  C0C  0005        ADD   0x05
  C0D  0006        ADD   0x06
  C0E  0006        ADD   0x06
  C0F  0006        ADD   0x06
LC10:
  C10  0006        ADD   0x06
  C11  0007        ADD   0x07
  C12  0007        ADD   0x07
  C13  0007        ADD   0x07
  C14  0008        ADD   0x08
  C15  0008        ADD   0x08
  C16  0008        ADD   0x08
  C17  0009        ADD   0x09
  C18  0009        ADD   0x09
  C19  000A        ADD   0x0A
  C1A  000A        ADD   0x0A
  C1B  000A        ADD   0x0A
  C1C  000B        ADD   0x0B
  C1D  000B        ADD   0x0B
  C1E  000C        ADD   0x0C
  C1F  000C        ADD   0x0C
  C20  000D        ADD   0x0D
  C21  000D        ADD   0x0D
  C22  000E        ADD   0x0E
  C23  000F        ADD   0x0F
  C24  000F        ADD   0x0F
  C25  0010        ADD   0x10
  C26  0011        ADD   0x11
  C27  0011        ADD   0x11
  C28  0012        ADD   0x12
  C29  0013        ADD   0x13
  C2A  0014        ADD   0x14
  C2B  0015        ADD   0x15
  C2C  0016        ADD   0x16
  C2D  0017        ADD   0x17
  C2E  0018        ADD   0x18
  C2F  0019        ADD   0x19
  C30  001A        ADD   0x1A
  C31  001B        ADD   0x1B
  C32  001C        ADD   0x1C
  C33  001D        ADD   0x1D
  C34  001F        ADD   0x1F
  C35  0020        ADD   0x20
  C36  0021        ADD   0x21
  C37  0023        ADD   0x23
  C38  0024        ADD   0x24
  C39  0026        ADD   0x26
  C3A  0028        ADD   0x28
  C3B  0029        ADD   0x29
  C3C  002B        ADD   0x2B
  C3D  002D        ADD   0x2D
  C3E  002F        ADD   0x2F
  C3F  0031        ADD   0x31
  C40  0034        ADD   0x34
  C41  0036        ADD   0x36
  C42  0038        ADD   0x38
  C43  003B        ADD   0x3B
  C44  003D        ADD   0x3D
  C45  0040        ADD   0x40
  C46  0043        ADD   0x43
  C47  0046        ADD   0x46
  C48  0049        ADD   0x49
  C49  004C        ADD   0x4C
  C4A  004F        ADD   0x4F
  C4B  0053        ADD   0x53
  C4C  0057        ADD   0x57
  C4D  005B        ADD   0x5B
  C4E  005F        ADD   0x5F
  C4F  0063        ADD   0x63
  C50  0067        ADD   0x67
  C51  006C        ADD   0x6C
  C52  0070        ADD   0x70
  C53  0075        ADD   0x75
  C54  007B        ADD   0x7B
  C55  0080        ADD   *,0,AR0
  C56  0086        ADD   *,0,AR0
  C57  008C        ADD   *
  C58  0092        ADD   *-,0,AR0
  C59  0098        ADD   *-
  C5A  009F        ADD   *-
  C5B  00A6        ADD   *+,0,AR0
  C5C  00AD        ADD   *+
  C5D  00B5        ADD   *+-,0,AR1
  C5E  00BD        ADD   *+-
  C5F  00C5        ADD   *,0,AR1
  C60  00CE        ADD   *
  C61  00D7        ADD   *-,0,AR1
  C62  00E1        ADD   *+,0,AR1
  C63  00EB        ADD   *+
  C64  00F5        ADD   *+-,0,AR1
  C65  0100        ADD   0x00,1
  C66  010B        ADD   0x0B,1
  C67  0117        ADD   0x17,1
  C68  0124        ADD   0x24,1
  C69  0130        ADD   0x30,1
  C6A  013E        ADD   0x3E,1
  C6B  014C        ADD   0x4C,1
  C6C  015B        ADD   0x5B,1
  C6D  016A        ADD   0x6A,1
  C6E  017A        ADD   0x7A,1
  C6F  018B        ADD   *,1
  C70  019C        ADD   *-,1
  C71  01AF        ADD   *+,1
  C72  01C2        ADD   *,1,AR0
  C73  01D5        ADD   *-,1,AR1
  C74  01EA        ADD   *+,1
  C75  0200        ADD   0x00,2
  C76  0217        ADD   0x17,2
  C77  022E        ADD   0x2E,2
  C78  0247        ADD   0x47,2
  C79  0261        ADD   0x61,2
  C7A  027C        ADD   0x7C,2
  C7B  0298        ADD   *-,2
  C7C  02B5        ADD   *+-,2,AR1
  C7D  02D4        ADD   *-,2,AR0
  C7E  02F4        ADD   *+-,2,AR0
  C7F  0316        ADD   0x16,3
  C80  0339        ADD   0x39,3
  C81  035D        ADD   0x5D,3
  C82  0383        ADD   *,3,AR1
  C83  03AB        ADD   *+,3
  C84  03D5        ADD   *-,3,AR1
  C85  0400        ADD   0x00,4
  C86  042D        ADD   0x2D,4
  C87  045D        ADD   0x5D,4
  C88  048E        ADD   *,4
  C89  04C2        ADD   *,4,AR0
  C8A  04F8        ADD   *+-,4
  C8B  0530        ADD   0x30,5
  C8C  056B        ADD   0x6B,5
  C8D  05A8        ADD   *+,5
  C8E  05E8        ADD   *+,5
  C8F  062B        ADD   0x2B,6
  C90  0671        ADD   0x71,6
  C91  06BA        ADD   *+-,6
  C92  0706        ADD   0x06,7
  C93  0756        ADD   0x56,7
  C94  07A9        ADD   *+,7
  C95  0800        ADD   0x00,8
  C96  085B        ADD   0x5B,8
  C97  08B9        ADD   *+-,8
  C98  091C        ADD   0x1C,9
  C99  0983        ADD   *,9,AR1
  C9A  09EF        ADD   *+,9
  C9B  0A60        ADD   0x60,10
  C9C  0AD5        ADD   *-,10,AR1
  C9D  0B50        ADD   0x50,11
  C9E  0BD0        ADD   *-,11,AR0
  C9F  0C56        ADD   0x56,12
  CA0  0CE2        ADD   *+,12,AR0
  CA1  0D74        ADD   0x74,13
  CA2  0E0D        ADD   0x0D,14
  CA3  0EAC        ADD   *+,14
  CA4  0F52        ADD   0x52,15
  CA5  1000        SUB   0x00
  CA6  10B5        SUB   *+-,0,AR1
  CA7  1173        SUB   0x73,1
  CA8  1238        SUB   0x38,2
  CA9  1307        SUB   0x07,3
  CAA  13DE        SUB   *-,3
  CAB  14C0        SUB   *,4,AR0
  CAC  15AB        SUB   *+,5
  CAD  16A0        SUB   *+,6,AR0
  CAE  17A1        SUB   *+,7,AR1
  CAF  18AD        SUB   *+,8
  CB0  19C4        SUB   *,9,AR0
  CB1  1AE8        SUB   *+,10
  CB2  1C19        SUB   0x19,12
  CB3  1D58        SUB   0x58,13
  CB4  1EA4        SUB   *+,14,AR0
  CB5  2000        LAC   0x00
  CB6  216A        LAC   0x6A,1
  CB7  22E5        LAC   *+,2,AR1
  CB8  2471        LAC   0x71,4
  CB9  260E        LAC   0x0E,6
  CBA  27BD        LAC   *+-,7
  CBB  297F        LAC   0x7F,9
  CBC  2B56        LAC   0x56,11
  CBD  2D41        LAC   0x41,13
  CBE  2F42        LAC   0x42,15
  CBF  3159        SAR   AR1,0x59
  CC0  3389        .word 0x3389
  CC1  35D1        .word 0x35D1
  CC2  3833        LAR   AR0,0x33
  CC3  3AB0        .word 0x3AB0
  CC4  3D49        .word 0x3D49
  CC5  4000        IN    0x00,PA0
  CC6  42D5        IN    *-,PA2,AR1
  CC7  45CA        IN    *,PA5
  CC8  48E1        OUT   *+,PA0,AR1
  CC9  4C1B        OUT   0x1B,PA4
  CCA  4F7A        OUT   0x7A,PA7
  CCB  52FF        SACL  *+-
  CCC  56AB        SACL  *+
  CCD  5A82        SACH  *,2,AR0
  CCE  5E84        SACH  *,6,AR0
  CCF  62B3        SUBH  *+-,AR1
  CD0  6711        TBLR  0x11
  CD1  6BA2        LTD   *+,AR0
  CD2  7066        LARK  AR0,0x66
  CD3  755F        .word 0x755F
  CD4  7A92        OR    *-,AR0
  CD5  7FFF        .word 0x7FFF
