; Eventide h3500 DSP microcode
; key 7A15  algorithm 7A (mod factory|one)  DSP 6
; source H3000-Upgrade_ROM3.BIN offset 0D20D, 1327 program words loaded at 800
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
  80C  5007        SACL  0x07
  80D  2D07        LAC   0x07,13
  80E  5009        SACL  0x09
  80F  2F07        LAC   0x07,15
  810  5003        SACL  0x03
  811  7F89        ZAC
  812  5001        SACL  0x01
  813  1007        SUB   0x07
  814  5808        SACH  0x08
  815  7EFF        LACK  0xFF
  816  500A        SACL  0x0A
  817  270A        LAC   0x0A,7
  818  7A0A        OR    0x0A
  819  5002        SACL  0x02
  81A  7E3F        LACK  0x3F
  81B  507A        SACL  0x7A
  81C  6A07        LT    0x07
  81D  8BA9        MPYK  2985
  81E  7F8E        PAC
  81F  507B        SACL  0x7B
  820  2807        LAC   0x07,8
  821  507F        SACL  0x7F
  822  7F80        NOP
  823  7F80        NOP
  824  7F80        NOP
L825:
  825  F600 0829   BIOZ  L829
  827  F900 0825   B     L825

L829:
  829  400A        IN    0x0A,PA0
  82A  650A        ZALH  0x0A
  82B  FD00 082E   BGEZ  L82E
  82D  7F80        NOP
L82E:
  82E  F600 082E   BIOZ  L82E
  830  2C07        LAC   0x07,12
  831  5029        SACL  0x29
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
  880  500D        SACL  0x0D
L881:
  881  F600 0885   BIOZ  L885
  883  F900 0881   B     L881

L885:
  885  400A        IN    0x0A,PA0
  886  650A        ZALH  0x0A
  887  FD00 088A   BGEZ  L88A
  889  7F80        NOP
L88A:
  88A  F600 088A   BIOZ  L88A
L88C:
  88C  450A        IN    0x0A,PA5
  88D  6881        LARP  1
  88E  660A        ZALS  0x0A
  88F  7909        AND   0x09
  890  FE00 0895   BNZ   L895
  892  6880        LARP  0
  893  F900 0897   B     L897

L895:
  895  390A        LAR   AR1,0x0A
  896  4680        IN    *,PA6,AR0
L897:
  897  7E15        LACK  0x15
  898  610D        ADDS  0x0D
  899  500D        SACL  0x0D
  89A  4C01        OUT   0x01,PA4
  89B  4C01        OUT   0x01,PA4
  89C  4C01        OUT   0x01,PA4
  89D  4C01        OUT   0x01,PA4
  89E  4C01        OUT   0x01,PA4
  89F  4C01        OUT   0x01,PA4
  8A0  4C01        OUT   0x01,PA4
  8A1  4C01        OUT   0x01,PA4
  8A2  4C01        OUT   0x01,PA4
  8A3  4C01        OUT   0x01,PA4
  8A4  4C01        OUT   0x01,PA4
  8A5  4C01        OUT   0x01,PA4
  8A6  4C01        OUT   0x01,PA4
  8A7  4C01        OUT   0x01,PA4
  8A8  4C01        OUT   0x01,PA4
  8A9  4C01        OUT   0x01,PA4
  8AA  4C01        OUT   0x01,PA4
  8AB  4C01        OUT   0x01,PA4
  8AC  4C01        OUT   0x01,PA4
  8AD  4C01        OUT   0x01,PA4
  8AE  4C01        OUT   0x01,PA4
  8AF  4C01        OUT   0x01,PA4
  8B0  4C01        OUT   0x01,PA4
  8B1  4C01        OUT   0x01,PA4
  8B2  4C01        OUT   0x01,PA4
  8B3  4C01        OUT   0x01,PA4
  8B4  4C01        OUT   0x01,PA4
  8B5  4C01        OUT   0x01,PA4
  8B6  4C01        OUT   0x01,PA4
  8B7  4C01        OUT   0x01,PA4
  8B8  4C01        OUT   0x01,PA4
  8B9  4C01        OUT   0x01,PA4
  8BA  4C01        OUT   0x01,PA4
  8BB  4C01        OUT   0x01,PA4
  8BC  4C01        OUT   0x01,PA4
  8BD  4C01        OUT   0x01,PA4
  8BE  4C01        OUT   0x01,PA4
  8BF  4C01        OUT   0x01,PA4
  8C0  4C01        OUT   0x01,PA4
  8C1  4C01        OUT   0x01,PA4
  8C2  4C01        OUT   0x01,PA4
  8C3  4C01        OUT   0x01,PA4
  8C4  7F80        NOP
  8C5  7F80        NOP
  8C6  7F80        NOP
  8C7  7F80        NOP
  8C8  200D        LAC   0x0D
  8C9  FC00 088C   BGZ   L88C
  8CB  7F80        NOP
  8CC  7F80        NOP
  8CD  7F89        ZAC
  8CE  500D        SACL  0x0D
L8CF:
  8CF  F600 08D3   BIOZ  L8D3
  8D1  F900 08CF   B     L8CF

L8D3:
  8D3  400A        IN    0x0A,PA0
  8D4  650A        ZALH  0x0A
  8D5  FD00 08D8   BGEZ  L8D8
  8D7  7F80        NOP
L8D8:
  8D8  F600 08D8   BIOZ  L8D8
L8DA:
  8DA  450A        IN    0x0A,PA5
  8DB  6881        LARP  1
  8DC  660A        ZALS  0x0A
  8DD  7909        AND   0x09
  8DE  FE00 08E3   BNZ   L8E3
  8E0  6880        LARP  0
  8E1  F900 08E5   B     L8E5

L8E3:
  8E3  390A        LAR   AR1,0x0A
  8E4  4680        IN    *,PA6,AR0
L8E5:
  8E5  7E15        LACK  0x15
  8E6  610D        ADDS  0x0D
  8E7  500D        SACL  0x0D
  8E8  4C01        OUT   0x01,PA4
  8E9  4C01        OUT   0x01,PA4
  8EA  4C01        OUT   0x01,PA4
  8EB  4C01        OUT   0x01,PA4
  8EC  4C01        OUT   0x01,PA4
  8ED  4C01        OUT   0x01,PA4
  8EE  4C01        OUT   0x01,PA4
  8EF  4C01        OUT   0x01,PA4
  8F0  4C01        OUT   0x01,PA4
  8F1  4C01        OUT   0x01,PA4
  8F2  4C01        OUT   0x01,PA4
  8F3  4C01        OUT   0x01,PA4
  8F4  4C01        OUT   0x01,PA4
  8F5  4C01        OUT   0x01,PA4
  8F6  4C01        OUT   0x01,PA4
  8F7  4C01        OUT   0x01,PA4
  8F8  4C01        OUT   0x01,PA4
  8F9  4C01        OUT   0x01,PA4
  8FA  4C01        OUT   0x01,PA4
  8FB  4C01        OUT   0x01,PA4
  8FC  4C01        OUT   0x01,PA4
  8FD  4C01        OUT   0x01,PA4
  8FE  4C01        OUT   0x01,PA4
  8FF  4C01        OUT   0x01,PA4
  900  4C01        OUT   0x01,PA4
  901  4C01        OUT   0x01,PA4
  902  4C01        OUT   0x01,PA4
  903  4C01        OUT   0x01,PA4
  904  4C01        OUT   0x01,PA4
  905  4C01        OUT   0x01,PA4
  906  4C01        OUT   0x01,PA4
  907  4C01        OUT   0x01,PA4
  908  4C01        OUT   0x01,PA4
  909  4C01        OUT   0x01,PA4
  90A  4C01        OUT   0x01,PA4
  90B  4C01        OUT   0x01,PA4
  90C  4C01        OUT   0x01,PA4
  90D  4C01        OUT   0x01,PA4
  90E  4C01        OUT   0x01,PA4
  90F  4C01        OUT   0x01,PA4
  910  4C01        OUT   0x01,PA4
  911  4C01        OUT   0x01,PA4
  912  7F80        NOP
  913  7F80        NOP
  914  7F80        NOP
  915  7F80        NOP
  916  200D        LAC   0x0D
  917  FC00 08DA   BGZ   L8DA
  919  7F80        NOP
  91A  7F80        NOP
  91B  7F80        NOP
  91C  7F80        NOP
  91D  7F89        ZAC
  91E  500D        SACL  0x0D
L91F:
  91F  F600 0923   BIOZ  L923
  921  F900 091F   B     L91F

L923:
  923  400A        IN    0x0A,PA0
  924  650A        ZALH  0x0A
  925  FD00 0928   BGEZ  L928
  927  7F80        NOP
L928:
  928  F600 0928   BIOZ  L928
L92A:
  92A  450A        IN    0x0A,PA5
  92B  6881        LARP  1
  92C  660A        ZALS  0x0A
  92D  7909        AND   0x09
  92E  FE00 0933   BNZ   L933
  930  6880        LARP  0
  931  F900 0935   B     L935

L933:
  933  390A        LAR   AR1,0x0A
  934  4680        IN    *,PA6,AR0
L935:
  935  7E15        LACK  0x15
  936  610D        ADDS  0x0D
  937  500D        SACL  0x0D
  938  4C01        OUT   0x01,PA4
  939  4C01        OUT   0x01,PA4
  93A  4C01        OUT   0x01,PA4
  93B  4C01        OUT   0x01,PA4
  93C  4C01        OUT   0x01,PA4
  93D  4C01        OUT   0x01,PA4
  93E  4C01        OUT   0x01,PA4
  93F  4C01        OUT   0x01,PA4
  940  4C01        OUT   0x01,PA4
  941  4C01        OUT   0x01,PA4
  942  4C01        OUT   0x01,PA4
  943  4C01        OUT   0x01,PA4
  944  4C01        OUT   0x01,PA4
  945  4C01        OUT   0x01,PA4
  946  4C01        OUT   0x01,PA4
  947  4C01        OUT   0x01,PA4
  948  4C01        OUT   0x01,PA4
  949  4C01        OUT   0x01,PA4
  94A  4C01        OUT   0x01,PA4
  94B  4C01        OUT   0x01,PA4
  94C  4C01        OUT   0x01,PA4
  94D  4C01        OUT   0x01,PA4
  94E  4C01        OUT   0x01,PA4
  94F  4C01        OUT   0x01,PA4
  950  4C01        OUT   0x01,PA4
  951  4C01        OUT   0x01,PA4
  952  4C01        OUT   0x01,PA4
  953  4C01        OUT   0x01,PA4
  954  4C01        OUT   0x01,PA4
  955  4C01        OUT   0x01,PA4
  956  4C01        OUT   0x01,PA4
  957  4C01        OUT   0x01,PA4
  958  4C01        OUT   0x01,PA4
  959  4C01        OUT   0x01,PA4
  95A  4C01        OUT   0x01,PA4
  95B  4C01        OUT   0x01,PA4
  95C  4C01        OUT   0x01,PA4
  95D  4C01        OUT   0x01,PA4
  95E  4C01        OUT   0x01,PA4
  95F  4C01        OUT   0x01,PA4
  960  4C01        OUT   0x01,PA4
  961  4C01        OUT   0x01,PA4
  962  7F80        NOP
  963  7F80        NOP
  964  7F80        NOP
  965  7F80        NOP
  966  200D        LAC   0x0D
  967  FC00 092A   BGZ   L92A
  969  7F89        ZAC
  96A  500D        SACL  0x0D
L96B:
  96B  F600 096F   BIOZ  L96F
  96D  F900 096B   B     L96B

L96F:
  96F  400A        IN    0x0A,PA0
  970  650A        ZALH  0x0A
  971  FD00 0974   BGEZ  L974
  973  7F80        NOP
L974:
  974  F600 0974   BIOZ  L974
L976:
  976  450A        IN    0x0A,PA5
  977  390A        LAR   AR1,0x0A
  978  4681        IN    *,PA6,AR1
  979  664B        ZALS  0x4B
  97A  1007        SUB   0x07
  97B  FF00 097F   BZ    L97F
  97D  F900 0980   B     L980

L97F:
  97F  4B77        OUT   0x77,PA3
L980:
  980  7182        LARK  AR1,0x82
  981  7F89        ZAC
  982  6A98        LT    *-
  983  6D0B        MPY   0x0B
  984  6C80        LTA   *,AR0
  985  6D0C        MPY   0x0C
  986  6C98        LTA   *-
  987  6D0D        MPY   0x0D
  988  6C81        LTA   *,AR1
  989  6D09        MPY   0x09
  98A  6C98        LTA   *-
  98B  591E        SACH  0x1E,1
  98C  7F89        ZAC
  98D  6D0B        MPY   0x0B
  98E  6C80        LTA   *,AR0
  98F  6D0C        MPY   0x0C
  990  6C98        LTA   *-
  991  6D0D        MPY   0x0D
  992  6C81        LTA   *,AR1
  993  6D09        MPY   0x09
  994  7F8F        APAC
  995  591F        SACH  0x1F,1
  996  6673        ZALS  0x73
  997  FE00 099B   BNZ   L99B
  999  F900 0A23   B     LA23

L99B:
  99B  657E        ZALH  0x7E
  99C  622B        SUBH  0x2B
  99D  FC00 09DD   BGZ   L9DD
  99F  657C        ZALH  0x7C
  9A0  FF00 09A8   BZ    L9A8
  9A2  6207        SUBH  0x07
  9A3  FF00 09C5   BZ    L9C5
  9A5  6207        SUBH  0x07
  9A6  FF00 0A0C   BZ    LA0C
L9A8:
  9A8  2F78        LAC   0x78,15
  9A9  6179        ADDS  0x79
  9AA  0470        ADD   0x70,4
  9AB  5978        SACH  0x78,1
  9AC  7902        AND   0x02
  9AD  5079        SACL  0x79
  9AE  6678        ZALS  0x78
  9AF  637A        SUBS  0x7A
  9B0  FD00 09B4   BGEZ  L9B4
  9B2  F900 0A41   B     LA41

L9B4:
  9B4  667A        ZALS  0x7A
  9B5  5078        SACL  0x78
  9B6  617B        ADDS  0x7B
  9B7  6171        ADDS  0x71
  9B8  670A        TBLR  0x0A
  9B9  650A        ZALH  0x0A
  9BA  5804        SACH  0x04
  9BB  7E02        LACK  0x02
  9BC  507C        SACL  0x7C
  9BD  7F80        NOP
  9BE  7F80        NOP
  9BF  7F80        NOP
  9C0  7F80        NOP
  9C1  7F80        NOP
  9C2  7F80        NOP
  9C3  F900 0A4E   B     LA4E

L9C5:
  9C5  2F78        LAC   0x78,15
  9C6  6179        ADDS  0x79
  9C7  1470        SUB   0x70,4
  9C8  5978        SACH  0x78,1
  9C9  7902        AND   0x02
  9CA  5079        SACL  0x79
  9CB  6678        ZALS  0x78
  9CC  FC00 0A41   BGZ   LA41
  9CE  7F89        ZAC
  9CF  5078        SACL  0x78
  9D0  617B        ADDS  0x7B
  9D1  6171        ADDS  0x71
  9D2  670A        TBLR  0x0A
  9D3  650A        ZALH  0x0A
  9D4  5804        SACH  0x04
  9D5  7E02        LACK  0x02
  9D6  507C        SACL  0x7C
  9D7  7F80        NOP
  9D8  7F80        NOP
  9D9  7F80        NOP
  9DA  7F80        NOP
  9DB  F900 0A4E   B     LA4E

L9DD:
  9DD  6673        ZALS  0x73
  9DE  6307        SUBS  0x07
  9DF  FB00 09F0   BLEZ  L9F0
  9E1  667D        ZALS  0x7D
  9E2  FF00 09EA   BZ    L9EA
  9E4  7E00        LACK  0x00
  9E5  507C        SACL  0x7C
  9E6  507D        SACL  0x7D
  9E7  7F80        NOP
  9E8  F900 09F9   B     L9F9

L9EA:
  9EA  7E01        LACK  0x01
  9EB  507C        SACL  0x7C
  9EC  507D        SACL  0x7D
  9ED  7F80        NOP
  9EE  F900 09F9   B     L9F9

L9F0:
  9F0  7F89        ZAC
  9F1  507C        SACL  0x7C
  9F2  5078        SACL  0x78
  9F3  5079        SACL  0x79
  9F4  7F80        NOP
  9F5  7F80        NOP
  9F6  7F80        NOP
  9F7  7F80        NOP
  9F8  7F80        NOP
L9F9:
  9F9  6502        ZALH  0x02
  9FA  582B        SACH  0x2B
  9FB  7F80        NOP
  9FC  7F80        NOP
  9FD  7F80        NOP
  9FE  7F80        NOP
  9FF  7F80        NOP
  A00  7F80        NOP
  A01  7F80        NOP
  A02  7F80        NOP
  A03  7F80        NOP
  A04  7F80        NOP
  A05  7F80        NOP
  A06  7F80        NOP
  A07  7F80        NOP
  A08  7F80        NOP
  A09  7F80        NOP
  A0A  F900 0A4E   B     LA4E

LA0C:
  A0C  7F80        NOP
  A0D  7F80        NOP
  A0E  7F80        NOP
  A0F  7F80        NOP
  A10  7F80        NOP
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
  A1B  7F80        NOP
  A1C  7F80        NOP
  A1D  7F80        NOP
  A1E  7F80        NOP
  A1F  7F80        NOP
  A20  7F80        NOP
  A21  F900 0A4E   B     LA4E

LA23:
  A23  6A2A        LT    0x2A
  A24  6D72        MPY   0x72
  A25  7F8E        PAC
  A26  590A        SACH  0x0A,1
  A27  2F78        LAC   0x78,15
  A28  6179        ADDS  0x79
  A29  0470        ADD   0x70,4
  A2A  040A        ADD   0x0A,4
  A2B  5978        SACH  0x78,1
  A2C  7902        AND   0x02
  A2D  5079        SACL  0x79
  A2E  6678        ZALS  0x78
  A2F  797A        AND   0x7A
  A30  617B        ADDS  0x7B
  A31  6171        ADDS  0x71
  A32  670A        TBLR  0x0A
  A33  6107        ADDS  0x07
  A34  670B        TBLR  0x0B
  A35  2F0A        LAC   0x0A,15
  A36  6A79        LT    0x79
  A37  6D0A        MPY   0x0A
  A38  7F90        SPAC
  A39  6D0B        MPY   0x0B
  A3A  7F8F        APAC
  A3B  5904        SACH  0x04,1
  A3C  7F80        NOP
  A3D  7F80        NOP
  A3E  7F80        NOP
  A3F  F900 0A4E   B     LA4E

LA41:
  A41  6678        ZALS  0x78
  A42  617B        ADDS  0x7B
  A43  6171        ADDS  0x71
  A44  670A        TBLR  0x0A
  A45  6107        ADDS  0x07
  A46  670B        TBLR  0x0B
  A47  2F0A        LAC   0x0A,15
  A48  6A79        LT    0x79
  A49  6D0A        MPY   0x0A
  A4A  7F90        SPAC
  A4B  6D0B        MPY   0x0B
  A4C  7F8F        APAC
  A4D  5904        SACH  0x04,1
LA4E:
  A4E  7F80        NOP
  A4F  7F80        NOP
  A50  4911        OUT   0x11,PA1
  A51  491C        OUT   0x1C,PA1
  A52  4905        OUT   0x05,PA1
  A53  652A        ZALH  0x2A
  A54  7F88        ABS
  A55  627E        SUBH  0x7E
  A56  FA00 0A5E   BLZ   LA5E
  A58  652A        ZALH  0x2A
  A59  7F88        ABS
  A5A  587E        SACH  0x7E
  A5B  7F80        NOP
  A5C  F900 0A64   B     LA64

LA5E:
  A5E  580A        SACH  0x0A
  A5F  657E        ZALH  0x7E
  A60  6A7F        LT    0x7F
  A61  6D0A        MPY   0x0A
  A62  7F8F        APAC
  A63  587E        SACH  0x7E
LA64:
  A64  1F74        SUB   0x74,15
  A65  4116        IN    0x16,PA1
  A66  7F80        NOP
  A67  4121        IN    0x21,PA1
  A68  7F80        NOP
  A69  410E        IN    0x0E,PA1
  A6A  FA00 0A6E   BLZ   LA6E
  A6C  F900 0A70   B     LA70

LA6E:
  A6E  6574        ZALH  0x74
  A6F  582B        SACH  0x2B
LA70:
  A70  6628        ZALS  0x28
  A71  1207        SUB   0x07,2
  A72  5028        SACL  0x28
  A73  6118        ADDS  0x18
  A74  500A        SACL  0x0A
  A75  001A        ADD   0x1A
  A76  500B        SACL  0x0B
  A77  4829        OUT   0x29,PA0
  A78  7F80        NOP
  A79  4F28        OUT   0x28,PA7
  A7A  4C16        OUT   0x16,PA4
  A7B  440C        IN    0x0C,PA4
  A7C  4C15        OUT   0x15,PA4
  A7D  440C        IN    0x0C,PA4
  A7E  4C14        OUT   0x14,PA4
  A7F  440C        IN    0x0C,PA4
  A80  4C13        OUT   0x13,PA4
  A81  7180        LARK  AR1,0x80
  A82  4F0A        OUT   0x0A,PA7
  A83  44A8        IN    *+,PA4
  A84  44A8        IN    *+,PA4
  A85  44A8        IN    *+,PA4
  A86  44A8        IN    *+,PA4
  A87  44A8        IN    *+,PA4
  A88  4F0B        OUT   0x0B,PA7
  A89  44A8        IN    *+,PA4
  A8A  44A8        IN    *+,PA4
  A8B  44A8        IN    *+,PA4
  A8C  44A8        IN    *+,PA4
  A8D  44A8        IN    *+,PA4
  A8E  6A17        LT    0x17
  A8F  6D19        MPY   0x19
  A90  7F8E        PAC
  A91  590A        SACH  0x0A,1
  A92  6519        ZALH  0x19
  A93  620A        SUBH  0x0A
  A94  580B        SACH  0x0B
  A95  6517        ZALH  0x17
  A96  620A        SUBH  0x0A
  A97  580C        SACH  0x0C
  A98  6502        ZALH  0x02
  A99  6217        SUBH  0x17
  A9A  620B        SUBH  0x0B
  A9B  580D        SACH  0x0D
  A9C  7184        LARK  AR1,0x84
  A9D  7089        LARK  AR0,0x89
  A9E  7F89        ZAC
  A9F  6A98        LT    *-
  AA0  6D0A        MPY   0x0A
  AA1  6C80        LTA   *,AR0
  AA2  6D0B        MPY   0x0B
  AA3  6C98        LTA   *-
  AA4  6D0C        MPY   0x0C
  AA5  4912        OUT   0x12,PA1
  AA6  491D        OUT   0x1D,PA1
  AA7  4904        OUT   0x04,PA1
  AA8  6C81        LTA   *,AR1
  AA9  6D0D        MPY   0x0D
  AAA  7F8F        APAC
  AAB  590F        SACH  0x0F,1
  AAC  7F89        ZAC
  AAD  6A98        LT    *-
  AAE  6D0A        MPY   0x0A
  AAF  6C80        LTA   *,AR0
  AB0  6D0B        MPY   0x0B
  AB1  6C98        LTA   *-
  AB2  6D0C        MPY   0x0C
  AB3  6C81        LTA   *,AR1
  AB4  4113        IN    0x13,PA1
  AB5  7F80        NOP
  AB6  4122        IN    0x22,PA1
  AB7  7F80        NOP
  AB8  411B        IN    0x1B,PA1
  AB9  6D0D        MPY   0x0D
  ABA  7F8F        APAC
  ABB  5910        SACH  0x10,1
  ABC  7F80        NOP
  ABD  6575        ZALH  0x75
  ABE  6205        SUBH  0x05
  ABF  FC00 0ACD   BGZ   LACD
  AC1  FA00 0ADD   BLZ   LADD
  AC3  7F80        NOP
  AC4  7F80        NOP
  AC5  7F80        NOP
  AC6  7F80        NOP
  AC7  7F80        NOP
  AC8  7F80        NOP
  AC9  7F80        NOP
  ACA  7F80        NOP
  ACB  F900 0AE9   B     LAE9

LACD:
  ACD  6505        ZALH  0x05
  ACE  6106        ADDS  0x06
  ACF  0876        ADD   0x76,8
  AD0  5805        SACH  0x05
  AD1  5006        SACL  0x06
  AD2  6275        SUBH  0x75
  AD3  FC00 0AD9   BGZ   LAD9
  AD5  7F80        NOP
  AD6  7F80        NOP
  AD7  F900 0AE9   B     LAE9

LAD9:
  AD9  6575        ZALH  0x75
  ADA  5805        SACH  0x05
  ADB  F900 0AE9   B     LAE9

LADD:
  ADD  6505        ZALH  0x05
  ADE  6106        ADDS  0x06
  ADF  1876        SUB   0x76,8
  AE0  5805        SACH  0x05
  AE1  5006        SACL  0x06
  AE2  6275        SUBH  0x75
  AE3  FA00 0AE7   BLZ   LAE7
  AE5  F900 0AE9   B     LAE9

LAE7:
  AE7  6575        ZALH  0x75
  AE8  5805        SACH  0x05
LAE9:
  AE9  6577        ZALH  0x77
  AEA  6007        ADDH  0x07
  AEB  5877        SACH  0x77
  AEC  7F89        ZAC
  AED  6A98        LT    *-
  AEE  6D0A        MPY   0x0A
  AEF  6C80        LTA   *,AR0
  AF0  6D0B        MPY   0x0B
  AF1  6C98        LTA   *-
  AF2  6D0C        MPY   0x0C
  AF3  6C81        LTA   *,AR1
  AF4  6D0D        MPY   0x0D
  AF5  7F8F        APAC
  AF6  5911        SACH  0x11,1
  AF7  7F89        ZAC
  AF8  6A98        LT    *-
  AF9  6D0A        MPY   0x0A
  AFA  6C80        LTA   *,AR0
  AFB  6D0B        MPY   0x0B
  AFC  6C98        LTA   *-
  AFD  6D0C        MPY   0x0C
  AFE  6C81        LTA   *,AR1
  AFF  6D0D        MPY   0x0D
  B00  7F8F        APAC
  B01  5912        SACH  0x12,1
  B02  6525        ZALH  0x25
  B03  6267        SUBH  0x67
  B04  FC00 0B10   BGZ   LB10
  B06  6525        ZALH  0x25
  B07  606A        ADDH  0x6A
  B08  5825        SACH  0x25
  B09  5026        SACL  0x26
  B0A  7F89        ZAC
  B0B  626A        SUBH  0x6A
  B0C  5827        SACH  0x27
  B0D  7F80        NOP
  B0E  F900 0B20   B     LB20

LB10:
  B10  6525        ZALH  0x25
  B11  6268        SUBH  0x68
  B12  FC00 0B1A   BGZ   LB1A
  B14  6526        ZALH  0x26
  B15  6069        ADDH  0x69
  B16  5826        SACH  0x26
  B17  7F80        NOP
  B18  F900 0B20   B     LB20

LB1A:
  B1A  6525        ZALH  0x25
  B1B  626A        SUBH  0x6A
  B1C  5825        SACH  0x25
  B1D  5026        SACL  0x26
  B1E  656A        ZALH  0x6A
  B1F  5827        SACH  0x27
LB20:
  B20  6518        ZALH  0x18
  B21  6261        SUBH  0x61
  B22  FC00 0B2E   BGZ   LB2E
  B24  6518        ZALH  0x18
  B25  6064        ADDH  0x64
  B26  5818        SACH  0x18
  B27  5019        SACL  0x19
  B28  7F89        ZAC
  B29  6264        SUBH  0x64
  B2A  581A        SACH  0x1A
  B2B  7F80        NOP
  B2C  F900 0B3E   B     LB3E

LB2E:
  B2E  6518        ZALH  0x18
  B2F  6262        SUBH  0x62
  B30  FC00 0B38   BGZ   LB38
  B32  6519        ZALH  0x19
  B33  6063        ADDH  0x63
  B34  5819        SACH  0x19
  B35  7F80        NOP
  B36  F900 0B3E   B     LB3E

LB38:
  B38  6518        ZALH  0x18
  B39  6264        SUBH  0x64
  B3A  5818        SACH  0x18
  B3B  5019        SACL  0x19
  B3C  6564        ZALH  0x64
  B3D  581A        SACH  0x1A
LB3E:
  B3E  2F60        LAC   0x60,15
  B3F  6A0E        LT    0x0E
  B40  6D65        MPY   0x65
  B41  7F8F        APAC
  B42  590A        SACH  0x0A,1
  B43  490F        OUT   0x0F,PA1
  B44  491E        OUT   0x1E,PA1
  B45  4926        OUT   0x26,PA1
  B46  6617        ZALS  0x17
  B47  050A        ADD   0x0A,5
  B48  0F18        ADD   0x18,15
  B49  5918        SACH  0x18,1
  B4A  7902        AND   0x02
  B4B  5017        SACL  0x17
  B4C  2F66        LAC   0x66,15
  B4D  6A1B        LT    0x1B
  B4E  6D6B        MPY   0x6B
  B4F  7F8F        APAC
  B50  590A        SACH  0x0A,1
  B51  7F80        NOP
  B52  4114        IN    0x14,PA1
  B53  6624        ZALS  0x24
  B54  4123        IN    0x23,PA1
  B55  050A        ADD   0x0A,5
  B56  412A        IN    0x2A,PA1
  B57  0F25        ADD   0x25,15
  B58  5925        SACH  0x25,1
  B59  7902        AND   0x02
  B5A  5024        SACL  0x24
  B5B  6628        ZALS  0x28
  B5C  6103        ADDS  0x03
  B5D  500C        SACL  0x0C
  B5E  6125        ADDS  0x25
  B5F  500A        SACL  0x0A
  B60  0027        ADD   0x27
  B61  500B        SACL  0x0B
  B62  4829        OUT   0x29,PA0
  B63  7F80        NOP
  B64  4F0C        OUT   0x0C,PA7
  B65  4C23        OUT   0x23,PA4
  B66  440C        IN    0x0C,PA4
  B67  4C22        OUT   0x22,PA4
  B68  440C        IN    0x0C,PA4
  B69  4C21        OUT   0x21,PA4
  B6A  440C        IN    0x0C,PA4
  B6B  4C20        OUT   0x20,PA4
  B6C  7180        LARK  AR1,0x80
  B6D  4F0A        OUT   0x0A,PA7
  B6E  44A8        IN    *+,PA4
  B6F  44A8        IN    *+,PA4
  B70  44A8        IN    *+,PA4
  B71  44A8        IN    *+,PA4
  B72  44A8        IN    *+,PA4
  B73  4F0B        OUT   0x0B,PA7
  B74  44A8        IN    *+,PA4
  B75  44A8        IN    *+,PA4
  B76  44A8        IN    *+,PA4
  B77  44A8        IN    *+,PA4
  B78  44A8        IN    *+,PA4
  B79  6A24        LT    0x24
  B7A  6D26        MPY   0x26
  B7B  7F8E        PAC
  B7C  590B        SACH  0x0B,1
  B7D  6526        ZALH  0x26
  B7E  620B        SUBH  0x0B
  B7F  580C        SACH  0x0C
  B80  6524        ZALH  0x24
  B81  620B        SUBH  0x0B
  B82  580D        SACH  0x0D
  B83  6502        ZALH  0x02
  B84  6224        SUBH  0x24
  B85  620C        SUBH  0x0C
  B86  5809        SACH  0x09
  B87  7184        LARK  AR1,0x84
  B88  7089        LARK  AR0,0x89
  B89  7F89        ZAC
  B8A  6A98        LT    *-
  B8B  6D0B        MPY   0x0B
  B8C  6C80        LTA   *,AR0
  B8D  6D0C        MPY   0x0C
  B8E  6C98        LTA   *-
  B8F  6D0D        MPY   0x0D
  B90  4910        OUT   0x10,PA1
  B91  491F        OUT   0x1F,PA1
  B92  4925        OUT   0x25,PA1
  B93  6C81        LTA   *,AR1
  B94  6D09        MPY   0x09
  B95  7F8F        APAC
  B96  591C        SACH  0x1C,1
  B97  7F89        ZAC
  B98  6A98        LT    *-
  B99  6D0B        MPY   0x0B
  B9A  6C80        LTA   *,AR0
  B9B  6D0C        MPY   0x0C
  B9C  6C98        LTA   *-
  B9D  6D0D        MPY   0x0D
  B9E  6C81        LTA   *,AR1
  B9F  4115        IN    0x15,PA1
  BA0  7F80        NOP
  BA1  4120        IN    0x20,PA1
  BA2  7F80        NOP
  BA3  7F80        NOP
  BA4  6D09        MPY   0x09
  BA5  7F8F        APAC
  BA6  591D        SACH  0x1D,1
  BA7  F900 0976   B     L976

  BA9  0000        ADD   0x00
  BAA  004F        ADD   0x4F
  BAB  013B        ADD   0x3B,1
  BAC  02C1        ADD   *,2,AR1
  BAD  04DF        ADD   *-,4
  BAE  078F        ADD   *,7
  BAF  0AC9        ADD   *,10
  BB0  0E87        ADD   *,14,AR1
  BB1  12BF        SUB   *+-,2
  BB2  1766        SUB   0x66,7
  BB3  1C71        SUB   0x71,12
  BB4  21D4        LAC   *-,1,AR0
  BB5  2782        LAC   *,7,AR0
  BB6  2D6C        LAC   0x6C,13
  BB7  3383        .word 0x3383
  BB8  39BA        LAR   AR1,*+-
  BB9  3FFF        .word 0x3FFF
  BBA  4645        IN    0x45,PA6
  BBB  4C7C        OUT   0x7C,PA4
  BBC  5293        SACL  *-,AR1
  BBD  587D        SACH  0x7D
  BBE  5E2B        SACH  0x2B,6
  BBF  638E        SUBS  *
  BC0  6899        MAR   *-
  BC1  6D40        MPY   0x40
  BC2  7178        LARK  AR1,0x78
  BC3  7536        .word 0x7536
  BC4  7870        XOR   0x70
  BC5  7B20        LST   0x20
  BC6  7D3E        TBLW  0x3E
  BC7  7EC4        LACK  0xC4
  BC8  7FB0        .word 0x7FB0
  BC9  7FFF        .word 0x7FFF
  BCA  7FB0        .word 0x7FB0
  BCB  7EC4        LACK  0xC4
  BCC  7D3E        TBLW  0x3E
  BCD  7B20        LST   0x20
  BCE  7870        XOR   0x70
  BCF  7536        .word 0x7536
  BD0  7178        LARK  AR1,0x78
  BD1  6D40        MPY   0x40
  BD2  6899        MAR   *-
  BD3  638E        SUBS  *
  BD4  5E2B        SACH  0x2B,6
  BD5  587D        SACH  0x7D
  BD6  5293        SACL  *-,AR1
  BD7  4C7C        OUT   0x7C,PA4
  BD8  4645        IN    0x45,PA6
  BD9  4000        IN    0x00,PA0
  BDA  39BA        LAR   AR1,*+-
  BDB  3383        .word 0x3383
  BDC  2D6C        LAC   0x6C,13
  BDD  2782        LAC   *,7,AR0
  BDE  21D4        LAC   *-,1,AR0
  BDF  1C71        SUB   0x71,12
  BE0  1766        SUB   0x66,7
  BE1  12BF        SUB   *+-,2
  BE2  0E87        ADD   *,14,AR1
  BE3  0AC9        ADD   *,10
  BE4  078F        ADD   *,7
  BE5  04DF        ADD   *-,4
  BE6  02C1        ADD   *,2,AR1
  BE7  013B        ADD   0x3B,1
  BE8  004F        ADD   0x4F
  BE9  0000        ADD   0x00
  BEA  0000        ADD   0x00
  BEB  0000        ADD   0x00
  BEC  0000        ADD   0x00
  BED  0000        ADD   0x00
  BEE  0000        ADD   0x00
  BEF  0000        ADD   0x00
  BF0  0000        ADD   0x00
  BF1  0000        ADD   0x00
  BF2  0000        ADD   0x00
  BF3  0000        ADD   0x00
  BF4  0000        ADD   0x00
  BF5  0000        ADD   0x00
  BF6  0000        ADD   0x00
  BF7  0000        ADD   0x00
  BF8  0000        ADD   0x00
  BF9  0000        ADD   0x00
  BFA  0000        ADD   0x00
  BFB  0000        ADD   0x00
  BFC  0000        ADD   0x00
  BFD  0000        ADD   0x00
  BFE  0000        ADD   0x00
  BFF  0000        ADD   0x00
  C00  0000        ADD   0x00
  C01  0000        ADD   0x00
  C02  0000        ADD   0x00
  C03  0000        ADD   0x00
  C04  0000        ADD   0x00
  C05  0000        ADD   0x00
  C06  0000        ADD   0x00
  C07  0000        ADD   0x00
  C08  0000        ADD   0x00
  C09  0000        ADD   0x00
  C0A  7FFF        .word 0x7FFF
  C0B  7FFF        .word 0x7FFF
  C0C  7FFF        .word 0x7FFF
  C0D  7FFF        .word 0x7FFF
  C0E  7FFF        .word 0x7FFF
  C0F  7FFF        .word 0x7FFF
  C10  7FFF        .word 0x7FFF
  C11  7FFF        .word 0x7FFF
  C12  7FFF        .word 0x7FFF
  C13  7FFF        .word 0x7FFF
  C14  7FFF        .word 0x7FFF
  C15  7FFF        .word 0x7FFF
  C16  7FFF        .word 0x7FFF
  C17  7FFF        .word 0x7FFF
  C18  7FFF        .word 0x7FFF
  C19  7FFF        .word 0x7FFF
  C1A  7FFF        .word 0x7FFF
  C1B  7FFF        .word 0x7FFF
  C1C  7FFF        .word 0x7FFF
  C1D  7FFF        .word 0x7FFF
  C1E  7FFF        .word 0x7FFF
  C1F  7FFF        .word 0x7FFF
  C20  7FFF        .word 0x7FFF
  C21  7FFF        .word 0x7FFF
  C22  7FFF        .word 0x7FFF
  C23  7FFF        .word 0x7FFF
  C24  7FFF        .word 0x7FFF
  C25  7FFF        .word 0x7FFF
  C26  7FFF        .word 0x7FFF
  C27  7FFF        .word 0x7FFF
  C28  7FFF        .word 0x7FFF
  C29  7FFF        .word 0x7FFF
  C2A  0000        ADD   0x00
  C2B  0000        ADD   0x00
  C2C  0208        ADD   0x08,2
  C2D  0410        ADD   0x10,4
  C2E  0618        ADD   0x18,6
  C2F  0820        ADD   0x20,8
  C30  0A29        ADD   0x29,10
  C31  0C31        ADD   0x31,12
  C32  0E39        ADD   0x39,14
  C33  1041        SUB   0x41
  C34  1249        SUB   0x49,2
  C35  1451        SUB   0x51,4
  C36  1659        SUB   0x59,6
  C37  1861        SUB   0x61,8
  C38  1A69        SUB   0x69,10
  C39  1C72        SUB   0x72,12
  C3A  1E7A        SUB   0x7A,14
  C3B  2082        LAC   *,0,AR0
  C3C  228A        LAC   *,2
  C3D  2492        LAC   *-,4,AR0
  C3E  269A        LAC   *-,6
  C3F  28A2        LAC   *+,8,AR0
  C40  2AAA        LAC   *+,10
  C41  2CB2        LAC   *+-,12,AR0
  C42  2EBB        LAC   *+-,14
  C43  30C3        SAR   AR0,*,AR1
  C44  32CB        .word 0x32CB
  C45  34D3        .word 0x34D3
  C46  36DB        .word 0x36DB
  C47  38E3        LAR   AR0,*+,AR1
  C48  3AEB        .word 0x3AEB
  C49  3CF3        .word 0x3CF3
  C4A  3EFB        .word 0x3EFB
  C4B  4104        IN    0x04,PA1
  C4C  430C        IN    0x0C,PA3
  C4D  4514        IN    0x14,PA5
  C4E  471C        IN    0x1C,PA7
  C4F  4924        OUT   0x24,PA1
  C50  4B2C        OUT   0x2C,PA3
  C51  4D34        OUT   0x34,PA5
  C52  4F3C        OUT   0x3C,PA7
  C53  5144        SACL  0x44
  C54  534D        SACL  0x4D
  C55  5555        SACL  0x55
  C56  575D        SACL  0x5D
  C57  5965        SACH  0x65,1
  C58  5B6D        SACH  0x6D,3
  C59  5D75        SACH  0x75,5
  C5A  5F7D        SACH  0x7D,7
  C5B  6185        ADDS  *,AR1
  C5C  638D        SUBS  *
  C5D  6596        ZALH  *-,AR0
  C5E  679E        TBLR  *-
  C5F  69A6        DMOV  *+,AR0
  C60  6BAE        LTD   *+
  C61  6DB6        MPY   *+-,AR0
  C62  6FBE        LDP   *+-
  C63  71C6        LARK  AR1,0xC6
  C64  73CE        .word 0x73CE
  C65  75D6        .word 0x75D6
  C66  77DF        .word 0x77DF
  C67  79E7        AND   *+,AR1
  C68  7BEF        LST   *+
  C69  7DF7        TBLW  *+-,AR1
  C6A  7FFF        .word 0x7FFF
  C6B  0000        ADD   0x00
  C6C  0000        ADD   0x00
  C6D  0400        ADD   0x00,4
  C6E  0800        ADD   0x00,8
  C6F  0C00        ADD   0x00,12
  C70  1000        SUB   0x00
  C71  1400        SUB   0x00,4
  C72  1800        SUB   0x00,8
  C73  1C00        SUB   0x00,12
  C74  2000        LAC   0x00
  C75  2400        LAC   0x00,4
  C76  2800        LAC   0x00,8
  C77  2C00        LAC   0x00,12
  C78  3000        SAR   AR0,0x00
  C79  3400        .word 0x3400
  C7A  3800        LAR   AR0,0x00
  C7B  3C00        .word 0x3C00
  C7C  4000        IN    0x00,PA0
  C7D  43FF        IN    *+-,PA3
  C7E  47FF        IN    *+-,PA7
  C7F  4BFF        OUT   *+-,PA3
  C80  4FFF        OUT   *+-,PA7
  C81  53FF        SACL  *+-
  C82  57FF        SACL  *+-
  C83  5BFF        SACH  *+-,3
  C84  5FFF        SACH  *+-,7
  C85  63FF        SUBS  *+-
  C86  67FF        TBLR  *+-
  C87  6BFF        LTD   *+-
  C88  6FFF        LDP   *+-
  C89  73FF        .word 0x73FF
  C8A  77FF        .word 0x77FF
  C8B  7BFF        LST   *+-
  C8C  7FFF        .word 0x7FFF
  C8D  7BFF        LST   *+-
  C8E  77FF        .word 0x77FF
  C8F  73FF        .word 0x73FF
  C90  6FFF        LDP   *+-
  C91  6BFF        LTD   *+-
  C92  67FF        TBLR  *+-
  C93  63FF        SUBS  *+-
  C94  5FFF        SACH  *+-,7
  C95  5BFF        SACH  *+-,3
  C96  57FF        SACL  *+-
  C97  53FF        SACL  *+-
  C98  4FFF        OUT   *+-,PA7
  C99  4BFF        OUT   *+-,PA3
  C9A  47FF        IN    *+-,PA7
  C9B  43FF        IN    *+-,PA3
  C9C  4000        IN    0x00,PA0
  C9D  3C00        .word 0x3C00
  C9E  3800        LAR   AR0,0x00
  C9F  3400        .word 0x3400
  CA0  3000        SAR   AR0,0x00
  CA1  2C00        LAC   0x00,12
  CA2  2800        LAC   0x00,8
  CA3  2400        LAC   0x00,4
  CA4  2000        LAC   0x00
  CA5  1C00        SUB   0x00,12
  CA6  1800        SUB   0x00,8
  CA7  1400        SUB   0x00,4
  CA8  1000        SUB   0x00
  CA9  0C00        ADD   0x00,12
  CAA  0800        ADD   0x00,8
  CAB  0400        ADD   0x00,4
  CAC  0000        ADD   0x00
  CAD  0000        ADD   0x00
  CAE  0008        ADD   0x08
  CAF  0021        ADD   0x21
  CB0  004A        ADD   0x4A
  CB1  0084        ADD   *,0,AR0
  CB2  00CE        ADD   *
  CB3  0129        ADD   0x29,1
  CB4  0195        ADD   *-,1,AR1
  CB5  0210        ADD   0x10,2
  CB6  029D        ADD   *-,2
  CB7  033A        ADD   0x3A,3
  CB8  03E7        ADD   *+,3,AR1
  CB9  04A5        ADD   *+,4,AR1
  CBA  0573        ADD   0x73,5
  CBB  0652        ADD   0x52,6
  CBC  0742        ADD   0x42,7
  CBD  0841        ADD   0x41,8
  CBE  0952        ADD   0x52,9
  CBF  0A73        ADD   0x73,10
  CC0  0BA4        ADD   *+,11,AR0
  CC1  0CE6        ADD   *+,12,AR0
  CC2  0E39        ADD   0x39,14
  CC3  0F9C        ADD   *-,15
  CC4  110F        SUB   0x0F,1
  CC5  1293        SUB   *-,2,AR1
  CC6  1428        SUB   0x28,4
  CC7  15CD        SUB   *,5
  CC8  1782        SUB   *,7,AR0
  CC9  1948        SUB   0x48,9
  CCA  1B1F        SUB   0x1F,11
  CCB  1D06        SUB   0x06,13
  CCC  1EFE        SUB   *+-,14
  CCD  2106        LAC   0x06,1
  CCE  231E        LAC   0x1E,3
  CCF  2548        LAC   0x48,5
  CD0  2781        LAC   *,7,AR1
  CD1  29CB        LAC   *,9
  CD2  2C26        LAC   0x26,12
  CD3  2E91        LAC   *-,14,AR1
  CD4  310D        SAR   AR1,0x0D
  CD5  3399        .word 0x3399
  CD6  3636        .word 0x3636
  CD7  38E3        LAR   AR0,*+,AR1
  CD8  3BA1        .word 0x3BA1
  CD9  3E6F        .word 0x3E6F
  CDA  414E        IN    0x4E,PA1
  CDB  443D        IN    0x3D,PA4
  CDC  473D        IN    0x3D,PA7
  CDD  4A4D        OUT   0x4D,PA2
  CDE  4D6E        OUT   0x6E,PA5
  CDF  509F        SACL  *-
  CE0  53E1        SACL  *+,AR1
  CE1  5734        SACL  0x34
  CE2  5A96        SACH  *-,2,AR0
  CE3  5E0A        SACH  0x0A,6
  CE4  618E        ADDS  *
  CE5  6522        ZALH  0x22
  CE6  68C7        MAR   *,AR1
  CE7  6C7C        LTA   0x7C
  CE8  7042        LARK  AR0,0x42
  CE9  7419        .word 0x7419
  CEA  7800        XOR   0x00
  CEB  7BF7        LST   *+-
  CEC  7FFF        .word 0x7FFF
  CED  0000        ADD   0x00
  CEE  0000        ADD   0x00
  CEF  0020        ADD   0x20
  CF0  0080        ADD   *,0,AR0
  CF1  0120        ADD   0x20,1
  CF2  0200        ADD   0x00,2
  CF3  0320        ADD   0x20,3
  CF4  0480        ADD   *,4,AR0
  CF5  0620        ADD   0x20,6
  CF6  0800        ADD   0x00,8
  CF7  0A20        ADD   0x20,10
  CF8  0C80        ADD   *,12,AR0
  CF9  0F20        ADD   0x20,15
  CFA  1200        SUB   0x00,2
  CFB  1520        SUB   0x20,5
  CFC  1880        SUB   *,8,AR0
  CFD  1C20        SUB   0x20,12
  CFE  2000        LAC   0x00
  CFF  2420        LAC   0x20,4
  D00  2880        LAC   *,8,AR0
  D01  2D20        LAC   0x20,13
  D02  3200        .word 0x3200
  D03  3720        .word 0x3720
  D04  3C80        .word 0x3C80
  D05  421F        IN    0x1F,PA2
  D06  47FF        IN    *+-,PA7
  D07  4E1F        OUT   0x1F,PA6
  D08  547F        SACL  0x7F
  D09  5B1F        SACH  0x1F,3
  D0A  61FF        ADDS  *+-
  D0B  691F        DMOV  0x1F
  D0C  707F        LARK  AR0,0x7F
  D0D  781F        XOR   0x1F
  D0E  7FFF        .word 0x7FFF
  D0F  781F        XOR   0x1F
  D10  707F        LARK  AR0,0x7F
  D11  691F        DMOV  0x1F
  D12  61FF        ADDS  *+-
  D13  5B1F        SACH  0x1F,3
  D14  547F        SACL  0x7F
  D15  4E1F        OUT   0x1F,PA6
  D16  47FF        IN    *+-,PA7
  D17  421F        IN    0x1F,PA2
  D18  3C80        .word 0x3C80
  D19  3720        .word 0x3720
  D1A  3200        .word 0x3200
  D1B  2D20        LAC   0x20,13
  D1C  2880        LAC   *,8,AR0
  D1D  2420        LAC   0x20,4
  D1E  2000        LAC   0x00
  D1F  1C20        SUB   0x20,12
  D20  1880        SUB   *,8,AR0
  D21  1520        SUB   0x20,5
  D22  1200        SUB   0x00,2
  D23  0F20        ADD   0x20,15
  D24  0C80        ADD   *,12,AR0
  D25  0A20        ADD   0x20,10
  D26  0800        ADD   0x00,8
  D27  0620        ADD   0x20,6
  D28  0480        ADD   *,4,AR0
  D29  0320        ADD   0x20,3
  D2A  0200        ADD   0x00,2
  D2B  0120        ADD   0x20,1
  D2C  0080        ADD   *,0,AR0
  D2D  0020        ADD   0x20
  D2E  0000        ADD   0x00
