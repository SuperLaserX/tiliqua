; Eventide h3500 DSP microcode
; key 7410  algorithm 74 (MULTI-SHIFT)  DSP 1
; source H3000-Upgrade_ROM4.BIN offset 06FAC, 357 program words loaded at 800
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
  80C  5006        SACL  0x06
  80D  2806        LAC   0x06,8
  80E  500A        SACL  0x0A
  80F  2F06        LAC   0x06,15
  810  5009        SACL  0x09
  811  7F89        ZAC
  812  5005        SACL  0x05
  813  1006        SUB   0x06
  814  5807        SACH  0x07
  815  7EFF        LACK  0xFF
  816  500B        SACL  0x0B
  817  270B        LAC   0x0B,7
  818  7A0B        OR    0x0B
  819  5008        SACL  0x08
  81A  7E64        LACK  0x64
  81B  5052        SACL  0x52
  81C  2352        LAC   0x52,3
  81D  7E64        LACK  0x64
  81E  5011        SACL  0x11
  81F  5010        SACL  0x10
  820  6881        LARP  1
  821  710F        LARK  AR1,0x0F
  822  7C88        SST   *
  823  7F89        ZAC
  824  500C        SACL  0x0C
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
L830:
  830  450B        IN    0x0B,PA5
  831  6881        LARP  1
  832  660B        ZALS  0x0B
  833  790A        AND   0x0A
  834  FE00 0839   BNZ   L839
  836  6880        LARP  0
  837  F900 083B   B     L83B

L839:
  839  390B        LAR   AR1,0x0B
  83A  4680        IN    *,PA6,AR0
L83B:
  83B  7F80        NOP
  83C  660C        ZALS  0x0C
  83D  4F0C        OUT   0x0C,PA7
  83E  6106        ADDS  0x06
  83F  500C        SACL  0x0C
  840  4F0C        OUT   0x0C,PA7
  841  6106        ADDS  0x06
  842  500C        SACL  0x0C
  843  4F0C        OUT   0x0C,PA7
  844  6106        ADDS  0x06
  845  500C        SACL  0x0C
  846  4F0C        OUT   0x0C,PA7
  847  6106        ADDS  0x06
  848  500C        SACL  0x0C
  849  4F0C        OUT   0x0C,PA7
  84A  6106        ADDS  0x06
  84B  500C        SACL  0x0C
  84C  4F0C        OUT   0x0C,PA7
  84D  6106        ADDS  0x06
  84E  500C        SACL  0x0C
  84F  4F0C        OUT   0x0C,PA7
  850  6106        ADDS  0x06
  851  500C        SACL  0x0C
  852  4F0C        OUT   0x0C,PA7
  853  6106        ADDS  0x06
  854  500C        SACL  0x0C
  855  4F0C        OUT   0x0C,PA7
  856  6106        ADDS  0x06
  857  500C        SACL  0x0C
  858  4F0C        OUT   0x0C,PA7
  859  6106        ADDS  0x06
  85A  500C        SACL  0x0C
  85B  4F0C        OUT   0x0C,PA7
  85C  6106        ADDS  0x06
  85D  500C        SACL  0x0C
  85E  4F0C        OUT   0x0C,PA7
  85F  6106        ADDS  0x06
  860  500C        SACL  0x0C
  861  4F0C        OUT   0x0C,PA7
  862  6106        ADDS  0x06
  863  500C        SACL  0x0C
  864  4F0C        OUT   0x0C,PA7
  865  6106        ADDS  0x06
  866  500C        SACL  0x0C
  867  4F0C        OUT   0x0C,PA7
  868  6106        ADDS  0x06
  869  500C        SACL  0x0C
  86A  4F0C        OUT   0x0C,PA7
  86B  6106        ADDS  0x06
  86C  500C        SACL  0x0C
  86D  4F0C        OUT   0x0C,PA7
  86E  6106        ADDS  0x06
  86F  500C        SACL  0x0C
  870  4F0C        OUT   0x0C,PA7
  871  6106        ADDS  0x06
  872  500C        SACL  0x0C
  873  4F0C        OUT   0x0C,PA7
  874  6106        ADDS  0x06
  875  500C        SACL  0x0C
  876  4F0C        OUT   0x0C,PA7
  877  6106        ADDS  0x06
  878  500C        SACL  0x0C
  879  4F0C        OUT   0x0C,PA7
  87A  6106        ADDS  0x06
  87B  500C        SACL  0x0C
  87C  7F80        NOP
  87D  7F80        NOP
  87E  7F80        NOP
  87F  7F80        NOP
  880  7F80        NOP
  881  200C        LAC   0x0C
  882  FD00 0830   BGEZ  L830
  884  6648        ZALS  0x48
  885  5011        SACL  0x11
  886  5010        SACL  0x10
  887  6654        ZALS  0x54
  888  501C        SACL  0x1C
  889  6881        LARP  1
L88A:
  88A  F600 088E   BIOZ  L88E
  88C  F900 088A   B     L88A

L88E:
  88E  400B        IN    0x0B,PA0
  88F  650B        ZALH  0x0B
  890  FD00 0893   BGEZ  L893
  892  7F80        NOP
L893:
  893  F600 0893   BIOZ  L893
L895:
  895  450B        IN    0x0B,PA5
  896  390B        LAR   AR1,0x0B
  897  4681        IN    *,PA6,AR1
  898  4A1D        OUT   0x1D,PA2
  899  4A01        OUT   0x01,PA2
  89A  7F89        ZAC
  89B  6A01        LT    0x01
  89C  4203        IN    0x03,PA2
  89D  6D62        MPY   0x62
  89E  4F1D        OUT   0x1D,PA7
  89F  4C22        OUT   0x22,PA4
  8A0  6C03        LTA   0x03
  8A1  4F26        OUT   0x26,PA7
  8A2  4402        IN    0x02,PA4
  8A3  4F14        OUT   0x14,PA7
  8A4  4415        IN    0x15,PA4
  8A5  4416        IN    0x16,PA4
  8A6  4F13        OUT   0x13,PA7
  8A7  4418        IN    0x18,PA4
  8A8  4419        IN    0x19,PA4
  8A9  4D20        OUT   0x20,PA5
  8AA  4A1C        OUT   0x1C,PA2
  8AB  6D64        MPY   0x64
  8AC  6C02        LTA   0x02
  8AD  4404        IN    0x04,PA4
  8AE  6D66        MPY   0x66
  8AF  6C04        LTA   0x04
  8B0  6D68        MPY   0x68
  8B1  7F8F        APAC
  8B2  5820        SACH  0x20
  8B3  6020        ADDH  0x20
  8B4  5820        SACH  0x20
  8B5  395A        LAR   AR1,0x5A
  8B6  385C        LAR   AR0,0x5C
  8B7  651E        ZALH  0x1E
  8B8  6A80        LT    *,AR0
  8B9  6D5E        MPY   0x5E
  8BA  7F8F        APAC
  8BB  6C81        LTA   *,AR1
  8BC  6D60        MPY   0x60
  8BD  7F8F        APAC
  8BE  6C1B        LTA   0x1B
  8BF  5822        SACH  0x22
  8C0  2F16        LAC   0x16,15
  8C1  6D16        MPY   0x16
  8C2  7F90        SPAC
  8C3  6D15        MPY   0x15
  8C4  7F8F        APAC
  8C5  5917        SACH  0x17,1
  8C6  2F19        LAC   0x19,15
  8C7  6D19        MPY   0x19
  8C8  7F90        SPAC
  8C9  6D18        MPY   0x18
  8CA  6C23        LTA   0x23
  8CB  591A        SACH  0x1A,1
  8CC  6D1A        MPY   0x1A
  8CD  7F90        SPAC
  8CE  6D17        MPY   0x17
  8CF  7F8F        APAC
  8D0  5901        SACH  0x01,1
  8D1  661B        ZALS  0x1B
  8D2  0450        ADD   0x50,4
  8D3  0F1C        ADD   0x1C,15
  8D4  591C        SACH  0x1C,1
  8D5  7908        AND   0x08
  8D6  501B        SACL  0x1B
  8D7  661D        ZALS  0x1D
  8D8  0006        ADD   0x06
  8D9  501D        SACL  0x1D
  8DA  631C        SUBS  0x1C
  8DB  5014        SACL  0x14
  8DC  1011        SUB   0x11
  8DD  5013        SACL  0x13
  8DE  661D        ZALS  0x1D
  8DF  6358        SUBS  0x58
  8E0  5026        SACL  0x26
  8E1  7B0F        LST   0x0F
  8E2  471E        IN    0x1E,PA7
  8E3  6523        ZALH  0x23
  8E4  6056        ADDH  0x56
  8E5  5823        SACH  0x23
  8E6  F500 08EA   BV    L8EA
  8E8  F900 0895   B     L895

L8EA:
  8EA  7F80        NOP
  8EB  7F80        NOP
L8EC:
  8EC  450B        IN    0x0B,PA5
  8ED  390B        LAR   AR1,0x0B
  8EE  4681        IN    *,PA6,AR1
  8EF  4A1D        OUT   0x1D,PA2
  8F0  4A01        OUT   0x01,PA2
  8F1  7F89        ZAC
  8F2  6A01        LT    0x01
  8F3  4203        IN    0x03,PA2
  8F4  6D62        MPY   0x62
  8F5  4F1D        OUT   0x1D,PA7
  8F6  4C22        OUT   0x22,PA4
  8F7  6C03        LTA   0x03
  8F8  4F26        OUT   0x26,PA7
  8F9  4402        IN    0x02,PA4
  8FA  4F14        OUT   0x14,PA7
  8FB  4415        IN    0x15,PA4
  8FC  4416        IN    0x16,PA4
  8FD  4110        IN    0x10,PA1
  8FE  6D64        MPY   0x64
  8FF  6C02        LTA   0x02
  900  6D66        MPY   0x66
  901  6C04        LTA   0x04
  902  4D20        OUT   0x20,PA5
  903  4A1C        OUT   0x1C,PA2
  904  6D68        MPY   0x68
  905  7F8F        APAC
  906  4404        IN    0x04,PA4
  907  5820        SACH  0x20
  908  6020        ADDH  0x20
  909  5820        SACH  0x20
  90A  395A        LAR   AR1,0x5A
  90B  385C        LAR   AR0,0x5C
  90C  651E        ZALH  0x1E
  90D  6A80        LT    *,AR0
  90E  6D5E        MPY   0x5E
  90F  7F8F        APAC
  910  6C81        LTA   *,AR1
  911  6D60        MPY   0x60
  912  7F8F        APAC
  913  7F8F        APAC
  914  5822        SACH  0x22
  915  6A1B        LT    0x1B
  916  6D15        MPY   0x15
  917  7F8E        PAC
  918  6D16        MPY   0x16
  919  7F90        SPAC
  91A  0F16        ADD   0x16,15
  91B  5901        SACH  0x01,1
  91C  661B        ZALS  0x1B
  91D  0450        ADD   0x50,4
  91E  0F1C        ADD   0x1C,15
  91F  591C        SACH  0x1C,1
  920  7908        AND   0x08
  921  501B        SACL  0x1B
  922  661D        ZALS  0x1D
  923  6106        ADDS  0x06
  924  501D        SACL  0x1D
  925  6358        SUBS  0x58
  926  5026        SACL  0x26
  927  661C        ZALS  0x1C
  928  6352        SUBS  0x52
  929  FC00 0939   BGZ   L939
  92B  6510        ZALH  0x10
  92C  5023        SACL  0x23
  92D  7F88        ABS
  92E  5811        SACH  0x11
  92F  7F89        ZAC
  930  6211        SUBH  0x11
  931  5811        SACH  0x11
  932  661C        ZALS  0x1C
  933  1011        SUB   0x11
  934  501C        SACL  0x1C
  935  7F80        NOP
  936  7F80        NOP
  937  F900 095B   B     L95B

L939:
  939  661C        ZALS  0x1C
  93A  6354        SUBS  0x54
  93B  FA00 0947   BLZ   L947
  93D  6510        ZALH  0x10
  93E  5023        SACL  0x23
  93F  7F88        ABS
  940  5811        SACH  0x11
  941  661C        ZALS  0x1C
  942  1011        SUB   0x11
  943  501C        SACL  0x1C
  944  7F80        NOP
  945  F900 095B   B     L95B

L947:
  947  7F80        NOP
  948  7F80        NOP
  949  7F80        NOP
  94A  7F80        NOP
  94B  7F80        NOP
  94C  7F80        NOP
  94D  7F80        NOP
  94E  7F80        NOP
  94F  7F80        NOP
  950  7F80        NOP
  951  7F80        NOP
  952  7F80        NOP
  953  471E        IN    0x1E,PA7
  954  661D        ZALS  0x1D
  955  631C        SUBS  0x1C
  956  5014        SACL  0x14
  957  1011        SUB   0x11
  958  5013        SACL  0x13
  959  F900 08EC   B     L8EC

L95B:
  95B  7F80        NOP
  95C  7F80        NOP
  95D  471E        IN    0x1E,PA7
  95E  661D        ZALS  0x1D
  95F  631C        SUBS  0x1C
  960  5014        SACL  0x14
  961  1011        SUB   0x11
  962  5013        SACL  0x13
  963  F900 0895   B     L895

