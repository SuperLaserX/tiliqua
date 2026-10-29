; Eventide h3500 DSP microcode
; key 0411  algorithm 04 (program 04)  DSP 2
; source H3000-Upgrade_ROM2.BIN offset 0ED66, 541 program words loaded at 800
;
  800  6880        LARP  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6E00        LDPK  0
  804  7E01        LACK  0x01
  805  5006        SACL  0x06
  806  5047        SACL  0x47
  807  2906        LAC   0x06,9
  808  5004        SACL  0x04
  809  2E06        LAC   0x06,14
  80A  5009        SACL  0x09
  80B  2206        LAC   0x06,2
  80C  5005        SACL  0x05
  80D  2F06        LAC   0x06,15
  80E  500B        SACL  0x0B
  80F  5011        SACL  0x11
  810  7F89        ZAC
  811  5008        SACL  0x08
  812  1006        SUB   0x06
  813  5807        SACH  0x07
  814  7EFF        LACK  0xFF
  815  5015        SACL  0x15
  816  5041        SACL  0x41
  817  5042        SACL  0x42
  818  500D        SACL  0x0D
  819  5002        SACL  0x02
  81A  2702        LAC   0x02,7
  81B  7A02        OR    0x02
  81C  500A        SACL  0x0A
L81D:
  81D  F600 0821   BIOZ  L821
  81F  F900 081D   B     L81D

L821:
  821  F600 0821   BIOZ  L821
  823  4002        IN    0x02,PA0
  824  6502        ZALH  0x02
  825  FD00 0828   BGEZ  L828
  827  7F80        NOP
L828:
  828  F600 082C   BIOZ  L82C
  82A  F900 0828   B     L828

L82C:
  82C  F600 082C   BIOZ  L82C
  82E  7F80        NOP
  82F  7F80        NOP
  830  7F80        NOP
  831  6615        ZALS  0x15
  832  0006        ADD   0x06
  833  5015        SACL  0x15
  834  7F89        ZAC
  835  5003        SACL  0x03
  836  5000        SACL  0x00
  837  5001        SACL  0x01
  838  500C        SACL  0x0C
  839  500F        SACL  0x0F
L83A:
  83A  7F80        NOP
  83B  7F80        NOP
  83C  7F80        NOP
  83D  7F80        NOP
  83E  0006        ADD   0x06
  83F  5003        SACL  0x03
  840  4502        IN    0x02,PA5
  841  6881        LARP  1
  842  6602        ZALS  0x02
  843  7904        AND   0x04
  844  FE00 0849   BNZ   L849
  846  6880        LARP  0
  847  F900 084B   B     L84B

L849:
  849  3902        LAR   AR1,0x02
  84A  4680        IN    *,PA6,AR0
L84B:
  84B  7F80        NOP
  84C  7F80        NOP
  84D  7F80        NOP
  84E  7F80        NOP
  84F  6603        ZALS  0x03
  850  0006        ADD   0x06
  851  5003        SACL  0x03
  852  6603        ZALS  0x03
  853  FE00 083A   BNZ   L83A
L855:
  855  F600 0859   BIOZ  L859
  857  F900 0855   B     L855

L859:
  859  F600 0859   BIOZ  L859
  85B  4002        IN    0x02,PA0
  85C  6502        ZALH  0x02
  85D  FD00 0860   BGEZ  L860
  85F  7F80        NOP
L860:
  860  7000        LARK  AR0,0x00
  861  650A        ZALH  0x0A
  862  5817        SACH  0x17
  863  7F80        NOP
  864  6543        ZALH  0x43
  865  6208        SUBH  0x08
  866  FF00 086F   BZ    L86F
  868  6545        ZALH  0x45
  869  6208        SUBH  0x08
  86A  FF00 086F   BZ    L86F
  86C  F900 0879   B     L879

  86E  410E        IN    0x0E,PA1
L86F:
  86F  6A06        LT    0x06
  870  886E        MPYK  2158
  871  7F8E        PAC
  872  6702        TBLR  0x02
  873  8900        MPYK  2304
  874  7F8E        PAC
  875  7D02        TBLW  0x02
  876  89C5        MPYK  2501
  877  7F8E        PAC
  878  7D02        TBLW  0x02
L879:
  879  6544        ZALH  0x44
  87A  6208        SUBH  0x08
  87B  FF00 0886   BZ    L886
  87D  6545        ZALH  0x45
  87E  6208        SUBH  0x08
  87F  FF00 0886   BZ    L886
  881  7F89        ZAC
  882  5011        SACL  0x11
  883  F900 0896   B     L896

  885  4C0C        OUT   0x0C,PA4
L886:
  886  2F06        LAC   0x06,15
  887  5011        SACL  0x11
  888  6A06        LT    0x06
  889  8885        MPYK  2181
  88A  7F8E        PAC
  88B  6702        TBLR  0x02
  88C  8910        MPYK  2320
  88D  7F8E        PAC
  88E  7D02        TBLW  0x02
  88F  8964        MPYK  2404
  890  7F8E        PAC
  891  7D02        TBLW  0x02
  892  89D5        MPYK  2517
  893  7F8E        PAC
  894  7D02        TBLW  0x02
  895  7F80        NOP
L896:
  896  6545        ZALH  0x45
  897  6208        SUBH  0x08
  898  FF00 089D   BZ    L89D
  89A  F900 08A5   B     L8A5

  89C  6618        ZALS  0x18
L89D:
  89D  6A06        LT    0x06
  89E  889C        MPYK  2204
  89F  7F8E        PAC
  8A0  6702        TBLR  0x02
  8A1  88FC        MPYK  2300
  8A2  7F8E        PAC
  8A3  7D02        TBLW  0x02
  8A4  7F80        NOP
L8A5:
  8A5  6546        ZALH  0x46
  8A6  6208        SUBH  0x08
  8A7  FF00 08B3   BZ    L8B3
  8A9  F900 08F3   B     L8F3

  8AB  6103        ADDS  0x03
  8AC  630E        SUBS  0x0E
  8AD  4400        IN    0x00,PA4
  8AE  4401        IN    0x01,PA4
  8AF  441A        IN    0x1A,PA4
  8B0  441B        IN    0x1B,PA4
  8B1  441C        IN    0x1C,PA4
  8B2  441D        IN    0x1D,PA4
L8B3:
  8B3  6A06        LT    0x06
  8B4  88AB        MPYK  2219
  8B5  7F8E        PAC
  8B6  6702        TBLR  0x02
  8B7  892B        MPYK  2347
  8B8  7F8E        PAC
  8B9  7D02        TBLW  0x02
  8BA  897F        MPYK  2431
  8BB  7F8E        PAC
  8BC  7D02        TBLW  0x02
  8BD  89F0        MPYK  2544
  8BE  7F8E        PAC
  8BF  7D02        TBLW  0x02
  8C0  88AC        MPYK  2220
  8C1  7F8E        PAC
  8C2  6702        TBLR  0x02
  8C3  89FD        MPYK  2557
  8C4  7F8E        PAC
  8C5  7D02        TBLW  0x02
  8C6  88AD        MPYK  2221
  8C7  7F8E        PAC
  8C8  6702        TBLR  0x02
  8C9  893C        MPYK  2364
  8CA  7F8E        PAC
  8CB  7D02        TBLW  0x02
  8CC  89FA        MPYK  2554
  8CD  7F8E        PAC
  8CE  7D02        TBLW  0x02
  8CF  88AE        MPYK  2222
  8D0  7F8E        PAC
  8D1  6702        TBLR  0x02
  8D2  893D        MPYK  2365
  8D3  7F8E        PAC
  8D4  7D02        TBLW  0x02
  8D5  89FB        MPYK  2555
  8D6  7F8E        PAC
  8D7  7D02        TBLW  0x02
  8D8  88AF        MPYK  2223
  8D9  7F8E        PAC
  8DA  6702        TBLR  0x02
  8DB  8989        MPYK  2441
  8DC  7F8E        PAC
  8DD  7D02        TBLW  0x02
  8DE  88B0        MPYK  2224
  8DF  7F8E        PAC
  8E0  6702        TBLR  0x02
  8E1  898A        MPYK  2442
  8E2  7F8E        PAC
  8E3  7D02        TBLW  0x02
  8E4  88B1        MPYK  2225
  8E5  7F8E        PAC
  8E6  6702        TBLR  0x02
  8E7  898C        MPYK  2444
  8E8  7F8E        PAC
  8E9  7D02        TBLW  0x02
  8EA  88B2        MPYK  2226
  8EB  7F8E        PAC
  8EC  6702        TBLR  0x02
  8ED  898D        MPYK  2445
  8EE  7F8E        PAC
  8EF  7D02        TBLW  0x02
  8F0  7F89        ZAC
  8F1  5041        SACL  0x41
  8F2  7F80        NOP
L8F3:
  8F3  F600 08F7   BIOZ  L8F7
  8F5  F900 08F3   B     L8F3

L8F7:
  8F7  F600 08F7   BIOZ  L8F7
L8F9:
  8F9  7F80        NOP
  8FA  7F80        NOP
  8FB  4318        IN    0x18,PA3
  8FC  6615        ZALS  0x15
  8FD  6341        SUBS  0x41
  8FE  FA00 09C5   BLZ   L9C5
  900  430E        IN    0x0E,PA3
  901  630E        SUBS  0x0E
  902  7F80        NOP
  903  FC00 09CA   BGZ   L9CA
L905:
  905  4002        IN    0x02,PA0
  906  6605        ZALS  0x05
  907  7902        AND   0x02
  908  FE00 090C   BNZ   L90C
  90A  F900 090D   B     L90D

L90C:
  90C  4EA8        OUT   *+,PA6
L90D:
  90D  470C        IN    0x0C,PA7
  90E  420F        IN    0x0F,PA2
  90F  4F10        OUT   0x10,PA7
  910  471E        IN    0x1E,PA7
  911  7F80        NOP
  912  7F80        NOP
  913  7F80        NOP
  914  7F80        NOP
  915  7F80        NOP
  916  7F80        NOP
  917  7F80        NOP
  918  7F80        NOP
  919  7F80        NOP
  91A  7F80        NOP
  91B  7F80        NOP
  91C  7F80        NOP
  91D  7F80        NOP
  91E  660F        ZALS  0x0F
  91F  6111        ADDS  0x11
  920  5010        SACL  0x10
  921  4002        IN    0x02,PA0
  922  6605        ZALS  0x05
  923  7902        AND   0x02
  924  FE00 0928   BNZ   L928
  926  F900 0929   B     L929

L928:
  928  4EA8        OUT   *+,PA6
L929:
  929  3003        SAR   AR0,0x03
  92A  6615        ZALS  0x15
  92B  6303        SUBS  0x03
  92C  6147        ADDS  0x47
  92D  6110        ADDS  0x10
  92E  5012        SACL  0x12
  92F  4502        IN    0x02,PA5
  930  6881        LARP  1
  931  6602        ZALS  0x02
  932  7904        AND   0x04
  933  FE00 0938   BNZ   L938
  935  6880        LARP  0
  936  F900 093A   B     L93A

L938:
  938  3902        LAR   AR1,0x02
  939  4680        IN    *,PA6,AR0
L93A:
  93A  3808        LAR   AR0,0x08
  93B  4F12        OUT   0x12,PA7
  93C  4401        IN    0x01,PA4
  93D  4400        IN    0x00,PA4
  93E  6612        ZALS  0x12
  93F  6310        SUBS  0x10
  940  5015        SACL  0x15
  941  7F80        NOP
  942  7F80        NOP
  943  7F80        NOP
  944  7F80        NOP
  945  4002        IN    0x02,PA0
  946  6605        ZALS  0x05
  947  7902        AND   0x02
  948  FE00 094C   BNZ   L94C
  94A  F900 094D   B     L94D

L94C:
  94C  4EA8        OUT   *+,PA6
L94D:
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
  957  F900 08F9   B     L8F9

L959:
  959  4002        IN    0x02,PA0
  95A  6605        ZALS  0x05
  95B  7902        AND   0x02
  95C  FE00 0960   BNZ   L960
  95E  F900 0961   B     L961

L960:
  960  4EA8        OUT   *+,PA6
L961:
  961  470C        IN    0x0C,PA7
  962  420F        IN    0x0F,PA2
  963  4F10        OUT   0x10,PA7
  964  471E        IN    0x1E,PA7
  965  7F80        NOP
  966  7F80        NOP
  967  7F80        NOP
  968  7F80        NOP
  969  7F80        NOP
  96A  7F80        NOP
  96B  7F80        NOP
  96C  7F80        NOP
  96D  7F80        NOP
  96E  7F80        NOP
  96F  660F        ZALS  0x0F
  970  6111        ADDS  0x11
  971  5010        SACL  0x10
  972  6517        ZALH  0x17
  973  6042        ADDH  0x42
  974  5817        SACH  0x17
  975  4002        IN    0x02,PA0
  976  6605        ZALS  0x05
  977  7902        AND   0x02
  978  FE00 097C   BNZ   L97C
  97A  F900 097D   B     L97D

L97C:
  97C  4EA8        OUT   *+,PA6
L97D:
  97D  3003        SAR   AR0,0x03
  97E  6615        ZALS  0x15
  97F  6303        SUBS  0x03
  980  6147        ADDS  0x47
  981  5015        SACL  0x15
  982  6110        ADDS  0x10
  983  5012        SACL  0x12
  984  000D        ADD   0x0D
  985  5013        SACL  0x13
  986  3808        LAR   AR0,0x08
  987  7F80        NOP
  988  4F12        OUT   0x12,PA7
  989  441B        IN    0x1B,PA4
  98A  441A        IN    0x1A,PA4
  98B  4F13        OUT   0x13,PA7
  98C  441D        IN    0x1D,PA4
  98D  441C        IN    0x1C,PA4
  98E  6A17        LT    0x17
  98F  6D1A        MPY   0x1A
  990  7F8E        PAC
  991  6D1C        MPY   0x1C
  992  7F90        SPAC
  993  0F1C        ADD   0x1C,15
  994  5900        SACH  0x00,1
  995  4002        IN    0x02,PA0
  996  6605        ZALS  0x05
  997  7902        AND   0x02
  998  FE00 099C   BNZ   L99C
  99A  F900 099D   B     L99D

L99C:
  99C  4EA8        OUT   *+,PA6
L99D:
  99D  6A17        LT    0x17
  99E  6D1B        MPY   0x1B
  99F  7F8E        PAC
  9A0  6D1D        MPY   0x1D
  9A1  7F90        SPAC
  9A2  0F1D        ADD   0x1D,15
  9A3  5901        SACH  0x01,1
  9A4  7F80        NOP
  9A5  6517        ZALH  0x17
  9A6  620A        SUBH  0x0A
  9A7  FF00 09B7   BZ    L9B7
L9A9:
  9A9  7F80        NOP
  9AA  7F80        NOP
  9AB  7F80        NOP
  9AC  7F80        NOP
  9AD  7F80        NOP
  9AE  7F80        NOP
  9AF  7F80        NOP
  9B0  7F80        NOP
  9B1  7F80        NOP
  9B2  7F80        NOP
  9B3  7F80        NOP
  9B4  7F80        NOP
  9B5  F900 0959   B     L959

L9B7:
  9B7  7F80        NOP
  9B8  7F80        NOP
  9B9  7F80        NOP
  9BA  7F80        NOP
  9BB  7F80        NOP
  9BC  7F80        NOP
  9BD  7F80        NOP
  9BE  7F80        NOP
  9BF  7F80        NOP
  9C0  7F80        NOP
  9C1  7F80        NOP
  9C2  7F80        NOP
  9C3  F900 0905   B     L905

L9C5:
  9C5  430E        IN    0x0E,PA3
  9C6  7F89        ZAC
  9C7  620E        SUBH  0x0E
  9C8  580E        SACH  0x0E
  9C9  7F80        NOP
L9CA:
  9CA  4002        IN    0x02,PA0
  9CB  6605        ZALS  0x05
  9CC  7902        AND   0x02
  9CD  FE00 09D1   BNZ   L9D1
  9CF  F900 09D2   B     L9D2

L9D1:
  9D1  4EA8        OUT   *+,PA6
L9D2:
  9D2  470C        IN    0x0C,PA7
  9D3  420F        IN    0x0F,PA2
  9D4  4F10        OUT   0x10,PA7
  9D5  471E        IN    0x1E,PA7
  9D6  7F80        NOP
  9D7  7F80        NOP
  9D8  7F80        NOP
  9D9  7F80        NOP
  9DA  7F80        NOP
  9DB  7F80        NOP
  9DC  7F80        NOP
  9DD  7F80        NOP
  9DE  7F80        NOP
  9DF  7F80        NOP
  9E0  660F        ZALS  0x0F
  9E1  6111        ADDS  0x11
  9E2  5010        SACL  0x10
  9E3  7F80        NOP
  9E4  7F89        ZAC
  9E5  5817        SACH  0x17
  9E6  4002        IN    0x02,PA0
  9E7  6605        ZALS  0x05
  9E8  7902        AND   0x02
  9E9  FE00 09ED   BNZ   L9ED
  9EB  F900 09EE   B     L9EE

L9ED:
  9ED  4EA8        OUT   *+,PA6
L9EE:
  9EE  3003        SAR   AR0,0x03
  9EF  6615        ZALS  0x15
  9F0  6303        SUBS  0x03
  9F1  6147        ADDS  0x47
  9F2  5015        SACL  0x15
  9F3  6110        ADDS  0x10
  9F4  5012        SACL  0x12
  9F5  7F80        NOP
  9F6  7F80        NOP
  9F7  3808        LAR   AR0,0x08
  9F8  7F80        NOP
  9F9  4F12        OUT   0x12,PA7
  9FA  4401        IN    0x01,PA4
  9FB  4400        IN    0x00,PA4
  9FC  6615        ZALS  0x15
  9FD  100E        SUB   0x0E
  9FE  5015        SACL  0x15
  9FF  660E        ZALS  0x0E
  A00  500D        SACL  0x0D
  A01  7F80        NOP
  A02  7F80        NOP
  A03  7F80        NOP
  A04  7F80        NOP
  A05  7F80        NOP
  A06  7F80        NOP
  A07  7F80        NOP
  A08  7F80        NOP
  A09  4002        IN    0x02,PA0
  A0A  6605        ZALS  0x05
  A0B  7902        AND   0x02
  A0C  FE00 0A10   BNZ   LA10
  A0E  F900 0A11   B     LA11

LA10:
  A10  4EA8        OUT   *+,PA6
LA11:
  A11  7F80        NOP
  A12  7F80        NOP
  A13  7F80        NOP
  A14  7F80        NOP
  A15  7F80        NOP
  A16  7F80        NOP
  A17  7F80        NOP
  A18  7F80        NOP
  A19  7F80        NOP
  A1A  7F80        NOP
  A1B  F900 09A9   B     L9A9

