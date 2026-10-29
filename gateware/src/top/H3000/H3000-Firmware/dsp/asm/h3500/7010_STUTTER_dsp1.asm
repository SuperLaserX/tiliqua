; Eventide h3500 DSP microcode
; key 7010  algorithm 70 (STUTTER)  DSP 1
; source H3000-Upgrade_ROM4.BIN offset 377A3, 458 program words loaded at 800
;
  800  6880        LARP  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6E00        LDPK  0
  804  7E01        LACK  0x01
  805  5008        SACL  0x08
  806  5047        SACL  0x47
  807  2808        LAC   0x08,8
  808  5006        SACL  0x06
  809  2E08        LAC   0x08,14
  80A  500B        SACL  0x0B
  80B  2208        LAC   0x08,2
  80C  5007        SACL  0x07
  80D  2F08        LAC   0x08,15
  80E  500D        SACL  0x0D
  80F  5013        SACL  0x13
  810  7F89        ZAC
  811  500A        SACL  0x0A
  812  5022        SACL  0x22
  813  5049        SACL  0x49
  814  1008        SUB   0x08
  815  5809        SACH  0x09
  816  5820        SACH  0x20
  817  7EFF        LACK  0xFF
  818  5016        SACL  0x16
  819  5041        SACL  0x41
  81A  5042        SACL  0x42
  81B  500F        SACL  0x0F
  81C  5002        SACL  0x02
  81D  2702        LAC   0x02,7
  81E  7A02        OR    0x02
  81F  500C        SACL  0x0C
  820  7000        LARK  AR0,0x00
  821  650C        ZALH  0x0C
  822  5818        SACH  0x18
  823  F800 0994   CALL  L994
L825:
  825  F600 0829   BIOZ  L829
  827  F900 0825   B     L825

L829:
  829  4002        IN    0x02,PA0
  82A  6502        ZALH  0x02
  82B  FD00 082E   BGEZ  L82E
  82D  7F80        NOP
L82E:
  82E  F600 082E   BIOZ  L82E
L830:
  830  7F80        NOP
  831  7F80        NOP
  832  7F80        NOP
  833  7F80        NOP
  834  6616        ZALS  0x16
  835  6322        SUBS  0x22
  836  FA00 0939   BLZ   L939
  838  4310        IN    0x10,PA3
  839  6310        SUBS  0x10
  83A  7F80        NOP
  83B  FC00 093E   BGZ   L93E
  83D  4002        IN    0x02,PA0
  83E  6607        ZALS  0x07
  83F  7902        AND   0x02
  840  FE00 0844   BNZ   L844
  842  F900 0845   B     L845

L844:
  844  4EA8        OUT   *+,PA6
L845:
  845  7F80        NOP
  846  7F80        NOP
  847  4211        IN    0x11,PA2
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
  85C  4002        IN    0x02,PA0
  85D  6607        ZALS  0x07
  85E  7902        AND   0x02
  85F  FE00 0863   BNZ   L863
  861  F900 0864   B     L864

L863:
  863  4EA8        OUT   *+,PA6
L864:
  864  3003        SAR   AR0,0x03
  865  6616        ZALS  0x16
  866  6303        SUBS  0x03
  867  6147        ADDS  0x47
  868  6111        ADDS  0x11
  869  5014        SACL  0x14
  86A  4502        IN    0x02,PA5
  86B  6881        LARP  1
  86C  6602        ZALS  0x02
  86D  7906        AND   0x06
  86E  FE00 0873   BNZ   L873
  870  6880        LARP  0
  871  F900 0875   B     L875

L873:
  873  3902        LAR   AR1,0x02
  874  4680        IN    *,PA6,AR0
L875:
  875  380A        LAR   AR0,0x0A
  876  4F14        OUT   0x14,PA7
  877  4401        IN    0x01,PA4
  878  4400        IN    0x00,PA4
  879  6614        ZALS  0x14
  87A  6311        SUBS  0x11
  87B  5016        SACL  0x16
  87C  7F80        NOP
  87D  6549        ZALH  0x49
  87E  FC00 08A2   BGZ   L8A2
  880  4002        IN    0x02,PA0
  881  6607        ZALS  0x07
  882  7902        AND   0x02
  883  FE00 0887   BNZ   L887
  885  F900 0888   B     L888

L887:
  887  4EA8        OUT   *+,PA6
L888:
  888  6520        ZALH  0x20
  889  FD00 0899   BGEZ  L899
  88B  6622        ZALS  0x22
  88C  6341        SUBS  0x41
  88D  FC00 0894   BGZ   L894
  88F  6641        ZALS  0x41
  890  5022        SACL  0x22
  891  7F80        NOP
  892  F900 0830   B     L830

L894:
  894  6622        ZALS  0x22
  895  104A        SUB   0x4A
  896  5022        SACL  0x22
  897  F900 0830   B     L830

L899:
  899  6611        ZALS  0x11
  89A  6148        ADDS  0x48
  89B  6321        SUBS  0x21
  89C  7909        AND   0x09
  89D  1508        SUB   0x08,5
  89E  5820        SACH  0x20
  89F  7F80        NOP
  8A0  F900 0830   B     L830

L8A2:
  8A2  4002        IN    0x02,PA0
  8A3  6607        ZALS  0x07
  8A4  7902        AND   0x02
  8A5  FE00 08A9   BNZ   L8A9
  8A7  F900 08AA   B     L8AA

L8A9:
  8A9  4EA8        OUT   *+,PA6
L8AA:
  8AA  6520        ZALH  0x20
  8AB  FA00 08B6   BLZ   L8B6
  8AD  6611        ZALS  0x11
  8AE  6148        ADDS  0x48
  8AF  6321        SUBS  0x21
  8B0  7909        AND   0x09
  8B1  1508        SUB   0x08,5
  8B2  5820        SACH  0x20
  8B3  7F80        NOP
  8B4  F900 0830   B     L830

L8B6:
  8B6  6549        ZALH  0x49
  8B7  6208        SUBH  0x08
  8B8  5849        SACH  0x49
  8B9  7F89        ZAC
  8BA  6248        SUBH  0x48
  8BB  5810        SACH  0x10
  8BC  6648        ZALS  0x48
  8BD  6122        ADDS  0x22
  8BE  5022        SACL  0x22
  8BF  6508        ZALH  0x08
  8C0  5820        SACH  0x20
  8C1  6511        ZALH  0x11
  8C2  5821        SACH  0x21
  8C3  7F80        NOP
  8C4  7F80        NOP
  8C5  7F80        NOP
  8C6  7F80        NOP
  8C7  7F80        NOP
  8C8  7F80        NOP
  8C9  7F80        NOP
  8CA  7F80        NOP
  8CB  F900 093E   B     L93E

L8CD:
  8CD  4002        IN    0x02,PA0
  8CE  6607        ZALS  0x07
  8CF  7902        AND   0x02
  8D0  FE00 08D4   BNZ   L8D4
  8D2  F900 08D5   B     L8D5

L8D4:
  8D4  4EA8        OUT   *+,PA6
L8D5:
  8D5  7F80        NOP
  8D6  7F80        NOP
  8D7  4211        IN    0x11,PA2
  8D8  7F80        NOP
  8D9  7F80        NOP
  8DA  7F80        NOP
  8DB  7F80        NOP
  8DC  7F80        NOP
  8DD  7F80        NOP
  8DE  7F80        NOP
  8DF  7F80        NOP
  8E0  7F80        NOP
  8E1  7F80        NOP
  8E2  7F80        NOP
  8E3  7F80        NOP
  8E4  7F80        NOP
  8E5  6518        ZALH  0x18
  8E6  6042        ADDH  0x42
  8E7  5818        SACH  0x18
  8E8  6518        ZALH  0x18
  8E9  620C        SUBH  0x0C
  8EA  5823        SACH  0x23
  8EB  7F80        NOP
  8EC  4002        IN    0x02,PA0
  8ED  6607        ZALS  0x07
  8EE  7902        AND   0x02
  8EF  FE00 08F3   BNZ   L8F3
  8F1  F900 08F4   B     L8F4

L8F3:
  8F3  4EA8        OUT   *+,PA6
L8F4:
  8F4  3003        SAR   AR0,0x03
  8F5  6616        ZALS  0x16
  8F6  6303        SUBS  0x03
  8F7  6147        ADDS  0x47
  8F8  5016        SACL  0x16
  8F9  6111        ADDS  0x11
  8FA  5014        SACL  0x14
  8FB  000F        ADD   0x0F
  8FC  5015        SACL  0x15
  8FD  380A        LAR   AR0,0x0A
  8FE  7F80        NOP
  8FF  4F14        OUT   0x14,PA7
  900  441B        IN    0x1B,PA4
  901  441A        IN    0x1A,PA4
  902  4F15        OUT   0x15,PA7
  903  441D        IN    0x1D,PA4
  904  441C        IN    0x1C,PA4
  905  6A18        LT    0x18
  906  6D1A        MPY   0x1A
  907  7F8E        PAC
  908  6D1C        MPY   0x1C
  909  7F90        SPAC
  90A  0F1C        ADD   0x1C,15
  90B  5900        SACH  0x00,1
  90C  4002        IN    0x02,PA0
  90D  6607        ZALS  0x07
  90E  7902        AND   0x02
  90F  FE00 0913   BNZ   L913
  911  F900 0914   B     L914

L913:
  913  4EA8        OUT   *+,PA6
L914:
  914  7F80        NOP
  915  7F80        NOP
  916  6A18        LT    0x18
  917  6D1B        MPY   0x1B
  918  7F8E        PAC
  919  6D1D        MPY   0x1D
  91A  7F90        SPAC
  91B  0F1D        ADD   0x1D,15
  91C  5901        SACH  0x01,1
  91D  6523        ZALH  0x23
  91E  FF00 0830   BZ    L830
L920:
  920  6520        ZALH  0x20
  921  FD00 092E   BGEZ  L92E
  923  7F80        NOP
  924  7F80        NOP
  925  7F80        NOP
  926  7F80        NOP
  927  7F80        NOP
  928  7F80        NOP
  929  7F80        NOP
  92A  7F80        NOP
  92B  7F80        NOP
  92C  F900 08CD   B     L8CD

L92E:
  92E  6611        ZALS  0x11
  92F  6148        ADDS  0x48
  930  6321        SUBS  0x21
  931  7909        AND   0x09
  932  1508        SUB   0x08,5
  933  5820        SACH  0x20
  934  7F80        NOP
  935  7F80        NOP
  936  7F80        NOP
  937  F900 08CD   B     L8CD

L939:
  939  4310        IN    0x10,PA3
  93A  7F89        ZAC
  93B  6210        SUBH  0x10
  93C  5810        SACH  0x10
  93D  7F80        NOP
L93E:
  93E  4002        IN    0x02,PA0
  93F  6607        ZALS  0x07
  940  7902        AND   0x02
  941  FE00 0945   BNZ   L945
  943  F900 0946   B     L946

L945:
  945  4EA8        OUT   *+,PA6
L946:
  946  7F80        NOP
  947  7F80        NOP
  948  4211        IN    0x11,PA2
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
  953  7F80        NOP
  954  7F80        NOP
  955  7F80        NOP
  956  7F80        NOP
  957  7F80        NOP
  958  7F80        NOP
  959  7F80        NOP
  95A  7F80        NOP
  95B  7F89        ZAC
  95C  5818        SACH  0x18
  95D  4002        IN    0x02,PA0
  95E  6607        ZALS  0x07
  95F  7902        AND   0x02
  960  FE00 0964   BNZ   L964
  962  F900 0965   B     L965

L964:
  964  4EA8        OUT   *+,PA6
L965:
  965  3003        SAR   AR0,0x03
  966  6616        ZALS  0x16
  967  6303        SUBS  0x03
  968  6147        ADDS  0x47
  969  5016        SACL  0x16
  96A  6111        ADDS  0x11
  96B  5014        SACL  0x14
  96C  7F80        NOP
  96D  7F80        NOP
  96E  380A        LAR   AR0,0x0A
  96F  7F80        NOP
  970  4F14        OUT   0x14,PA7
  971  4401        IN    0x01,PA4
  972  4400        IN    0x00,PA4
  973  6616        ZALS  0x16
  974  1010        SUB   0x10
  975  5016        SACL  0x16
  976  6610        ZALS  0x10
  977  500F        SACL  0x0F
  978  7F80        NOP
  979  7F80        NOP
  97A  7F80        NOP
  97B  7F80        NOP
  97C  7F80        NOP
  97D  7F80        NOP
  97E  7F80        NOP
  97F  7F80        NOP
  980  4002        IN    0x02,PA0
  981  6607        ZALS  0x07
  982  7902        AND   0x02
  983  FE00 0987   BNZ   L987
  985  F900 0988   B     L988

L987:
  987  4EA8        OUT   *+,PA6
L988:
  988  7F80        NOP
  989  7F80        NOP
  98A  7F80        NOP
  98B  7F80        NOP
  98C  7F80        NOP
  98D  7F80        NOP
  98E  7F80        NOP
  98F  7F80        NOP
  990  7F80        NOP
  991  7F80        NOP
  992  F900 0920   B     L920

L994:
  994  F600 0998   BIOZ  L998
  996  F900 0994   B     L994

L998:
  998  4002        IN    0x02,PA0
  999  6502        ZALH  0x02
  99A  FD00 099D   BGEZ  L99D
  99C  7F80        NOP
L99D:
  99D  F600 099D   BIOZ  L99D
  99F  7F80        NOP
  9A0  7F89        ZAC
  9A1  5004        SACL  0x04
  9A2  5005        SACL  0x05
  9A3  7F80        NOP
  9A4  7F80        NOP
  9A5  7F80        NOP
  9A6  7F80        NOP
  9A7  7F80        NOP
  9A8  7F80        NOP
  9A9  7F80        NOP
  9AA  7F80        NOP
  9AB  7F80        NOP
  9AC  7F80        NOP
  9AD  7F80        NOP
  9AE  7F80        NOP
  9AF  7F80        NOP
  9B0  7F80        NOP
L9B1:
  9B1  4F04        OUT   0x04,PA7
  9B2  4C05        OUT   0x05,PA4
  9B3  0008        ADD   0x08
  9B4  5004        SACL  0x04
  9B5  4502        IN    0x02,PA5
  9B6  6881        LARP  1
  9B7  6602        ZALS  0x02
  9B8  7906        AND   0x06
  9B9  FE00 09BE   BNZ   L9BE
  9BB  6880        LARP  0
  9BC  F900 09C0   B     L9C0

L9BE:
  9BE  3902        LAR   AR1,0x02
  9BF  4680        IN    *,PA6,AR0
L9C0:
  9C0  4F04        OUT   0x04,PA7
  9C1  4C05        OUT   0x05,PA4
  9C2  6604        ZALS  0x04
  9C3  0008        ADD   0x08
  9C4  5004        SACL  0x04
  9C5  6604        ZALS  0x04
  9C6  FE00 09B1   BNZ   L9B1
  9C8  6E00        LDPK  0
  9C9  7F8D        RET

