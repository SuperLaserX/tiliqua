; Eventide h3500 DSP microcode
; key 7A13  algorithm 7A (mod factory|one)  DSP 4
; source H3000-Upgrade_ROM3.BIN offset 0C15F, 789 program words loaded at 800
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
  80C  5020        SACL  0x20
  80D  2B20        LAC   0x20,11
  80E  5022        SACL  0x22
  80F  2F20        LAC   0x20,15
  810  5014        SACL  0x14
  811  7F89        ZAC
  812  5001        SACL  0x01
  813  1020        SUB   0x20
  814  5821        SACH  0x21
  815  7EFF        LACK  0xFF
  816  5023        SACL  0x23
  817  2723        LAC   0x23,7
  818  7A23        OR    0x23
  819  5013        SACL  0x13
  81A  7E0D        LACK  0x0D
  81B  5012        SACL  0x12
  81C  7E11        LACK  0x11
  81D  5029        SACL  0x29
  81E  7F80        NOP
  81F  7F80        NOP
  820  7F80        NOP
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
  824  7F80        NOP
L825:
  825  F600 0829   BIOZ  L829
  827  F900 0825   B     L825

L829:
  829  4023        IN    0x23,PA0
  82A  6523        ZALH  0x23
  82B  FD00 082E   BGEZ  L82E
  82D  7F80        NOP
L82E:
  82E  F600 082E   BIOZ  L82E
  830  7F80        NOP
  831  7F80        NOP
  832  7F80        NOP
  833  7F80        NOP
  834  7F80        NOP
  835  7F80        NOP
  836  7F80        NOP
  837  7F80        NOP
  838  7F80        NOP
  839  7F80        NOP
  83A  7F80        NOP
  83B  7F80        NOP
  83C  7F80        NOP
  83D  7F80        NOP
  83E  7F80        NOP
  83F  7F80        NOP
  840  7F80        NOP
  841  7F80        NOP
  842  7F80        NOP
  843  7F80        NOP
  844  7F80        NOP
  845  7F80        NOP
  846  7F80        NOP
  847  7F80        NOP
  848  7F80        NOP
  849  7F80        NOP
  84A  7F80        NOP
  84B  7F80        NOP
  84C  7F80        NOP
  84D  7F80        NOP
  84E  7F80        NOP
  84F  7F80        NOP
  850  7F80        NOP
  851  7F80        NOP
  852  7F80        NOP
  853  7F80        NOP
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
  85F  7F80        NOP
  860  7F80        NOP
  861  7F80        NOP
  862  7F80        NOP
  863  7F80        NOP
  864  7F80        NOP
  865  7F80        NOP
  866  7F80        NOP
  867  7F80        NOP
  868  7F80        NOP
  869  7F80        NOP
  86A  7F80        NOP
  86B  7F80        NOP
  86C  7F80        NOP
  86D  7F80        NOP
  86E  7F80        NOP
  86F  7F80        NOP
  870  7F80        NOP
  871  7F80        NOP
  872  7F80        NOP
  873  7F80        NOP
  874  7F80        NOP
  875  7F80        NOP
  876  7F80        NOP
  877  7F80        NOP
  878  7F80        NOP
  879  7F80        NOP
  87A  7F80        NOP
  87B  7F80        NOP
  87C  7F80        NOP
  87D  7F80        NOP
  87E  7F80        NOP
  87F  7F89        ZAC
  880  5024        SACL  0x24
L881:
  881  F600 0885   BIOZ  L885
  883  F900 0881   B     L881

L885:
  885  4023        IN    0x23,PA0
  886  6523        ZALH  0x23
  887  FD00 088A   BGEZ  L88A
  889  7F80        NOP
L88A:
  88A  F600 088A   BIOZ  L88A
L88C:
  88C  4523        IN    0x23,PA5
  88D  6881        LARP  1
  88E  6623        ZALS  0x23
  88F  7922        AND   0x22
  890  FE00 0895   BNZ   L895
  892  6880        LARP  0
  893  F900 0897   B     L897

L895:
  895  3923        LAR   AR1,0x23
  896  4680        IN    *,PA6,AR0
L897:
  897  7F80        NOP
  898  6624        ZALS  0x24
  899  4F24        OUT   0x24,PA7
  89A  6120        ADDS  0x20
  89B  5024        SACL  0x24
  89C  4F24        OUT   0x24,PA7
  89D  6120        ADDS  0x20
  89E  5024        SACL  0x24
  89F  4F24        OUT   0x24,PA7
  8A0  6120        ADDS  0x20
  8A1  5024        SACL  0x24
  8A2  4F24        OUT   0x24,PA7
  8A3  6120        ADDS  0x20
  8A4  5024        SACL  0x24
  8A5  4F24        OUT   0x24,PA7
  8A6  6120        ADDS  0x20
  8A7  5024        SACL  0x24
  8A8  4F24        OUT   0x24,PA7
  8A9  6120        ADDS  0x20
  8AA  5024        SACL  0x24
  8AB  4F24        OUT   0x24,PA7
  8AC  6120        ADDS  0x20
  8AD  5024        SACL  0x24
  8AE  4F24        OUT   0x24,PA7
  8AF  6120        ADDS  0x20
  8B0  5024        SACL  0x24
  8B1  4F24        OUT   0x24,PA7
  8B2  6120        ADDS  0x20
  8B3  5024        SACL  0x24
  8B4  4F24        OUT   0x24,PA7
  8B5  6120        ADDS  0x20
  8B6  5024        SACL  0x24
  8B7  4F24        OUT   0x24,PA7
  8B8  6120        ADDS  0x20
  8B9  5024        SACL  0x24
  8BA  4F24        OUT   0x24,PA7
  8BB  6120        ADDS  0x20
  8BC  5024        SACL  0x24
  8BD  4F24        OUT   0x24,PA7
  8BE  6120        ADDS  0x20
  8BF  5024        SACL  0x24
  8C0  4F24        OUT   0x24,PA7
  8C1  6120        ADDS  0x20
  8C2  5024        SACL  0x24
  8C3  4F24        OUT   0x24,PA7
  8C4  6120        ADDS  0x20
  8C5  5024        SACL  0x24
  8C6  4F24        OUT   0x24,PA7
  8C7  6120        ADDS  0x20
  8C8  5024        SACL  0x24
  8C9  4F24        OUT   0x24,PA7
  8CA  6120        ADDS  0x20
  8CB  5024        SACL  0x24
  8CC  4F24        OUT   0x24,PA7
  8CD  6120        ADDS  0x20
  8CE  5024        SACL  0x24
  8CF  4F24        OUT   0x24,PA7
  8D0  6120        ADDS  0x20
  8D1  5024        SACL  0x24
  8D2  4F24        OUT   0x24,PA7
  8D3  6120        ADDS  0x20
  8D4  5024        SACL  0x24
  8D5  4F24        OUT   0x24,PA7
  8D6  6120        ADDS  0x20
  8D7  5024        SACL  0x24
  8D8  7F80        NOP
  8D9  7F80        NOP
  8DA  7F80        NOP
  8DB  7F80        NOP
  8DC  7F80        NOP
  8DD  2024        LAC   0x24
  8DE  FD00 088C   BGEZ  L88C
  8E0  7F80        NOP
  8E1  7F80        NOP
  8E2  7F89        ZAC
  8E3  5024        SACL  0x24
L8E4:
  8E4  F600 08E8   BIOZ  L8E8
  8E6  F900 08E4   B     L8E4

L8E8:
  8E8  4023        IN    0x23,PA0
  8E9  6523        ZALH  0x23
  8EA  FD00 08ED   BGEZ  L8ED
  8EC  7F80        NOP
L8ED:
  8ED  F600 08ED   BIOZ  L8ED
L8EF:
  8EF  4523        IN    0x23,PA5
  8F0  6881        LARP  1
  8F1  6623        ZALS  0x23
  8F2  7922        AND   0x22
  8F3  FE00 08F8   BNZ   L8F8
  8F5  6880        LARP  0
  8F6  F900 08FA   B     L8FA

L8F8:
  8F8  3923        LAR   AR1,0x23
  8F9  4680        IN    *,PA6,AR0
L8FA:
  8FA  7F80        NOP
  8FB  6624        ZALS  0x24
  8FC  4F24        OUT   0x24,PA7
  8FD  6120        ADDS  0x20
  8FE  5024        SACL  0x24
  8FF  4F24        OUT   0x24,PA7
  900  6120        ADDS  0x20
  901  5024        SACL  0x24
  902  4F24        OUT   0x24,PA7
  903  6120        ADDS  0x20
  904  5024        SACL  0x24
  905  4F24        OUT   0x24,PA7
  906  6120        ADDS  0x20
  907  5024        SACL  0x24
  908  4F24        OUT   0x24,PA7
  909  6120        ADDS  0x20
  90A  5024        SACL  0x24
  90B  4F24        OUT   0x24,PA7
  90C  6120        ADDS  0x20
  90D  5024        SACL  0x24
  90E  4F24        OUT   0x24,PA7
  90F  6120        ADDS  0x20
  910  5024        SACL  0x24
  911  4F24        OUT   0x24,PA7
  912  6120        ADDS  0x20
  913  5024        SACL  0x24
  914  4F24        OUT   0x24,PA7
  915  6120        ADDS  0x20
  916  5024        SACL  0x24
  917  4F24        OUT   0x24,PA7
  918  6120        ADDS  0x20
  919  5024        SACL  0x24
  91A  4F24        OUT   0x24,PA7
  91B  6120        ADDS  0x20
  91C  5024        SACL  0x24
  91D  4F24        OUT   0x24,PA7
  91E  6120        ADDS  0x20
  91F  5024        SACL  0x24
  920  4F24        OUT   0x24,PA7
  921  6120        ADDS  0x20
  922  5024        SACL  0x24
  923  4F24        OUT   0x24,PA7
  924  6120        ADDS  0x20
  925  5024        SACL  0x24
  926  4F24        OUT   0x24,PA7
  927  6120        ADDS  0x20
  928  5024        SACL  0x24
  929  4F24        OUT   0x24,PA7
  92A  6120        ADDS  0x20
  92B  5024        SACL  0x24
  92C  4F24        OUT   0x24,PA7
  92D  6120        ADDS  0x20
  92E  5024        SACL  0x24
  92F  4F24        OUT   0x24,PA7
  930  6120        ADDS  0x20
  931  5024        SACL  0x24
  932  4F24        OUT   0x24,PA7
  933  6120        ADDS  0x20
  934  5024        SACL  0x24
  935  4F24        OUT   0x24,PA7
  936  6120        ADDS  0x20
  937  5024        SACL  0x24
  938  4F24        OUT   0x24,PA7
  939  6120        ADDS  0x20
  93A  5024        SACL  0x24
  93B  7F80        NOP
  93C  7F80        NOP
  93D  7F80        NOP
  93E  7F80        NOP
  93F  7F80        NOP
  940  2024        LAC   0x24
  941  FD00 08EF   BGEZ  L8EF
  943  7F80        NOP
  944  7F80        NOP
  945  7F80        NOP
  946  7F80        NOP
  947  7F89        ZAC
  948  5024        SACL  0x24
L949:
  949  F600 094D   BIOZ  L94D
  94B  F900 0949   B     L949

L94D:
  94D  4023        IN    0x23,PA0
  94E  6523        ZALH  0x23
  94F  FD00 0952   BGEZ  L952
  951  7F80        NOP
L952:
  952  F600 0952   BIOZ  L952
L954:
  954  4523        IN    0x23,PA5
  955  6881        LARP  1
  956  6623        ZALS  0x23
  957  7922        AND   0x22
  958  FE00 095D   BNZ   L95D
  95A  6880        LARP  0
  95B  F900 095F   B     L95F

L95D:
  95D  3923        LAR   AR1,0x23
  95E  4680        IN    *,PA6,AR0
L95F:
  95F  7F80        NOP
  960  6624        ZALS  0x24
  961  4F24        OUT   0x24,PA7
  962  6120        ADDS  0x20
  963  5024        SACL  0x24
  964  4F24        OUT   0x24,PA7
  965  6120        ADDS  0x20
  966  5024        SACL  0x24
  967  4F24        OUT   0x24,PA7
  968  6120        ADDS  0x20
  969  5024        SACL  0x24
  96A  4F24        OUT   0x24,PA7
  96B  6120        ADDS  0x20
  96C  5024        SACL  0x24
  96D  4F24        OUT   0x24,PA7
  96E  6120        ADDS  0x20
  96F  5024        SACL  0x24
  970  4F24        OUT   0x24,PA7
  971  6120        ADDS  0x20
  972  5024        SACL  0x24
  973  4F24        OUT   0x24,PA7
  974  6120        ADDS  0x20
  975  5024        SACL  0x24
  976  4F24        OUT   0x24,PA7
  977  6120        ADDS  0x20
  978  5024        SACL  0x24
  979  4F24        OUT   0x24,PA7
  97A  6120        ADDS  0x20
  97B  5024        SACL  0x24
  97C  4F24        OUT   0x24,PA7
  97D  6120        ADDS  0x20
  97E  5024        SACL  0x24
  97F  4F24        OUT   0x24,PA7
  980  6120        ADDS  0x20
  981  5024        SACL  0x24
  982  4F24        OUT   0x24,PA7
  983  6120        ADDS  0x20
  984  5024        SACL  0x24
  985  4F24        OUT   0x24,PA7
  986  6120        ADDS  0x20
  987  5024        SACL  0x24
  988  4F24        OUT   0x24,PA7
  989  6120        ADDS  0x20
  98A  5024        SACL  0x24
  98B  4F24        OUT   0x24,PA7
  98C  6120        ADDS  0x20
  98D  5024        SACL  0x24
  98E  4F24        OUT   0x24,PA7
  98F  6120        ADDS  0x20
  990  5024        SACL  0x24
  991  4F24        OUT   0x24,PA7
  992  6120        ADDS  0x20
  993  5024        SACL  0x24
  994  4F24        OUT   0x24,PA7
  995  6120        ADDS  0x20
  996  5024        SACL  0x24
  997  4F24        OUT   0x24,PA7
  998  6120        ADDS  0x20
  999  5024        SACL  0x24
  99A  4F24        OUT   0x24,PA7
  99B  6120        ADDS  0x20
  99C  5024        SACL  0x24
  99D  4F24        OUT   0x24,PA7
  99E  6120        ADDS  0x20
  99F  5024        SACL  0x24
  9A0  7F80        NOP
  9A1  7F80        NOP
  9A2  7F80        NOP
  9A3  7F80        NOP
  9A4  7F80        NOP
  9A5  2024        LAC   0x24
  9A6  FD00 0954   BGEZ  L954
  9A8  7F80        NOP
  9A9  7F80        NOP
L9AA:
  9AA  F600 09AE   BIOZ  L9AE
  9AC  F900 09AA   B     L9AA

L9AE:
  9AE  4023        IN    0x23,PA0
  9AF  6523        ZALH  0x23
  9B0  FD00 09B3   BGEZ  L9B3
  9B2  7F80        NOP
L9B3:
  9B3  F600 09B3   BIOZ  L9B3
L9B5:
  9B5  4523        IN    0x23,PA5
  9B6  3923        LAR   AR1,0x23
  9B7  4681        IN    *,PA6,AR1
  9B8  4703        IN    0x03,PA7
  9B9  392E        LAR   AR1,0x2E
  9BA  6A88        LT    *
  9BB  6D4C        MPY   0x4C
  9BC  7F8E        PAC
  9BD  392F        LAR   AR1,0x2F
  9BE  6C88        LTA   *
  9BF  6D4D        MPY   0x4D
  9C0  7F8F        APAC
  9C1  3930        LAR   AR1,0x30
  9C2  6C88        LTA   *
  9C3  5804        SACH  0x04
  9C4  6D4E        MPY   0x4E
  9C5  7F8E        PAC
  9C6  3931        LAR   AR1,0x31
  9C7  6C88        LTA   *
  9C8  6D4F        MPY   0x4F
  9C9  7F8F        APAC
  9CA  3932        LAR   AR1,0x32
  9CB  6C88        LTA   *
  9CC  5805        SACH  0x05
  9CD  6D50        MPY   0x50
  9CE  7F8E        PAC
  9CF  3933        LAR   AR1,0x33
  9D0  6C88        LTA   *
  9D1  6D51        MPY   0x51
  9D2  7F8F        APAC
  9D3  3934        LAR   AR1,0x34
  9D4  6C88        LTA   *
  9D5  5806        SACH  0x06
  9D6  6D52        MPY   0x52
  9D7  7F8E        PAC
  9D8  3935        LAR   AR1,0x35
  9D9  6C88        LTA   *
  9DA  6D53        MPY   0x53
  9DB  7F8F        APAC
  9DC  6C27        LTA   0x27
  9DD  5807        SACH  0x07
  9DE  3936        LAR   AR1,0x36
  9DF  6D88        MPY   *
  9E0  7F8E        PAC
  9E1  7F8F        APAC
  9E2  7F8F        APAC
  9E3  6C28        LTA   0x28
  9E4  5808        SACH  0x08
  9E5  3938        LAR   AR1,0x38
  9E6  6D88        MPY   *
  9E7  7F8E        PAC
  9E8  7F8F        APAC
  9E9  7F8F        APAC
  9EA  7F8F        APAC
  9EB  5809        SACH  0x09
  9EC  6556        ZALH  0x56
  9ED  7F80        NOP
  9EE  392C        LAR   AR1,0x2C
  9EF  382D        LAR   AR0,0x2D
  9F0  4D80        OUT   *,PA5,AR0
  9F1  4E81        OUT   *,PA6,AR1
  9F2  6A54        LT    0x54
  9F3  4702        IN    0x02,PA7
  9F4  410A        IN    0x0A,PA1
  9F5  410B        IN    0x0B,PA1
  9F6  410E        IN    0x0E,PA1
  9F7  410C        IN    0x0C,PA1
  9F8  410D        IN    0x0D,PA1
  9F9  4111        IN    0x11,PA1
  9FA  393A        LAR   AR1,0x3A
  9FB  4988        OUT   *,PA1
  9FC  393D        LAR   AR1,0x3D
  9FD  4988        OUT   *,PA1
  9FE  393E        LAR   AR1,0x3E
  9FF  4988        OUT   *,PA1
  A00  3940        LAR   AR1,0x40
  A01  4988        OUT   *,PA1
  A02  3942        LAR   AR1,0x42
  A03  4988        OUT   *,PA1
  A04  3941        LAR   AR1,0x41
  A05  4988        OUT   *,PA1
  A06  3937        LAR   AR1,0x37
  A07  6D88        MPY   *
  A08  7F8F        APAC
  A09  3946        LAR   AR1,0x46
  A0A  6C88        LTA   *
  A0B  5827        SACH  0x27
  A0C  718A        LARK  AR1,0x8A
  A0D  6D88        MPY   *
  A0E  7F8E        PAC
  A0F  5915        SACH  0x15,1
  A10  4703        IN    0x03,PA7
  A11  6A4C        LT    0x4C
  A12  392E        LAR   AR1,0x2E
  A13  6D88        MPY   *
  A14  7F8E        PAC
  A15  6C4D        LTA   0x4D
  A16  392F        LAR   AR1,0x2F
  A17  6D88        MPY   *
  A18  7F8F        APAC
  A19  3930        LAR   AR1,0x30
  A1A  6C88        LTA   *
  A1B  5804        SACH  0x04
  A1C  6D4E        MPY   0x4E
  A1D  7F8E        PAC
  A1E  3931        LAR   AR1,0x31
  A1F  6C88        LTA   *
  A20  6D4F        MPY   0x4F
  A21  7F8F        APAC
  A22  3932        LAR   AR1,0x32
  A23  6C88        LTA   *
  A24  5805        SACH  0x05
  A25  6D50        MPY   0x50
  A26  7F8E        PAC
  A27  3933        LAR   AR1,0x33
  A28  6C88        LTA   *
  A29  6D51        MPY   0x51
  A2A  7F8F        APAC
  A2B  3934        LAR   AR1,0x34
  A2C  6C88        LTA   *
  A2D  5806        SACH  0x06
  A2E  6D52        MPY   0x52
  A2F  7F8E        PAC
  A30  3935        LAR   AR1,0x35
  A31  6C88        LTA   *
  A32  6D53        MPY   0x53
  A33  7F8F        APAC
  A34  6C27        LTA   0x27
  A35  5807        SACH  0x07
  A36  3936        LAR   AR1,0x36
  A37  6D88        MPY   *
  A38  7F8E        PAC
  A39  7F8F        APAC
  A3A  7F8F        APAC
  A3B  6C28        LTA   0x28
  A3C  5808        SACH  0x08
  A3D  3938        LAR   AR1,0x38
  A3E  6D88        MPY   *
  A3F  7F8E        PAC
  A40  7F8F        APAC
  A41  7F8F        APAC
  A42  7F8F        APAC
  A43  5809        SACH  0x09
  A44  3939        LAR   AR1,0x39
  A45  6A88        LT    *
  A46  392C        LAR   AR1,0x2C
  A47  382D        LAR   AR0,0x2D
  A48  4D80        OUT   *,PA5,AR0
  A49  4E81        OUT   *,PA6,AR1
  A4A  6557        ZALH  0x57
  A4B  4702        IN    0x02,PA7
  A4C  410A        IN    0x0A,PA1
  A4D  410B        IN    0x0B,PA1
  A4E  410F        IN    0x0F,PA1
  A4F  410C        IN    0x0C,PA1
  A50  410D        IN    0x0D,PA1
  A51  4110        IN    0x10,PA1
  A52  393A        LAR   AR1,0x3A
  A53  4988        OUT   *,PA1
  A54  393D        LAR   AR1,0x3D
  A55  4988        OUT   *,PA1
  A56  3944        LAR   AR1,0x44
  A57  4988        OUT   *,PA1
  A58  3940        LAR   AR1,0x40
  A59  4988        OUT   *,PA1
  A5A  3942        LAR   AR1,0x42
  A5B  4988        OUT   *,PA1
  A5C  3941        LAR   AR1,0x41
  A5D  4988        OUT   *,PA1
  A5E  6D55        MPY   0x55
  A5F  7F8F        APAC
  A60  7F8F        APAC
  A61  5828        SACH  0x28
  A62  3947        LAR   AR1,0x47
  A63  6A88        LT    *
  A64  718B        LARK  AR1,0x8B
  A65  6D88        MPY   *
  A66  7F8E        PAC
  A67  5916        SACH  0x16,1
  A68  4703        IN    0x03,PA7
  A69  392E        LAR   AR1,0x2E
  A6A  6A88        LT    *
  A6B  6D4C        MPY   0x4C
  A6C  7F8E        PAC
  A6D  392F        LAR   AR1,0x2F
  A6E  6C88        LTA   *
  A6F  6D4D        MPY   0x4D
  A70  7F8F        APAC
  A71  3930        LAR   AR1,0x30
  A72  6C88        LTA   *
  A73  5804        SACH  0x04
  A74  6D4E        MPY   0x4E
  A75  7F8E        PAC
  A76  3931        LAR   AR1,0x31
  A77  6C88        LTA   *
  A78  6D4F        MPY   0x4F
  A79  7F8F        APAC
  A7A  3932        LAR   AR1,0x32
  A7B  6C88        LTA   *
  A7C  5805        SACH  0x05
  A7D  6D50        MPY   0x50
  A7E  7F8E        PAC
  A7F  3933        LAR   AR1,0x33
  A80  6C88        LTA   *
  A81  6D51        MPY   0x51
  A82  7F8F        APAC
  A83  3934        LAR   AR1,0x34
  A84  6C88        LTA   *
  A85  5806        SACH  0x06
  A86  6D52        MPY   0x52
  A87  7F8E        PAC
  A88  3935        LAR   AR1,0x35
  A89  6C88        LTA   *
  A8A  6D53        MPY   0x53
  A8B  7F8F        APAC
  A8C  6C27        LTA   0x27
  A8D  5807        SACH  0x07
  A8E  3936        LAR   AR1,0x36
  A8F  6D88        MPY   *
  A90  7F8E        PAC
  A91  7F8F        APAC
  A92  7F8F        APAC
  A93  6C28        LTA   0x28
  A94  5808        SACH  0x08
  A95  3938        LAR   AR1,0x38
  A96  6D88        MPY   *
  A97  7F8E        PAC
  A98  7F8F        APAC
  A99  7F8F        APAC
  A9A  7F8F        APAC
  A9B  5809        SACH  0x09
  A9C  7F80        NOP
  A9D  7F80        NOP
  A9E  392C        LAR   AR1,0x2C
  A9F  382D        LAR   AR0,0x2D
  AA0  4D80        OUT   *,PA5,AR0
  AA1  4E81        OUT   *,PA6,AR1
  AA2  7F80        NOP
  AA3  4702        IN    0x02,PA7
  AA4  410A        IN    0x0A,PA1
  AA5  410B        IN    0x0B,PA1
  AA6  4123        IN    0x23,PA1
  AA7  410C        IN    0x0C,PA1
  AA8  410D        IN    0x0D,PA1
  AA9  7F80        NOP
  AAA  7F80        NOP
  AAB  393A        LAR   AR1,0x3A
  AAC  4988        OUT   *,PA1
  AAD  393D        LAR   AR1,0x3D
  AAE  4988        OUT   *,PA1
  AAF  393C        LAR   AR1,0x3C
  AB0  4988        OUT   *,PA1
  AB1  3940        LAR   AR1,0x40
  AB2  4988        OUT   *,PA1
  AB3  3942        LAR   AR1,0x42
  AB4  4988        OUT   *,PA1
  AB5  3945        LAR   AR1,0x45
  AB6  4988        OUT   *,PA1
  AB7  7F80        NOP
  AB8  7F80        NOP
  AB9  7F80        NOP
  ABA  7F80        NOP
  ABB  7F80        NOP
  ABC  6612        ZALS  0x12
  ABD  0029        ADD   0x29
  ABE  5029        SACL  0x29
  ABF  0012        ADD   0x12
  AC0  5012        SACL  0x12
  AC1  4703        IN    0x03,PA7
  AC2  392E        LAR   AR1,0x2E
  AC3  6A88        LT    *
  AC4  6D4C        MPY   0x4C
  AC5  7F8E        PAC
  AC6  392F        LAR   AR1,0x2F
  AC7  6C88        LTA   *
  AC8  6D4D        MPY   0x4D
  AC9  7F8F        APAC
  ACA  3930        LAR   AR1,0x30
  ACB  6C88        LTA   *
  ACC  5804        SACH  0x04
  ACD  6D4E        MPY   0x4E
  ACE  7F8E        PAC
  ACF  3931        LAR   AR1,0x31
  AD0  6C88        LTA   *
  AD1  6D4F        MPY   0x4F
  AD2  7F8F        APAC
  AD3  3932        LAR   AR1,0x32
  AD4  6C88        LTA   *
  AD5  5805        SACH  0x05
  AD6  6D50        MPY   0x50
  AD7  7F8E        PAC
  AD8  3933        LAR   AR1,0x33
  AD9  6C88        LTA   *
  ADA  6D51        MPY   0x51
  ADB  7F8F        APAC
  ADC  3934        LAR   AR1,0x34
  ADD  6C88        LTA   *
  ADE  5806        SACH  0x06
  ADF  6D52        MPY   0x52
  AE0  7F8E        PAC
  AE1  3935        LAR   AR1,0x35
  AE2  6C88        LTA   *
  AE3  6D53        MPY   0x53
  AE4  7F8F        APAC
  AE5  6C27        LTA   0x27
  AE6  5807        SACH  0x07
  AE7  3936        LAR   AR1,0x36
  AE8  6D88        MPY   *
  AE9  7F8E        PAC
  AEA  7F8F        APAC
  AEB  7F8F        APAC
  AEC  6C28        LTA   0x28
  AED  5808        SACH  0x08
  AEE  3938        LAR   AR1,0x38
  AEF  6D88        MPY   *
  AF0  7F8E        PAC
  AF1  7F8F        APAC
  AF2  7F8F        APAC
  AF3  7F8F        APAC
  AF4  5809        SACH  0x09
  AF5  7F80        NOP
  AF6  7F89        ZAC
  AF7  392C        LAR   AR1,0x2C
  AF8  382D        LAR   AR0,0x2D
  AF9  4D80        OUT   *,PA5,AR0
  AFA  4E81        OUT   *,PA6,AR1
  AFB  7F80        NOP
  AFC  4702        IN    0x02,PA7
  AFD  410A        IN    0x0A,PA1
  AFE  410B        IN    0x0B,PA1
  AFF  4123        IN    0x23,PA1
  B00  410C        IN    0x0C,PA1
  B01  410D        IN    0x0D,PA1
  B02  7F80        NOP
  B03  7F80        NOP
  B04  393A        LAR   AR1,0x3A
  B05  4988        OUT   *,PA1
  B06  393D        LAR   AR1,0x3D
  B07  4988        OUT   *,PA1
  B08  393B        LAR   AR1,0x3B
  B09  4988        OUT   *,PA1
  B0A  3940        LAR   AR1,0x40
  B0B  4988        OUT   *,PA1
  B0C  3942        LAR   AR1,0x42
  B0D  4988        OUT   *,PA1
  B0E  393F        LAR   AR1,0x3F
  B0F  4988        OUT   *,PA1
  B10  7F80        NOP
  B11  7F80        NOP
  B12  7F80        NOP
  B13  F900 09B5   B     L9B5

