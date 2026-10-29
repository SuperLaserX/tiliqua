; Eventide h3000_v153 DSP microcode
; key 0410  algorithm 04 (program 04)  DSP 1
; source H3000_153_SmallROM.BIN offset 03B30, 450 program words loaded at 800
;
  800  6880        LARP  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6E00        LDPK  0
  804  7E01        LACK  0x01
  805  5006        SACL  0x06
  806  5046        SACL  0x46
  807  2806        LAC   0x06,8
  808  5004        SACL  0x04
  809  2306        LAC   0x06,3
  80A  5005        SACL  0x05
  80B  2E06        LAC   0x06,14
  80C  5009        SACL  0x09
  80D  2F06        LAC   0x06,15
  80E  500B        SACL  0x0B
  80F  7F89        ZAC
  810  5008        SACL  0x08
  811  1006        SUB   0x06
  812  5807        SACH  0x07
  813  7EFF        LACK  0xFF
  814  5013        SACL  0x13
  815  5041        SACL  0x41
  816  5042        SACL  0x42
  817  500D        SACL  0x0D
  818  5002        SACL  0x02
  819  2702        LAC   0x02,7
  81A  7A02        OR    0x02
  81B  500A        SACL  0x0A
  81C  7F80        NOP
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
  82E  7F89        ZAC
  82F  5008        SACL  0x08
  830  5003        SACL  0x03
  831  500F        SACL  0x0F
  832  5016        SACL  0x16
  833  5017        SACL  0x17
  834  5000        SACL  0x00
  835  5001        SACL  0x01
  836  4D08        OUT   0x08,PA5
  837  4E08        OUT   0x08,PA6
L838:
  838  4F03        OUT   0x03,PA7
  839  4C08        OUT   0x08,PA4
  83A  0006        ADD   0x06
  83B  5003        SACL  0x03
  83C  4502        IN    0x02,PA5
  83D  6881        LARP  1
  83E  6602        ZALS  0x02
  83F  7904        AND   0x04
  840  FE00 0845   BNZ   L845
  842  6880        LARP  0
  843  F900 0847   B     L847

L845:
  845  3902        LAR   AR1,0x02
  846  4680        IN    *,PA6,AR0
L847:
  847  4F03        OUT   0x03,PA7
  848  4C08        OUT   0x08,PA4
  849  6603        ZALS  0x03
  84A  0006        ADD   0x06
  84B  5003        SACL  0x03
  84C  6603        ZALS  0x03
  84D  FE00 0838   BNZ   L838
L84F:
  84F  F600 0853   BIOZ  L853
  851  F900 084F   B     L84F

L853:
  853  F600 0853   BIOZ  L853
  855  4002        IN    0x02,PA0
  856  6502        ZALH  0x02
  857  FD00 085A   BGEZ  L85A
  859  7F80        NOP
L85A:
  85A  7000        LARK  AR0,0x00
  85B  650A        ZALH  0x0A
  85C  5814        SACH  0x14
  85D  5815        SACH  0x15
  85E  6543        ZALH  0x43
  85F  6208        SUBH  0x08
  860  FF00 0868   BZ    L868
  862  6545        ZALH  0x45
  863  6208        SUBH  0x08
  864  FF00 0868   BZ    L868
  866  F900 0878   B     L878

L868:
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
L878:
  878  6544        ZALH  0x44
  879  6208        SUBH  0x08
  87A  FF00 0885   BZ    L885
  87C  6545        ZALH  0x45
  87D  6208        SUBH  0x08
  87E  FF00 0885   BZ    L885
  880  7F80        NOP
  881  7F80        NOP
  882  F900 0895   B     L895

  884  0F16        ADD   0x16,15
L885:
  885  7F80        NOP
  886  7F80        NOP
  887  6A06        LT    0x06
  888  8884        MPYK  2180
  889  7F8E        PAC
  88A  6702        TBLR  0x02
  88B  88F4        MPYK  2292
  88C  7F8E        PAC
  88D  7D02        TBLW  0x02
  88E  8946        MPYK  2374
  88F  7F8E        PAC
  890  7D02        TBLW  0x02
  891  89AB        MPYK  2475
  892  7F8E        PAC
  893  7D02        TBLW  0x02
  894  7F80        NOP
L895:
  895  6545        ZALH  0x45
  896  6208        SUBH  0x08
  897  FF00 089C   BZ    L89C
  899  F900 08A4   B     L8A4

  89B  4B13        OUT   0x13,PA3
L89C:
  89C  6A06        LT    0x06
  89D  889B        MPYK  2203
  89E  7F8E        PAC
  89F  6702        TBLR  0x02
  8A0  88AB        MPYK  2219
  8A1  7F8E        PAC
  8A2  7D02        TBLW  0x02
  8A3  7F80        NOP
L8A4:
  8A4  F600 08A8   BIOZ  L8A8
  8A6  F900 08A4   B     L8A4

L8A8:
  8A8  F600 08A8   BIOZ  L8A8
  8AA  7F80        NOP
L8AB:
  8AB  4717        IN    0x17,PA7
  8AC  6613        ZALS  0x13
  8AD  6341        SUBS  0x41
  8AE  FA00 0968   BLZ   L968
  8B0  410E        IN    0x0E,PA1
  8B1  630E        SUBS  0x0E
  8B2  7F80        NOP
  8B3  FC00 096D   BGZ   L96D
  8B5  4002        IN    0x02,PA0
  8B6  6605        ZALS  0x05
  8B7  7902        AND   0x02
  8B8  FE00 08BC   BNZ   L8BC
  8BA  F900 08BD   B     L8BD

L8BC:
  8BC  4DA8        OUT   *+,PA5
L8BD:
  8BD  3003        SAR   AR0,0x03
  8BE  6613        ZALS  0x13
  8BF  6303        SUBS  0x03
  8C0  6146        ADDS  0x46
  8C1  5013        SACL  0x13
  8C2  610F        ADDS  0x0F
  8C3  5010        SACL  0x10
  8C4  3808        LAR   AR0,0x08
  8C5  7F80        NOP
  8C6  7F80        NOP
  8C7  4F10        OUT   0x10,PA7
  8C8  4401        IN    0x01,PA4
  8C9  4400        IN    0x00,PA4
  8CA  7F80        NOP
  8CB  7F80        NOP
  8CC  7F80        NOP
  8CD  7F80        NOP
  8CE  7F80        NOP
  8CF  7F80        NOP
  8D0  7F80        NOP
  8D1  7F80        NOP
  8D2  7F80        NOP
  8D3  7F80        NOP
  8D4  7F80        NOP
  8D5  7F80        NOP
  8D6  7F80        NOP
  8D7  7F80        NOP
  8D8  4002        IN    0x02,PA0
  8D9  6605        ZALS  0x05
  8DA  7902        AND   0x02
  8DB  FE00 08DF   BNZ   L8DF
  8DD  F900 08E0   B     L8E0

L8DF:
  8DF  4DA8        OUT   *+,PA5
L8E0:
  8E0  7F80        NOP
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
  8EC  7F80        NOP
  8ED  7F80        NOP
  8EE  7F80        NOP
  8EF  7F80        NOP
  8F0  7F80        NOP
  8F1  7F80        NOP
  8F2  2F16        LAC   0x16,15
  8F3  4A0F        OUT   0x0F,PA2
  8F4  0F17        ADD   0x17,15
  8F5  580C        SACH  0x0C
  8F6  4F0F        OUT   0x0F,PA7
  8F7  4C0C        OUT   0x0C,PA4
  8F8  4002        IN    0x02,PA0
  8F9  6605        ZALS  0x05
  8FA  7902        AND   0x02
  8FB  FE00 08FF   BNZ   L8FF
  8FD  F900 0900   B     L900

L8FF:
  8FF  4DA8        OUT   *+,PA5
L900:
  900  660F        ZALS  0x0F
  901  6346        SUBS  0x46
  902  500F        SACL  0x0F
  903  4716        IN    0x16,PA7
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
  912  4DA8        OUT   *+,PA5
L913:
  913  3003        SAR   AR0,0x03
  914  6613        ZALS  0x13
  915  6303        SUBS  0x03
  916  6146        ADDS  0x46
  917  5013        SACL  0x13
  918  610F        ADDS  0x0F
  919  5010        SACL  0x10
  91A  000D        ADD   0x0D
  91B  5011        SACL  0x11
  91C  3808        LAR   AR0,0x08
  91D  4F10        OUT   0x10,PA7
  91E  4419        IN    0x19,PA4
  91F  4418        IN    0x18,PA4
  920  4F11        OUT   0x11,PA7
  921  441B        IN    0x1B,PA4
  922  441A        IN    0x1A,PA4
  923  6A15        LT    0x15
  924  6D18        MPY   0x18
  925  7F8E        PAC
  926  6D1A        MPY   0x1A
  927  7F90        SPAC
  928  0F1A        ADD   0x1A,15
  929  5900        SACH  0x00,1
  92A  7F80        NOP
  92B  4002        IN    0x02,PA0
  92C  6605        ZALS  0x05
  92D  7902        AND   0x02
  92E  FE00 0932   BNZ   L932
  930  F900 0933   B     L933

L932:
  932  4DA8        OUT   *+,PA5
L933:
  933  6A15        LT    0x15
  934  6D19        MPY   0x19
  935  7F8E        PAC
  936  6D1B        MPY   0x1B
  937  7F90        SPAC
  938  0F1B        ADD   0x1B,15
  939  5901        SACH  0x01,1
  93A  7F80        NOP
  93B  7F80        NOP
  93C  7F80        NOP
  93D  7F80        NOP
  93E  7F80        NOP
  93F  7F80        NOP
  940  7F80        NOP
  941  7F80        NOP
  942  7F80        NOP
  943  7F80        NOP
  944  2F16        LAC   0x16,15
  945  4A0F        OUT   0x0F,PA2
  946  0F17        ADD   0x17,15
  947  580C        SACH  0x0C
  948  4F0F        OUT   0x0F,PA7
  949  4C0C        OUT   0x0C,PA4
  94A  4002        IN    0x02,PA0
  94B  6605        ZALS  0x05
  94C  7902        AND   0x02
  94D  FE00 0951   BNZ   L951
  94F  F900 0952   B     L952

L951:
  951  4DA8        OUT   *+,PA5
L952:
  952  660F        ZALS  0x0F
  953  6346        SUBS  0x46
  954  500F        SACL  0x0F
  955  4716        IN    0x16,PA7
  956  6515        ZALH  0x15
  957  6042        ADDH  0x42
  958  5815        SACH  0x15
  959  6515        ZALH  0x15
  95A  620A        SUBH  0x0A
  95B  FF00 08AB   BZ    L8AB
L95D:
  95D  4717        IN    0x17,PA7
  95E  7F80        NOP
  95F  7F80        NOP
  960  7F80        NOP
  961  7F80        NOP
  962  7F80        NOP
  963  7F80        NOP
  964  7F80        NOP
  965  7F80        NOP
  966  F900 090B   B     L90B

L968:
  968  410E        IN    0x0E,PA1
  969  7F89        ZAC
  96A  620E        SUBH  0x0E
  96B  580E        SACH  0x0E
  96C  7F80        NOP
L96D:
  96D  4002        IN    0x02,PA0
  96E  6605        ZALS  0x05
  96F  7902        AND   0x02
  970  FE00 0974   BNZ   L974
  972  F900 0975   B     L975

L974:
  974  4DA8        OUT   *+,PA5
L975:
  975  3003        SAR   AR0,0x03
  976  6613        ZALS  0x13
  977  6303        SUBS  0x03
  978  6146        ADDS  0x46
  979  5013        SACL  0x13
  97A  610F        ADDS  0x0F
  97B  5010        SACL  0x10
  97C  7F80        NOP
  97D  7F80        NOP
  97E  3808        LAR   AR0,0x08
  97F  4F10        OUT   0x10,PA7
  980  4401        IN    0x01,PA4
  981  4400        IN    0x00,PA4
  982  6613        ZALS  0x13
  983  100E        SUB   0x0E
  984  5013        SACL  0x13
  985  660E        ZALS  0x0E
  986  500D        SACL  0x0D
  987  7F80        NOP
  988  7F80        NOP
  989  7F80        NOP
  98A  7F80        NOP
  98B  7F80        NOP
  98C  7F80        NOP
  98D  7F80        NOP
  98E  7F80        NOP
  98F  7F80        NOP
  990  4002        IN    0x02,PA0
  991  6605        ZALS  0x05
  992  7902        AND   0x02
  993  FE00 0997   BNZ   L997
  995  F900 0998   B     L998

L997:
  997  4DA8        OUT   *+,PA5
L998:
  998  7F80        NOP
  999  7F80        NOP
  99A  7F80        NOP
  99B  7F80        NOP
  99C  7F80        NOP
  99D  7F80        NOP
  99E  7F80        NOP
  99F  7F80        NOP
  9A0  7F80        NOP
  9A1  7F80        NOP
  9A2  7F80        NOP
  9A3  7F80        NOP
  9A4  7F80        NOP
  9A5  7F80        NOP
  9A6  7F80        NOP
  9A7  7F80        NOP
  9A8  7F80        NOP
  9A9  2F16        LAC   0x16,15
  9AA  4A0F        OUT   0x0F,PA2
  9AB  0F17        ADD   0x17,15
  9AC  580C        SACH  0x0C
  9AD  4F0F        OUT   0x0F,PA7
  9AE  4C0C        OUT   0x0C,PA4
  9AF  4002        IN    0x02,PA0
  9B0  6605        ZALS  0x05
  9B1  7902        AND   0x02
  9B2  FE00 09B6   BNZ   L9B6
  9B4  F900 09B7   B     L9B7

L9B6:
  9B6  4DA8        OUT   *+,PA5
L9B7:
  9B7  660F        ZALS  0x0F
  9B8  6346        SUBS  0x46
  9B9  500F        SACL  0x0F
  9BA  4716        IN    0x16,PA7
  9BB  7F89        ZAC
  9BC  5815        SACH  0x15
  9BD  7F80        NOP
  9BE  7F80        NOP
  9BF  7F80        NOP
  9C0  F900 095D   B     L95D

