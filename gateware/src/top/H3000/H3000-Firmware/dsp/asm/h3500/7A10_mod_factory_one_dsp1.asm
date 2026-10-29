; Eventide h3500 DSP microcode
; key 7A10  algorithm 7A (mod factory|one)  DSP 1
; source H3000-Upgrade_ROM3.BIN offset 0415C, 684 program words loaded at 800
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
  80D  2820        LAC   0x20,8
  80E  5022        SACL  0x22
  80F  2F20        LAC   0x20,15
  810  5018        SACL  0x18
  811  7F89        ZAC
  812  5001        SACL  0x01
  813  1020        SUB   0x20
  814  5821        SACH  0x21
  815  7EFF        LACK  0xFF
  816  5023        SACL  0x23
  817  2723        LAC   0x23,7
  818  7A23        OR    0x23
  819  5017        SACL  0x17
  81A  7E0D        LACK  0x0D
  81B  5016        SACL  0x16
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
L943:
  943  F600 0947   BIOZ  L947
  945  F900 0943   B     L943

L947:
  947  4023        IN    0x23,PA0
  948  6523        ZALH  0x23
  949  FD00 094C   BGEZ  L94C
  94B  7F80        NOP
L94C:
  94C  F600 094C   BIOZ  L94C
L94E:
  94E  4523        IN    0x23,PA5
  94F  3923        LAR   AR1,0x23
  950  4681        IN    *,PA6,AR1
  951  4703        IN    0x03,PA7
  952  3932        LAR   AR1,0x32
  953  6A88        LT    *
  954  6D50        MPY   0x50
  955  7F8E        PAC
  956  3933        LAR   AR1,0x33
  957  6C88        LTA   *
  958  6D51        MPY   0x51
  959  7F8F        APAC
  95A  3934        LAR   AR1,0x34
  95B  6C88        LTA   *
  95C  5804        SACH  0x04
  95D  6D52        MPY   0x52
  95E  7F8E        PAC
  95F  3935        LAR   AR1,0x35
  960  6C88        LTA   *
  961  6D53        MPY   0x53
  962  7F8F        APAC
  963  3936        LAR   AR1,0x36
  964  6C88        LTA   *
  965  5805        SACH  0x05
  966  6D54        MPY   0x54
  967  7F8E        PAC
  968  3937        LAR   AR1,0x37
  969  6C88        LTA   *
  96A  6D55        MPY   0x55
  96B  7F8F        APAC
  96C  3938        LAR   AR1,0x38
  96D  6C88        LTA   *
  96E  5806        SACH  0x06
  96F  6D56        MPY   0x56
  970  7F8E        PAC
  971  3939        LAR   AR1,0x39
  972  6C88        LTA   *
  973  6D57        MPY   0x57
  974  7F8F        APAC
  975  6C27        LTA   0x27
  976  5807        SACH  0x07
  977  393A        LAR   AR1,0x3A
  978  6D88        MPY   *
  979  7F8E        PAC
  97A  7F8F        APAC
  97B  7F8F        APAC
  97C  6C28        LTA   0x28
  97D  5808        SACH  0x08
  97E  393C        LAR   AR1,0x3C
  97F  6D88        MPY   *
  980  7F8E        PAC
  981  7F8F        APAC
  982  7F8F        APAC
  983  7F8F        APAC
  984  5809        SACH  0x09
  985  655A        ZALH  0x5A
  986  7F80        NOP
  987  3930        LAR   AR1,0x30
  988  3831        LAR   AR0,0x31
  989  4D80        OUT   *,PA5,AR0
  98A  4E81        OUT   *,PA6,AR1
  98B  6A58        LT    0x58
  98C  4702        IN    0x02,PA7
  98D  410A        IN    0x0A,PA1
  98E  410B        IN    0x0B,PA1
  98F  410E        IN    0x0E,PA1
  990  410C        IN    0x0C,PA1
  991  410D        IN    0x0D,PA1
  992  4114        IN    0x14,PA1
  993  393E        LAR   AR1,0x3E
  994  4988        OUT   *,PA1
  995  3940        LAR   AR1,0x40
  996  4988        OUT   *,PA1
  997  3941        LAR   AR1,0x41
  998  4988        OUT   *,PA1
  999  3942        LAR   AR1,0x42
  99A  4988        OUT   *,PA1
  99B  3944        LAR   AR1,0x44
  99C  4988        OUT   *,PA1
  99D  3945        LAR   AR1,0x45
  99E  4988        OUT   *,PA1
  99F  393B        LAR   AR1,0x3B
  9A0  6D88        MPY   *
  9A1  7F8F        APAC
  9A2  394A        LAR   AR1,0x4A
  9A3  6C88        LTA   *
  9A4  5827        SACH  0x27
  9A5  7188        LARK  AR1,0x88
  9A6  6D88        MPY   *
  9A7  7F8E        PAC
  9A8  5919        SACH  0x19,1
  9A9  4703        IN    0x03,PA7
  9AA  6A50        LT    0x50
  9AB  3932        LAR   AR1,0x32
  9AC  6D88        MPY   *
  9AD  7F8E        PAC
  9AE  6C51        LTA   0x51
  9AF  3933        LAR   AR1,0x33
  9B0  6D88        MPY   *
  9B1  7F8F        APAC
  9B2  3934        LAR   AR1,0x34
  9B3  6C88        LTA   *
  9B4  5804        SACH  0x04
  9B5  6D52        MPY   0x52
  9B6  7F8E        PAC
  9B7  3935        LAR   AR1,0x35
  9B8  6C88        LTA   *
  9B9  6D53        MPY   0x53
  9BA  7F8F        APAC
  9BB  3936        LAR   AR1,0x36
  9BC  6C88        LTA   *
  9BD  5805        SACH  0x05
  9BE  6D54        MPY   0x54
  9BF  7F8E        PAC
  9C0  3937        LAR   AR1,0x37
  9C1  6C88        LTA   *
  9C2  6D55        MPY   0x55
  9C3  7F8F        APAC
  9C4  3938        LAR   AR1,0x38
  9C5  6C88        LTA   *
  9C6  5806        SACH  0x06
  9C7  6D56        MPY   0x56
  9C8  7F8E        PAC
  9C9  3939        LAR   AR1,0x39
  9CA  6C88        LTA   *
  9CB  6D57        MPY   0x57
  9CC  7F8F        APAC
  9CD  6C27        LTA   0x27
  9CE  5807        SACH  0x07
  9CF  393A        LAR   AR1,0x3A
  9D0  6D88        MPY   *
  9D1  7F8E        PAC
  9D2  7F8F        APAC
  9D3  7F8F        APAC
  9D4  6C28        LTA   0x28
  9D5  5808        SACH  0x08
  9D6  393C        LAR   AR1,0x3C
  9D7  6D88        MPY   *
  9D8  7F8E        PAC
  9D9  7F8F        APAC
  9DA  7F8F        APAC
  9DB  7F8F        APAC
  9DC  5809        SACH  0x09
  9DD  393D        LAR   AR1,0x3D
  9DE  6A88        LT    *
  9DF  3930        LAR   AR1,0x30
  9E0  3831        LAR   AR0,0x31
  9E1  4D80        OUT   *,PA5,AR0
  9E2  4E81        OUT   *,PA6,AR1
  9E3  655B        ZALH  0x5B
  9E4  4702        IN    0x02,PA7
  9E5  410A        IN    0x0A,PA1
  9E6  410B        IN    0x0B,PA1
  9E7  4110        IN    0x10,PA1
  9E8  410C        IN    0x0C,PA1
  9E9  410D        IN    0x0D,PA1
  9EA  4115        IN    0x15,PA1
  9EB  393E        LAR   AR1,0x3E
  9EC  4988        OUT   *,PA1
  9ED  3940        LAR   AR1,0x40
  9EE  4988        OUT   *,PA1
  9EF  3946        LAR   AR1,0x46
  9F0  4988        OUT   *,PA1
  9F1  3942        LAR   AR1,0x42
  9F2  4988        OUT   *,PA1
  9F3  3944        LAR   AR1,0x44
  9F4  4988        OUT   *,PA1
  9F5  3948        LAR   AR1,0x48
  9F6  4988        OUT   *,PA1
  9F7  6D59        MPY   0x59
  9F8  7F8F        APAC
  9F9  7F8F        APAC
  9FA  5828        SACH  0x28
  9FB  394B        LAR   AR1,0x4B
  9FC  6A88        LT    *
  9FD  7189        LARK  AR1,0x89
  9FE  6D88        MPY   *
  9FF  7F8E        PAC
  A00  591A        SACH  0x1A,1
  A01  4703        IN    0x03,PA7
  A02  3932        LAR   AR1,0x32
  A03  6A88        LT    *
  A04  6D50        MPY   0x50
  A05  7F8E        PAC
  A06  3933        LAR   AR1,0x33
  A07  6C88        LTA   *
  A08  6D51        MPY   0x51
  A09  7F8F        APAC
  A0A  3934        LAR   AR1,0x34
  A0B  6C88        LTA   *
  A0C  5804        SACH  0x04
  A0D  6D52        MPY   0x52
  A0E  7F8E        PAC
  A0F  3935        LAR   AR1,0x35
  A10  6C88        LTA   *
  A11  6D53        MPY   0x53
  A12  7F8F        APAC
  A13  3936        LAR   AR1,0x36
  A14  6C88        LTA   *
  A15  5805        SACH  0x05
  A16  6D54        MPY   0x54
  A17  7F8E        PAC
  A18  3937        LAR   AR1,0x37
  A19  6C88        LTA   *
  A1A  6D55        MPY   0x55
  A1B  7F8F        APAC
  A1C  3938        LAR   AR1,0x38
  A1D  6C88        LTA   *
  A1E  5806        SACH  0x06
  A1F  6D56        MPY   0x56
  A20  7F8E        PAC
  A21  3939        LAR   AR1,0x39
  A22  6C88        LTA   *
  A23  6D57        MPY   0x57
  A24  7F8F        APAC
  A25  6C27        LTA   0x27
  A26  5807        SACH  0x07
  A27  393A        LAR   AR1,0x3A
  A28  6D88        MPY   *
  A29  7F8E        PAC
  A2A  7F8F        APAC
  A2B  7F8F        APAC
  A2C  6C28        LTA   0x28
  A2D  5808        SACH  0x08
  A2E  393C        LAR   AR1,0x3C
  A2F  6D88        MPY   *
  A30  7F8E        PAC
  A31  7F8F        APAC
  A32  7F8F        APAC
  A33  7F8F        APAC
  A34  5809        SACH  0x09
  A35  7F80        NOP
  A36  7F80        NOP
  A37  3930        LAR   AR1,0x30
  A38  3831        LAR   AR0,0x31
  A39  4D80        OUT   *,PA5,AR0
  A3A  4E81        OUT   *,PA6,AR1
  A3B  7F80        NOP
  A3C  4702        IN    0x02,PA7
  A3D  410A        IN    0x0A,PA1
  A3E  410B        IN    0x0B,PA1
  A3F  410F        IN    0x0F,PA1
  A40  410C        IN    0x0C,PA1
  A41  410D        IN    0x0D,PA1
  A42  4112        IN    0x12,PA1
  A43  393E        LAR   AR1,0x3E
  A44  4988        OUT   *,PA1
  A45  3940        LAR   AR1,0x40
  A46  4988        OUT   *,PA1
  A47  3947        LAR   AR1,0x47
  A48  4988        OUT   *,PA1
  A49  3942        LAR   AR1,0x42
  A4A  4988        OUT   *,PA1
  A4B  3944        LAR   AR1,0x44
  A4C  4988        OUT   *,PA1
  A4D  3949        LAR   AR1,0x49
  A4E  4988        OUT   *,PA1
  A4F  7F80        NOP
  A50  7F80        NOP
  A51  7F80        NOP
  A52  7F80        NOP
  A53  7F80        NOP
  A54  6616        ZALS  0x16
  A55  0029        ADD   0x29
  A56  5029        SACL  0x29
  A57  0016        ADD   0x16
  A58  5016        SACL  0x16
  A59  4703        IN    0x03,PA7
  A5A  3932        LAR   AR1,0x32
  A5B  6A88        LT    *
  A5C  6D50        MPY   0x50
  A5D  7F8E        PAC
  A5E  3933        LAR   AR1,0x33
  A5F  6C88        LTA   *
  A60  6D51        MPY   0x51
  A61  7F8F        APAC
  A62  3934        LAR   AR1,0x34
  A63  6C88        LTA   *
  A64  5804        SACH  0x04
  A65  6D52        MPY   0x52
  A66  7F8E        PAC
  A67  3935        LAR   AR1,0x35
  A68  6C88        LTA   *
  A69  6D53        MPY   0x53
  A6A  7F8F        APAC
  A6B  3936        LAR   AR1,0x36
  A6C  6C88        LTA   *
  A6D  5805        SACH  0x05
  A6E  6D54        MPY   0x54
  A6F  7F8E        PAC
  A70  3937        LAR   AR1,0x37
  A71  6C88        LTA   *
  A72  6D55        MPY   0x55
  A73  7F8F        APAC
  A74  3938        LAR   AR1,0x38
  A75  6C88        LTA   *
  A76  5806        SACH  0x06
  A77  6D56        MPY   0x56
  A78  7F8E        PAC
  A79  3939        LAR   AR1,0x39
  A7A  6C88        LTA   *
  A7B  6D57        MPY   0x57
  A7C  7F8F        APAC
  A7D  6C27        LTA   0x27
  A7E  5807        SACH  0x07
  A7F  393A        LAR   AR1,0x3A
  A80  6D88        MPY   *
  A81  7F8E        PAC
  A82  7F8F        APAC
  A83  7F8F        APAC
  A84  6C28        LTA   0x28
  A85  5808        SACH  0x08
  A86  393C        LAR   AR1,0x3C
  A87  6D88        MPY   *
  A88  7F8E        PAC
  A89  7F8F        APAC
  A8A  7F8F        APAC
  A8B  7F8F        APAC
  A8C  5809        SACH  0x09
  A8D  7F80        NOP
  A8E  7F89        ZAC
  A8F  3930        LAR   AR1,0x30
  A90  3831        LAR   AR0,0x31
  A91  4D80        OUT   *,PA5,AR0
  A92  4E81        OUT   *,PA6,AR1
  A93  7F80        NOP
  A94  4702        IN    0x02,PA7
  A95  410A        IN    0x0A,PA1
  A96  410B        IN    0x0B,PA1
  A97  4111        IN    0x11,PA1
  A98  410C        IN    0x0C,PA1
  A99  410D        IN    0x0D,PA1
  A9A  4113        IN    0x13,PA1
  A9B  393E        LAR   AR1,0x3E
  A9C  4988        OUT   *,PA1
  A9D  3940        LAR   AR1,0x40
  A9E  4988        OUT   *,PA1
  A9F  393F        LAR   AR1,0x3F
  AA0  4988        OUT   *,PA1
  AA1  3942        LAR   AR1,0x42
  AA2  4988        OUT   *,PA1
  AA3  3944        LAR   AR1,0x44
  AA4  4988        OUT   *,PA1
  AA5  3943        LAR   AR1,0x43
  AA6  4988        OUT   *,PA1
  AA7  7F80        NOP
  AA8  7F80        NOP
  AA9  7F80        NOP
  AAA  F900 094E   B     L94E

