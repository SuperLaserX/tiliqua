; Eventide h3500 DSP microcode
; key 0012  algorithm 00 (program 00)  DSP 3
; source H3000-Upgrade_ROM2.BIN offset 02FFC, 992 program words loaded at 800
;
  800  7F80        NOP
  801  7F80        NOP
  802  7F80        NOP
  803  7F80        NOP
  804  7F80        NOP
  805  7F80        NOP
  806  7F80        NOP
  807  7F80        NOP
  808  7F80        NOP
  809  7F80        NOP
  80A  7F80        NOP
  80B  7F80        NOP
  80C  7F80        NOP
  80D  7F80        NOP
  80E  7F80        NOP
  80F  7F80        NOP
  810  7F80        NOP
  811  7F80        NOP
  812  7F80        NOP
  813  7F80        NOP
  814  7F80        NOP
  815  7F80        NOP
  816  7F80        NOP
  817  7F80        NOP
  818  7F80        NOP
  819  7F80        NOP
  81A  7F80        NOP
  81B  7F80        NOP
  81C  7F80        NOP
  81D  7F80        NOP
  81E  7F80        NOP
  81F  7F80        NOP
  820  7F80        NOP
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
  824  7F80        NOP
  825  7F80        NOP
  826  7F80        NOP
  827  7F80        NOP
  828  7F80        NOP
  829  7F80        NOP
  82A  7F80        NOP
  82B  7F80        NOP
  82C  7F80        NOP
  82D  7F80        NOP
  82E  7F80        NOP
  82F  7F80        NOP
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
  87F  7F80        NOP
  880  6621        ZALS  0x21
  881  112E        SUB   0x2E,1
  882  102E        SUB   0x2E
  883  5000        SACL  0x00
  884  7E00        LACK  0x00
  885  5016        SACL  0x16
  886  6634        ZALS  0x34
  887  5003        SACL  0x03
  888  6742        TBLR  0x42
  889  7E01        LACK  0x01
  88A  0003        ADD   0x03
  88B  5003        SACL  0x03
L88C:
  88C  6741        TBLR  0x41
  88D  7E01        LACK  0x01
  88E  0003        ADD   0x03
  88F  5003        SACL  0x03
  890  6541        ZALH  0x41
  891  6242        SUBH  0x42
  892  FA00 089E   BLZ   L89E
  894  6941        DMOV  0x41
  895  6600        ZALS  0x00
  896  102E        SUB   0x2E
  897  5000        SACL  0x00
  898  7E01        LACK  0x01
  899  0016        ADD   0x16
  89A  5016        SACL  0x16
  89B  6603        ZALS  0x03
  89C  F900 088C   B     L88C

L89E:
  89E  6A42        LT    0x42
  89F  6D26        MPY   0x26
  8A0  7F8E        PAC
  8A1  5943        SACH  0x43,1
  8A2  6600        ZALS  0x00
  8A3  1022        SUB   0x22
  8A4  5000        SACL  0x00
  8A5  6603        ZALS  0x03
  8A6  0022        ADD   0x22
  8A7  5003        SACL  0x03
  8A8  3800        LAR   AR0,0x00
  8A9  6603        ZALS  0x03
L8AA:
  8AA  6740        TBLR  0x40
  8AB  6541        ZALH  0x41
  8AC  6242        SUBH  0x42
  8AD  FA00 08C0   BLZ   L8C0
  8AF  6541        ZALH  0x41
  8B0  6240        SUBH  0x40
  8B1  FB00 08C0   BLEZ  L8C0
  8B3  6541        ZALH  0x41
  8B4  6243        SUBH  0x43
  8B5  FA00 08C0   BLZ   L8C0
  8B7  6603        ZALS  0x03
  8B8  102E        SUB   0x2E
  8B9  7D32        TBLW  0x32
  8BA  1034        SUB   0x34
  8BB  1016        SUB   0x16
  8BC  501C        SACL  0x1C
  8BD  7F89        ZAC
  8BE  F900 08C8   B     L8C8

L8C0:
  8C0  6941        DMOV  0x41
  8C1  6940        DMOV  0x40
  8C2  7E01        LACK  0x01
  8C3  0003        ADD   0x03
  8C4  5003        SACL  0x03
  8C5  F400 08AA   BANZ  L8AA
  8C7  6532        ZALH  0x32
L8C8:
  8C8  7F8D        RET

  8C9  7F80        NOP
  8CA  7F80        NOP
  8CB  7F80        NOP
  8CC  7F80        NOP
L8CD:
  8CD  F600 08D1   BIOZ  L8D1
  8CF  F900 08CD   B     L8CD

L8D1:
  8D1  F600 08D1   BIOZ  L8D1
  8D3  4000        IN    0x00,PA0
  8D4  6500        ZALH  0x00
  8D5  FD00 08D8   BGEZ  L8D8
  8D7  7F80        NOP
L8D8:
  8D8  F600 08DC   BIOZ  L8DC
  8DA  F900 08D8   B     L8D8

L8DC:
  8DC  F600 08DC   BIOZ  L8DC
  8DE  7E0C        LACK  0x0C
  8DF  5000        SACL  0x00
  8E0  2C00        LAC   0x00,12
  8E1  5000        SACL  0x00
  8E2  4800        OUT   0x00,PA0
L8E3:
  8E3  F600 08E7   BIOZ  L8E7
  8E5  F900 08E3   B     L8E3

L8E7:
  8E7  F600 08E7   BIOZ  L8E7
  8E9  7F80        NOP
  8EA  7F80        NOP
  8EB  7F80        NOP
  8EC  4500        IN    0x00,PA5
  8ED  6881        LARP  1
  8EE  6600        ZALS  0x00
  8EF  7935        AND   0x35
  8F0  FE00 08F5   BNZ   L8F5
  8F2  6880        LARP  0
  8F3  F900 08F7   B     L8F7

L8F5:
  8F5  3900        LAR   AR1,0x00
  8F6  4680        IN    *,PA6,AR0
L8F7:
  8F7  7F80        NOP
  8F8  7F80        NOP
  8F9  7F80        NOP
  8FA  4000        IN    0x00,PA0
  8FB  212E        LAC   0x2E,1
  8FC  7900        AND   0x00
  8FD  FE00 08E3   BNZ   L8E3
  8FF  7F8D        RET

L900:
  900  F600 0904   BIOZ  L904
  902  F900 0900   B     L900

L904:
  904  F600 0904   BIOZ  L904
  906  4000        IN    0x00,PA0
  907  6500        ZALH  0x00
  908  FD00 090B   BGEZ  L90B
  90A  7F80        NOP
L90B:
  90B  420B        IN    0x0B,PA2
  90C  660B        ZALS  0x0B
  90D  6120        ADDS  0x20
  90E  500A        SACL  0x0A
  90F  7F8D        RET

L910:
  910  F600 0914   BIOZ  L914
  912  F900 0910   B     L910

L914:
  914  F600 0914   BIOZ  L914
  916  4000        IN    0x00,PA0
  917  6500        ZALH  0x00
  918  FD00 091B   BGEZ  L91B
  91A  7F80        NOP
L91B:
  91B  420B        IN    0x0B,PA2
  91C  660B        ZALS  0x0B
  91D  6125        ADDS  0x25
  91E  500A        SACL  0x0A
  91F  7F8D        RET

  920  2121        LAC   0x21,1
  921  0033        ADD   0x33
  922  503F        SACL  0x3F
  923  6633        ZALS  0x33
  924  5009        SACL  0x09
L925:
  925  F800 09DC   CALL  L9DC
  927  7040        LARK  AR0,0x40
  928  713F        LARK  AR1,0x3F
  929  6609        ZALS  0x09
L92A:
  92A  6880        LARP  0
  92B  7DA1        TBLW  *+,AR1
  92C  002E        ADD   0x2E
  92D  F400 092A   BANZ  L92A
  92F  5009        SACL  0x09
  930  6509        ZALH  0x09
  931  623F        SUBH  0x3F
  932  FA00 0925   BLZ   L925
  934  7F8D        RET

  935  2121        LAC   0x21,1
  936  0033        ADD   0x33
  937  503F        SACL  0x3F
  938  6638        ZALS  0x38
  939  5009        SACL  0x09
L93A:
  93A  F800 09DC   CALL  L9DC
  93C  7040        LARK  AR0,0x40
  93D  711F        LARK  AR1,0x1F
L93E:
  93E  6880        LARP  0
  93F  F800 09C9   CALL  L9C9
  941  F800 09C9   CALL  L9C9
  943  6609        ZALS  0x09
  944  7D3D        TBLW  0x3D
  945  002E        ADD   0x2E
  946  5009        SACL  0x09
  947  6881        LARP  1
  948  F400 093E   BANZ  L93E
  94A  6509        ZALH  0x09
  94B  623F        SUBH  0x3F
  94C  FA00 093A   BLZ   L93A
  94E  7F8D        RET

  94F  2121        LAC   0x21,1
  950  0033        ADD   0x33
  951  503F        SACL  0x3F
  952  6638        ZALS  0x38
  953  5009        SACL  0x09
L954:
  954  F800 09DC   CALL  L9DC
  956  7040        LARK  AR0,0x40
  957  710F        LARK  AR1,0x0F
L958:
  958  6880        LARP  0
  959  F800 09C9   CALL  L9C9
  95B  F800 09C9   CALL  L9C9
  95D  F800 09C9   CALL  L9C9
  95F  F800 09C9   CALL  L9C9
  961  6609        ZALS  0x09
  962  7D3D        TBLW  0x3D
  963  002E        ADD   0x2E
  964  5009        SACL  0x09
  965  6881        LARP  1
  966  F400 0958   BANZ  L958
  968  6509        ZALH  0x09
  969  623F        SUBH  0x3F
  96A  FA00 0954   BLZ   L954
  96C  7F8D        RET

  96D  2121        LAC   0x21,1
  96E  0033        ADD   0x33
  96F  503F        SACL  0x3F
  970  6638        ZALS  0x38
  971  5009        SACL  0x09
L972:
  972  F800 09DC   CALL  L9DC
  974  7040        LARK  AR0,0x40
  975  7107        LARK  AR1,0x07
L976:
  976  6880        LARP  0
  977  F800 09C9   CALL  L9C9
  979  F800 09C9   CALL  L9C9
  97B  F800 09C9   CALL  L9C9
  97D  F800 09C9   CALL  L9C9
  97F  F800 09C9   CALL  L9C9
  981  F800 09C9   CALL  L9C9
  983  F800 09C9   CALL  L9C9
  985  F800 09C9   CALL  L9C9
  987  6609        ZALS  0x09
  988  7D3D        TBLW  0x3D
  989  002E        ADD   0x2E
  98A  5009        SACL  0x09
  98B  6881        LARP  1
  98C  F400 0976   BANZ  L976
  98E  6509        ZALH  0x09
  98F  623F        SUBH  0x3F
  990  FA00 0972   BLZ   L972
  992  7F8D        RET

  993  2121        LAC   0x21,1
  994  0033        ADD   0x33
  995  503F        SACL  0x3F
  996  6638        ZALS  0x38
  997  5009        SACL  0x09
L998:
  998  F800 09DC   CALL  L9DC
  99A  7040        LARK  AR0,0x40
  99B  7103        LARK  AR1,0x03
L99C:
  99C  6880        LARP  0
  99D  F800 09C9   CALL  L9C9
  99F  F800 09C9   CALL  L9C9
  9A1  F800 09C9   CALL  L9C9
  9A3  F800 09C9   CALL  L9C9
  9A5  F800 09C9   CALL  L9C9
  9A7  F800 09C9   CALL  L9C9
  9A9  F800 09C9   CALL  L9C9
  9AB  F800 09C9   CALL  L9C9
  9AD  F800 09C9   CALL  L9C9
  9AF  F800 09C9   CALL  L9C9
  9B1  F800 09C9   CALL  L9C9
  9B3  F800 09C9   CALL  L9C9
  9B5  F800 09C9   CALL  L9C9
  9B7  F800 09C9   CALL  L9C9
  9B9  F800 09C9   CALL  L9C9
  9BB  F800 09C9   CALL  L9C9
  9BD  6609        ZALS  0x09
  9BE  7D3D        TBLW  0x3D
  9BF  002E        ADD   0x2E
  9C0  5009        SACL  0x09
  9C1  6881        LARP  1
  9C2  F400 099C   BANZ  L99C
  9C4  6509        ZALH  0x09
  9C5  623F        SUBH  0x3F
  9C6  FA00 0998   BLZ   L998
  9C8  7F8D        RET

L9C9:
  9C9  65A8        ZALH  *+
  9CA  583A        SACH  0x3A
  9CB  7F89        ZAC
  9CC  6A3C        LT    0x3C
  9CD  6D2C        MPY   0x2C
  9CE  6B3B        LTD   0x3B
  9CF  6D2B        MPY   0x2B
  9D0  6B3A        LTD   0x3A
  9D1  6D2A        MPY   0x2A
  9D2  6C3E        LTA   0x3E
  9D3  6D29        MPY   0x29
  9D4  6B3D        LTD   0x3D
  9D5  6D28        MPY   0x28
  9D6  0F3D        ADD   0x3D,15
  9D7  7F8F        APAC
  9D8  583D        SACH  0x3D
  9D9  603D        ADDH  0x3D
  9DA  583D        SACH  0x3D
  9DB  7F8D        RET

L9DC:
  9DC  7103        LARK  AR1,0x03
  9DD  707F        LARK  AR0,0x7F
L9DE:
  9DE  F600 09E2   BIOZ  L9E2
  9E0  F900 09DE   B     L9DE

L9E2:
  9E2  F600 09E2   BIOZ  L9E2
  9E4  4000        IN    0x00,PA0
  9E5  6500        ZALH  0x00
  9E6  FD00 09E9   BGEZ  L9E9
  9E8  7F80        NOP
L9E9:
  9E9  6880        LARP  0
  9EA  7F80        NOP
L9EB:
  9EB  F600 09EF   BIOZ  L9EF
  9ED  F900 09EB   B     L9EB

L9EF:
  9EF  F600 09EF   BIOZ  L9EF
  9F1  4F0A        OUT   0x0A,PA7
  9F2  7F80        NOP
  9F3  4498        IN    *-,PA4
  9F4  4498        IN    *-,PA4
  9F5  7F80        NOP
  9F6  7F80        NOP
  9F7  4498        IN    *-,PA4
  9F8  4498        IN    *-,PA4
  9F9  7F80        NOP
  9FA  7F80        NOP
  9FB  4498        IN    *-,PA4
  9FC  4498        IN    *-,PA4
  9FD  7F80        NOP
  9FE  7F80        NOP
  9FF  4498        IN    *-,PA4
  A00  4498        IN    *-,PA4
  A01  4498        IN    *-,PA4
  A02  7E09        LACK  0x09
  A03  610A        ADDS  0x0A
  A04  500A        SACL  0x0A
  A05  7E04        LACK  0x04
LA06:
  A06  102E        SUB   0x2E
  A07  FC00 0A06   BGZ   LA06
  A09  4F0A        OUT   0x0A,PA7
  A0A  4498        IN    *-,PA4
  A0B  4498        IN    *-,PA4
  A0C  4498        IN    *-,PA4
  A0D  7F80        NOP
  A0E  7F80        NOP
  A0F  4498        IN    *-,PA4
  A10  4498        IN    *-,PA4
  A11  7F80        NOP
  A12  7F80        NOP
  A13  4498        IN    *-,PA4
  A14  4498        IN    *-,PA4
  A15  7F80        NOP
  A16  7E07        LACK  0x07
  A17  610A        ADDS  0x0A
  A18  500A        SACL  0x0A
  A19  6881        LARP  1
  A1A  F400 09E9   BANZ  L9E9
  A1C  6880        LARP  0
  A1D  660A        ZALS  0x0A
  A1E  172E        SUB   0x2E,7
  A1F  500A        SACL  0x0A
  A20  7F8D        RET

  A21  6633        ZALS  0x33
  A22  5009        SACL  0x09
  A23  2121        LAC   0x21,1
  A24  102E        SUB   0x2E
  A25  5000        SACL  0x00
  A26  6880        LARP  0
  A27  3800        LAR   AR0,0x00
  A28  F800 0A2F   CALL  LA2F
  A2A  6600        ZALS  0x00
  A2B  5042        SACL  0x42
  A2C  6601        ZALS  0x01
  A2D  5045        SACL  0x45
  A2E  7F8D        RET

LA2F:
  A2F  7F89        ZAC
  A30  5000        SACL  0x00
  A31  5001        SACL  0x01
  A32  6609        ZALS  0x09
LA33:
  A33  6708        TBLR  0x08
  A34  6508        ZALH  0x08
  A35  6200        SUBH  0x00
  A36  FA00 0A3C   BLZ   LA3C
  A38  6508        ZALH  0x08
  A39  5800        SACH  0x00
  A3A  F900 0A42   B     LA42

LA3C:
  A3C  6508        ZALH  0x08
  A3D  6201        SUBH  0x01
  A3E  FC00 0A42   BGZ   LA42
  A40  6508        ZALH  0x08
  A41  5801        SACH  0x01
LA42:
  A42  7E01        LACK  0x01
  A43  0009        ADD   0x09
  A44  5009        SACL  0x09
  A45  F400 0A33   BANZ  LA33
  A47  7F8D        RET

  A48  2F42        LAC   0x42,15
  A49  0F45        ADD   0x45,15
  A4A  5848        SACH  0x48
  A4B  2F42        LAC   0x42,15
  A4C  1F45        SUB   0x45,15
  A4D  5849        SACH  0x49
  A4E  6549        ZALH  0x49
  A4F  622D        SUBH  0x2D
  A50  FC00 0A55   BGZ   LA55
  A52  6532        ZALH  0x32
  A53  F900 0A64   B     LA64

LA55:
  A55  2F32        LAC   0x32,15
  A56  5800        SACH  0x00
  A57  6880        LARP  0
  A58  700F        LARK  AR0,0x0F
  A59  2000        LAC   0x00
LA5A:
  A5A  6449        SUBC  0x49
  A5B  F400 0A5A   BANZ  LA5A
  A5D  501A        SACL  0x1A
  A5E  651A        ZALH  0x1A
  A5F  FE00 0A63   BNZ   LA63
  A61  652E        ZALH  0x2E
  A62  581A        SACH  0x1A
LA63:
  A63  7F89        ZAC
LA64:
  A64  7F8D        RET

  A65  7F89        ZAC
  A66  5009        SACL  0x09
LA67:
  A67  6609        ZALS  0x09
  A68  0033        ADD   0x33
  A69  6708        TBLR  0x08
  A6A  6508        ZALH  0x08
  A6B  6248        SUBH  0x48
  A6C  5808        SACH  0x08
  A6D  6A08        LT    0x08
  A6E  6D1A        MPY   0x1A
  A6F  7F8E        PAC
  A70  5008        SACL  0x08
  A71  6A08        LT    0x08
  A72  6D24        MPY   0x24
  A73  7F8E        PAC
  A74  5908        SACH  0x08,1
  A75  6609        ZALS  0x09
  A76  0033        ADD   0x33
  A77  7D08        TBLW  0x08
  A78  6609        ZALS  0x09
  A79  002E        ADD   0x2E
  A7A  5009        SACL  0x09
  A7B  1121        SUB   0x21,1
  A7C  142E        SUB   0x2E,4
  A7D  FB00 0A67   BLEZ  LA67
  A7F  7F8D        RET

  A80  7E01        LACK  0x01
  A81  5015        SACL  0x15
  A82  6621        ZALS  0x21
  A83  5017        SACL  0x17
  A84  7E0E        LACK  0x0E
  A85  5018        SACL  0x18
  A86  7F89        ZAC
  A87  5014        SACL  0x14
  A88  F800 0AF6   CALL  LAF6
  A8A  6621        ZALS  0x21
  A8B  1022        SUB   0x22
  A8C  102F        SUB   0x2F
  A8D  5018        SACL  0x18
  A8E  6622        ZALS  0x22
  A8F  5014        SACL  0x14
  A90  F800 0AF6   CALL  LAF6
  A92  7F8D        RET

  A93  6633        ZALS  0x33
  A94  5009        SACL  0x09
  A95  651C        ZALH  0x1C
  A96  5800        SACH  0x00
  A97  3800        LAR   AR0,0x00
  A98  F800 0AE5   CALL  LAE5
  A9A  FE00 0AE1   BNZ   LAE1
  A9C  6600        ZALS  0x00
  A9D  5040        SACL  0x40
  A9E  6601        ZALS  0x01
  A9F  5041        SACL  0x41
  AA0  6609        ZALS  0x09
  AA1  5044        SACL  0x44
  AA2  001C        ADD   0x1C
  AA3  112E        SUB   0x2E,1
  AA4  5009        SACL  0x09
  AA5  7003        LARK  AR0,0x03
  AA6  F800 0AE5   CALL  LAE5
  AA8  FE00 0AE1   BNZ   LAE1
  AAA  6600        ZALS  0x00
  AAB  5042        SACL  0x42
  AAC  6601        ZALS  0x01
  AAD  5043        SACL  0x43
  AAE  6609        ZALS  0x09
  AAF  5046        SACL  0x46
  AB0  6540        ZALH  0x40
  AB1  7F88        ABS
  AB2  5800        SACH  0x00
  AB3  6541        ZALH  0x41
  AB4  6240        SUBH  0x40
  AB5  7F88        ABS
  AB6  5801        SACH  0x01
  AB7  6880        LARP  0
  AB8  6500        ZALH  0x00
  AB9  700E        LARK  AR0,0x0E
LABA:
  ABA  6401        SUBC  0x01
  ABB  F400 0ABA   BANZ  LABA
  ABD  5045        SACL  0x45
  ABE  2145        LAC   0x45,1
  ABF  5045        SACL  0x45
  AC0  6542        ZALH  0x42
  AC1  7F88        ABS
  AC2  5800        SACH  0x00
  AC3  6543        ZALH  0x43
  AC4  6242        SUBH  0x42
  AC5  7F88        ABS
  AC6  5801        SACH  0x01
  AC7  6880        LARP  0
  AC8  6500        ZALH  0x00
  AC9  700E        LARK  AR0,0x0E
LACA:
  ACA  6401        SUBC  0x01
  ACB  F400 0ACA   BANZ  LACA
  ACD  5047        SACL  0x47
  ACE  2147        LAC   0x47,1
  ACF  5047        SACL  0x47
  AD0  6546        ZALH  0x46
  AD1  6147        ADDS  0x47
  AD2  6244        SUBH  0x44
  AD3  6345        SUBS  0x45
  AD4  5804        SACH  0x04
  AD5  5005        SACL  0x05
  AD6  621C        SUBH  0x1C
  AD7  7F88        ABS
  AD8  112E        SUB   0x2E,1
  AD9  FA00 0AE1   BLZ   LAE1
  ADB  6504        ZALH  0x04
  ADC  6105        ADDS  0x05
  ADD  581C        SACH  0x1C
  ADE  501D        SACL  0x1D
  ADF  7F89        ZAC
  AE0  7F8D        RET

LAE1:
  AE1  7F89        ZAC
  AE2  501D        SACL  0x1D
  AE3  6532        ZALH  0x32
  AE4  7F8D        RET

LAE5:
  AE5  6880        LARP  0
LAE6:
  AE6  6609        ZALS  0x09
  AE7  6700        TBLR  0x00
  AE8  002E        ADD   0x2E
  AE9  6701        TBLR  0x01
  AEA  5009        SACL  0x09
  AEB  6A00        LT    0x00
  AEC  6D01        MPY   0x01
  AED  7F8E        PAC
  AEE  FB00 0AF4   BLEZ  LAF4
  AF0  F400 0AE6   BANZ  LAE6
  AF2  6632        ZALS  0x32
  AF3  7F8D        RET

LAF4:
  AF4  7F89        ZAC
  AF5  7F8D        RET

LAF6:
  AF6  6A15        LT    0x15
  AF7  8020        MPYK  32
  AF8  7F8E        PAC
  AF9  503F        SACL  0x3F
  AFA  6633        ZALS  0x33
  AFB  5002        SACL  0x02
  AFC  F800 0B8A   CALL  LB8A
  AFE  6633        ZALS  0x33
  AFF  0014        ADD   0x14
  B00  5002        SACL  0x02
  B01  F800 0B93   CALL  LB93
  B03  663F        ZALS  0x3F
  B04  0033        ADD   0x33
  B05  0014        ADD   0x14
  B06  5002        SACL  0x02
  B07  6634        ZALS  0x34
  B08  0014        ADD   0x14
  B09  5003        SACL  0x03
  B0A  6880        LARP  0
  B0B  3818        LAR   AR0,0x18
  B0C  6519        ZALH  0x19
  B0D  FE00 0B13   BNZ   LB13
  B0F  F800 0B56   CALL  LB56
  B11  F900 0B15   B     LB15

LB13:
  B13  F800 0B6B   CALL  LB6B
LB15:
  B15  663F        ZALS  0x3F
  B16  503E        SACL  0x3E
LB17:
  B17  663E        ZALS  0x3E
  B18  0033        ADD   0x33
  B19  5002        SACL  0x02
  B1A  F800 0B8A   CALL  LB8A
  B1C  663E        ZALS  0x3E
  B1D  0014        ADD   0x14
  B1E  0033        ADD   0x33
  B1F  5002        SACL  0x02
  B20  F800 0B93   CALL  LB93
  B22  6634        ZALS  0x34
  B23  0014        ADD   0x14
  B24  5003        SACL  0x03
  B25  6602        ZALS  0x02
  B26  003F        ADD   0x3F
  B27  5002        SACL  0x02
  B28  6880        LARP  0
  B29  3818        LAR   AR0,0x18
  B2A  F800 0B6B   CALL  LB6B
  B2C  663E        ZALS  0x3E
  B2D  003F        ADD   0x3F
  B2E  503E        SACL  0x3E
  B2F  653E        ZALH  0x3E
  B30  6217        SUBH  0x17
  B31  FA00 0B17   BLZ   LB17
  B33  7F8D        RET

  B34  7EFF        LACK  0xFF
  B35  5001        SACL  0x01
  B36  281D        LAC   0x1D,8
  B37  5800        SACH  0x00
  B38  6600        ZALS  0x00
  B39  7901        AND   0x01
  B3A  5000        SACL  0x00
  B3B  6A23        LT    0x23
  B3C  6D00        MPY   0x00
  B3D  7F8E        PAC
  B3E  5000        SACL  0x00
  B3F  2800        LAC   0x00,8
  B40  5800        SACH  0x00
  B41  6D1C        MPY   0x1C
  B42  7F8E        PAC
  B43  0000        ADD   0x00
  B44  501E        SACL  0x1E
  B45  7F8D        RET

LB46:
  B46  F600 0B4A   BIOZ  LB4A
  B48  F900 0B46   B     LB46

LB4A:
  B4A  F600 0B4A   BIOZ  LB4A
  B4C  491E        OUT   0x1E,PA1
  B4D  7F8D        RET

LB4E:
  B4E  F600 0B52   BIOZ  LB52
  B50  F900 0B4E   B     LB4E

LB52:
  B52  F600 0B52   BIOZ  LB52
  B54  4B1E        OUT   0x1E,PA3
  B55  7F8D        RET

LB56:
  B56  F800 0B9C   CALL  LB9C
  B58  6603        ZALS  0x03
  B59  7D00        TBLW  0x00
  B5A  7E01        LACK  0x01
  B5B  0003        ADD   0x03
  B5C  5003        SACL  0x03
LB5D:
  B5D  6602        ZALS  0x02
  B5E  6760        TBLR  0x60
  B5F  0015        ADD   0x15
  B60  5002        SACL  0x02
  B61  F800 0B9C   CALL  LB9C
  B63  6603        ZALS  0x03
  B64  7D00        TBLW  0x00
  B65  7E01        LACK  0x01
  B66  0003        ADD   0x03
  B67  5003        SACL  0x03
  B68  F400 0B5D   BANZ  LB5D
  B6A  7F8D        RET

LB6B:
  B6B  F800 0B9C   CALL  LB9C
  B6D  6603        ZALS  0x03
  B6E  6701        TBLR  0x01
  B6F  6500        ZALH  0x00
  B70  6001        ADDH  0x01
  B71  5800        SACH  0x00
  B72  6603        ZALS  0x03
  B73  7D00        TBLW  0x00
  B74  7E01        LACK  0x01
  B75  0003        ADD   0x03
  B76  5003        SACL  0x03
LB77:
  B77  6602        ZALS  0x02
  B78  6760        TBLR  0x60
  B79  0015        ADD   0x15
  B7A  5002        SACL  0x02
  B7B  F800 0B9C   CALL  LB9C
  B7D  6603        ZALS  0x03
  B7E  6701        TBLR  0x01
  B7F  6501        ZALH  0x01
  B80  6000        ADDH  0x00
  B81  5800        SACH  0x00
  B82  6603        ZALS  0x03
  B83  7D00        TBLW  0x00
  B84  7E01        LACK  0x01
  B85  0003        ADD   0x03
  B86  5003        SACL  0x03
  B87  F400 0B77   BANZ  LB77
  B89  7F8D        RET

LB8A:
  B8A  701F        LARK  AR0,0x1F
  B8B  715F        LARK  AR1,0x5F
  B8C  6602        ZALS  0x02
LB8D:
  B8D  6881        LARP  1
  B8E  6790        TBLR  *-,AR0
  B8F  0015        ADD   0x15
  B90  F400 0B8D   BANZ  LB8D
  B92  7F8D        RET

LB93:
  B93  701F        LARK  AR0,0x1F
  B94  717F        LARK  AR1,0x7F
  B95  6602        ZALS  0x02
LB96:
  B96  6881        LARP  1
  B97  6790        TBLR  *-,AR0
  B98  0015        ADD   0x15
  B99  F400 0B96   BANZ  LB96
  B9B  7F8D        RET

LB9C:
  B9C  7F89        ZAC
  B9D  6A7F        LT    0x7F
  B9E  6D5F        MPY   0x5F
  B9F  6B7E        LTD   0x7E
  BA0  6D5E        MPY   0x5E
  BA1  6B7D        LTD   0x7D
  BA2  6D5D        MPY   0x5D
  BA3  6B7C        LTD   0x7C
  BA4  6D5C        MPY   0x5C
  BA5  6B7B        LTD   0x7B
  BA6  6D5B        MPY   0x5B
  BA7  6B7A        LTD   0x7A
  BA8  6D5A        MPY   0x5A
  BA9  6B79        LTD   0x79
  BAA  6D59        MPY   0x59
  BAB  6B78        LTD   0x78
  BAC  6D58        MPY   0x58
  BAD  6B77        LTD   0x77
  BAE  6D57        MPY   0x57
  BAF  6B76        LTD   0x76
  BB0  6D56        MPY   0x56
  BB1  6B75        LTD   0x75
  BB2  6D55        MPY   0x55
  BB3  6B74        LTD   0x74
  BB4  6D54        MPY   0x54
  BB5  6B73        LTD   0x73
  BB6  6D53        MPY   0x53
  BB7  6B72        LTD   0x72
  BB8  6D52        MPY   0x52
  BB9  6B71        LTD   0x71
  BBA  6D51        MPY   0x51
  BBB  6B70        LTD   0x70
  BBC  6D50        MPY   0x50
  BBD  6B6F        LTD   0x6F
  BBE  6D4F        MPY   0x4F
  BBF  6B6E        LTD   0x6E
  BC0  6D4E        MPY   0x4E
  BC1  6B6D        LTD   0x6D
  BC2  6D4D        MPY   0x4D
  BC3  6B6C        LTD   0x6C
  BC4  6D4C        MPY   0x4C
  BC5  6B6B        LTD   0x6B
  BC6  6D4B        MPY   0x4B
  BC7  6B6A        LTD   0x6A
  BC8  6D4A        MPY   0x4A
  BC9  6B69        LTD   0x69
  BCA  6D49        MPY   0x49
  BCB  6B68        LTD   0x68
  BCC  6D48        MPY   0x48
  BCD  6B67        LTD   0x67
  BCE  6D47        MPY   0x47
  BCF  6B66        LTD   0x66
  BD0  6D46        MPY   0x46
  BD1  6B65        LTD   0x65
  BD2  6D45        MPY   0x45
  BD3  6B64        LTD   0x64
  BD4  6D44        MPY   0x44
  BD5  6B63        LTD   0x63
  BD6  6D43        MPY   0x43
  BD7  6B62        LTD   0x62
  BD8  6D42        MPY   0x42
  BD9  6B61        LTD   0x61
  BDA  6D41        MPY   0x41
  BDB  6B60        LTD   0x60
  BDC  6D40        MPY   0x40
  BDD  7F8F        APAC
  BDE  5900        SACH  0x00,1
  BDF  7F8D        RET

