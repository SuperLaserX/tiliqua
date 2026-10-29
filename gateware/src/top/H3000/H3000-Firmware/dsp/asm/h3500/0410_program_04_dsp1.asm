; Eventide h3500 DSP microcode
; key 0410  algorithm 04 (program 04)  DSP 1
; source H3000-Upgrade_ROM2.BIN offset 0BAAF, 539 program words loaded at 800
;
  800  6880        LARP  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6E00        LDPK  0
  804  7E01        LACK  0x01
  805  5006        SACL  0x06
  806  5047        SACL  0x47
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
  88B  8942        MPYK  2370
  88C  7F8E        PAC
  88D  7D02        TBLW  0x02
  88E  8994        MPYK  2452
  88F  7F8E        PAC
  890  7D02        TBLW  0x02
  891  8A04        MPYK  2564
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
  8A0  88F9        MPYK  2297
  8A1  7F8E        PAC
  8A2  7D02        TBLW  0x02
  8A3  7F80        NOP
L8A4:
  8A4  6546        ZALH  0x46
  8A5  6208        SUBH  0x08
  8A6  FF00 08B2   BZ    L8B2
  8A8  F900 08F2   B     L8F2

  8AA  6103        ADDS  0x03
  8AB  630E        SUBS  0x0E
  8AC  4400        IN    0x00,PA4
  8AD  4401        IN    0x01,PA4
  8AE  4418        IN    0x18,PA4
  8AF  4419        IN    0x19,PA4
  8B0  441A        IN    0x1A,PA4
  8B1  441B        IN    0x1B,PA4
L8B2:
  8B2  6A06        LT    0x06
  8B3  88AA        MPYK  2218
  8B4  7F8E        PAC
  8B5  6702        TBLR  0x02
  8B6  890D        MPYK  2317
  8B7  7F8E        PAC
  8B8  7D02        TBLW  0x02
  8B9  8963        MPYK  2403
  8BA  7F8E        PAC
  8BB  7D02        TBLW  0x02
  8BC  89D0        MPYK  2512
  8BD  7F8E        PAC
  8BE  7D02        TBLW  0x02
  8BF  88AB        MPYK  2219
  8C0  7F8E        PAC
  8C1  6702        TBLR  0x02
  8C2  89DC        MPYK  2524
  8C3  7F8E        PAC
  8C4  7D02        TBLW  0x02
  8C5  88AC        MPYK  2220
  8C6  7F8E        PAC
  8C7  6702        TBLR  0x02
  8C8  8916        MPYK  2326
  8C9  7F8E        PAC
  8CA  7D02        TBLW  0x02
  8CB  89D9        MPYK  2521
  8CC  7F8E        PAC
  8CD  7D02        TBLW  0x02
  8CE  88AD        MPYK  2221
  8CF  7F8E        PAC
  8D0  6702        TBLR  0x02
  8D1  8917        MPYK  2327
  8D2  7F8E        PAC
  8D3  7D02        TBLW  0x02
  8D4  89DA        MPYK  2522
  8D5  7F8E        PAC
  8D6  7D02        TBLW  0x02
  8D7  88AE        MPYK  2222
  8D8  7F8E        PAC
  8D9  6702        TBLR  0x02
  8DA  896C        MPYK  2412
  8DB  7F8E        PAC
  8DC  7D02        TBLW  0x02
  8DD  88AF        MPYK  2223
  8DE  7F8E        PAC
  8DF  6702        TBLR  0x02
  8E0  896D        MPYK  2413
  8E1  7F8E        PAC
  8E2  7D02        TBLW  0x02
  8E3  88B0        MPYK  2224
  8E4  7F8E        PAC
  8E5  6702        TBLR  0x02
  8E6  896F        MPYK  2415
  8E7  7F8E        PAC
  8E8  7D02        TBLW  0x02
  8E9  88B1        MPYK  2225
  8EA  7F8E        PAC
  8EB  6702        TBLR  0x02
  8EC  8970        MPYK  2416
  8ED  7F8E        PAC
  8EE  7D02        TBLW  0x02
  8EF  7F89        ZAC
  8F0  5041        SACL  0x41
  8F1  7F80        NOP
L8F2:
  8F2  F600 08F6   BIOZ  L8F6
  8F4  F900 08F2   B     L8F2

L8F6:
  8F6  F600 08F6   BIOZ  L8F6
  8F8  7F80        NOP
L8F9:
  8F9  4717        IN    0x17,PA7
  8FA  6613        ZALS  0x13
  8FB  6341        SUBS  0x41
  8FC  FA00 09C1   BLZ   L9C1
  8FE  410E        IN    0x0E,PA1
  8FF  630E        SUBS  0x0E
  900  7F80        NOP
  901  FC00 09C6   BGZ   L9C6
L903:
  903  4002        IN    0x02,PA0
  904  6605        ZALS  0x05
  905  7902        AND   0x02
  906  FE00 090A   BNZ   L90A
  908  F900 090B   B     L90B

L90A:
  90A  4DA8        OUT   *+,PA5
L90B:
  90B  3003        SAR   AR0,0x03
  90C  6613        ZALS  0x13
  90D  6303        SUBS  0x03
  90E  6147        ADDS  0x47
  90F  5013        SACL  0x13
  910  610F        ADDS  0x0F
  911  5010        SACL  0x10
  912  3808        LAR   AR0,0x08
  913  7F80        NOP
  914  7F80        NOP
  915  4F10        OUT   0x10,PA7
  916  4401        IN    0x01,PA4
  917  4400        IN    0x00,PA4
  918  7F80        NOP
  919  7F80        NOP
  91A  7F80        NOP
  91B  7F80        NOP
  91C  7F80        NOP
  91D  7F80        NOP
  91E  7F80        NOP
  91F  7F80        NOP
  920  7F80        NOP
  921  7F80        NOP
  922  7F80        NOP
  923  7F80        NOP
  924  7F80        NOP
  925  7F80        NOP
  926  4002        IN    0x02,PA0
  927  6605        ZALS  0x05
  928  7902        AND   0x02
  929  FE00 092D   BNZ   L92D
  92B  F900 092E   B     L92E

L92D:
  92D  4DA8        OUT   *+,PA5
L92E:
  92E  7F80        NOP
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
  93A  7F80        NOP
  93B  7F80        NOP
  93C  7F80        NOP
  93D  7F80        NOP
  93E  7F80        NOP
  93F  7F80        NOP
  940  2F16        LAC   0x16,15
  941  4A0F        OUT   0x0F,PA2
  942  0F17        ADD   0x17,15
  943  580C        SACH  0x0C
  944  4F0F        OUT   0x0F,PA7
  945  4C0C        OUT   0x0C,PA4
  946  4002        IN    0x02,PA0
  947  6605        ZALS  0x05
  948  7902        AND   0x02
  949  FE00 094D   BNZ   L94D
  94B  F900 094E   B     L94E

L94D:
  94D  4DA8        OUT   *+,PA5
L94E:
  94E  660F        ZALS  0x0F
  94F  6347        SUBS  0x47
  950  500F        SACL  0x0F
  951  4716        IN    0x16,PA7
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
  960  4DA8        OUT   *+,PA5
L961:
  961  3003        SAR   AR0,0x03
  962  6613        ZALS  0x13
  963  6303        SUBS  0x03
  964  6147        ADDS  0x47
  965  5013        SACL  0x13
  966  610F        ADDS  0x0F
  967  5010        SACL  0x10
  968  000D        ADD   0x0D
  969  5011        SACL  0x11
  96A  3808        LAR   AR0,0x08
  96B  4F10        OUT   0x10,PA7
  96C  4419        IN    0x19,PA4
  96D  4418        IN    0x18,PA4
  96E  4F11        OUT   0x11,PA7
  96F  441B        IN    0x1B,PA4
  970  441A        IN    0x1A,PA4
  971  6A15        LT    0x15
  972  6D18        MPY   0x18
  973  7F8E        PAC
  974  6D1A        MPY   0x1A
  975  7F90        SPAC
  976  0F1A        ADD   0x1A,15
  977  5900        SACH  0x00,1
  978  7F80        NOP
  979  4002        IN    0x02,PA0
  97A  6605        ZALS  0x05
  97B  7902        AND   0x02
  97C  FE00 0980   BNZ   L980
  97E  F900 0981   B     L981

L980:
  980  4DA8        OUT   *+,PA5
L981:
  981  6A15        LT    0x15
  982  6D19        MPY   0x19
  983  7F8E        PAC
  984  6D1B        MPY   0x1B
  985  7F90        SPAC
  986  0F1B        ADD   0x1B,15
  987  5901        SACH  0x01,1
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
  992  2F16        LAC   0x16,15
  993  4A0F        OUT   0x0F,PA2
  994  0F17        ADD   0x17,15
  995  580C        SACH  0x0C
  996  4F0F        OUT   0x0F,PA7
  997  4C0C        OUT   0x0C,PA4
  998  4002        IN    0x02,PA0
  999  6605        ZALS  0x05
  99A  7902        AND   0x02
  99B  FE00 099F   BNZ   L99F
  99D  F900 09A0   B     L9A0

L99F:
  99F  4DA8        OUT   *+,PA5
L9A0:
  9A0  660F        ZALS  0x0F
  9A1  6347        SUBS  0x47
  9A2  500F        SACL  0x0F
  9A3  4716        IN    0x16,PA7
  9A4  6515        ZALH  0x15
  9A5  6042        ADDH  0x42
  9A6  5815        SACH  0x15
  9A7  7F80        NOP
  9A8  7F80        NOP
  9A9  F500 09B6   BV    L9B6
L9AB:
  9AB  4717        IN    0x17,PA7
  9AC  7F80        NOP
  9AD  7F80        NOP
  9AE  7F80        NOP
  9AF  7F80        NOP
  9B0  7F80        NOP
  9B1  7F80        NOP
  9B2  7F80        NOP
  9B3  7F80        NOP
  9B4  F900 0959   B     L959

L9B6:
  9B6  4717        IN    0x17,PA7
  9B7  7F80        NOP
  9B8  7F80        NOP
  9B9  7F80        NOP
  9BA  7F80        NOP
  9BB  7F80        NOP
  9BC  7F80        NOP
  9BD  7F80        NOP
  9BE  7F80        NOP
  9BF  F900 0903   B     L903

L9C1:
  9C1  410E        IN    0x0E,PA1
  9C2  7F89        ZAC
  9C3  620E        SUBH  0x0E
  9C4  580E        SACH  0x0E
  9C5  7F80        NOP
L9C6:
  9C6  4002        IN    0x02,PA0
  9C7  6605        ZALS  0x05
  9C8  7902        AND   0x02
  9C9  FE00 09CD   BNZ   L9CD
  9CB  F900 09CE   B     L9CE

L9CD:
  9CD  4DA8        OUT   *+,PA5
L9CE:
  9CE  3003        SAR   AR0,0x03
  9CF  6613        ZALS  0x13
  9D0  6303        SUBS  0x03
  9D1  6147        ADDS  0x47
  9D2  5013        SACL  0x13
  9D3  610F        ADDS  0x0F
  9D4  5010        SACL  0x10
  9D5  7F80        NOP
  9D6  7F80        NOP
  9D7  3808        LAR   AR0,0x08
  9D8  4F10        OUT   0x10,PA7
  9D9  4401        IN    0x01,PA4
  9DA  4400        IN    0x00,PA4
  9DB  6613        ZALS  0x13
  9DC  100E        SUB   0x0E
  9DD  5013        SACL  0x13
  9DE  660E        ZALS  0x0E
  9DF  500D        SACL  0x0D
  9E0  7F80        NOP
  9E1  7F80        NOP
  9E2  7F80        NOP
  9E3  7F80        NOP
  9E4  7F80        NOP
  9E5  7F80        NOP
  9E6  7F80        NOP
  9E7  7F80        NOP
  9E8  7F80        NOP
  9E9  4002        IN    0x02,PA0
  9EA  6605        ZALS  0x05
  9EB  7902        AND   0x02
  9EC  FE00 09F0   BNZ   L9F0
  9EE  F900 09F1   B     L9F1

L9F0:
  9F0  4DA8        OUT   *+,PA5
L9F1:
  9F1  7F80        NOP
  9F2  7F80        NOP
  9F3  7F80        NOP
  9F4  7F80        NOP
  9F5  7F80        NOP
  9F6  7F80        NOP
  9F7  7F80        NOP
  9F8  7F80        NOP
  9F9  7F80        NOP
  9FA  7F80        NOP
  9FB  7F80        NOP
  9FC  7F80        NOP
  9FD  7F80        NOP
  9FE  7F80        NOP
  9FF  7F80        NOP
  A00  7F80        NOP
  A01  7F80        NOP
  A02  2F16        LAC   0x16,15
  A03  4A0F        OUT   0x0F,PA2
  A04  0F17        ADD   0x17,15
  A05  580C        SACH  0x0C
  A06  4F0F        OUT   0x0F,PA7
  A07  4C0C        OUT   0x0C,PA4
  A08  4002        IN    0x02,PA0
  A09  6605        ZALS  0x05
  A0A  7902        AND   0x02
  A0B  FE00 0A0F   BNZ   LA0F
  A0D  F900 0A10   B     LA10

LA0F:
  A0F  4DA8        OUT   *+,PA5
LA10:
  A10  660F        ZALS  0x0F
  A11  6347        SUBS  0x47
  A12  500F        SACL  0x0F
  A13  4716        IN    0x16,PA7
  A14  7F89        ZAC
  A15  5815        SACH  0x15
  A16  7F80        NOP
  A17  7F80        NOP
  A18  7F80        NOP
  A19  F900 09AB   B     L9AB

