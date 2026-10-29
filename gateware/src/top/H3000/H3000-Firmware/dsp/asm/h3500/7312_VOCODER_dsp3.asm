; Eventide h3500 DSP microcode
; key 7312  algorithm 73 (VOCODER)  DSP 3
; source H3000-Upgrade_ROM4.BIN offset 3D774, 1431 program words loaded at 800
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
  80C  5047        SACL  0x47
  80D  2A47        LAC   0x47,10
  80E  504B        SACL  0x4B
  80F  2F47        LAC   0x47,15
  810  504A        SACL  0x4A
  811  7F89        ZAC
  812  5046        SACL  0x46
  813  1047        SUB   0x47
  814  5848        SACH  0x48
  815  7EFF        LACK  0xFF
  816  504C        SACL  0x4C
  817  274C        LAC   0x4C,7
  818  7A4C        OR    0x4C
  819  5049        SACL  0x49
  81A  6A47        LT    0x47
  81B  8D97        MPYK  3479
  81C  7F8E        PAC
  81D  5061        SACL  0x61
  81E  8DD7        MPYK  3543
  81F  7F8E        PAC
  820  5062        SACL  0x62
  821  8C90        MPYK  3216
  822  7F8E        PAC
  823  5063        SACL  0x63
  824  8DD7        MPYK  3543
  825  7F8E        PAC
  826  5064        SACL  0x64
  827  8E57        MPYK  3671
  828  7F8E        PAC
  829  5065        SACL  0x65
  82A  8E97        MPYK  3735
  82B  7F8E        PAC
  82C  5066        SACL  0x66
  82D  8FD7        MPYK  4055
  82E  7F8E        PAC
  82F  5067        SACL  0x67
  830  2947        LAC   0x47,9
  831  5068        SACL  0x68
  832  7E13        LACK  0x13
  833  5069        SACL  0x69
  834  7F89        ZAC
  835  506A        SACL  0x6A
  836  2849        LAC   0x49,8
  837  587A        SACH  0x7A
  838  287A        LAC   0x7A,8
  839  507A        SACL  0x7A
  83A  2847        LAC   0x47,8
  83B  507B        SACL  0x7B
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
  848  7F89        ZAC
  849  504D        SACL  0x4D
L84A:
  84A  F600 084E   BIOZ  L84E
  84C  F900 084A   B     L84A

L84E:
  84E  404C        IN    0x4C,PA0
  84F  654C        ZALH  0x4C
  850  FD00 0853   BGEZ  L853
  852  7F80        NOP
L853:
  853  F600 0853   BIOZ  L853
L855:
  855  454C        IN    0x4C,PA5
  856  6881        LARP  1
  857  664C        ZALS  0x4C
  858  794B        AND   0x4B
  859  FE00 085E   BNZ   L85E
  85B  6880        LARP  0
  85C  F900 0860   B     L860

L85E:
  85E  394C        LAR   AR1,0x4C
  85F  4680        IN    *,PA6,AR0
L860:
  860  7E15        LACK  0x15
  861  614D        ADDS  0x4D
  862  504D        SACL  0x4D
  863  4C46        OUT   0x46,PA4
  864  4C46        OUT   0x46,PA4
  865  4C46        OUT   0x46,PA4
  866  4C46        OUT   0x46,PA4
  867  4C46        OUT   0x46,PA4
  868  4C46        OUT   0x46,PA4
  869  4C46        OUT   0x46,PA4
  86A  4C46        OUT   0x46,PA4
  86B  4C46        OUT   0x46,PA4
  86C  4C46        OUT   0x46,PA4
  86D  4C46        OUT   0x46,PA4
  86E  4C46        OUT   0x46,PA4
  86F  4C46        OUT   0x46,PA4
  870  4C46        OUT   0x46,PA4
  871  4C46        OUT   0x46,PA4
  872  4C46        OUT   0x46,PA4
  873  4C46        OUT   0x46,PA4
  874  4C46        OUT   0x46,PA4
  875  4C46        OUT   0x46,PA4
  876  4C46        OUT   0x46,PA4
  877  4C46        OUT   0x46,PA4
  878  4C46        OUT   0x46,PA4
  879  4C46        OUT   0x46,PA4
  87A  4C46        OUT   0x46,PA4
  87B  4C46        OUT   0x46,PA4
  87C  4C46        OUT   0x46,PA4
  87D  4C46        OUT   0x46,PA4
  87E  4C46        OUT   0x46,PA4
  87F  4C46        OUT   0x46,PA4
  880  4C46        OUT   0x46,PA4
  881  4C46        OUT   0x46,PA4
  882  4C46        OUT   0x46,PA4
  883  4C46        OUT   0x46,PA4
  884  4C46        OUT   0x46,PA4
  885  4C46        OUT   0x46,PA4
  886  4C46        OUT   0x46,PA4
  887  4C46        OUT   0x46,PA4
  888  4C46        OUT   0x46,PA4
  889  4C46        OUT   0x46,PA4
  88A  4C46        OUT   0x46,PA4
  88B  4C46        OUT   0x46,PA4
  88C  4C46        OUT   0x46,PA4
  88D  7F80        NOP
  88E  7F80        NOP
  88F  7F80        NOP
  890  7F80        NOP
  891  204D        LAC   0x4D
  892  FC00 0855   BGZ   L855
L894:
  894  F600 0898   BIOZ  L898
  896  F900 0894   B     L894

L898:
  898  404C        IN    0x4C,PA0
  899  654C        ZALH  0x4C
  89A  FD00 089D   BGEZ  L89D
  89C  7F80        NOP
L89D:
  89D  F600 089D   BIOZ  L89D
L89F:
  89F  F800 08B3   CALL  L8B3
  8A1  F800 08E5   CALL  L8E5
  8A3  F800 093D   CALL  L93D
  8A5  F800 0962   CALL  L962
  8A7  F800 0995   CALL  L995
  8A9  F800 099E   CALL  L99E
  8AB  F800 09ED   CALL  L9ED
  8AD  FA00 089F   BLZ   L89F
  8AF  F800 0B1E   CALL  LB1E
  8B1  F900 089F   B     L89F

L8B3:
  8B3  F800 0B0C   CALL  LB0C
L8B5:
  8B5  F600 08B9   BIOZ  L8B9
  8B7  F900 08B5   B     L8B5

L8B9:
  8B9  7F80        NOP
  8BA  7F80        NOP
  8BB  7F80        NOP
  8BC  7F80        NOP
  8BD  7F80        NOP
  8BE  7F80        NOP
  8BF  7F80        NOP
  8C0  7F80        NOP
  8C1  7E0C        LACK  0x0C
  8C2  504C        SACL  0x4C
  8C3  2C4C        LAC   0x4C,12
  8C4  504C        SACL  0x4C
  8C5  484C        OUT   0x4C,PA0
L8C6:
  8C6  F600 08C6   BIOZ  L8C6
L8C8:
  8C8  F600 08CC   BIOZ  L8CC
  8CA  F900 08C8   B     L8C8

L8CC:
  8CC  7F80        NOP
  8CD  7F80        NOP
  8CE  7F80        NOP
  8CF  7F80        NOP
  8D0  7F80        NOP
  8D1  7F80        NOP
  8D2  7F80        NOP
  8D3  7F80        NOP
  8D4  454C        IN    0x4C,PA5
  8D5  6881        LARP  1
  8D6  664C        ZALS  0x4C
  8D7  794B        AND   0x4B
  8D8  FE00 08DD   BNZ   L8DD
  8DA  6880        LARP  0
  8DB  F900 08DF   B     L8DF

L8DD:
  8DD  394C        LAR   AR1,0x4C
  8DE  4680        IN    *,PA6,AR0
L8DF:
  8DF  404C        IN    0x4C,PA0
  8E0  2147        LAC   0x47,1
  8E1  794C        AND   0x4C
  8E2  FE00 08C6   BNZ   L8C6
  8E4  7F8D        RET

L8E5:
  8E5  6662        ZALS  0x62
  8E6  5050        SACL  0x50
  8E7  6168        ADDS  0x68
  8E8  5051        SACL  0x51
  8E9  F800 0B0C   CALL  LB0C
L8EB:
  8EB  F600 08EF   BIOZ  L8EF
  8ED  F900 08EB   B     L8EB

L8EF:
  8EF  4160        IN    0x60,PA1
  8F0  6660        ZALS  0x60
  8F1  1068        SUB   0x68
  8F2  1547        SUB   0x47,5
  8F3  1447        SUB   0x47,4
  8F4  5052        SACL  0x52
  8F5  7F80        NOP
L8F6:
  8F6  F600 08F6   BIOZ  L8F6
L8F8:
  8F8  F600 08FC   BIOZ  L8FC
  8FA  F900 08F8   B     L8F8

L8FC:
  8FC  4F52        OUT   0x52,PA7
  8FD  7000        LARK  AR0,0x00
  8FE  44A8        IN    *+,PA4
  8FF  44A8        IN    *+,PA4
  900  44A8        IN    *+,PA4
  901  44A8        IN    *+,PA4
  902  44A8        IN    *+,PA4
  903  44A8        IN    *+,PA4
  904  44A8        IN    *+,PA4
  905  44A8        IN    *+,PA4
  906  44A8        IN    *+,PA4
  907  44A8        IN    *+,PA4
  908  44A8        IN    *+,PA4
  909  44A8        IN    *+,PA4
  90A  44A8        IN    *+,PA4
  90B  44A8        IN    *+,PA4
  90C  44A8        IN    *+,PA4
  90D  7000        LARK  AR0,0x00
  90E  6650        ZALS  0x50
  90F  7DA8        TBLW  *+
  910  6147        ADDS  0x47
  911  7DA8        TBLW  *+
  912  6147        ADDS  0x47
  913  7DA8        TBLW  *+
  914  6147        ADDS  0x47
  915  7DA8        TBLW  *+
  916  6147        ADDS  0x47
  917  7DA8        TBLW  *+
  918  6147        ADDS  0x47
  919  7DA8        TBLW  *+
  91A  6147        ADDS  0x47
  91B  7DA8        TBLW  *+
  91C  6147        ADDS  0x47
  91D  7DA8        TBLW  *+
  91E  6147        ADDS  0x47
  91F  7DA8        TBLW  *+
  920  6147        ADDS  0x47
  921  7DA8        TBLW  *+
  922  6147        ADDS  0x47
  923  7DA8        TBLW  *+
  924  6147        ADDS  0x47
  925  7DA8        TBLW  *+
  926  6147        ADDS  0x47
  927  7DA8        TBLW  *+
  928  6147        ADDS  0x47
  929  7DA8        TBLW  *+
  92A  6147        ADDS  0x47
  92B  7DA8        TBLW  *+
  92C  6147        ADDS  0x47
  92D  5050        SACL  0x50
  92E  6652        ZALS  0x52
  92F  0447        ADD   0x47,4
  930  5052        SACL  0x52
  931  7F80        NOP
  932  6550        ZALH  0x50
  933  6251        SUBH  0x51
  934  FA00 08FC   BLZ   L8FC
  936  7014        LARK  AR0,0x14
  937  6667        ZALS  0x67
L938:
  938  7D46        TBLW  0x46
  939  0047        ADD   0x47
  93A  F400 0938   BANZ  L938
  93C  7F8D        RET

L93D:
  93D  6662        ZALS  0x62
  93E  5050        SACL  0x50
  93F  2947        LAC   0x47,9
  940  1047        SUB   0x47
  941  504C        SACL  0x4C
  942  384C        LAR   AR0,0x4C
  943  6880        LARP  0
  944  7F89        ZAC
  945  506E        SACL  0x6E
L946:
  946  6650        ZALS  0x50
  947  674C        TBLR  0x4C
  948  0047        ADD   0x47
  949  5050        SACL  0x50
  94A  204C        LAC   0x4C
  94B  7F88        ABS
  94C  106E        SUB   0x6E
  94D  FB00 0952   BLEZ  L952
  94F  204C        LAC   0x4C
  950  7F88        ABS
  951  506E        SACL  0x6E
L952:
  952  F400 0946   BANZ  L946
  954  6880        LARP  0
  955  700F        LARK  AR0,0x0F
  956  2049        LAC   0x49
L957:
  957  646E        SUBC  0x6E
  958  F400 0957   BANZ  L957
  95A  506D        SACL  0x6D
  95B  656D        ZALH  0x6D
  95C  6246        SUBH  0x46
  95D  FE00 0961   BNZ   L961
  95F  6647        ZALS  0x47
  960  506D        SACL  0x6D
L961:
  961  7F8D        RET

L962:
  962  6662        ZALS  0x62
  963  5050        SACL  0x50
  964  6663        ZALS  0x63
  965  5051        SACL  0x51
  966  70FF        LARK  AR0,0xFF
L967:
  967  6650        ZALS  0x50
  968  674C        TBLR  0x4C
  969  6651        ZALS  0x51
  96A  674D        TBLR  0x4D
  96B  6147        ADDS  0x47
  96C  5051        SACL  0x51
  96D  6A4C        LT    0x4C
  96E  6D6D        MPY   0x6D
  96F  7F8E        PAC
  970  504C        SACL  0x4C
  971  2E4C        LAC   0x4C,14
  972  584C        SACH  0x4C
  973  6A4C        LT    0x4C
  974  6D4D        MPY   0x4D
  975  7F8E        PAC
  976  594C        SACH  0x4C,1
  977  6650        ZALS  0x50
  978  7D4C        TBLW  0x4C
  979  6147        ADDS  0x47
  97A  5050        SACL  0x50
  97B  F400 0967   BANZ  L967
  97D  70FF        LARK  AR0,0xFF
L97E:
  97E  6650        ZALS  0x50
  97F  674C        TBLR  0x4C
  980  6651        ZALS  0x51
  981  6347        SUBS  0x47
  982  674D        TBLR  0x4D
  983  5051        SACL  0x51
  984  6A4C        LT    0x4C
  985  6D6D        MPY   0x6D
  986  7F8E        PAC
  987  504C        SACL  0x4C
  988  2E4C        LAC   0x4C,14
  989  584C        SACH  0x4C
  98A  6A4C        LT    0x4C
  98B  6D4D        MPY   0x4D
  98C  7F8E        PAC
  98D  594C        SACH  0x4C,1
  98E  6650        ZALS  0x50
  98F  7D4C        TBLW  0x4C
  990  6147        ADDS  0x47
  991  5050        SACL  0x50
  992  F400 097E   BANZ  L97E
  994  7F8D        RET

L995:
  995  6669        ZALS  0x69
  996  0047        ADD   0x47
  997  5050        SACL  0x50
  998  7F89        ZAC
  999  5051        SACL  0x51
  99A  5054        SACL  0x54
  99B  F800 0BCD   CALL  LBCD
  99D  7F8D        RET

L99E:
  99E  3869        LAR   AR0,0x69
  99F  6661        ZALS  0x61
  9A0  5050        SACL  0x50
  9A1  6650        ZALS  0x50
  9A2  6740        TBLR  0x40
  9A3  0047        ADD   0x47
  9A4  6741        TBLR  0x41
  9A5  7F89        ZAC
  9A6  5051        SACL  0x51
L9A7:
  9A7  6540        ZALH  0x40
  9A8  FE00 09AF   BNZ   L9AF
  9AA  6541        ZALH  0x41
  9AB  FA00 09AF   BLZ   L9AF
  9AD  F900 09C2   B     L9C2

L9AF:
  9AF  2F41        LAC   0x41,15
  9B0  5843        SACH  0x43
  9B1  2F48        LAC   0x48,15
  9B2  7848        XOR   0x48
  9B3  7943        AND   0x43
  9B4  5043        SACL  0x43
  9B5  2F40        LAC   0x40,15
  9B6  5842        SACH  0x42
  9B7  7A43        OR    0x43
  9B8  5043        SACL  0x43
  9B9  6542        ZALH  0x42
  9BA  6143        ADDS  0x43
  9BB  5840        SACH  0x40
  9BC  5041        SACL  0x41
  9BD  7E01        LACK  0x01
  9BE  0051        ADD   0x51
  9BF  5051        SACL  0x51
  9C0  F900 09A7   B     L9A7

L9C2:
  9C2  6650        ZALS  0x50
  9C3  7D40        TBLW  0x40
  9C4  0047        ADD   0x47
  9C5  7D41        TBLW  0x41
  9C6  0047        ADD   0x47
  9C7  5050        SACL  0x50
  9C8  6898        MAR   *-
L9C9:
  9C9  6650        ZALS  0x50
  9CA  6740        TBLR  0x40
  9CB  0047        ADD   0x47
  9CC  6741        TBLR  0x41
  9CD  3951        LAR   AR1,0x51
  9CE  6881        LARP  1
  9CF  F400 09D3   BANZ  L9D3
  9D1  F900 09E3   B     L9E3

L9D3:
  9D3  2F41        LAC   0x41,15
  9D4  5843        SACH  0x43
  9D5  2F48        LAC   0x48,15
  9D6  7848        XOR   0x48
  9D7  7943        AND   0x43
  9D8  5043        SACL  0x43
  9D9  2F40        LAC   0x40,15
  9DA  5842        SACH  0x42
  9DB  7A43        OR    0x43
  9DC  5043        SACL  0x43
  9DD  6542        ZALH  0x42
  9DE  6143        ADDS  0x43
  9DF  5840        SACH  0x40
  9E0  5041        SACL  0x41
  9E1  F400 09D3   BANZ  L9D3
L9E3:
  9E3  6650        ZALS  0x50
  9E4  7D40        TBLW  0x40
  9E5  0047        ADD   0x47
  9E6  7D41        TBLW  0x41
  9E7  0047        ADD   0x47
  9E8  5050        SACL  0x50
  9E9  6880        LARP  0
  9EA  F400 09C9   BANZ  L9C9
  9EC  7F8D        RET

L9ED:
  9ED  6661        ZALS  0x61
  9EE  0047        ADD   0x47
  9EF  6753        TBLR  0x53
  9F0  6553        ZALH  0x53
  9F1  F800 0B44   CALL  LB44
  9F3  584C        SACH  0x4C
  9F4  604C        ADDH  0x4C
  9F5  604C        ADDH  0x4C
  9F6  604C        ADDH  0x4C
  9F7  584C        SACH  0x4C
  9F8  6880        LARP  0
  9F9  700F        LARK  AR0,0x0F
  9FA  204C        LAC   0x4C
L9FB:
  9FB  646D        SUBC  0x6D
  9FC  F400 09FB   BANZ  L9FB
  9FE  506C        SACL  0x6C
  9FF  656E        ZALH  0x6E
  A00  6278        SUBH  0x78
  A01  FD00 0A07   BGEZ  LA07
  A03  7F89        ZAC
  A04  506C        SACL  0x6C
  A05  F900 0B0B   B     LB0B

LA07:
  A07  7E14        LACK  0x14
  A08  5052        SACL  0x52
  A09  7E00        LACK  0x00
  A0A  5050        SACL  0x50
LA0B:
  A0B  6666        ZALS  0x66
  A0C  6150        ADDS  0x50
  A0D  7D46        TBLW  0x46
  A0E  7E01        LACK  0x01
  A0F  0050        ADD   0x50
  A10  5050        SACL  0x50
  A11  6550        ZALH  0x50
  A12  6252        SUBH  0x52
  A13  FB00 0A0B   BLEZ  LA0B
  A15  6669        ZALS  0x69
  A16  5052        SACL  0x52
  A17  6664        ZALS  0x64
  A18  0152        ADD   0x52,1
  A19  7D49        TBLW  0x49
  A1A  0047        ADD   0x47
  A1B  7D48        TBLW  0x48
  A1C  6661        ZALS  0x61
  A1D  0047        ADD   0x47
  A1E  6753        TBLR  0x53
  A1F  7E01        LACK  0x01
  A20  5050        SACL  0x50
LA21:
  A21  6661        ZALS  0x61
  A22  0150        ADD   0x50,1
  A23  0047        ADD   0x47
  A24  6754        TBLR  0x54
  A25  6880        LARP  0
  A26  6A54        LT    0x54
  A27  6D53        MPY   0x53
  A28  7F8E        PAC
  A29  584C        SACH  0x4C
  A2A  2053        LAC   0x53
  A2B  7F88        ABS
  A2C  504D        SACL  0x4D
  A2D  2054        LAC   0x54
  A2E  7F88        ABS
  A2F  504E        SACL  0x4E
  A30  654E        ZALH  0x4E
  A31  700E        LARK  AR0,0x0E
LA32:
  A32  644D        SUBC  0x4D
  A33  F400 0A32   BANZ  LA32
  A35  505B        SACL  0x5B
  A36  654C        ZALH  0x4C
  A37  FD00 0A3C   BGEZ  LA3C
  A39  7F89        ZAC
  A3A  625B        SUBH  0x5B
  A3B  585B        SACH  0x5B
LA3C:
  A3C  6664        ZALS  0x64
  A3D  0150        ADD   0x50,1
  A3E  0152        ADD   0x52,1
  A3F  7D5B        TBLW  0x5B
  A40  0047        ADD   0x47
  A41  7D46        TBLW  0x46
  A42  6664        ZALS  0x64
  A43  0152        ADD   0x52,1
  A44  1150        SUB   0x50,1
  A45  7D5B        TBLW  0x5B
  A46  0047        ADD   0x47
  A47  7D46        TBLW  0x46
  A48  7E01        LACK  0x01
  A49  0050        ADD   0x50
  A4A  5050        SACL  0x50
  A4B  6550        ZALH  0x50
  A4C  6252        SUBH  0x52
  A4D  FB00 0A21   BLEZ  LA21
  A4F  6549        ZALH  0x49
  A50  5855        SACH  0x55
  A51  2F49        LAC   0x49,15
  A52  584C        SACH  0x4C
  A53  7E01        LACK  0x01
  A54  5050        SACL  0x50
LA55:
  A55  6664        ZALS  0x64
  A56  0152        ADD   0x52,1
  A57  675D        TBLR  0x5D
  A58  6664        ZALS  0x64
  A59  0152        ADD   0x52,1
  A5A  0150        ADD   0x50,1
  A5B  675B        TBLR  0x5B
  A5C  205B        LAC   0x5B
  A5D  7F88        ABS
  A5E  504C        SACL  0x4C
  A5F  205D        LAC   0x5D
  A60  7F88        ABS
  A61  504D        SACL  0x4D
  A62  654C        ZALH  0x4C
  A63  624D        SUBH  0x4D
  A64  FA00 0A74   BLZ   LA74
  A66  6A5B        LT    0x5B
  A67  6D5D        MPY   0x5D
  A68  7F8E        PAC
  A69  FC00 0A6F   BGZ   LA6F
  A6B  657A        ZALH  0x7A
  A6C  5856        SACH  0x56
  A6D  F900 0A97   B     LA97

LA6F:
  A6F  7F89        ZAC
  A70  627A        SUBH  0x7A
  A71  5856        SACH  0x56
  A72  F900 0A97   B     LA97

LA74:
  A74  6880        LARP  0
  A75  6A5B        LT    0x5B
  A76  6D5D        MPY   0x5D
  A77  7F8E        PAC
  A78  584C        SACH  0x4C
  A79  205D        LAC   0x5D
  A7A  7F88        ABS
  A7B  504D        SACL  0x4D
  A7C  205B        LAC   0x5B
  A7D  7F88        ABS
  A7E  504E        SACL  0x4E
  A7F  654E        ZALH  0x4E
  A80  700E        LARK  AR0,0x0E
LA81:
  A81  644D        SUBC  0x4D
  A82  F400 0A81   BANZ  LA81
  A84  5056        SACL  0x56
  A85  654C        ZALH  0x4C
  A86  FD00 0A8B   BGEZ  LA8B
  A88  7F89        ZAC
  A89  6256        SUBH  0x56
  A8A  5856        SACH  0x56
LA8B:
  A8B  7F89        ZAC
  A8C  6256        SUBH  0x56
  A8D  5856        SACH  0x56
  A8E  2056        LAC   0x56
  A8F  7F88        ABS
  A90  107A        SUB   0x7A
  A91  FA00 0A97   BLZ   LA97
  A93  6A56        LT    0x56
  A94  6D7A        MPY   0x7A
  A95  7F8E        PAC
  A96  5956        SACH  0x56,1
LA97:
  A97  6666        ZALS  0x66
  A98  0050        ADD   0x50
  A99  7D56        TBLW  0x56
  A9A  2F49        LAC   0x49,15
  A9B  6A56        LT    0x56
  A9C  6D56        MPY   0x56
  A9D  7F90        SPAC
  A9E  595B        SACH  0x5B,1
  A9F  6A5B        LT    0x5B
  AA0  6D55        MPY   0x55
  AA1  7F8E        PAC
  AA2  594C        SACH  0x4C,1
  AA3  204C        LAC   0x4C
  AA4  107B        SUB   0x7B
  AA5  FB00 0AF4   BLEZ  LAF4
  AA7  654C        ZALH  0x4C
  AA8  5855        SACH  0x55
  AA9  7E01        LACK  0x01
  AAA  6150        ADDS  0x50
  AAB  505B        SACL  0x5B
  AAC  2F5B        LAC   0x5B,15
  AAD  5851        SACH  0x51
LAAE:
  AAE  6664        ZALS  0x64
  AAF  0150        ADD   0x50,1
  AB0  0152        ADD   0x52,1
  AB1  1151        SUB   0x51,1
  AB2  6757        TBLR  0x57
  AB3  0047        ADD   0x47
  AB4  6758        TBLR  0x58
  AB5  6664        ZALS  0x64
  AB6  0151        ADD   0x51,1
  AB7  0152        ADD   0x52,1
  AB8  675B        TBLR  0x5B
  AB9  6A56        LT    0x56
  ABA  6D5B        MPY   0x5B
  ABB  7F8E        PAC
  ABC  7F8F        APAC
  ABD  6057        ADDH  0x57
  ABE  6158        ADDS  0x58
  ABF  585B        SACH  0x5B
  AC0  505C        SACL  0x5C
  AC1  6664        ZALS  0x64
  AC2  0150        ADD   0x50,1
  AC3  0152        ADD   0x52,1
  AC4  1151        SUB   0x51,1
  AC5  7D5B        TBLW  0x5B
  AC6  0047        ADD   0x47
  AC7  7D5C        TBLW  0x5C
  AC8  6664        ZALS  0x64
  AC9  0151        ADD   0x51,1
  ACA  0152        ADD   0x52,1
  ACB  675B        TBLR  0x5B
  ACC  0047        ADD   0x47
  ACD  675C        TBLR  0x5C
  ACE  6A56        LT    0x56
  ACF  6D57        MPY   0x57
  AD0  7F8E        PAC
  AD1  7F8F        APAC
  AD2  605B        ADDH  0x5B
  AD3  615C        ADDS  0x5C
  AD4  585B        SACH  0x5B
  AD5  505C        SACL  0x5C
  AD6  6664        ZALS  0x64
  AD7  0151        ADD   0x51,1
  AD8  0152        ADD   0x52,1
  AD9  7D5B        TBLW  0x5B
  ADA  0047        ADD   0x47
  ADB  7D5C        TBLW  0x5C
  ADC  7E01        LACK  0x01
  ADD  0051        ADD   0x51
  ADE  5051        SACL  0x51
  ADF  6551        ZALH  0x51
  AE0  6252        SUBH  0x52
  AE1  FB00 0AAE   BLEZ  LAAE
  AE3  2F56        LAC   0x56,15
  AE4  584C        SACH  0x4C
  AE5  7E01        LACK  0x01
  AE6  5051        SACL  0x51
  AE7  7E01        LACK  0x01
  AE8  0050        ADD   0x50
  AE9  5050        SACL  0x50
  AEA  6550        ZALH  0x50
  AEB  6252        SUBH  0x52
  AEC  FB00 0A55   BLEZ  LA55
  AEE  7F89        ZAC
  AEF  F900 0B01   B     LB01

  AF1  6547        ZALH  0x47
  AF2  F900 0B00   B     LB00

LAF4:
  AF4  6666        ZALS  0x66
  AF5  0050        ADD   0x50
  AF6  7D46        TBLW  0x46
  AF7  6547        ZALH  0x47
  AF8  F900 0B00   B     LB00

  AFA  6548        ZALH  0x48
  AFB  F900 0B00   B     LB00

  AFD  6548        ZALH  0x48
  AFE  F900 0B00   B     LB00

LB00:
  B00  7F80        NOP
LB01:
  B01  6E01        LDPK  1
  B02  5800        SACH  0x80
  B03  6E00        LDPK  0
  B04  6555        ZALH  0x55
  B05  F800 0B44   CALL  LB44
  B07  586B        SACH  0x6B
  B08  6E01        LDPK  1
  B09  6500        ZALH  0x80
  B0A  6E00        LDPK  0
LB0B:
  B0B  7F8D        RET

LB0C:
  B0C  F600 0B0C   BIOZ  LB0C
LB0E:
  B0E  F600 0B12   BIOZ  LB12
  B10  F900 0B0E   B     LB0E

LB12:
  B12  404C        IN    0x4C,PA0
  B13  654C        ZALH  0x4C
  B14  FD00 0B17   BGEZ  LB17
  B16  7F80        NOP
LB17:
  B17  F600 0B17   BIOZ  LB17
  B19  6880        LARP  0
  B1A  7031        LARK  AR0,0x31
LB1B:
  B1B  F400 0B1B   BANZ  LB1B
  B1D  7F8D        RET

LB1E:
  B1E  F800 0B0C   CALL  LB0C
  B20  7E01        LACK  0x01
  B21  5050        SACL  0x50
  B22  7E14        LACK  0x14
  B23  5051        SACL  0x51
LB24:
  B24  6650        ZALS  0x50
  B25  504C        SACL  0x4C
  B26  6666        ZALS  0x66
  B27  0050        ADD   0x50
  B28  674D        TBLR  0x4D
LB29:
  B29  F600 0B2D   BIOZ  LB2D
  B2B  F900 0B29   B     LB29

LB2D:
  B2D  4A4C        OUT   0x4C,PA2
  B2E  4B4D        OUT   0x4D,PA3
  B2F  7E01        LACK  0x01
  B30  0050        ADD   0x50
  B31  5050        SACL  0x50
  B32  7F80        NOP
LB33:
  B33  F600 0B33   BIOZ  LB33
  B35  6550        ZALH  0x50
  B36  6251        SUBH  0x51
  B37  FB00 0B24   BLEZ  LB24
  B39  6A6B        LT    0x6B
  B3A  6D6C        MPY   0x6C
  B3B  7F8E        PAC
  B3C  594D        SACH  0x4D,1
LB3D:
  B3D  F600 0B41   BIOZ  LB41
  B3F  F900 0B3D   B     LB3D

LB41:
  B41  4A46        OUT   0x46,PA2
  B42  4B4D        OUT   0x4D,PA3
  B43  7F8D        RET

LB44:
  B44  FC00 0B49   BGZ   LB49
  B46  7F89        ZAC
  B47  F900 0BCC   B     LBCC

LB49:
  B49  5842        SACH  0x42
  B4A  5043        SACL  0x43
  B4B  7F89        ZAC
  B4C  5050        SACL  0x50
  B4D  6549        ZALH  0x49
  B4E  5851        SACH  0x51
  B4F  6A47        LT    0x47
  B50  8D90        MPYK  3472
  B51  7F8E        PAC
  B52  6757        TBLR  0x57
  B53  0047        ADD   0x47
  B54  6758        TBLR  0x58
  B55  0047        ADD   0x47
  B56  6759        TBLR  0x59
  B57  0047        ADD   0x47
  B58  675A        TBLR  0x5A
  B59  0047        ADD   0x47
  B5A  675B        TBLR  0x5B
  B5B  0047        ADD   0x47
  B5C  675C        TBLR  0x5C
  B5D  0047        ADD   0x47
  B5E  675D        TBLR  0x5D
LB5F:
  B5F  6542        ZALH  0x42
  B60  6143        ADDS  0x43
  B61  5840        SACH  0x40
  B62  5041        SACL  0x41
  B63  0F4A        ADD   0x4A,15
  B64  FD00 0B86   BGEZ  LB86
  B66  6557        ZALH  0x57
  B67  5851        SACH  0x51
  B68  2141        LAC   0x41,1
  B69  5043        SACL  0x43
  B6A  5842        SACH  0x42
  B6B  2148        LAC   0x48,1
  B6C  7848        XOR   0x48
  B6D  7942        AND   0x42
  B6E  0140        ADD   0x40,1
  B6F  5042        SACL  0x42
  B70  6542        ZALH  0x42
  B71  6143        ADDS  0x43
  B72  5840        SACH  0x40
  B73  5041        SACL  0x41
  B74  0F4A        ADD   0x4A,15
  B75  FD00 0B86   BGEZ  LB86
  B77  6549        ZALH  0x49
  B78  5851        SACH  0x51
  B79  7E01        LACK  0x01
  B7A  0050        ADD   0x50
  B7B  5050        SACL  0x50
  B7C  2141        LAC   0x41,1
  B7D  5043        SACL  0x43
  B7E  5842        SACH  0x42
  B7F  2148        LAC   0x48,1
  B80  7848        XOR   0x48
  B81  7942        AND   0x42
  B82  0140        ADD   0x40,1
  B83  5042        SACL  0x42
  B84  F900 0B5F   B     LB5F

LB86:
  B86  6A42        LT    0x42
  B87  6D42        MPY   0x42
  B88  7F8E        PAC
  B89  0E47        ADD   0x47,14
  B8A  5952        SACH  0x52,1
  B8B  6D52        MPY   0x52
  B8C  7F8E        PAC
  B8D  0E47        ADD   0x47,14
  B8E  5953        SACH  0x53,1
  B8F  6D53        MPY   0x53
  B90  7F8E        PAC
  B91  0E47        ADD   0x47,14
  B92  5954        SACH  0x54,1
  B93  6D54        MPY   0x54
  B94  7F8E        PAC
  B95  0E47        ADD   0x47,14
  B96  5955        SACH  0x55,1
  B97  6542        ZALH  0x42
  B98  6143        ADDS  0x43
  B99  6A42        LT    0x42
  B9A  6D42        MPY   0x42
  B9B  7F90        SPAC
  B9C  6D52        MPY   0x52
  B9D  7F8F        APAC
  B9E  6A52        LT    0x52
  B9F  6D5A        MPY   0x5A
  BA0  6C54        LTA   0x54
  BA1  6D5C        MPY   0x5C
  BA2  6C42        LTA   0x42
  BA3  6D59        MPY   0x59
  BA4  6C49        LTA   0x49
  BA5  6D58        MPY   0x58
  BA6  6C53        LTA   0x53
  BA7  6D5B        MPY   0x5B
  BA8  6C55        LTA   0x55
  BA9  6D5D        MPY   0x5D
  BAA  7F8F        APAC
  BAB  0E47        ADD   0x47,14
  BAC  594C        SACH  0x4C,1
  BAD  6A4C        LT    0x4C
  BAE  6D51        MPY   0x51
  BAF  7F8E        PAC
  BB0  0E47        ADD   0x47,14
  BB1  594C        SACH  0x4C,1
  BB2  304D        SAR   AR0,0x4D
  BB3  3850        LAR   AR0,0x50
  BB4  654C        ZALH  0x4C
  BB5  5840        SACH  0x40
  BB6  5041        SACL  0x41
  BB7  F900 0BC7   B     LBC7

LBB9:
  BB9  2F41        LAC   0x41,15
  BBA  5843        SACH  0x43
  BBB  2F48        LAC   0x48,15
  BBC  7848        XOR   0x48
  BBD  7943        AND   0x43
  BBE  5043        SACL  0x43
  BBF  2F40        LAC   0x40,15
  BC0  5842        SACH  0x42
  BC1  7A43        OR    0x43
  BC2  5043        SACL  0x43
  BC3  6542        ZALH  0x42
  BC4  6143        ADDS  0x43
  BC5  5840        SACH  0x40
  BC6  5041        SACL  0x41
LBC7:
  BC7  F400 0BB9   BANZ  LBB9
  BC9  384D        LAR   AR0,0x4D
  BCA  6540        ZALH  0x40
  BCB  6141        ADDS  0x41
LBCC:
  BCC  7F8D        RET

LBCD:
  BCD  6662        ZALS  0x62
  BCE  5052        SACL  0x52
  BCF  F800 0C3A   CALL  LC3A
  BD1  6662        ZALS  0x62
  BD2  0051        ADD   0x51
  BD3  5052        SACL  0x52
  BD4  F800 0C43   CALL  LC43
  BD6  7E20        LACK  0x20
  BD7  0062        ADD   0x62
  BD8  0051        ADD   0x51
  BD9  5052        SACL  0x52
  BDA  6651        ZALS  0x51
  BDB  5053        SACL  0x53
  BDC  6880        LARP  0
  BDD  3850        LAR   AR0,0x50
  BDE  6554        ZALH  0x54
  BDF  FE00 0BE5   BNZ   LBE5
  BE1  F800 0C05   CALL  LC05
  BE3  F900 0BE7   B     LBE7

LBE5:
  BE5  F800 0C1C   CALL  LC1C
LBE7:
  BE7  7E20        LACK  0x20
  BE8  5055        SACL  0x55
LBE9:
  BE9  6655        ZALS  0x55
  BEA  0062        ADD   0x62
  BEB  5052        SACL  0x52
  BEC  F800 0C3A   CALL  LC3A
  BEE  6655        ZALS  0x55
  BEF  0051        ADD   0x51
  BF0  0062        ADD   0x62
  BF1  5052        SACL  0x52
  BF2  F800 0C43   CALL  LC43
  BF4  6651        ZALS  0x51
  BF5  5053        SACL  0x53
  BF6  7E20        LACK  0x20
  BF7  6152        ADDS  0x52
  BF8  5052        SACL  0x52
  BF9  6880        LARP  0
  BFA  3850        LAR   AR0,0x50
  BFB  F800 0C1C   CALL  LC1C
  BFD  7E20        LACK  0x20
  BFE  0055        ADD   0x55
  BFF  5055        SACL  0x55
  C00  6655        ZALS  0x55
  C01  1947        SUB   0x47,9
  C02  FA00 0BE9   BLZ   LBE9
  C04  7F8D        RET

LC05:
  C05  6898        MAR   *-
  C06  F900 0C0C   B     LC0C

LC08:
  C08  6652        ZALS  0x52
  C09  6720        TBLR  0x20
  C0A  0047        ADD   0x47
  C0B  5052        SACL  0x52
LC0C:
  C0C  F800 0C4C   CALL  LC4C
  C0E  204C        LAC   0x4C
  C0F  5840        SACH  0x40
  C10  5041        SACL  0x41
  C11  6661        ZALS  0x61
  C12  0153        ADD   0x53,1
  C13  7D40        TBLW  0x40
  C14  0047        ADD   0x47
  C15  7D41        TBLW  0x41
  C16  7E01        LACK  0x01
  C17  0053        ADD   0x53
  C18  5053        SACL  0x53
  C19  F400 0C08   BANZ  LC08
  C1B  7F8D        RET

LC1C:
  C1C  6898        MAR   *-
  C1D  F900 0C23   B     LC23

LC1F:
  C1F  6652        ZALS  0x52
  C20  6720        TBLR  0x20
  C21  0047        ADD   0x47
  C22  5052        SACL  0x52
LC23:
  C23  F800 0C4C   CALL  LC4C
  C25  6661        ZALS  0x61
  C26  0153        ADD   0x53,1
  C27  6740        TBLR  0x40
  C28  0047        ADD   0x47
  C29  6741        TBLR  0x41
  C2A  6540        ZALH  0x40
  C2B  6141        ADDS  0x41
  C2C  004C        ADD   0x4C
  C2D  5840        SACH  0x40
  C2E  5041        SACL  0x41
  C2F  6661        ZALS  0x61
  C30  0153        ADD   0x53,1
  C31  7D40        TBLW  0x40
  C32  0047        ADD   0x47
  C33  7D41        TBLW  0x41
  C34  7E01        LACK  0x01
  C35  0053        ADD   0x53
  C36  5053        SACL  0x53
  C37  F400 0C1F   BANZ  LC1F
  C39  7F8D        RET

LC3A:
  C3A  701F        LARK  AR0,0x1F
  C3B  711F        LARK  AR1,0x1F
  C3C  6652        ZALS  0x52
LC3D:
  C3D  6881        LARP  1
  C3E  6790        TBLR  *-,AR0
  C3F  0047        ADD   0x47
  C40  F400 0C3D   BANZ  LC3D
  C42  7F8D        RET

LC43:
  C43  701F        LARK  AR0,0x1F
  C44  713F        LARK  AR1,0x3F
  C45  6652        ZALS  0x52
LC46:
  C46  6881        LARP  1
  C47  6790        TBLR  *-,AR0
  C48  0047        ADD   0x47
  C49  F400 0C46   BANZ  LC46
  C4B  7F8D        RET

LC4C:
  C4C  7F89        ZAC
  C4D  6A3F        LT    0x3F
  C4E  6D1F        MPY   0x1F
  C4F  6B3E        LTD   0x3E
  C50  6D1E        MPY   0x1E
  C51  6B3D        LTD   0x3D
  C52  6D1D        MPY   0x1D
  C53  6B3C        LTD   0x3C
  C54  6D1C        MPY   0x1C
  C55  6B3B        LTD   0x3B
  C56  6D1B        MPY   0x1B
  C57  6B3A        LTD   0x3A
  C58  6D1A        MPY   0x1A
  C59  6B39        LTD   0x39
  C5A  6D19        MPY   0x19
  C5B  6B38        LTD   0x38
  C5C  6D18        MPY   0x18
  C5D  6B37        LTD   0x37
  C5E  6D17        MPY   0x17
  C5F  6B36        LTD   0x36
  C60  6D16        MPY   0x16
  C61  6B35        LTD   0x35
  C62  6D15        MPY   0x15
  C63  6B34        LTD   0x34
  C64  6D14        MPY   0x14
  C65  6B33        LTD   0x33
  C66  6D13        MPY   0x13
  C67  6B32        LTD   0x32
  C68  6D12        MPY   0x12
  C69  6B31        LTD   0x31
  C6A  6D11        MPY   0x11
  C6B  6B30        LTD   0x30
  C6C  6D10        MPY   0x10
  C6D  6B2F        LTD   0x2F
  C6E  6D0F        MPY   0x0F
  C6F  6B2E        LTD   0x2E
  C70  6D0E        MPY   0x0E
  C71  6B2D        LTD   0x2D
  C72  6D0D        MPY   0x0D
  C73  6B2C        LTD   0x2C
  C74  6D0C        MPY   0x0C
  C75  6B2B        LTD   0x2B
  C76  6D0B        MPY   0x0B
  C77  6B2A        LTD   0x2A
  C78  6D0A        MPY   0x0A
  C79  6B29        LTD   0x29
  C7A  6D09        MPY   0x09
  C7B  6B28        LTD   0x28
  C7C  6D08        MPY   0x08
  C7D  6B27        LTD   0x27
  C7E  6D07        MPY   0x07
  C7F  6B26        LTD   0x26
  C80  6D06        MPY   0x06
  C81  6B25        LTD   0x25
  C82  6D05        MPY   0x05
  C83  6B24        LTD   0x24
  C84  6D04        MPY   0x04
  C85  6B23        LTD   0x23
  C86  6D03        MPY   0x03
  C87  6B22        LTD   0x22
  C88  6D02        MPY   0x02
  C89  6B21        LTD   0x21
  C8A  6D01        MPY   0x01
  C8B  6B20        LTD   0x20
  C8C  6D00        MPY   0x00
  C8D  7F8F        APAC
  C8E  584C        SACH  0x4C
  C8F  7F8D        RET

  C90  0A3D        ADD   0x3D,10
  C91  0A3E        ADD   0x3E,10
  C92  0A41        ADD   0x41,10
  C93  0A47        ADD   0x47,10
  C94  0A4F        ADD   0x4F,10
  C95  0A59        ADD   0x59,10
  C96  0A66        ADD   0x66,10
  C97  0A75        ADD   0x75,10
  C98  0A86        ADD   *,10,AR0
  C99  0A99        ADD   *-,10
  C9A  0AAF        ADD   *+,10
  C9B  0AC7        ADD   *,10,AR1
  C9C  0AE1        ADD   *+,10,AR1
  C9D  0AFD        ADD   *+-,10
  C9E  0B1C        ADD   0x1C,11
  C9F  0B3D        ADD   0x3D,11
  CA0  0B60        ADD   0x60,11
  CA1  0B85        ADD   *,11,AR1
  CA2  0BAD        ADD   *+,11
  CA3  0BD6        ADD   *-,11,AR0
  CA4  0C02        ADD   0x02,12
  CA5  0C31        ADD   0x31,12
  CA6  0C61        ADD   0x61,12
  CA7  0C94        ADD   *-,12,AR0
  CA8  0CC8        ADD   *,12
  CA9  0CFF        ADD   *+-,12
  CAA  0D39        ADD   0x39,13
  CAB  0D74        ADD   0x74,13
  CAC  0DB1        ADD   *+-,13,AR1
  CAD  0DF1        ADD   *+-,13,AR1
  CAE  0E33        ADD   0x33,14
  CAF  0E77        ADD   0x77,14
  CB0  0EBD        ADD   *+-,14
  CB1  0F05        ADD   0x05,15
  CB2  0F4F        ADD   0x4F,15
  CB3  0F9B        ADD   *-,15
  CB4  0FEA        ADD   *+,15
  CB5  103A        SUB   0x3A
  CB6  108C        SUB   *
  CB7  10E1        SUB   *+,0,AR1
  CB8  1137        SUB   0x37,1
  CB9  1190        SUB   *-,1,AR0
  CBA  11EB        SUB   *+,1
  CBB  1247        SUB   0x47,2
  CBC  12A5        SUB   *+,2,AR1
  CBD  1306        SUB   0x06,3
  CBE  1368        SUB   0x68,3
  CBF  13CD        SUB   *,3
  CC0  1433        SUB   0x33,4
  CC1  149B        SUB   *-,4
  CC2  1505        SUB   0x05,5
  CC3  1571        SUB   0x71,5
  CC4  15DE        SUB   *-,5
  CC5  164E        SUB   0x4E,6
  CC6  16BF        SUB   *+-,6
  CC7  1732        SUB   0x32,7
  CC8  17A7        SUB   *+,7,AR1
  CC9  181E        SUB   0x1E,8
  CCA  1896        SUB   *-,8,AR0
  CCB  1910        SUB   0x10,9
  CCC  198C        SUB   *,9
  CCD  1A0A        SUB   0x0A,10
  CCE  1A89        SUB   *,10
  CCF  1B0A        SUB   0x0A,11
  CD0  1B8C        SUB   *,11
  CD1  1C10        SUB   0x10,12
  CD2  1C96        SUB   *-,12,AR0
  CD3  1D1D        SUB   0x1D,13
  CD4  1DA6        SUB   *+,13,AR0
  CD5  1E30        SUB   0x30,14
  CD6  1EBC        SUB   *+-,14
  CD7  1F49        SUB   0x49,15
  CD8  1FD8        SUB   *-,15
  CD9  2068        LAC   0x68
  CDA  20FA        LAC   *+-
  CDB  218D        LAC   *,1
  CDC  2221        LAC   0x21,2
  CDD  22B7        LAC   *+-,2,AR1
  CDE  234E        LAC   0x4E,3
  CDF  23E6        LAC   *+,3,AR0
  CE0  2480        LAC   *,4,AR0
  CE1  251B        LAC   0x1B,5
  CE2  25B7        LAC   *+-,5,AR1
  CE3  2654        LAC   0x54,6
  CE4  26F3        LAC   *+-,6,AR1
  CE5  2793        LAC   *-,7,AR1
  CE6  2833        LAC   0x33,8
  CE7  28D5        LAC   *-,8,AR1
  CE8  2978        LAC   0x78,9
  CE9  2A1D        LAC   0x1D,10
  CEA  2AC2        LAC   *,10,AR0
  CEB  2B68        LAC   0x68,11
  CEC  2C0F        LAC   0x0F,12
  CED  2CB8        LAC   *+-,12
  CEE  2D61        LAC   0x61,13
  CEF  2E0B        LAC   0x0B,14
  CF0  2EB6        LAC   *+-,14,AR0
  CF1  2F61        LAC   0x61,15
  CF2  300E        SAR   AR0,0x0E
  CF3  30BC        SAR   AR0,*+-
  CF4  316A        SAR   AR1,0x6A
  CF5  3219        .word 0x3219
  CF6  32C9        .word 0x32C9
  CF7  3379        .word 0x3379
  CF8  342A        .word 0x342A
  CF9  34DC        .word 0x34DC
  CFA  358F        .word 0x358F
  CFB  3642        .word 0x3642
  CFC  36F5        .word 0x36F5
  CFD  37A9        .word 0x37A9
  CFE  385E        LAR   AR0,0x5E
  CFF  3913        LAR   AR1,0x13
  D00  39C9        LAR   AR1,*
  D01  3A7F        .word 0x3A7F
  D02  3B35        .word 0x3B35
  D03  3BEC        .word 0x3BEC
  D04  3CA4        .word 0x3CA4
  D05  3D5B        .word 0x3D5B
  D06  3E13        .word 0x3E13
  D07  3ECB        .word 0x3ECB
  D08  3F84        .word 0x3F84
  D09  403C        IN    0x3C,PA0
  D0A  40F5        IN    *+-,PA0,AR1
  D0B  41AE        IN    *+,PA1
  D0C  4267        IN    0x67,PA2
  D0D  4320        IN    0x20,PA3
  D0E  43D9        IN    *-,PA3
  D0F  4493        IN    *-,PA4,AR1
  D10  454C        IN    0x4C,PA5
  D11  4605        IN    0x05,PA6
  D12  46BF        IN    *+-,PA6
  D13  4778        IN    0x78,PA7
  D14  4831        OUT   0x31,PA0
  D15  48EA        OUT   *+,PA0
  D16  49A3        OUT   *+,PA1,AR1
  D17  4A5C        OUT   0x5C,PA2
  D18  4B14        OUT   0x14,PA3
  D19  4BCC        OUT   *,PA3
  D1A  4C84        OUT   *,PA4,AR0
  D1B  4D3C        OUT   0x3C,PA5
  D1C  4DF3        OUT   *+-,PA5,AR1
  D1D  4EAA        OUT   *+,PA6
  D1E  4F61        OUT   0x61,PA7
  D1F  5017        SACL  0x17
  D20  50CD        SACL  *
  D21  5183        SACL  *,AR1
  D22  5238        SACL  0x38
  D23  52EC        SACL  *+
  D24  53A0        SACL  *+,AR0
  D25  5453        SACL  0x53
  D26  5506        SACL  0x06
  D27  55B8        SACL  *+-
  D28  566A        SACL  0x6A
  D29  571B        SACL  0x1B
  D2A  57CB        SACL  *
  D2B  587A        SACH  0x7A
  D2C  5929        SACH  0x29,1
  D2D  59D7        SACH  *-,1,AR1
  D2E  5A84        SACH  *,2,AR0
  D2F  5B30        SACH  0x30,3
  D30  5BDB        SACH  *-,3
  D31  5C86        SACH  *,4,AR0
  D32  5D2F        SACH  0x2F,5
  D33  5DD8        SACH  *-,5
  D34  5E80        SACH  *,6,AR0
  D35  5F26        SACH  0x26,7
  D36  5FCC        SACH  *,7
  D37  6071        ADDH  0x71
  D38  6115        ADDS  0x15
  D39  61B7        ADDS  *+-,AR1
  D3A  6259        SUBH  0x59
  D3B  62F9        SUBH  *+-
  D3C  6398        SUBS  *-
  D3D  6436        SUBC  0x36
  D3E  64D3        SUBC  *-,AR1
  D3F  656E        ZALH  0x6E
  D40  6609        ZALS  0x09
  D41  66A2        ZALS  *+,AR0
  D42  6739        TBLR  0x39
  D43  67D0        TBLR  *-,AR0
  D44  6865        MAR   0x65
  D45  68F8        MAR   *+-
  D46  698B        DMOV  *
  D47  6A1C        LT    0x1C
  D48  6AAB        LT    *+
  D49  6B39        LTD   0x39
  D4A  6BC6        LTD   *,AR0
  D4B  6C51        LTA   0x51
  D4C  6CDA        LTA   *-
  D4D  6D62        MPY   0x62
  D4E  6DE9        MPY   *+
  D4F  6E6E        .word 0x6E6E
  D50  6EF1        .word 0x6EF1
  D51  6F72        LDP   0x72
  D52  6FF2        LDP   *+-,AR0
  D53  7071        LARK  AR0,0x71
  D54  70ED        LARK  AR0,0xED
  D55  7168        LARK  AR1,0x68
  D56  71E2        LARK  AR1,0xE2
  D57  7259        .word 0x7259
  D58  72CF        .word 0x72CF
  D59  7343        .word 0x7343
  D5A  73B5        .word 0x73B5
  D5B  7426        .word 0x7426
  D5C  7494        .word 0x7494
  D5D  7501        .word 0x7501
  D5E  756C        .word 0x756C
  D5F  75D5        .word 0x75D5
  D60  763C        .word 0x763C
  D61  76A1        .word 0x76A1
  D62  7704        .word 0x7704
  D63  7766        .word 0x7766
  D64  77C5        .word 0x77C5
  D65  7823        XOR   0x23
  D66  787E        XOR   0x7E
  D67  78D8        XOR   *-
  D68  792F        AND   0x2F
  D69  7985        AND   *,AR1
  D6A  79D8        AND   *-
  D6B  7A2A        OR    0x2A
  D6C  7A79        OR    0x79
  D6D  7AC7        OR    *,AR1
  D6E  7B12        LST   0x12
  D6F  7B5B        LST   0x5B
  D70  7BA2        LST   *+
  D71  7BE7        LST   *+
  D72  7C2A        SST   0xAA
  D73  7C6A        SST   0xEA
  D74  7CA9        SST   *+
  D75  7CE5        SST   *+,AR1
  D76  7D20        TBLW  0x20
  D77  7D58        TBLW  0x58
  D78  7D8E        TBLW  *
  D79  7DC1        TBLW  *,AR1
  D7A  7DF3        TBLW  *+-,AR1
  D7B  7E22        LACK  0x22
  D7C  7E4F        LACK  0x4F
  D7D  7E7A        LACK  0x7A
  D7E  7EA3        LACK  0xA3
  D7F  7EC9        LACK  0xC9
  D80  7EEE        LACK  0xEE
  D81  7F10        .word 0x7F10
  D82  7F2F        .word 0x7F2F
  D83  7F4D        .word 0x7F4D
  D84  7F68        .word 0x7F68
  D85  7F81        DINT
  D86  7F98        .word 0x7F98
  D87  7FAC        .word 0x7FAC
  D88  7FBE        .word 0x7FBE
  D89  7FCE        .word 0x7FCE
  D8A  7FDC        .word 0x7FDC
  D8B  7FE7        .word 0x7FE7
  D8C  7FF1        .word 0x7FF1
  D8D  7FF7        .word 0x7FF7
  D8E  7FFC        .word 0x7FFC
  D8F  7FFE        .word 0x7FFE
  D90  5A82        SACH  *,2,AR0
  D91  1A92        SUB   *-,10,AR0
  D92  BA3B        .word 0xBA3B
  D93  D3DA        .word 0xD3DA
  D94  0DAC        ADD   *+,13
  D95  BB55        .word 0xBB55
  D96  0E5A        ADD   0x5A,14
