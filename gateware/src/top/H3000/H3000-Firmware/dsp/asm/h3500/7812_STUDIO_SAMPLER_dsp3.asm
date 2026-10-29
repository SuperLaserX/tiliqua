; Eventide h3500 DSP microcode
; key 7812  algorithm 78 (STUDIO SAMPLER)  DSP 3
; source H3000-Upgrade_ROM3.BIN offset 2DBC2, 1246 program words loaded at 800
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
  80C  5070        SACL  0x70
  80D  2A70        LAC   0x70,10
  80E  5074        SACL  0x74
  80F  2F70        LAC   0x70,15
  810  5073        SACL  0x73
  811  7F89        ZAC
  812  506F        SACL  0x6F
  813  1070        SUB   0x70
  814  5871        SACH  0x71
  815  7EFF        LACK  0xFF
  816  5075        SACL  0x75
  817  2775        LAC   0x75,7
  818  7A75        OR    0x75
  819  5072        SACL  0x72
  81A  6A70        LT    0x70
  81B  8D6A        MPYK  3434
  81C  7F8E        PAC
  81D  5067        SACL  0x67
  81E  8CDE        MPYK  3294
  81F  7F8E        PAC
  820  5068        SACL  0x68
  821  7E3F        LACK  0x3F
  822  5055        SACL  0x55
  823  6571        ZALH  0x71
  824  5856        SACH  0x56
  825  7F80        NOP
  826  7F80        NOP
  827  7F80        NOP
  828  7F80        NOP
  829  7F89        ZAC
  82A  5069        SACL  0x69
  82B  7EBB        LACK  0xBB
  82C  5075        SACL  0x75
  82D  2475        LAC   0x75,4
  82E  506E        SACL  0x6E
  82F  2A70        LAC   0x70,10
  830  5049        SACL  0x49
  831  2F49        LAC   0x49,15
  832  584A        SACH  0x4A
  833  2F49        LAC   0x49,15
  834  5848        SACH  0x48
  835  2C70        LAC   0x70,12
  836  5054        SACL  0x54
  837  2870        LAC   0x70,8
  838  5051        SACL  0x51
L839:
  839  F800 0A38   CALL  LA38
L83B:
  83B  7E19        LACK  0x19
  83C  F800 09FB   CALL  L9FB
  83E  F800 0A0A   CALL  LA0A
  840  6540        ZALH  0x40
  841  FF00 083B   BZ    L83B
  843  F800 0A2C   CALL  LA2C
  845  F800 0A87   CALL  LA87
  847  6542        ZALH  0x42
  848  584E        SACH  0x4E
  849  2871        LAC   0x71,8
  84A  7943        AND   0x43
  84B  504F        SACL  0x4F
  84C  2A43        LAC   0x43,10
  84D  5066        SACL  0x66
  84E  5865        SACH  0x65
  84F  2A71        LAC   0x71,10
  850  7871        XOR   0x71
  851  7965        AND   0x65
  852  0A42        ADD   0x42,10
  853  5065        SACL  0x65
  854  2271        LAC   0x71,2
  855  7965        AND   0x65
  856  5052        SACL  0x52
  857  2A47        LAC   0x47,10
  858  5066        SACL  0x66
  859  5865        SACH  0x65
  85A  2A71        LAC   0x71,10
  85B  7871        XOR   0x71
  85C  7965        AND   0x65
  85D  0A46        ADD   0x46,10
  85E  5065        SACL  0x65
  85F  2271        LAC   0x71,2
  860  7965        AND   0x65
  861  5053        SACL  0x53
  862  2A70        LAC   0x70,10
  863  5051        SACL  0x51
L864:
  864  654E        ZALH  0x4E
  865  614F        ADDS  0x4F
  866  6150        ADDS  0x50
  867  6255        SUBH  0x55
  868  6356        SUBS  0x56
  869  FA00 0871   BLZ   L871
  86B  7F89        ZAC
  86C  584D        SACH  0x4D
  86D  6549        ZALH  0x49
  86E  584C        SACH  0x4C
  86F  F900 089C   B     L89C

L871:
  871  F800 0A8B   CALL  LA8B
  873  F800 0BB1   CALL  LBB1
  875  F800 0BF0   CALL  LBF0
  877  F800 0C0D   CALL  LC0D
  879  F800 0B8D   CALL  LB8D
  87B  656C        ZALH  0x6C
  87C  584C        SACH  0x4C
  87D  656B        ZALH  0x6B
  87E  626A        SUBH  0x6A
  87F  FA00 0885   BLZ   L885
  881  6572        ZALH  0x72
  882  584D        SACH  0x4D
  883  F900 089C   B     L89C

L885:
  885  6880        LARP  0
  886  6A6B        LT    0x6B
  887  6D6A        MPY   0x6A
  888  7F8E        PAC
  889  5875        SACH  0x75
  88A  206A        LAC   0x6A
  88B  7F88        ABS
  88C  5076        SACL  0x76
  88D  206B        LAC   0x6B
  88E  7F88        ABS
  88F  5077        SACL  0x77
  890  6577        ZALH  0x77
  891  700E        LARK  AR0,0x0E
L892:
  892  6476        SUBC  0x76
  893  F400 0892   BANZ  L892
  895  504D        SACL  0x4D
  896  6575        ZALH  0x75
  897  FD00 089C   BGEZ  L89C
  899  7F89        ZAC
  89A  624D        SUBH  0x4D
  89B  584D        SACH  0x4D
L89C:
  89C  F800 0A73   CALL  LA73
  89E  6652        ZALS  0x52
  89F  0170        ADD   0x70,1
  8A0  5052        SACL  0x52
  8A1  F800 0A73   CALL  LA73
  8A3  6652        ZALS  0x52
  8A4  0170        ADD   0x70,1
  8A5  5052        SACL  0x52
  8A6  F800 0A73   CALL  LA73
  8A8  6652        ZALS  0x52
  8A9  0170        ADD   0x70,1
  8AA  5052        SACL  0x52
  8AB  F800 0A73   CALL  LA73
  8AD  6652        ZALS  0x52
  8AE  1370        SUB   0x70,3
  8AF  1270        SUB   0x70,2
  8B0  5052        SACL  0x52
  8B1  654B        ZALH  0x4B
  8B2  FF00 08D0   BZ    L8D0
  8B4  6652        ZALS  0x52
  8B5  6153        ADDS  0x53
  8B6  1170        SUB   0x70,1
  8B7  5052        SACL  0x52
  8B8  F800 0A73   CALL  LA73
  8BA  6652        ZALS  0x52
  8BB  0170        ADD   0x70,1
  8BC  5052        SACL  0x52
  8BD  F800 0A73   CALL  LA73
  8BF  6652        ZALS  0x52
  8C0  0170        ADD   0x70,1
  8C1  5052        SACL  0x52
  8C2  F800 0A73   CALL  LA73
  8C4  6652        ZALS  0x52
  8C5  0170        ADD   0x70,1
  8C6  5052        SACL  0x52
  8C7  F800 0A73   CALL  LA73
  8C9  6652        ZALS  0x52
  8CA  1370        SUB   0x70,3
  8CB  1270        SUB   0x70,2
  8CC  5052        SACL  0x52
  8CD  6652        ZALS  0x52
  8CE  6353        SUBS  0x53
  8CF  5052        SACL  0x52
L8D0:
  8D0  654E        ZALH  0x4E
  8D1  614F        ADDS  0x4F
  8D2  6350        SUBS  0x50
  8D3  FC00 08DB   BGZ   L8DB
  8D5  7F89        ZAC
  8D6  584D        SACH  0x4D
  8D7  6549        ZALH  0x49
  8D8  584C        SACH  0x4C
  8D9  F900 0906   B     L906

L8DB:
  8DB  F800 0AE8   CALL  LAE8
  8DD  F800 0BB1   CALL  LBB1
  8DF  F800 0BF0   CALL  LBF0
  8E1  F800 0C0D   CALL  LC0D
  8E3  F800 0B8D   CALL  LB8D
  8E5  656C        ZALH  0x6C
  8E6  584C        SACH  0x4C
  8E7  656B        ZALH  0x6B
  8E8  626A        SUBH  0x6A
  8E9  FA00 08EF   BLZ   L8EF
  8EB  6572        ZALH  0x72
  8EC  584D        SACH  0x4D
  8ED  F900 0906   B     L906

L8EF:
  8EF  6880        LARP  0
  8F0  6A6B        LT    0x6B
  8F1  6D6A        MPY   0x6A
  8F2  7F8E        PAC
  8F3  5875        SACH  0x75
  8F4  206A        LAC   0x6A
  8F5  7F88        ABS
  8F6  5076        SACL  0x76
  8F7  206B        LAC   0x6B
  8F8  7F88        ABS
  8F9  5077        SACL  0x77
  8FA  6577        ZALH  0x77
  8FB  700E        LARK  AR0,0x0E
L8FC:
  8FC  6476        SUBC  0x76
  8FD  F400 08FC   BANZ  L8FC
  8FF  504D        SACL  0x4D
  900  6575        ZALH  0x75
  901  FD00 0906   BGEZ  L906
  903  7F89        ZAC
  904  624D        SUBH  0x4D
  905  584D        SACH  0x4D
L906:
  906  F800 0A73   CALL  LA73
  908  6652        ZALS  0x52
  909  0170        ADD   0x70,1
  90A  5052        SACL  0x52
  90B  F800 0A73   CALL  LA73
  90D  6652        ZALS  0x52
  90E  0170        ADD   0x70,1
  90F  5052        SACL  0x52
  910  F800 0A73   CALL  LA73
  912  6652        ZALS  0x52
  913  0170        ADD   0x70,1
  914  5052        SACL  0x52
  915  F800 0A73   CALL  LA73
  917  654B        ZALH  0x4B
  918  FF00 0934   BZ    L934
  91A  6652        ZALS  0x52
  91B  6153        ADDS  0x53
  91C  1170        SUB   0x70,1
  91D  1370        SUB   0x70,3
  91E  1270        SUB   0x70,2
  91F  5052        SACL  0x52
  920  F800 0A73   CALL  LA73
  922  6652        ZALS  0x52
  923  0170        ADD   0x70,1
  924  5052        SACL  0x52
  925  F800 0A73   CALL  LA73
  927  6652        ZALS  0x52
  928  0170        ADD   0x70,1
  929  5052        SACL  0x52
  92A  F800 0A73   CALL  LA73
  92C  6652        ZALS  0x52
  92D  0170        ADD   0x70,1
  92E  5052        SACL  0x52
  92F  F800 0A73   CALL  LA73
  931  6652        ZALS  0x52
  932  6353        SUBS  0x53
  933  5052        SACL  0x52
L934:
  934  F800 0A0A   CALL  LA0A
  936  6541        ZALH  0x41
  937  FE00 0839   BNZ   L839
  939  654E        ZALH  0x4E
  93A  614F        ADDS  0x4F
  93B  0051        ADD   0x51
  93C  584E        SACH  0x4E
  93D  504F        SACL  0x4F
  93E  6244        SUBH  0x44
  93F  6345        SUBS  0x45
  940  FA00 0864   BLZ   L864
  942  F800 0A87   CALL  LA87
  944  6542        ZALH  0x42
  945  584E        SACH  0x4E
  946  2871        LAC   0x71,8
  947  7943        AND   0x43
  948  504F        SACL  0x4F
  949  2A43        LAC   0x43,10
  94A  5066        SACL  0x66
  94B  5865        SACH  0x65
  94C  2A71        LAC   0x71,10
  94D  7871        XOR   0x71
  94E  7965        AND   0x65
  94F  0A42        ADD   0x42,10
  950  5065        SACL  0x65
  951  2271        LAC   0x71,2
  952  7965        AND   0x65
  953  5052        SACL  0x52
  954  2A47        LAC   0x47,10
  955  5066        SACL  0x66
  956  5865        SACH  0x65
  957  2A71        LAC   0x71,10
  958  7871        XOR   0x71
  959  7965        AND   0x65
  95A  0A46        ADD   0x46,10
  95B  5065        SACL  0x65
  95C  2271        LAC   0x71,2
  95D  7965        AND   0x65
  95E  5053        SACL  0x53
  95F  2870        LAC   0x70,8
  960  5051        SACL  0x51
L961:
  961  654E        ZALH  0x4E
  962  614F        ADDS  0x4F
  963  6150        ADDS  0x50
  964  6255        SUBH  0x55
  965  6356        SUBS  0x56
  966  FA00 096E   BLZ   L96E
  968  7F89        ZAC
  969  584D        SACH  0x4D
  96A  6549        ZALH  0x49
  96B  584C        SACH  0x4C
  96C  F900 0999   B     L999

L96E:
  96E  F800 0A8B   CALL  LA8B
  970  F800 0BB1   CALL  LBB1
  972  F800 0BF0   CALL  LBF0
  974  F800 0C0D   CALL  LC0D
  976  F800 0B8D   CALL  LB8D
  978  656C        ZALH  0x6C
  979  584C        SACH  0x4C
  97A  656B        ZALH  0x6B
  97B  626A        SUBH  0x6A
  97C  FA00 0982   BLZ   L982
  97E  6572        ZALH  0x72
  97F  584D        SACH  0x4D
  980  F900 0999   B     L999

L982:
  982  6880        LARP  0
  983  6A6B        LT    0x6B
  984  6D6A        MPY   0x6A
  985  7F8E        PAC
  986  5875        SACH  0x75
  987  206A        LAC   0x6A
  988  7F88        ABS
  989  5076        SACL  0x76
  98A  206B        LAC   0x6B
  98B  7F88        ABS
  98C  5077        SACL  0x77
  98D  6577        ZALH  0x77
  98E  700E        LARK  AR0,0x0E
L98F:
  98F  6476        SUBC  0x76
  990  F400 098F   BANZ  L98F
  992  504D        SACL  0x4D
  993  6575        ZALH  0x75
  994  FD00 0999   BGEZ  L999
  996  7F89        ZAC
  997  624D        SUBH  0x4D
  998  584D        SACH  0x4D
L999:
  999  F800 0A73   CALL  LA73
  99B  654B        ZALH  0x4B
  99C  FF00 09A7   BZ    L9A7
  99E  6652        ZALS  0x52
  99F  6153        ADDS  0x53
  9A0  1170        SUB   0x70,1
  9A1  5052        SACL  0x52
  9A2  F800 0A73   CALL  LA73
  9A4  6652        ZALS  0x52
  9A5  6353        SUBS  0x53
  9A6  5052        SACL  0x52
L9A7:
  9A7  654E        ZALH  0x4E
  9A8  614F        ADDS  0x4F
  9A9  6350        SUBS  0x50
  9AA  FC00 09B2   BGZ   L9B2
  9AC  7F89        ZAC
  9AD  584D        SACH  0x4D
  9AE  6549        ZALH  0x49
  9AF  584C        SACH  0x4C
  9B0  F900 09DD   B     L9DD

L9B2:
  9B2  F800 0AE8   CALL  LAE8
  9B4  F800 0BB1   CALL  LBB1
  9B6  F800 0BF0   CALL  LBF0
  9B8  F800 0C0D   CALL  LC0D
  9BA  F800 0B8D   CALL  LB8D
  9BC  656C        ZALH  0x6C
  9BD  584C        SACH  0x4C
  9BE  656B        ZALH  0x6B
  9BF  626A        SUBH  0x6A
  9C0  FA00 09C6   BLZ   L9C6
  9C2  6572        ZALH  0x72
  9C3  584D        SACH  0x4D
  9C4  F900 09DD   B     L9DD

L9C6:
  9C6  6880        LARP  0
  9C7  6A6B        LT    0x6B
  9C8  6D6A        MPY   0x6A
  9C9  7F8E        PAC
  9CA  5875        SACH  0x75
  9CB  206A        LAC   0x6A
  9CC  7F88        ABS
  9CD  5076        SACL  0x76
  9CE  206B        LAC   0x6B
  9CF  7F88        ABS
  9D0  5077        SACL  0x77
  9D1  6577        ZALH  0x77
  9D2  700E        LARK  AR0,0x0E
L9D3:
  9D3  6476        SUBC  0x76
  9D4  F400 09D3   BANZ  L9D3
  9D6  504D        SACL  0x4D
  9D7  6575        ZALH  0x75
  9D8  FD00 09DD   BGEZ  L9DD
  9DA  7F89        ZAC
  9DB  624D        SUBH  0x4D
  9DC  584D        SACH  0x4D
L9DD:
  9DD  F800 0A73   CALL  LA73
  9DF  654B        ZALH  0x4B
  9E0  FF00 09EB   BZ    L9EB
  9E2  6652        ZALS  0x52
  9E3  6153        ADDS  0x53
  9E4  1170        SUB   0x70,1
  9E5  5052        SACL  0x52
  9E6  F800 0A73   CALL  LA73
  9E8  6652        ZALS  0x52
  9E9  6353        SUBS  0x53
  9EA  5052        SACL  0x52
L9EB:
  9EB  F800 0A0A   CALL  LA0A
  9ED  6541        ZALH  0x41
  9EE  FE00 0839   BNZ   L839
  9F0  654E        ZALH  0x4E
  9F1  614F        ADDS  0x4F
  9F2  0051        ADD   0x51
  9F3  584E        SACH  0x4E
  9F4  504F        SACL  0x4F
  9F5  6244        SUBH  0x44
  9F6  6345        SUBS  0x45
  9F7  FA00 0961   BLZ   L961
  9F9  F900 0839   B     L839

L9FB:
  9FB  FF00 0A09   BZ    LA09
L9FD:
  9FD  702B        LARK  AR0,0x2B
L9FE:
  9FE  7130        LARK  AR1,0x30
  9FF  6881        LARP  1
LA00:
  A00  F400 0A00   BANZ  LA00
  A02  7F80        NOP
  A03  6880        LARP  0
  A04  F400 09FE   BANZ  L9FE
  A06  6370        SUBS  0x70
  A07  FE00 09FD   BNZ   L9FD
LA09:
  A09  7F8D        RET

LA0A:
  A0A  F800 0A5C   CALL  LA5C
  A0C  6880        LARP  0
  A0D  7023        LARK  AR0,0x23
LA0E:
  A0E  F400 0A0E   BANZ  LA0E
  A10  7E0C        LACK  0x0C
  A11  5075        SACL  0x75
  A12  2C75        LAC   0x75,12
  A13  5075        SACL  0x75
  A14  4875        OUT   0x75,PA0
LA15:
  A15  F600 0A15   BIOZ  LA15
  A17  6880        LARP  0
  A18  7023        LARK  AR0,0x23
LA19:
  A19  F400 0A19   BANZ  LA19
  A1B  4575        IN    0x75,PA5
  A1C  6881        LARP  1
  A1D  6675        ZALS  0x75
  A1E  7974        AND   0x74
  A1F  FE00 0A24   BNZ   LA24
  A21  6880        LARP  0
  A22  F900 0A26   B     LA26

LA24:
  A24  3975        LAR   AR1,0x75
  A25  4680        IN    *,PA6,AR0
LA26:
  A26  4075        IN    0x75,PA0
  A27  2170        LAC   0x70,1
  A28  7975        AND   0x75
  A29  FE00 0A15   BNZ   LA15
  A2B  7F8D        RET

LA2C:
  A2C  6A70        LT    0x70
  A2D  8CD2        MPYK  3282
  A2E  7F8E        PAC
  A2F  6776        TBLR  0x76
  A30  F800 0A5C   CALL  LA5C
  A32  6880        LARP  0
  A33  7023        LARK  AR0,0x23
LA34:
  A34  F400 0A34   BANZ  LA34
  A36  4876        OUT   0x76,PA0
  A37  7F8D        RET

LA38:
  A38  6A70        LT    0x70
  A39  8CD8        MPYK  3288
  A3A  7F8E        PAC
  A3B  6776        TBLR  0x76
  A3C  F800 0A5C   CALL  LA5C
  A3E  6880        LARP  0
  A3F  7023        LARK  AR0,0x23
LA40:
  A40  F400 0A40   BANZ  LA40
  A42  4876        OUT   0x76,PA0
  A43  7F8D        RET

  A44  6A70        LT    0x70
  A45  8CD3        MPYK  3283
  A46  7F8E        PAC
  A47  6776        TBLR  0x76
  A48  F800 0A5C   CALL  LA5C
  A4A  6880        LARP  0
  A4B  7023        LARK  AR0,0x23
LA4C:
  A4C  F400 0A4C   BANZ  LA4C
  A4E  4876        OUT   0x76,PA0
  A4F  7F8D        RET

  A50  6A70        LT    0x70
  A51  8CD9        MPYK  3289
  A52  7F8E        PAC
  A53  6776        TBLR  0x76
  A54  F800 0A5C   CALL  LA5C
  A56  6880        LARP  0
  A57  7023        LARK  AR0,0x23
LA58:
  A58  F400 0A58   BANZ  LA58
  A5A  4876        OUT   0x76,PA0
  A5B  7F8D        RET

LA5C:
  A5C  F600 0A60   BIOZ  LA60
  A5E  F900 0A5C   B     LA5C

LA60:
  A60  F600 0A60   BIOZ  LA60
  A62  6880        LARP  0
  A63  7023        LARK  AR0,0x23
LA64:
  A64  F400 0A64   BANZ  LA64
  A66  7F80        NOP
  A67  4075        IN    0x75,PA0
  A68  6575        ZALH  0x75
  A69  FD00 0A6C   BGEZ  LA6C
  A6B  7F80        NOP
LA6C:
  A6C  F600 0A6C   BIOZ  LA6C
  A6E  6880        LARP  0
  A6F  7031        LARK  AR0,0x31
LA70:
  A70  F400 0A70   BANZ  LA70
  A72  7F8D        RET

LA73:
  A73  F800 0A5C   CALL  LA5C
  A75  6880        LARP  0
  A76  7023        LARK  AR0,0x23
LA77:
  A77  F400 0A77   BANZ  LA77
  A79  7F80        NOP
  A7A  4854        OUT   0x54,PA0
  A7B  7F80        NOP
  A7C  4F52        OUT   0x52,PA7
  A7D  4C4C        OUT   0x4C,PA4
  A7E  6652        ZALS  0x52
  A7F  0070        ADD   0x70
  A80  5052        SACL  0x52
  A81  7F80        NOP
  A82  4F52        OUT   0x52,PA7
  A83  4C4D        OUT   0x4D,PA4
  A84  0070        ADD   0x70
  A85  5052        SACL  0x52
  A86  7F8D        RET

LA87:
  A87  6649        ZALS  0x49
  A88  614A        ADDS  0x4A
  A89  5050        SACL  0x50
  A8A  7F8D        RET

LA8B:
  A8B  6567        ZALH  0x67
  A8C  5878        SACH  0x78
  A8D  0E50        ADD   0x50,14
  A8E  5879        SACH  0x79
  A8F  654E        ZALH  0x4E
  A90  614F        ADDS  0x4F
  A91  587A        SACH  0x7A
  A92  507B        SACL  0x7B
  A93  F800 0A5C   CALL  LA5C
  A95  6880        LARP  0
  A96  701D        LARK  AR0,0x1D
LA97:
  A97  F400 0A97   BANZ  LA97
LA99:
  A99  7000        LARK  AR0,0x00
  A9A  487A        OUT   0x7A,PA0
  A9B  4F7B        OUT   0x7B,PA7
  A9C  44A8        IN    *+,PA4
  A9D  44A8        IN    *+,PA4
  A9E  44A8        IN    *+,PA4
  A9F  44A8        IN    *+,PA4
  AA0  44A8        IN    *+,PA4
  AA1  44A8        IN    *+,PA4
  AA2  44A8        IN    *+,PA4
  AA3  44A8        IN    *+,PA4
  AA4  44A8        IN    *+,PA4
  AA5  44A8        IN    *+,PA4
  AA6  44A8        IN    *+,PA4
  AA7  44A8        IN    *+,PA4
  AA8  44A8        IN    *+,PA4
  AA9  44A8        IN    *+,PA4
  AAA  44A8        IN    *+,PA4
  AAB  44A8        IN    *+,PA4
  AAC  7000        LARK  AR0,0x00
  AAD  2EA8        LAC   *+,14
  AAE  0EA8        ADD   *+,14
  AAF  0EA8        ADD   *+,14
  AB0  0EA8        ADD   *+,14
  AB1  587C        SACH  0x7C
  AB2  2EA8        LAC   *+,14
  AB3  0EA8        ADD   *+,14
  AB4  0EA8        ADD   *+,14
  AB5  0EA8        ADD   *+,14
  AB6  587D        SACH  0x7D
  AB7  2EA8        LAC   *+,14
  AB8  0EA8        ADD   *+,14
  AB9  0EA8        ADD   *+,14
  ABA  0EA8        ADD   *+,14
  ABB  587E        SACH  0x7E
  ABC  2EA8        LAC   *+,14
  ABD  0EA8        ADD   *+,14
  ABE  0EA8        ADD   *+,14
  ABF  0EA8        ADD   *+,14
  AC0  587F        SACH  0x7F
  AC1  6678        ZALS  0x78
  AC2  7D7C        TBLW  0x7C
  AC3  0070        ADD   0x70
  AC4  7D7D        TBLW  0x7D
  AC5  0070        ADD   0x70
  AC6  7D7E        TBLW  0x7E
  AC7  0070        ADD   0x70
  AC8  7D7F        TBLW  0x7F
  AC9  0070        ADD   0x70
  ACA  5078        SACL  0x78
  ACB  7F80        NOP
  ACC  7F80        NOP
  ACD  7F80        NOP
  ACE  7F80        NOP
  ACF  7F80        NOP
  AD0  7F80        NOP
  AD1  7F80        NOP
  AD2  7F80        NOP
  AD3  7F80        NOP
  AD4  7F80        NOP
  AD5  7F80        NOP
  AD6  7F80        NOP
  AD7  7F80        NOP
  AD8  7F80        NOP
  AD9  7F80        NOP
  ADA  7F80        NOP
  ADB  7F80        NOP
  ADC  7F80        NOP
  ADD  7F80        NOP
  ADE  657A        ZALH  0x7A
  ADF  617B        ADDS  0x7B
  AE0  0470        ADD   0x70,4
  AE1  587A        SACH  0x7A
  AE2  507B        SACL  0x7B
  AE3  6578        ZALH  0x78
  AE4  6279        SUBH  0x79
  AE5  FA00 0A99   BLZ   LA99
  AE7  7F8D        RET

LAE8:
  AE8  6567        ZALH  0x67
  AE9  5878        SACH  0x78
  AEA  0E50        ADD   0x50,14
  AEB  5879        SACH  0x79
  AEC  654E        ZALH  0x4E
  AED  614F        ADDS  0x4F
  AEE  614A        ADDS  0x4A
  AEF  1470        SUB   0x70,4
  AF0  587A        SACH  0x7A
  AF1  507B        SACL  0x7B
  AF2  F800 0A5C   CALL  LA5C
  AF4  6880        LARP  0
  AF5  701D        LARK  AR0,0x1D
LAF6:
  AF6  F400 0AF6   BANZ  LAF6
LAF8:
  AF8  7000        LARK  AR0,0x00
  AF9  487A        OUT   0x7A,PA0
  AFA  4F7B        OUT   0x7B,PA7
  AFB  44A8        IN    *+,PA4
  AFC  44A8        IN    *+,PA4
  AFD  44A8        IN    *+,PA4
  AFE  44A8        IN    *+,PA4
  AFF  44A8        IN    *+,PA4
  B00  44A8        IN    *+,PA4
  B01  44A8        IN    *+,PA4
  B02  44A8        IN    *+,PA4
  B03  44A8        IN    *+,PA4
  B04  44A8        IN    *+,PA4
  B05  44A8        IN    *+,PA4
  B06  44A8        IN    *+,PA4
  B07  44A8        IN    *+,PA4
  B08  44A8        IN    *+,PA4
  B09  44A8        IN    *+,PA4
  B0A  44A8        IN    *+,PA4
  B0B  7000        LARK  AR0,0x00
  B0C  2EA8        LAC   *+,14
  B0D  0EA8        ADD   *+,14
  B0E  0EA8        ADD   *+,14
  B0F  0EA8        ADD   *+,14
  B10  587F        SACH  0x7F
  B11  2EA8        LAC   *+,14
  B12  0EA8        ADD   *+,14
  B13  0EA8        ADD   *+,14
  B14  0EA8        ADD   *+,14
  B15  587E        SACH  0x7E
  B16  2EA8        LAC   *+,14
  B17  0EA8        ADD   *+,14
  B18  0EA8        ADD   *+,14
  B19  0EA8        ADD   *+,14
  B1A  587D        SACH  0x7D
  B1B  2EA8        LAC   *+,14
  B1C  0EA8        ADD   *+,14
  B1D  0EA8        ADD   *+,14
  B1E  0EA8        ADD   *+,14
  B1F  587C        SACH  0x7C
  B20  6678        ZALS  0x78
  B21  7D7C        TBLW  0x7C
  B22  0070        ADD   0x70
  B23  7D7D        TBLW  0x7D
  B24  0070        ADD   0x70
  B25  7D7E        TBLW  0x7E
  B26  0070        ADD   0x70
  B27  7D7F        TBLW  0x7F
  B28  0070        ADD   0x70
  B29  5078        SACL  0x78
  B2A  7F80        NOP
  B2B  7F80        NOP
  B2C  7F80        NOP
  B2D  7F80        NOP
  B2E  7F80        NOP
  B2F  7F80        NOP
  B30  7F80        NOP
  B31  7F80        NOP
  B32  7F80        NOP
  B33  7F80        NOP
  B34  7F80        NOP
  B35  7F80        NOP
  B36  7F80        NOP
  B37  7F80        NOP
  B38  7F80        NOP
  B39  7F80        NOP
  B3A  7F80        NOP
  B3B  7F80        NOP
  B3C  7F80        NOP
  B3D  657A        ZALH  0x7A
  B3E  617B        ADDS  0x7B
  B3F  1470        SUB   0x70,4
  B40  587A        SACH  0x7A
  B41  507B        SACL  0x7B
  B42  6578        ZALH  0x78
  B43  6279        SUBH  0x79
  B44  FA00 0AF8   BLZ   LAF8
  B46  7F8D        RET

  B47  6568        ZALH  0x68
  B48  5878        SACH  0x78
  B49  0E49        ADD   0x49,14
  B4A  1E48        SUB   0x48,14
  B4B  5879        SACH  0x79
  B4C  F800 0A5C   CALL  LA5C
LB4E:
  B4E  6678        ZALS  0x78
  B4F  677A        TBLR  0x7A
  B50  0070        ADD   0x70
  B51  5078        SACL  0x78
LB52:
  B52  F600 0B56   BIOZ  LB56
  B54  F900 0B52   B     LB52

LB56:
  B56  4E7A        OUT   0x7A,PA6
LB57:
  B57  F600 0B57   BIOZ  LB57
  B59  6578        ZALH  0x78
  B5A  6279        SUBH  0x79
  B5B  FA00 0B4E   BLZ   LB4E
LB5D:
  B5D  F600 0B61   BIOZ  LB61
  B5F  F900 0B5D   B     LB5D

LB61:
  B61  4E6F        OUT   0x6F,PA6
  B62  7F8D        RET

  B63  6567        ZALH  0x67
  B64  5878        SACH  0x78
  B65  0E50        ADD   0x50,14
  B66  5879        SACH  0x79
  B67  F800 0A5C   CALL  LA5C
LB69:
  B69  6678        ZALS  0x78
  B6A  677A        TBLR  0x7A
  B6B  0070        ADD   0x70
  B6C  5078        SACL  0x78
LB6D:
  B6D  F600 0B71   BIOZ  LB71
  B6F  F900 0B6D   B     LB6D

LB71:
  B71  4E7A        OUT   0x7A,PA6
LB72:
  B72  F600 0B72   BIOZ  LB72
  B74  6578        ZALH  0x78
  B75  6279        SUBH  0x79
  B76  FA00 0B69   BLZ   LB69
LB78:
  B78  F600 0B7C   BIOZ  LB7C
  B7A  F900 0B78   B     LB78

LB7C:
  B7C  4E6F        OUT   0x6F,PA6
  B7D  7F8D        RET

  B7E  F800 0A5C   CALL  LA5C
LB80:
  B80  F600 0B84   BIOZ  LB84
  B82  F900 0B80   B     LB80

LB84:
  B84  4E73        OUT   0x73,PA6
LB85:
  B85  F600 0B85   BIOZ  LB85
LB87:
  B87  F600 0B8B   BIOZ  LB8B
  B89  F900 0B87   B     LB87

LB8B:
  B8B  4E6F        OUT   0x6F,PA6
  B8C  7F8D        RET

LB8D:
  B8D  7E00        LACK  0x00
  B8E  506B        SACL  0x6B
  B8F  6668        ZALS  0x68
  B90  507B        SACL  0x7B
  B91  507D        SACL  0x7D
  B92  6649        ZALS  0x49
  B93  506C        SACL  0x6C
  B94  6568        ZALH  0x68
  B95  0E49        ADD   0x49,14
  B96  1E48        SUB   0x48,14
  B97  587C        SACH  0x7C
LB98:
  B98  667B        ZALS  0x7B
  B99  6779        TBLR  0x79
  B9A  6579        ZALH  0x79
  B9B  626B        SUBH  0x6B
  B9C  FA00 0BA7   BLZ   LBA7
  B9E  667B        ZALS  0x7B
  B9F  507D        SACL  0x7D
  BA0  1068        SUB   0x68
  BA1  506C        SACL  0x6C
  BA2  226C        LAC   0x6C,2
  BA3  6148        ADDS  0x48
  BA4  506C        SACL  0x6C
  BA5  6579        ZALH  0x79
  BA6  586B        SACH  0x6B
LBA7:
  BA7  7E01        LACK  0x01
  BA8  007B        ADD   0x7B
  BA9  507B        SACL  0x7B
  BAA  657C        ZALH  0x7C
  BAB  627B        SUBH  0x7B
  BAC  FC00 0B98   BGZ   LB98
  BAE  667D        ZALS  0x7D
  BAF  7D72        TBLW  0x72
  BB0  7F8D        RET

LBB1:
  BB1  6667        ZALS  0x67
  BB2  5078        SACL  0x78
  BB3  2E49        LAC   0x49,14
  BB4  0E4A        ADD   0x4A,14
  BB5  5875        SACH  0x75
  BB6  6572        ZALH  0x72
  BB7  587B        SACH  0x7B
  BB8  6573        ZALH  0x73
  BB9  587A        SACH  0x7A
LBBA:
  BBA  6675        ZALS  0x75
  BBB  6370        SUBS  0x70
  BBC  5075        SACL  0x75
  BBD  6678        ZALS  0x78
  BBE  6779        TBLR  0x79
  BBF  6579        ZALH  0x79
  BC0  627B        SUBH  0x7B
  BC1  FC00 0BC7   BGZ   LBC7
  BC3  6579        ZALH  0x79
  BC4  587B        SACH  0x7B
  BC5  F900 0BCD   B     LBCD

LBC7:
  BC7  6579        ZALH  0x79
  BC8  627A        SUBH  0x7A
  BC9  FA00 0BCD   BLZ   LBCD
  BCB  6579        ZALH  0x79
  BCC  587A        SACH  0x7A
LBCD:
  BCD  7E01        LACK  0x01
  BCE  0078        ADD   0x78
  BCF  5078        SACL  0x78
  BD0  6675        ZALS  0x75
  BD1  FE00 0BBA   BNZ   LBBA
  BD3  2F7A        LAC   0x7A,15
  BD4  0F7B        ADD   0x7B,15
  BD5  587C        SACH  0x7C
  BD6  2F7A        LAC   0x7A,15
  BD7  1F7B        SUB   0x7B,15
  BD8  587D        SACH  0x7D
  BD9  657D        ZALH  0x7D
  BDA  626F        SUBH  0x6F
  BDB  FE00 0BE1   BNZ   LBE1
  BDD  6572        ZALH  0x72
  BDE  586D        SACH  0x6D
  BDF  F900 0BEF   B     LBEF

LBE1:
  BE1  2F72        LAC   0x72,15
  BE2  5875        SACH  0x75
  BE3  6880        LARP  0
  BE4  700F        LARK  AR0,0x0F
  BE5  2075        LAC   0x75
LBE6:
  BE6  647D        SUBC  0x7D
  BE7  F400 0BE6   BANZ  LBE6
  BE9  506D        SACL  0x6D
  BEA  656D        ZALH  0x6D
  BEB  FE00 0BEF   BNZ   LBEF
  BED  6570        ZALH  0x70
  BEE  586D        SACH  0x6D
LBEF:
  BEF  7F8D        RET

LBF0:
  BF0  7F89        ZAC
  BF1  5078        SACL  0x78
LBF2:
  BF2  6678        ZALS  0x78
  BF3  0067        ADD   0x67
  BF4  6779        TBLR  0x79
  BF5  6579        ZALH  0x79
  BF6  627C        SUBH  0x7C
  BF7  5879        SACH  0x79
  BF8  6A79        LT    0x79
  BF9  6D6D        MPY   0x6D
  BFA  7F8E        PAC
  BFB  5079        SACL  0x79
  BFC  6A79        LT    0x79
  BFD  6D6E        MPY   0x6E
  BFE  7F8E        PAC
  BFF  5979        SACH  0x79,1
  C00  6678        ZALS  0x78
  C01  0067        ADD   0x67
  C02  7D79        TBLW  0x79
  C03  6678        ZALS  0x78
  C04  0070        ADD   0x70
  C05  5078        SACL  0x78
  C06  6578        ZALH  0x78
  C07  1E49        SUB   0x49,14
  C08  1E4A        SUB   0x4A,14
  C09  1472        SUB   0x72,4
  C0A  FA00 0BF2   BLZ   LBF2
  C0C  7F8D        RET

LC0D:
  C0D  7E01        LACK  0x01
  C0E  5078        SACL  0x78
  C0F  7F89        ZAC
  C10  5079        SACL  0x79
  C11  F800 0C1D   CALL  LC1D
  C13  6668        ZALS  0x68
  C14  676A        TBLR  0x6A
  C15  2E49        LAC   0x49,14
  C16  1E48        SUB   0x48,14
  C17  5878        SACH  0x78
  C18  2E48        LAC   0x48,14
  C19  5879        SACH  0x79
  C1A  F800 0C1D   CALL  LC1D
  C1C  7F8D        RET

LC1D:
  C1D  6667        ZALS  0x67
  C1E  507A        SACL  0x7A
  C1F  F800 0C7C   CALL  LC7C
  C21  6667        ZALS  0x67
  C22  0079        ADD   0x79
  C23  507A        SACL  0x7A
  C24  F800 0C85   CALL  LC85
  C26  7E20        LACK  0x20
  C27  0067        ADD   0x67
  C28  0079        ADD   0x79
  C29  507A        SACL  0x7A
  C2A  6668        ZALS  0x68
  C2B  507B        SACL  0x7B
  C2C  6880        LARP  0
  C2D  3878        LAR   AR0,0x78
  C2E  6569        ZALH  0x69
  C2F  FE00 0C35   BNZ   LC35
  C31  F800 0C55   CALL  LC55
  C33  F900 0C37   B     LC37

LC35:
  C35  F800 0C66   CALL  LC66
LC37:
  C37  7E20        LACK  0x20
  C38  507C        SACL  0x7C
LC39:
  C39  667C        ZALS  0x7C
  C3A  0067        ADD   0x67
  C3B  507A        SACL  0x7A
  C3C  F800 0C7C   CALL  LC7C
  C3E  667C        ZALS  0x7C
  C3F  0079        ADD   0x79
  C40  0067        ADD   0x67
  C41  507A        SACL  0x7A
  C42  F800 0C85   CALL  LC85
  C44  6668        ZALS  0x68
  C45  507B        SACL  0x7B
  C46  7E20        LACK  0x20
  C47  617A        ADDS  0x7A
  C48  507A        SACL  0x7A
  C49  6880        LARP  0
  C4A  3878        LAR   AR0,0x78
  C4B  F800 0C66   CALL  LC66
  C4D  7E20        LACK  0x20
  C4E  007C        ADD   0x7C
  C4F  507C        SACL  0x7C
  C50  657C        ZALH  0x7C
  C51  1E4A        SUB   0x4A,14
  C52  FA00 0C39   BLZ   LC39
  C54  7F8D        RET

LC55:
  C55  6898        MAR   *-
  C56  F900 0C5C   B     LC5C

LC58:
  C58  667A        ZALS  0x7A
  C59  6720        TBLR  0x20
  C5A  0070        ADD   0x70
  C5B  507A        SACL  0x7A
LC5C:
  C5C  F800 0C8E   CALL  LC8E
  C5E  667B        ZALS  0x7B
  C5F  7D75        TBLW  0x75
  C60  7E01        LACK  0x01
  C61  007B        ADD   0x7B
  C62  507B        SACL  0x7B
  C63  F400 0C58   BANZ  LC58
  C65  7F8D        RET

LC66:
  C66  6898        MAR   *-
  C67  F900 0C6D   B     LC6D

LC69:
  C69  667A        ZALS  0x7A
  C6A  6720        TBLR  0x20
  C6B  0070        ADD   0x70
  C6C  507A        SACL  0x7A
LC6D:
  C6D  F800 0C8E   CALL  LC8E
  C6F  667B        ZALS  0x7B
  C70  6776        TBLR  0x76
  C71  6576        ZALH  0x76
  C72  6075        ADDH  0x75
  C73  5875        SACH  0x75
  C74  667B        ZALS  0x7B
  C75  7D75        TBLW  0x75
  C76  7E01        LACK  0x01
  C77  007B        ADD   0x7B
  C78  507B        SACL  0x7B
  C79  F400 0C69   BANZ  LC69
  C7B  7F8D        RET

LC7C:
  C7C  701F        LARK  AR0,0x1F
  C7D  711F        LARK  AR1,0x1F
  C7E  667A        ZALS  0x7A
LC7F:
  C7F  6881        LARP  1
  C80  6790        TBLR  *-,AR0
  C81  0070        ADD   0x70
  C82  F400 0C7F   BANZ  LC7F
  C84  7F8D        RET

LC85:
  C85  701F        LARK  AR0,0x1F
  C86  713F        LARK  AR1,0x3F
  C87  667A        ZALS  0x7A
LC88:
  C88  6881        LARP  1
  C89  6790        TBLR  *-,AR0
  C8A  0070        ADD   0x70
  C8B  F400 0C88   BANZ  LC88
  C8D  7F8D        RET

LC8E:
  C8E  7F89        ZAC
  C8F  6A3F        LT    0x3F
  C90  6D1F        MPY   0x1F
  C91  6B3E        LTD   0x3E
  C92  6D1E        MPY   0x1E
  C93  6B3D        LTD   0x3D
  C94  6D1D        MPY   0x1D
  C95  6B3C        LTD   0x3C
  C96  6D1C        MPY   0x1C
  C97  6B3B        LTD   0x3B
  C98  6D1B        MPY   0x1B
  C99  6B3A        LTD   0x3A
  C9A  6D1A        MPY   0x1A
  C9B  6B39        LTD   0x39
  C9C  6D19        MPY   0x19
  C9D  6B38        LTD   0x38
  C9E  6D18        MPY   0x18
  C9F  6B37        LTD   0x37
  CA0  6D17        MPY   0x17
  CA1  6B36        LTD   0x36
  CA2  6D16        MPY   0x16
  CA3  6B35        LTD   0x35
  CA4  6D15        MPY   0x15
  CA5  6B34        LTD   0x34
  CA6  6D14        MPY   0x14
  CA7  6B33        LTD   0x33
  CA8  6D13        MPY   0x13
  CA9  6B32        LTD   0x32
  CAA  6D12        MPY   0x12
  CAB  6B31        LTD   0x31
  CAC  6D11        MPY   0x11
  CAD  6B30        LTD   0x30
  CAE  6D10        MPY   0x10
  CAF  6B2F        LTD   0x2F
  CB0  6D0F        MPY   0x0F
  CB1  6B2E        LTD   0x2E
  CB2  6D0E        MPY   0x0E
  CB3  6B2D        LTD   0x2D
  CB4  6D0D        MPY   0x0D
  CB5  6B2C        LTD   0x2C
  CB6  6D0C        MPY   0x0C
  CB7  6B2B        LTD   0x2B
  CB8  6D0B        MPY   0x0B
  CB9  6B2A        LTD   0x2A
  CBA  6D0A        MPY   0x0A
  CBB  6B29        LTD   0x29
  CBC  6D09        MPY   0x09
  CBD  6B28        LTD   0x28
  CBE  6D08        MPY   0x08
  CBF  6B27        LTD   0x27
  CC0  6D07        MPY   0x07
  CC1  6B26        LTD   0x26
  CC2  6D06        MPY   0x06
  CC3  6B25        LTD   0x25
  CC4  6D05        MPY   0x05
  CC5  6B24        LTD   0x24
  CC6  6D04        MPY   0x04
  CC7  6B23        LTD   0x23
  CC8  6D03        MPY   0x03
  CC9  6B22        LTD   0x22
  CCA  6D02        MPY   0x02
  CCB  6B21        LTD   0x21
  CCC  6D01        MPY   0x01
  CCD  6B20        LTD   0x20
  CCE  6D00        MPY   0x00
  CCF  7F8F        APAC
  CD0  5975        SACH  0x75,1
  CD1  7F8D        RET

  CD2  9801        MPYK  -2047
  CD3  8401        MPYK  1025
  CD4  8801        MPYK  2049
  CD5  8C01        MPYK  3073
  CD6  9001        MPYK  -4095
  CD7  9401        MPYK  -3071
  CD8  9800        MPYK  -2048
  CD9  8400        MPYK  1024
  CDA  8800        MPYK  2048
  CDB  8C00        MPYK  3072
  CDC  9000        MPYK  -4096
  CDD  9400        MPYK  -3072
