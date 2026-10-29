; Eventide h3500 DSP microcode
; key 7411  algorithm 74 (MULTI-SHIFT)  DSP 2
; source H3000-Upgrade_ROM4.BIN offset 07280, 354 program words loaded at 800
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
  80D  2906        LAC   0x06,9
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
  81B  5053        SACL  0x53
  81C  2353        LAC   0x53,3
  81D  7E64        LACK  0x64
  81E  5011        SACL  0x11
  81F  5010        SACL  0x10
  820  6881        LARP  1
  821  710F        LARK  AR1,0x0F
  822  7C88        SST   *
  823  6608        ZALS  0x08
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
  83D  6106        ADDS  0x06
  83E  500C        SACL  0x0C
  83F  4F0C        OUT   0x0C,PA7
  840  6106        ADDS  0x06
  841  500C        SACL  0x0C
  842  4F0C        OUT   0x0C,PA7
  843  6106        ADDS  0x06
  844  500C        SACL  0x0C
  845  4F0C        OUT   0x0C,PA7
  846  6106        ADDS  0x06
  847  500C        SACL  0x0C
  848  4F0C        OUT   0x0C,PA7
  849  6106        ADDS  0x06
  84A  500C        SACL  0x0C
  84B  4F0C        OUT   0x0C,PA7
  84C  6106        ADDS  0x06
  84D  500C        SACL  0x0C
  84E  4F0C        OUT   0x0C,PA7
  84F  6106        ADDS  0x06
  850  500C        SACL  0x0C
  851  4F0C        OUT   0x0C,PA7
  852  6106        ADDS  0x06
  853  500C        SACL  0x0C
  854  4F0C        OUT   0x0C,PA7
  855  6106        ADDS  0x06
  856  500C        SACL  0x0C
  857  4F0C        OUT   0x0C,PA7
  858  6106        ADDS  0x06
  859  500C        SACL  0x0C
  85A  4F0C        OUT   0x0C,PA7
  85B  6106        ADDS  0x06
  85C  500C        SACL  0x0C
  85D  4F0C        OUT   0x0C,PA7
  85E  6106        ADDS  0x06
  85F  500C        SACL  0x0C
  860  4F0C        OUT   0x0C,PA7
  861  6106        ADDS  0x06
  862  500C        SACL  0x0C
  863  4F0C        OUT   0x0C,PA7
  864  6106        ADDS  0x06
  865  500C        SACL  0x0C
  866  4F0C        OUT   0x0C,PA7
  867  6106        ADDS  0x06
  868  500C        SACL  0x0C
  869  4F0C        OUT   0x0C,PA7
  86A  6106        ADDS  0x06
  86B  500C        SACL  0x0C
  86C  4F0C        OUT   0x0C,PA7
  86D  6106        ADDS  0x06
  86E  500C        SACL  0x0C
  86F  4F0C        OUT   0x0C,PA7
  870  6106        ADDS  0x06
  871  500C        SACL  0x0C
  872  4F0C        OUT   0x0C,PA7
  873  6106        ADDS  0x06
  874  500C        SACL  0x0C
  875  4F0C        OUT   0x0C,PA7
  876  6106        ADDS  0x06
  877  500C        SACL  0x0C
  878  4F0C        OUT   0x0C,PA7
  879  6106        ADDS  0x06
  87A  500C        SACL  0x0C
  87B  4F0C        OUT   0x0C,PA7
  87C  7F80        NOP
  87D  7F80        NOP
  87E  7F80        NOP
  87F  7F80        NOP
  880  7F80        NOP
  881  200C        LAC   0x0C
  882  FA00 0830   BLZ   L830
  884  6649        ZALS  0x49
  885  5011        SACL  0x11
  886  5010        SACL  0x10
  887  6655        ZALS  0x55
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
  898  7F89        ZAC
  899  421D        IN    0x1D,PA2
  89A  4201        IN    0x01,PA2
  89B  4A03        OUT   0x03,PA2
  89C  6A01        LT    0x01
  89D  471F        IN    0x1F,PA7
  89E  4E21        OUT   0x21,PA6
  89F  4A1C        OUT   0x1C,PA2
  8A0  6D63        MPY   0x63
  8A1  6C03        LTA   0x03
  8A2  4402        IN    0x02,PA4
  8A3  6D65        MPY   0x65
  8A4  6C02        LTA   0x02
  8A5  6D67        MPY   0x67
  8A6  6C04        LTA   0x04
  8A7  6D69        MPY   0x69
  8A8  7F8F        APAC
  8A9  5821        SACH  0x21
  8AA  6021        ADDH  0x21
  8AB  5821        SACH  0x21
  8AC  395B        LAR   AR1,0x5B
  8AD  385D        LAR   AR0,0x5D
  8AE  4F12        OUT   0x12,PA7
  8AF  4C22        OUT   0x22,PA4
  8B0  651F        ZALH  0x1F
  8B1  4F26        OUT   0x26,PA7
  8B2  4404        IN    0x04,PA4
  8B3  4F14        OUT   0x14,PA7
  8B4  4415        IN    0x15,PA4
  8B5  4416        IN    0x16,PA4
  8B6  4F13        OUT   0x13,PA7
  8B7  4418        IN    0x18,PA4
  8B8  4419        IN    0x19,PA4
  8B9  6A80        LT    *,AR0
  8BA  6D5F        MPY   0x5F
  8BB  7F8F        APAC
  8BC  6C81        LTA   *,AR1
  8BD  6D61        MPY   0x61
  8BE  7F8F        APAC
  8BF  6C1B        LTA   0x1B
  8C0  5822        SACH  0x22
  8C1  2F16        LAC   0x16,15
  8C2  6D16        MPY   0x16
  8C3  7F90        SPAC
  8C4  6D15        MPY   0x15
  8C5  7F8F        APAC
  8C6  5917        SACH  0x17,1
  8C7  2F19        LAC   0x19,15
  8C8  6D19        MPY   0x19
  8C9  7F90        SPAC
  8CA  6D18        MPY   0x18
  8CB  6C23        LTA   0x23
  8CC  591A        SACH  0x1A,1
  8CD  6D1A        MPY   0x1A
  8CE  7F90        SPAC
  8CF  6D17        MPY   0x17
  8D0  7F8F        APAC
  8D1  5903        SACH  0x03,1
  8D2  661D        ZALS  0x1D
  8D3  6109        ADDS  0x09
  8D4  5012        SACL  0x12
  8D5  6359        SUBS  0x59
  8D6  5026        SACL  0x26
  8D7  661B        ZALS  0x1B
  8D8  0451        ADD   0x51,4
  8D9  0F1C        ADD   0x1C,15
  8DA  591C        SACH  0x1C,1
  8DB  7908        AND   0x08
  8DC  501B        SACL  0x1B
  8DD  6612        ZALS  0x12
  8DE  631C        SUBS  0x1C
  8DF  5014        SACL  0x14
  8E0  1011        SUB   0x11
  8E1  5013        SACL  0x13
  8E2  7B0F        LST   0x0F
  8E3  6523        ZALH  0x23
  8E4  6057        ADDH  0x57
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
  8EF  7F89        ZAC
  8F0  421D        IN    0x1D,PA2
  8F1  4201        IN    0x01,PA2
  8F2  4A03        OUT   0x03,PA2
  8F3  6A01        LT    0x01
  8F4  471F        IN    0x1F,PA7
  8F5  4E21        OUT   0x21,PA6
  8F6  4A1C        OUT   0x1C,PA2
  8F7  6D63        MPY   0x63
  8F8  6C03        LTA   0x03
  8F9  4402        IN    0x02,PA4
  8FA  6D65        MPY   0x65
  8FB  6C02        LTA   0x02
  8FC  6D67        MPY   0x67
  8FD  6C04        LTA   0x04
  8FE  6D69        MPY   0x69
  8FF  7F8F        APAC
  900  5821        SACH  0x21
  901  6021        ADDH  0x21
  902  5821        SACH  0x21
  903  395B        LAR   AR1,0x5B
  904  385D        LAR   AR0,0x5D
  905  4F12        OUT   0x12,PA7
  906  4C22        OUT   0x22,PA4
  907  7F80        NOP
  908  4F26        OUT   0x26,PA7
  909  4404        IN    0x04,PA4
  90A  4F14        OUT   0x14,PA7
  90B  4415        IN    0x15,PA4
  90C  4416        IN    0x16,PA4
  90D  4310        IN    0x10,PA3
  90E  7F80        NOP
  90F  651F        ZALH  0x1F
  910  6A80        LT    *,AR0
  911  6D5F        MPY   0x5F
  912  7F8F        APAC
  913  6C81        LTA   *,AR1
  914  6D61        MPY   0x61
  915  7F8F        APAC
  916  7F8F        APAC
  917  5822        SACH  0x22
  918  6A1B        LT    0x1B
  919  6D15        MPY   0x15
  91A  7F8E        PAC
  91B  6D16        MPY   0x16
  91C  7F90        SPAC
  91D  0F16        ADD   0x16,15
  91E  5903        SACH  0x03,1
  91F  661B        ZALS  0x1B
  920  0451        ADD   0x51,4
  921  0F1C        ADD   0x1C,15
  922  591C        SACH  0x1C,1
  923  7908        AND   0x08
  924  501B        SACL  0x1B
  925  661D        ZALS  0x1D
  926  6109        ADDS  0x09
  927  5012        SACL  0x12
  928  6359        SUBS  0x59
  929  5026        SACL  0x26
  92A  661C        ZALS  0x1C
  92B  6353        SUBS  0x53
  92C  FC00 093C   BGZ   L93C
  92E  6510        ZALH  0x10
  92F  5023        SACL  0x23
  930  7F88        ABS
  931  5811        SACH  0x11
  932  7F89        ZAC
  933  6211        SUBH  0x11
  934  5811        SACH  0x11
  935  661C        ZALS  0x1C
  936  1011        SUB   0x11
  937  501C        SACL  0x1C
  938  7F80        NOP
  939  7F80        NOP
  93A  F900 095B   B     L95B

L93C:
  93C  661C        ZALS  0x1C
  93D  6355        SUBS  0x55
  93E  FA00 094A   BLZ   L94A
  940  6510        ZALH  0x10
  941  5023        SACL  0x23
  942  7F88        ABS
  943  5811        SACH  0x11
  944  661C        ZALS  0x1C
  945  1011        SUB   0x11
  946  501C        SACL  0x1C
  947  7F80        NOP
  948  F900 095B   B     L95B

L94A:
  94A  7F80        NOP
  94B  7F80        NOP
  94C  7F80        NOP
  94D  7F80        NOP
  94E  7F80        NOP
  94F  7F80        NOP
  950  7F80        NOP
  951  7F80        NOP
  952  7F80        NOP
  953  7F80        NOP
  954  6612        ZALS  0x12
  955  631C        SUBS  0x1C
  956  5014        SACL  0x14
  957  1011        SUB   0x11
  958  5013        SACL  0x13
  959  F900 08EC   B     L8EC

L95B:
  95B  6612        ZALS  0x12
  95C  631C        SUBS  0x1C
  95D  5014        SACL  0x14
  95E  1011        SUB   0x11
  95F  5013        SACL  0x13
  960  F900 0895   B     L895

