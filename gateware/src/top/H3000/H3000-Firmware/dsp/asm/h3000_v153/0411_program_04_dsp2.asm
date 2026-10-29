; Eventide h3000_v153 DSP microcode
; key 0411  algorithm 04 (program 04)  DSP 2
; source H3000_153_BigROM.BIN offset 0FBEF, 449 program words loaded at 800
;
  800  6880        LARP  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6E00        LDPK  0
  804  7E01        LACK  0x01
  805  5006        SACL  0x06
  806  5046        SACL  0x46
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
  873  88B2        MPYK  2226
  874  7F8E        PAC
  875  7D02        TBLW  0x02
  876  8969        MPYK  2409
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
  88C  88C2        MPYK  2242
  88D  7F8E        PAC
  88E  7D02        TBLW  0x02
  88F  8916        MPYK  2326
  890  7F8E        PAC
  891  7D02        TBLW  0x02
  892  8979        MPYK  2425
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
  8A1  88AE        MPYK  2222
  8A2  7F8E        PAC
  8A3  7D02        TBLW  0x02
  8A4  7F80        NOP
L8A5:
  8A5  F600 08A9   BIOZ  L8A9
  8A7  F900 08A5   B     L8A5

L8A9:
  8A9  F600 08A9   BIOZ  L8A9
L8AB:
  8AB  7F80        NOP
  8AC  7F80        NOP
  8AD  4318        IN    0x18,PA3
  8AE  6615        ZALS  0x15
  8AF  6341        SUBS  0x41
  8B0  FA00 0969   BLZ   L969
  8B2  430E        IN    0x0E,PA3
  8B3  630E        SUBS  0x0E
  8B4  7F80        NOP
  8B5  FC00 096E   BGZ   L96E
  8B7  4002        IN    0x02,PA0
  8B8  6605        ZALS  0x05
  8B9  7902        AND   0x02
  8BA  FE00 08BE   BNZ   L8BE
  8BC  F900 08BF   B     L8BF

L8BE:
  8BE  4EA8        OUT   *+,PA6
L8BF:
  8BF  470C        IN    0x0C,PA7
  8C0  420F        IN    0x0F,PA2
  8C1  4F10        OUT   0x10,PA7
  8C2  471E        IN    0x1E,PA7
  8C3  7F80        NOP
  8C4  7F80        NOP
  8C5  7F80        NOP
  8C6  7F80        NOP
  8C7  7F80        NOP
  8C8  7F80        NOP
  8C9  7F80        NOP
  8CA  7F80        NOP
  8CB  7F80        NOP
  8CC  7F80        NOP
  8CD  7F80        NOP
  8CE  7F80        NOP
  8CF  7F80        NOP
  8D0  660F        ZALS  0x0F
  8D1  6111        ADDS  0x11
  8D2  5010        SACL  0x10
  8D3  4002        IN    0x02,PA0
  8D4  6605        ZALS  0x05
  8D5  7902        AND   0x02
  8D6  FE00 08DA   BNZ   L8DA
  8D8  F900 08DB   B     L8DB

L8DA:
  8DA  4EA8        OUT   *+,PA6
L8DB:
  8DB  3003        SAR   AR0,0x03
  8DC  6615        ZALS  0x15
  8DD  6303        SUBS  0x03
  8DE  6146        ADDS  0x46
  8DF  6110        ADDS  0x10
  8E0  5012        SACL  0x12
  8E1  4502        IN    0x02,PA5
  8E2  6881        LARP  1
  8E3  6602        ZALS  0x02
  8E4  7904        AND   0x04
  8E5  FE00 08EA   BNZ   L8EA
  8E7  6880        LARP  0
  8E8  F900 08EC   B     L8EC

L8EA:
  8EA  3902        LAR   AR1,0x02
  8EB  4680        IN    *,PA6,AR0
L8EC:
  8EC  3808        LAR   AR0,0x08
  8ED  4F12        OUT   0x12,PA7
  8EE  4401        IN    0x01,PA4
  8EF  4400        IN    0x00,PA4
  8F0  6612        ZALS  0x12
  8F1  6310        SUBS  0x10
  8F2  5015        SACL  0x15
  8F3  7F80        NOP
  8F4  7F80        NOP
  8F5  7F80        NOP
  8F6  7F80        NOP
  8F7  4002        IN    0x02,PA0
  8F8  6605        ZALS  0x05
  8F9  7902        AND   0x02
  8FA  FE00 08FE   BNZ   L8FE
  8FC  F900 08FF   B     L8FF

L8FE:
  8FE  4EA8        OUT   *+,PA6
L8FF:
  8FF  7F80        NOP
  900  7F80        NOP
  901  7F80        NOP
  902  7F80        NOP
  903  7F80        NOP
  904  7F80        NOP
  905  7F80        NOP
  906  7F80        NOP
  907  7F80        NOP
  908  7F80        NOP
  909  F900 08AB   B     L8AB

L90B:
  90B  4002        IN    0x02,PA0
  90C  6605        ZALS  0x05
  90D  7902        AND   0x02
  90E  FE00 0912   BNZ   L912
  910  F900 0913   B     L913

L912:
  912  4EA8        OUT   *+,PA6
L913:
  913  470C        IN    0x0C,PA7
  914  420F        IN    0x0F,PA2
  915  4F10        OUT   0x10,PA7
  916  471E        IN    0x1E,PA7
  917  7F80        NOP
  918  7F80        NOP
  919  7F80        NOP
  91A  7F80        NOP
  91B  7F80        NOP
  91C  7F80        NOP
  91D  7F80        NOP
  91E  7F80        NOP
  91F  7F80        NOP
  920  7F80        NOP
  921  660F        ZALS  0x0F
  922  6111        ADDS  0x11
  923  5010        SACL  0x10
  924  6517        ZALH  0x17
  925  6042        ADDH  0x42
  926  5817        SACH  0x17
  927  4002        IN    0x02,PA0
  928  6605        ZALS  0x05
  929  7902        AND   0x02
  92A  FE00 092E   BNZ   L92E
  92C  F900 092F   B     L92F

L92E:
  92E  4EA8        OUT   *+,PA6
L92F:
  92F  3003        SAR   AR0,0x03
  930  6615        ZALS  0x15
  931  6303        SUBS  0x03
  932  6146        ADDS  0x46
  933  5015        SACL  0x15
  934  6110        ADDS  0x10
  935  5012        SACL  0x12
  936  000D        ADD   0x0D
  937  5013        SACL  0x13
  938  3808        LAR   AR0,0x08
  939  7F80        NOP
  93A  4F12        OUT   0x12,PA7
  93B  441B        IN    0x1B,PA4
  93C  441A        IN    0x1A,PA4
  93D  4F13        OUT   0x13,PA7
  93E  441D        IN    0x1D,PA4
  93F  441C        IN    0x1C,PA4
  940  6A17        LT    0x17
  941  6D1A        MPY   0x1A
  942  7F8E        PAC
  943  6D1C        MPY   0x1C
  944  7F90        SPAC
  945  0F1C        ADD   0x1C,15
  946  5900        SACH  0x00,1
  947  4002        IN    0x02,PA0
  948  6605        ZALS  0x05
  949  7902        AND   0x02
  94A  FE00 094E   BNZ   L94E
  94C  F900 094F   B     L94F

L94E:
  94E  4EA8        OUT   *+,PA6
L94F:
  94F  6A17        LT    0x17
  950  6D1B        MPY   0x1B
  951  7F8E        PAC
  952  6D1D        MPY   0x1D
  953  7F90        SPAC
  954  0F1D        ADD   0x1D,15
  955  5901        SACH  0x01,1
  956  7F80        NOP
  957  6517        ZALH  0x17
  958  620A        SUBH  0x0A
  959  FF00 08AB   BZ    L8AB
L95B:
  95B  7F80        NOP
  95C  7F80        NOP
  95D  7F80        NOP
  95E  7F80        NOP
  95F  7F80        NOP
  960  7F80        NOP
  961  7F80        NOP
  962  7F80        NOP
  963  7F80        NOP
  964  7F80        NOP
  965  7F80        NOP
  966  7F80        NOP
  967  F900 090B   B     L90B

L969:
  969  430E        IN    0x0E,PA3
  96A  7F89        ZAC
  96B  620E        SUBH  0x0E
  96C  580E        SACH  0x0E
  96D  7F80        NOP
L96E:
  96E  4002        IN    0x02,PA0
  96F  6605        ZALS  0x05
  970  7902        AND   0x02
  971  FE00 0975   BNZ   L975
  973  F900 0976   B     L976

L975:
  975  4EA8        OUT   *+,PA6
L976:
  976  470C        IN    0x0C,PA7
  977  420F        IN    0x0F,PA2
  978  4F10        OUT   0x10,PA7
  979  471E        IN    0x1E,PA7
  97A  7F80        NOP
  97B  7F80        NOP
  97C  7F80        NOP
  97D  7F80        NOP
  97E  7F80        NOP
  97F  7F80        NOP
  980  7F80        NOP
  981  7F80        NOP
  982  7F80        NOP
  983  7F80        NOP
  984  660F        ZALS  0x0F
  985  6111        ADDS  0x11
  986  5010        SACL  0x10
  987  7F80        NOP
  988  7F89        ZAC
  989  5817        SACH  0x17
  98A  4002        IN    0x02,PA0
  98B  6605        ZALS  0x05
  98C  7902        AND   0x02
  98D  FE00 0991   BNZ   L991
  98F  F900 0992   B     L992

L991:
  991  4EA8        OUT   *+,PA6
L992:
  992  3003        SAR   AR0,0x03
  993  6615        ZALS  0x15
  994  6303        SUBS  0x03
  995  6146        ADDS  0x46
  996  5015        SACL  0x15
  997  6110        ADDS  0x10
  998  5012        SACL  0x12
  999  7F80        NOP
  99A  7F80        NOP
  99B  3808        LAR   AR0,0x08
  99C  7F80        NOP
  99D  4F12        OUT   0x12,PA7
  99E  4401        IN    0x01,PA4
  99F  4400        IN    0x00,PA4
  9A0  6615        ZALS  0x15
  9A1  100E        SUB   0x0E
  9A2  5015        SACL  0x15
  9A3  660E        ZALS  0x0E
  9A4  500D        SACL  0x0D
  9A5  7F80        NOP
  9A6  7F80        NOP
  9A7  7F80        NOP
  9A8  7F80        NOP
  9A9  7F80        NOP
  9AA  7F80        NOP
  9AB  7F80        NOP
  9AC  7F80        NOP
  9AD  4002        IN    0x02,PA0
  9AE  6605        ZALS  0x05
  9AF  7902        AND   0x02
  9B0  FE00 09B4   BNZ   L9B4
  9B2  F900 09B5   B     L9B5

L9B4:
  9B4  4EA8        OUT   *+,PA6
L9B5:
  9B5  7F80        NOP
  9B6  7F80        NOP
  9B7  7F80        NOP
  9B8  7F80        NOP
  9B9  7F80        NOP
  9BA  7F80        NOP
  9BB  7F80        NOP
  9BC  7F80        NOP
  9BD  7F80        NOP
  9BE  7F80        NOP
  9BF  F900 095B   B     L95B

