; Eventide h3500 DSP microcode
; key 7412  algorithm 74 (MULTI-SHIFT)  DSP 3
; source H3000-Upgrade_ROM4.BIN offset 0754E, 1168 program words loaded at 800
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
  80C  504D        SACL  0x4D
  80D  2A4D        LAC   0x4D,10
  80E  5051        SACL  0x51
  80F  2F4D        LAC   0x4D,15
  810  5050        SACL  0x50
  811  7F89        ZAC
  812  504C        SACL  0x4C
  813  104D        SUB   0x4D
  814  584E        SACH  0x4E
  815  7EFF        LACK  0xFF
  816  5052        SACL  0x52
  817  2752        LAC   0x52,7
  818  7A52        OR    0x52
  819  504F        SACL  0x4F
  81A  6A4D        LT    0x4D
  81B  8D80        MPYK  3456
  81C  7F8E        PAC
  81D  5067        SACL  0x67
  81E  8C90        MPYK  3216
  81F  7F8E        PAC
  820  5068        SACL  0x68
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
  824  7F89        ZAC
  825  5053        SACL  0x53
L826:
  826  F600 082A   BIOZ  L82A
  828  F900 0826   B     L826

L82A:
  82A  4052        IN    0x52,PA0
  82B  6552        ZALH  0x52
  82C  FD00 082F   BGEZ  L82F
  82E  7F80        NOP
L82F:
  82F  F600 082F   BIOZ  L82F
L831:
  831  4552        IN    0x52,PA5
  832  6881        LARP  1
  833  6652        ZALS  0x52
  834  7951        AND   0x51
  835  FE00 083A   BNZ   L83A
  837  6880        LARP  0
  838  F900 083C   B     L83C

L83A:
  83A  3952        LAR   AR1,0x52
  83B  4680        IN    *,PA6,AR0
L83C:
  83C  7E15        LACK  0x15
  83D  6153        ADDS  0x53
  83E  5053        SACL  0x53
  83F  4C4C        OUT   0x4C,PA4
  840  4C4C        OUT   0x4C,PA4
  841  4C4C        OUT   0x4C,PA4
  842  4C4C        OUT   0x4C,PA4
  843  4C4C        OUT   0x4C,PA4
  844  4C4C        OUT   0x4C,PA4
  845  4C4C        OUT   0x4C,PA4
  846  4C4C        OUT   0x4C,PA4
  847  4C4C        OUT   0x4C,PA4
  848  4C4C        OUT   0x4C,PA4
  849  4C4C        OUT   0x4C,PA4
  84A  4C4C        OUT   0x4C,PA4
  84B  4C4C        OUT   0x4C,PA4
  84C  4C4C        OUT   0x4C,PA4
  84D  4C4C        OUT   0x4C,PA4
  84E  4C4C        OUT   0x4C,PA4
  84F  4C4C        OUT   0x4C,PA4
  850  4C4C        OUT   0x4C,PA4
  851  4C4C        OUT   0x4C,PA4
  852  4C4C        OUT   0x4C,PA4
  853  4C4C        OUT   0x4C,PA4
  854  4C4C        OUT   0x4C,PA4
  855  4C4C        OUT   0x4C,PA4
  856  4C4C        OUT   0x4C,PA4
  857  4C4C        OUT   0x4C,PA4
  858  4C4C        OUT   0x4C,PA4
  859  4C4C        OUT   0x4C,PA4
  85A  4C4C        OUT   0x4C,PA4
  85B  4C4C        OUT   0x4C,PA4
  85C  4C4C        OUT   0x4C,PA4
  85D  4C4C        OUT   0x4C,PA4
  85E  4C4C        OUT   0x4C,PA4
  85F  4C4C        OUT   0x4C,PA4
  860  4C4C        OUT   0x4C,PA4
  861  4C4C        OUT   0x4C,PA4
  862  4C4C        OUT   0x4C,PA4
  863  4C4C        OUT   0x4C,PA4
  864  4C4C        OUT   0x4C,PA4
  865  4C4C        OUT   0x4C,PA4
  866  4C4C        OUT   0x4C,PA4
  867  4C4C        OUT   0x4C,PA4
  868  4C4C        OUT   0x4C,PA4
  869  7F80        NOP
  86A  7F80        NOP
  86B  7F80        NOP
  86C  7F80        NOP
  86D  2053        LAC   0x53
  86E  FC00 0831   BGZ   L831
  870  7F80        NOP
  871  7F89        ZAC
  872  5066        SACL  0x66
  873  506F        SACL  0x6F
  874  7EBB        LACK  0xBB
  875  5052        SACL  0x52
  876  2452        LAC   0x52,4
  877  5074        SACL  0x74
  878  7E64        LACK  0x64
  879  5042        SACL  0x42
  87A  5043        SACL  0x43
  87B  2342        LAC   0x42,3
  87C  5044        SACL  0x44
  87D  5045        SACL  0x45
  87E  F800 0A67   CALL  LA67
  880  F800 0921   CALL  L921
  882  6548        ZALH  0x48
  883  5857        SACH  0x57
  884  6549        ZALH  0x49
  885  5858        SACH  0x58
  886  F800 097D   CALL  L97D
  888  F800 098D   CALL  L98D
L88A:
  88A  F800 0A67   CALL  LA67
  88C  F800 0955   CALL  L955
  88E  FF00 0892   BZ    L892
  890  F800 0921   CALL  L921
L892:
  892  F800 099D   CALL  L99D
  894  654A        ZALH  0x4A
  895  624C        SUBH  0x4C
  896  FF00 08C9   BZ    L8C9
  898  F800 0907   CALL  L907
  89A  F800 09C5   CALL  L9C5
  89C  6562        ZALH  0x62
  89D  FE00 08C9   BNZ   L8C9
  89F  6663        ZALS  0x63
  8A0  1C4D        SUB   0x4D,12
  8A1  FC00 08C9   BGZ   L8C9
  8A3  2E48        LAC   0x48,14
  8A4  5865        SACH  0x65
  8A5  7E1F        LACK  0x1F
  8A6  5052        SACL  0x52
  8A7  664F        ZALS  0x4F
  8A8  1052        SUB   0x52
  8A9  7965        AND   0x65
  8AA  054D        ADD   0x4D,5
  8AB  5065        SACL  0x65
  8AC  F800 09FE   CALL  L9FE
  8AE  F800 0A40   CALL  LA40
L8B0:
  8B0  F800 0A67   CALL  LA67
  8B2  6562        ZALH  0x62
  8B3  FA00 08C8   BLZ   L8C8
  8B5  F800 0A5C   CALL  LA5C
  8B7  FE00 08B0   BNZ   L8B0
  8B9  F800 0A99   CALL  LA99
  8BB  F800 0B6F   CALL  LB6F
  8BD  F800 0BAE   CALL  LBAE
  8BF  F800 0BCB   CALL  LBCB
  8C1  F800 0B4B   CALL  LB4B
  8C3  6572        ZALH  0x72
  8C4  5857        SACH  0x57
  8C5  F800 097D   CALL  L97D
  8C7  7F80        NOP
L8C8:
  8C8  7F80        NOP
L8C9:
  8C9  7F80        NOP
  8CA  F800 099D   CALL  L99D
  8CC  654B        ZALH  0x4B
  8CD  624C        SUBH  0x4C
  8CE  FF00 0904   BZ    L904
  8D0  F800 0914   CALL  L914
  8D2  F800 09C5   CALL  L9C5
  8D4  6562        ZALH  0x62
  8D5  FE00 0904   BNZ   L904
  8D7  6663        ZALS  0x63
  8D8  1C4D        SUB   0x4D,12
  8D9  FC00 0904   BGZ   L904
  8DB  2E49        LAC   0x49,14
  8DC  5865        SACH  0x65
  8DD  7E1F        LACK  0x1F
  8DE  5052        SACL  0x52
  8DF  664F        ZALS  0x4F
  8E0  1052        SUB   0x52
  8E1  7965        AND   0x65
  8E2  054D        ADD   0x4D,5
  8E3  5065        SACL  0x65
  8E4  F800 09FE   CALL  L9FE
  8E6  F800 0A40   CALL  LA40
L8E8:
  8E8  F800 0A67   CALL  LA67
  8EA  6562        ZALH  0x62
  8EB  FA00 0903   BLZ   L903
  8ED  F800 0A5C   CALL  LA5C
  8EF  FE00 08E8   BNZ   L8E8
  8F1  665D        ZALS  0x5D
  8F2  6150        ADDS  0x50
  8F3  505D        SACL  0x5D
  8F4  F800 0A99   CALL  LA99
  8F6  F800 0B6F   CALL  LB6F
  8F8  F800 0BAE   CALL  LBAE
  8FA  F800 0BCB   CALL  LBCB
  8FC  F800 0B4B   CALL  LB4B
  8FE  6572        ZALH  0x72
  8FF  5858        SACH  0x58
  900  F800 098D   CALL  L98D
  902  7F80        NOP
L903:
  903  7F80        NOP
L904:
  904  7F80        NOP
  905  F900 088A   B     L88A

L907:
  907  6542        ZALH  0x42
  908  5869        SACH  0x69
  909  6544        ZALH  0x44
  90A  586A        SACH  0x6A
  90B  6546        ZALH  0x46
  90C  586B        SACH  0x6B
  90D  6548        ZALH  0x48
  90E  586C        SACH  0x6C
  90F  6540        ZALH  0x40
  910  586D        SACH  0x6D
  911  655B        ZALH  0x5B
  912  586E        SACH  0x6E
  913  7F8D        RET

L914:
  914  6543        ZALH  0x43
  915  5869        SACH  0x69
  916  6545        ZALH  0x45
  917  586A        SACH  0x6A
  918  6547        ZALH  0x47
  919  586B        SACH  0x6B
  91A  6549        ZALH  0x49
  91B  586C        SACH  0x6C
  91C  6541        ZALH  0x41
  91D  586D        SACH  0x6D
  91E  655C        ZALH  0x5C
  91F  586E        SACH  0x6E
  920  7F8D        RET

L921:
  921  F800 0963   CALL  L963
L923:
  923  F600 0927   BIOZ  L927
  925  F900 0923   B     L923

L927:
  927  7F80        NOP
  928  7F80        NOP
  929  7F80        NOP
  92A  7F80        NOP
  92B  7F80        NOP
  92C  7F80        NOP
  92D  7F80        NOP
  92E  7F80        NOP
  92F  7E0C        LACK  0x0C
  930  5052        SACL  0x52
  931  2C52        LAC   0x52,12
  932  5052        SACL  0x52
  933  4852        OUT   0x52,PA0
L934:
  934  F600 0934   BIOZ  L934
L936:
  936  F600 093A   BIOZ  L93A
  938  F900 0936   B     L936

L93A:
  93A  7F80        NOP
  93B  7F80        NOP
  93C  7F80        NOP
  93D  7F80        NOP
  93E  7F80        NOP
  93F  7F80        NOP
  940  7F80        NOP
  941  7F80        NOP
  942  4552        IN    0x52,PA5
  943  6881        LARP  1
  944  6652        ZALS  0x52
  945  7951        AND   0x51
  946  FE00 094B   BNZ   L94B
  948  6880        LARP  0
  949  F900 094D   B     L94D

L94B:
  94B  3952        LAR   AR1,0x52
  94C  4680        IN    *,PA6,AR0
L94D:
  94D  4052        IN    0x52,PA0
  94E  214D        LAC   0x4D,1
  94F  7952        AND   0x52
  950  FE00 0934   BNZ   L934
  952  665D        ZALS  0x5D
  953  5075        SACL  0x75
  954  7F8D        RET

L955:
  955  665D        ZALS  0x5D
  956  6375        SUBS  0x75
  957  5052        SACL  0x52
  958  FC00 095D   BGZ   L95D
  95A  665D        ZALS  0x5D
  95B  1075        SUB   0x75
  95C  5052        SACL  0x52
L95D:
  95D  6652        ZALS  0x52
  95E  1B4D        SUB   0x4D,11
  95F  FC00 0962   BGZ   L962
  961  7F89        ZAC
L962:
  962  7F8D        RET

L963:
  963  F600 0963   BIOZ  L963
L965:
  965  F600 0969   BIOZ  L969
  967  F900 0965   B     L965

L969:
  969  7F80        NOP
  96A  7F80        NOP
  96B  7F80        NOP
  96C  7F80        NOP
  96D  7F80        NOP
  96E  7F80        NOP
  96F  7F80        NOP
  970  7F80        NOP
  971  4052        IN    0x52,PA0
  972  6552        ZALH  0x52
  973  FD00 0976   BGEZ  L976
  975  7F80        NOP
L976:
  976  F600 0976   BIOZ  L976
  978  6880        LARP  0
  979  7031        LARK  AR0,0x31
L97A:
  97A  F400 097A   BANZ  L97A
  97C  7F8D        RET

L97D:
  97D  F800 0963   CALL  L963
L97F:
  97F  F600 0983   BIOZ  L983
  981  F900 097F   B     L97F

L983:
  983  7F80        NOP
  984  7F80        NOP
  985  7F80        NOP
  986  7F80        NOP
  987  7F80        NOP
  988  7F80        NOP
  989  7F80        NOP
  98A  7F80        NOP
  98B  4957        OUT   0x57,PA1
  98C  7F8D        RET

L98D:
  98D  F800 0963   CALL  L963
L98F:
  98F  F600 0993   BIOZ  L993
  991  F900 098F   B     L98F

L993:
  993  7F80        NOP
  994  7F80        NOP
  995  7F80        NOP
  996  7F80        NOP
  997  7F80        NOP
  998  7F80        NOP
  999  7F80        NOP
  99A  7F80        NOP
  99B  4B58        OUT   0x58,PA3
  99C  7F8D        RET

L99D:
  99D  F800 0963   CALL  L963
  99F  7F80        NOP
  9A0  7F80        NOP
  9A1  7F80        NOP
  9A2  7F80        NOP
  9A3  7F80        NOP
  9A4  7F80        NOP
  9A5  425D        IN    0x5D,PA2
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
  9B0  425C        IN    0x5C,PA2
  9B1  7F80        NOP
  9B2  7F80        NOP
  9B3  7F80        NOP
  9B4  7F80        NOP
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
  9BF  7F80        NOP
  9C0  7F80        NOP
  9C1  7F80        NOP
  9C2  7F80        NOP
  9C3  425B        IN    0x5B,PA2
  9C4  7F8D        RET

L9C5:
  9C5  656D        ZALH  0x6D
  9C6  FC00 09CE   BGZ   L9CE
  9C8  FA00 09D2   BLZ   L9D2
  9CA  654E        ZALH  0x4E
  9CB  5862        SACH  0x62
  9CC  F900 09FD   B     L9FD

L9CE:
  9CE  656A        ZALH  0x6A
  9CF  626E        SUBH  0x6E
  9D0  F900 09D4   B     L9D4

L9D2:
  9D2  6569        ZALH  0x69
  9D3  626E        SUBH  0x6E
L9D4:
  9D4  5854        SACH  0x54
  9D5  6880        LARP  0
  9D6  6A54        LT    0x54
  9D7  6D6D        MPY   0x6D
  9D8  7F8E        PAC
  9D9  5852        SACH  0x52
  9DA  206D        LAC   0x6D
  9DB  7F88        ABS
  9DC  5053        SACL  0x53
  9DD  2054        LAC   0x54
  9DE  7F88        ABS
  9DF  700F        LARK  AR0,0x0F
L9E0:
  9E0  6453        SUBC  0x53
  9E1  F400 09E0   BANZ  L9E0
  9E3  5062        SACL  0x62
  9E4  5863        SACH  0x63
  9E5  6563        ZALH  0x63
  9E6  700F        LARK  AR0,0x0F
L9E7:
  9E7  6453        SUBC  0x53
  9E8  F400 09E7   BANZ  L9E7
  9EA  5063        SACL  0x63
  9EB  2052        LAC   0x52
  9EC  FD00 09F3   BGEZ  L9F3
  9EE  7F89        ZAC
  9EF  6262        SUBH  0x62
  9F0  6363        SUBS  0x63
  9F1  5862        SACH  0x62
  9F2  5063        SACL  0x63
L9F3:
  9F3  2B63        LAC   0x63,11
  9F4  5863        SACH  0x63
  9F5  2B4E        LAC   0x4E,11
  9F6  784E        XOR   0x4E
  9F7  7963        AND   0x63
  9F8  5063        SACL  0x63
  9F9  2B62        LAC   0x62,11
  9FA  5862        SACH  0x62
  9FB  7A63        OR    0x63
  9FC  5063        SACL  0x63
L9FD:
  9FD  7F8D        RET

L9FE:
  9FE  666C        ZALS  0x6C
  9FF  6165        ADDS  0x65
  A00  5064        SACL  0x64
  A01  7F8D        RET

LA02:
  A02  656C        ZALH  0x6C
  A03  6065        ADDH  0x65
  A04  5852        SACH  0x52
  A05  6A52        LT    0x52
  A06  8600        MPYK  1536
  A07  7F8E        PAC
  A08  5C66        SACH  0x66,4
  A09  656C        ZALH  0x6C
  A0A  626B        SUBH  0x6B
  A0B  5852        SACH  0x52
  A0C  6A52        LT    0x52
  A0D  819A        MPYK  410
  A0E  7F8E        PAC
  A0F  5C52        SACH  0x52,4
  A10  6566        ZALH  0x66
  A11  6052        ADDH  0x52
  A12  5866        SACH  0x66
  A13  6A65        LT    0x65
  A14  8166        MPYK  358
  A15  7F8E        PAC
  A16  5C52        SACH  0x52,4
  A17  6566        ZALH  0x66
  A18  6052        ADDH  0x52
  A19  5866        SACH  0x66
  A1A  2C6C        LAC   0x6C,12
  A1B  1C6B        SUB   0x6B,12
  A1C  5852        SACH  0x52
  A1D  6A52        LT    0x52
  A1E  6D65        MPY   0x65
  A1F  7F8E        PAC
  A20  5052        SACL  0x52
  A21  6A52        LT    0x52
  A22  83A0        MPYK  928
  A23  7F8E        PAC
  A24  5952        SACH  0x52,1
  A25  6552        ZALH  0x52
  A26  6066        ADDH  0x66
  A27  5866        SACH  0x66
  A28  7F8D        RET

LA29:
  A29  F800 0A67   CALL  LA67
  A2B  6562        ZALH  0x62
  A2C  6163        ADDS  0x63
  A2D  6366        SUBS  0x66
  A2E  FC00 0A39   BGZ   LA39
  A30  6665        ZALS  0x65
  A31  154D        SUB   0x4D,5
  A32  FB00 0A3C   BLEZ  LA3C
  A34  5065        SACL  0x65
  A35  F800 0A02   CALL  LA02
  A37  F900 0A29   B     LA29

LA39:
  A39  7F89        ZAC
  A3A  F900 0A3F   B     LA3F

LA3C:
  A3C  7F89        ZAC
  A3D  5065        SACL  0x65
  A3E  204E        LAC   0x4E
LA3F:
  A3F  7F8D        RET

LA40:
  A40  656D        ZALH  0x6D
  A41  FC00 0A47   BGZ   LA47
  A43  FA00 0A51   BLZ   LA51
  A45  F900 0A5B   B     LA5B

LA47:
  A47  666A        ZALS  0x6A
  A48  6262        SUBH  0x62
  A49  6363        SUBS  0x63
  A4A  585E        SACH  0x5E
  A4B  505F        SACL  0x5F
  A4C  6364        SUBS  0x64
  A4D  5860        SACH  0x60
  A4E  5061        SACL  0x61
  A4F  F900 0A5B   B     LA5B

LA51:
  A51  6669        ZALS  0x69
  A52  6364        SUBS  0x64
  A53  6262        SUBH  0x62
  A54  6363        SUBS  0x63
  A55  616C        ADDS  0x6C
  A56  585E        SACH  0x5E
  A57  505F        SACL  0x5F
  A58  6164        ADDS  0x64
  A59  5860        SACH  0x60
  A5A  5061        SACL  0x61
LA5B:
  A5B  7F8D        RET

LA5C:
  A5C  655E        ZALH  0x5E
  A5D  FA00 0A65   BLZ   LA65
  A5F  6560        ZALH  0x60
  A60  FA00 0A65   BLZ   LA65
  A62  7F89        ZAC
  A63  F900 0A66   B     LA66

LA65:
  A65  204E        LAC   0x4E
LA66:
  A66  7F8D        RET

LA67:
  A67  F800 0963   CALL  L963
  A69  7F80        NOP
  A6A  7F80        NOP
  A6B  7F80        NOP
  A6C  7F80        NOP
  A6D  7F80        NOP
  A6E  7F80        NOP
  A6F  4276        IN    0x76,PA2
  A70  6676        ZALS  0x76
  A71  635D        SUBS  0x5D
  A72  5052        SACL  0x52
  A73  FC00 0A78   BGZ   LA78
  A75  6676        ZALS  0x76
  A76  105D        SUB   0x5D
  A77  5052        SACL  0x52
LA78:
  A78  6562        ZALH  0x62
  A79  6163        ADDS  0x63
  A7A  6352        SUBS  0x52
  A7B  5862        SACH  0x62
  A7C  5063        SACL  0x63
  A7D  6562        ZALH  0x62
  A7E  6163        ADDS  0x63
  A7F  6352        SUBS  0x52
  A80  5862        SACH  0x62
  A81  5063        SACL  0x63
  A82  655E        ZALH  0x5E
  A83  615F        ADDS  0x5F
  A84  6152        ADDS  0x52
  A85  585E        SACH  0x5E
  A86  505F        SACL  0x5F
  A87  6560        ZALH  0x60
  A88  6161        ADDS  0x61
  A89  6152        ADDS  0x52
  A8A  5860        SACH  0x60
  A8B  5061        SACL  0x61
  A8C  655E        ZALH  0x5E
  A8D  615F        ADDS  0x5F
  A8E  6152        ADDS  0x52
  A8F  585E        SACH  0x5E
  A90  505F        SACL  0x5F
  A91  6560        ZALH  0x60
  A92  6161        ADDS  0x61
  A93  6152        ADDS  0x52
  A94  5860        SACH  0x60
  A95  5061        SACL  0x61
  A96  6676        ZALS  0x76
  A97  505D        SACL  0x5D
  A98  7F8D        RET

LA99:
  A99  6567        ZALH  0x67
  A9A  5876        SACH  0x76
  A9B  0E6C        ADD   0x6C,14
  A9C  0E65        ADD   0x65,14
  A9D  5877        SACH  0x77
  A9E  665F        ZALS  0x5F
  A9F  6361        SUBS  0x61
  AA0  FC00 0AA6   BGZ   LAA6
  AA2  FA00 0AB0   BLZ   LAB0
  AA4  F900 0B1D   B     LB1D

LAA6:
  AA6  7F80        NOP
  AA7  7F80        NOP
  AA8  7F80        NOP
  AA9  244D        LAC   0x4D,4
  AAA  5079        SACL  0x79
  AAB  665D        ZALS  0x5D
  AAC  635F        SUBS  0x5F
  AAD  5078        SACL  0x78
  AAE  F900 0AB8   B     LAB8

LAB0:
  AB0  7F80        NOP
  AB1  7F80        NOP
  AB2  244E        LAC   0x4E,4
  AB3  5079        SACL  0x79
  AB4  665D        ZALS  0x5D
  AB5  635F        SUBS  0x5F
  AB6  0079        ADD   0x79
  AB7  5078        SACL  0x78
LAB8:
  AB8  F800 0963   CALL  L963
LABA:
  ABA  F600 0ABE   BIOZ  LABE
  ABC  F900 0ABA   B     LABA

LABE:
  ABE  7F80        NOP
  ABF  7F80        NOP
  AC0  7F80        NOP
  AC1  7F80        NOP
  AC2  7F80        NOP
  AC3  7F80        NOP
LAC4:
  AC4  7000        LARK  AR0,0x00
  AC5  4F78        OUT   0x78,PA7
  AC6  44A8        IN    *+,PA4
  AC7  44A8        IN    *+,PA4
  AC8  44A8        IN    *+,PA4
  AC9  44A8        IN    *+,PA4
  ACA  44A8        IN    *+,PA4
  ACB  44A8        IN    *+,PA4
  ACC  44A8        IN    *+,PA4
  ACD  44A8        IN    *+,PA4
  ACE  44A8        IN    *+,PA4
  ACF  44A8        IN    *+,PA4
  AD0  44A8        IN    *+,PA4
  AD1  44A8        IN    *+,PA4
  AD2  44A8        IN    *+,PA4
  AD3  44A8        IN    *+,PA4
  AD4  44A8        IN    *+,PA4
  AD5  44A8        IN    *+,PA4
  AD6  7000        LARK  AR0,0x00
  AD7  2EA8        LAC   *+,14
  AD8  0EA8        ADD   *+,14
  AD9  0EA8        ADD   *+,14
  ADA  0EA8        ADD   *+,14
  ADB  587A        SACH  0x7A
  ADC  2EA8        LAC   *+,14
  ADD  0EA8        ADD   *+,14
  ADE  0EA8        ADD   *+,14
  ADF  0EA8        ADD   *+,14
  AE0  587B        SACH  0x7B
  AE1  2EA8        LAC   *+,14
  AE2  0EA8        ADD   *+,14
  AE3  0EA8        ADD   *+,14
  AE4  0EA8        ADD   *+,14
  AE5  587C        SACH  0x7C
  AE6  2EA8        LAC   *+,14
  AE7  0EA8        ADD   *+,14
  AE8  0EA8        ADD   *+,14
  AE9  0EA8        ADD   *+,14
  AEA  587D        SACH  0x7D
  AEB  6579        ZALH  0x79
  AEC  FA00 0AF8   BLZ   LAF8
  AEE  6676        ZALS  0x76
  AEF  7D7A        TBLW  0x7A
  AF0  004D        ADD   0x4D
  AF1  7D7B        TBLW  0x7B
  AF2  004D        ADD   0x4D
  AF3  7D7C        TBLW  0x7C
  AF4  004D        ADD   0x4D
  AF5  7D7D        TBLW  0x7D
  AF6  F900 0B02   B     LB02

LAF8:
  AF8  6676        ZALS  0x76
  AF9  7D7D        TBLW  0x7D
  AFA  004D        ADD   0x4D
  AFB  7D7C        TBLW  0x7C
  AFC  004D        ADD   0x4D
  AFD  7D7B        TBLW  0x7B
  AFE  004D        ADD   0x4D
  AFF  7D7A        TBLW  0x7A
  B00  7F80        NOP
  B01  7F80        NOP
LB02:
  B02  004D        ADD   0x4D
  B03  5076        SACL  0x76
  B04  7F80        NOP
  B05  7F80        NOP
  B06  7F80        NOP
  B07  7F80        NOP
  B08  7F80        NOP
  B09  7F80        NOP
  B0A  7F80        NOP
  B0B  7F80        NOP
  B0C  7F80        NOP
  B0D  7F80        NOP
  B0E  7F80        NOP
  B0F  7F80        NOP
  B10  7F80        NOP
  B11  7F80        NOP
  B12  7F80        NOP
  B13  7F80        NOP
  B14  7F80        NOP
  B15  7F80        NOP
  B16  6678        ZALS  0x78
  B17  0079        ADD   0x79
  B18  5078        SACL  0x78
  B19  6576        ZALH  0x76
  B1A  6277        SUBH  0x77
  B1B  FA00 0AC4   BLZ   LAC4
LB1D:
  B1D  7F8D        RET

  B1E  6568        ZALH  0x68
  B1F  5876        SACH  0x76
  B20  7EDC        LACK  0xDC
  B21  5077        SACL  0x77
  B22  2277        LAC   0x77,2
  B23  0068        ADD   0x68
  B24  5077        SACL  0x77
  B25  F800 0963   CALL  L963
LB27:
  B27  6676        ZALS  0x76
  B28  6778        TBLR  0x78
  B29  004D        ADD   0x4D
  B2A  5076        SACL  0x76
LB2B:
  B2B  F600 0B2F   BIOZ  LB2F
  B2D  F900 0B2B   B     LB2B

LB2F:
  B2F  4E78        OUT   0x78,PA6
LB30:
  B30  F600 0B30   BIOZ  LB30
  B32  6576        ZALH  0x76
  B33  6277        SUBH  0x77
  B34  FA00 0B27   BLZ   LB27
LB36:
  B36  F600 0B3A   BIOZ  LB3A
  B38  F900 0B36   B     LB36

LB3A:
  B3A  4E4C        OUT   0x4C,PA6
  B3B  7F8D        RET

  B3C  F800 0963   CALL  L963
LB3E:
  B3E  F600 0B42   BIOZ  LB42
  B40  F900 0B3E   B     LB3E

LB42:
  B42  4E50        OUT   0x50,PA6
LB43:
  B43  F600 0B43   BIOZ  LB43
LB45:
  B45  F600 0B49   BIOZ  LB49
  B47  F900 0B45   B     LB45

LB49:
  B49  4E4C        OUT   0x4C,PA6
  B4A  7F8D        RET

LB4B:
  B4B  7E00        LACK  0x00
  B4C  5071        SACL  0x71
  B4D  6668        ZALS  0x68
  B4E  5079        SACL  0x79
  B4F  507B        SACL  0x7B
  B50  666C        ZALS  0x6C
  B51  5072        SACL  0x72
  B52  6568        ZALH  0x68
  B53  0E6C        ADD   0x6C,14
  B54  1E6B        SUB   0x6B,14
  B55  587A        SACH  0x7A
LB56:
  B56  6679        ZALS  0x79
  B57  6777        TBLR  0x77
  B58  6577        ZALH  0x77
  B59  6271        SUBH  0x71
  B5A  FA00 0B65   BLZ   LB65
  B5C  6679        ZALS  0x79
  B5D  507B        SACL  0x7B
  B5E  1068        SUB   0x68
  B5F  5072        SACL  0x72
  B60  2272        LAC   0x72,2
  B61  616B        ADDS  0x6B
  B62  5072        SACL  0x72
  B63  6577        ZALH  0x77
  B64  5871        SACH  0x71
LB65:
  B65  7E01        LACK  0x01
  B66  0079        ADD   0x79
  B67  5079        SACL  0x79
  B68  657A        ZALH  0x7A
  B69  6279        SUBH  0x79
  B6A  FC00 0B56   BGZ   LB56
  B6C  667B        ZALS  0x7B
  B6D  7D4F        TBLW  0x4F
  B6E  7F8D        RET

LB6F:
  B6F  6667        ZALS  0x67
  B70  5076        SACL  0x76
  B71  2E6C        LAC   0x6C,14
  B72  0E65        ADD   0x65,14
  B73  5852        SACH  0x52
  B74  654F        ZALH  0x4F
  B75  5879        SACH  0x79
  B76  6550        ZALH  0x50
  B77  5878        SACH  0x78
LB78:
  B78  6652        ZALS  0x52
  B79  634D        SUBS  0x4D
  B7A  5052        SACL  0x52
  B7B  6676        ZALS  0x76
  B7C  6777        TBLR  0x77
  B7D  6577        ZALH  0x77
  B7E  6279        SUBH  0x79
  B7F  FC00 0B85   BGZ   LB85
  B81  6577        ZALH  0x77
  B82  5879        SACH  0x79
  B83  F900 0B8B   B     LB8B

LB85:
  B85  6577        ZALH  0x77
  B86  6278        SUBH  0x78
  B87  FA00 0B8B   BLZ   LB8B
  B89  6577        ZALH  0x77
  B8A  5878        SACH  0x78
LB8B:
  B8B  7E01        LACK  0x01
  B8C  0076        ADD   0x76
  B8D  5076        SACL  0x76
  B8E  6652        ZALS  0x52
  B8F  FE00 0B78   BNZ   LB78
  B91  2F78        LAC   0x78,15
  B92  0F79        ADD   0x79,15
  B93  587A        SACH  0x7A
  B94  2F78        LAC   0x78,15
  B95  1F79        SUB   0x79,15
  B96  587B        SACH  0x7B
  B97  657B        ZALH  0x7B
  B98  624C        SUBH  0x4C
  B99  FE00 0B9F   BNZ   LB9F
  B9B  654F        ZALH  0x4F
  B9C  5873        SACH  0x73
  B9D  F900 0BAD   B     LBAD

LB9F:
  B9F  2F4F        LAC   0x4F,15
  BA0  5852        SACH  0x52
  BA1  6880        LARP  0
  BA2  700F        LARK  AR0,0x0F
  BA3  2052        LAC   0x52
LBA4:
  BA4  647B        SUBC  0x7B
  BA5  F400 0BA4   BANZ  LBA4
  BA7  5073        SACL  0x73
  BA8  6573        ZALH  0x73
  BA9  FE00 0BAD   BNZ   LBAD
  BAB  654D        ZALH  0x4D
  BAC  5873        SACH  0x73
LBAD:
  BAD  7F8D        RET

LBAE:
  BAE  7F89        ZAC
  BAF  5076        SACL  0x76
LBB0:
  BB0  6676        ZALS  0x76
  BB1  0067        ADD   0x67
  BB2  6777        TBLR  0x77
  BB3  6577        ZALH  0x77
  BB4  627A        SUBH  0x7A
  BB5  5877        SACH  0x77
  BB6  6A77        LT    0x77
  BB7  6D73        MPY   0x73
  BB8  7F8E        PAC
  BB9  5077        SACL  0x77
  BBA  6A77        LT    0x77
  BBB  6D74        MPY   0x74
  BBC  7F8E        PAC
  BBD  5977        SACH  0x77,1
  BBE  6676        ZALS  0x76
  BBF  0067        ADD   0x67
  BC0  7D77        TBLW  0x77
  BC1  6676        ZALS  0x76
  BC2  004D        ADD   0x4D
  BC3  5076        SACL  0x76
  BC4  6576        ZALH  0x76
  BC5  1E6C        SUB   0x6C,14
  BC6  1E65        SUB   0x65,14
  BC7  144F        SUB   0x4F,4
  BC8  FA00 0BB0   BLZ   LBB0
  BCA  7F8D        RET

LBCB:
  BCB  7E01        LACK  0x01
  BCC  5076        SACL  0x76
  BCD  7F89        ZAC
  BCE  5077        SACL  0x77
  BCF  F800 0BDB   CALL  LBDB
  BD1  6668        ZALS  0x68
  BD2  6770        TBLR  0x70
  BD3  2E6C        LAC   0x6C,14
  BD4  1E6B        SUB   0x6B,14
  BD5  5876        SACH  0x76
  BD6  2E6B        LAC   0x6B,14
  BD7  5877        SACH  0x77
  BD8  F800 0BDB   CALL  LBDB
  BDA  7F8D        RET

LBDB:
  BDB  6667        ZALS  0x67
  BDC  5078        SACL  0x78
  BDD  F800 0C3A   CALL  LC3A
  BDF  6667        ZALS  0x67
  BE0  0077        ADD   0x77
  BE1  5078        SACL  0x78
  BE2  F800 0C43   CALL  LC43
  BE4  7E20        LACK  0x20
  BE5  0067        ADD   0x67
  BE6  0077        ADD   0x77
  BE7  5078        SACL  0x78
  BE8  6668        ZALS  0x68
  BE9  5079        SACL  0x79
  BEA  6880        LARP  0
  BEB  3876        LAR   AR0,0x76
  BEC  656F        ZALH  0x6F
  BED  FE00 0BF3   BNZ   LBF3
  BEF  F800 0C13   CALL  LC13
  BF1  F900 0BF5   B     LBF5

LBF3:
  BF3  F800 0C24   CALL  LC24
LBF5:
  BF5  7E20        LACK  0x20
  BF6  507A        SACL  0x7A
LBF7:
  BF7  667A        ZALS  0x7A
  BF8  0067        ADD   0x67
  BF9  5078        SACL  0x78
  BFA  F800 0C3A   CALL  LC3A
  BFC  667A        ZALS  0x7A
  BFD  0077        ADD   0x77
  BFE  0067        ADD   0x67
  BFF  5078        SACL  0x78
  C00  F800 0C43   CALL  LC43
  C02  6668        ZALS  0x68
  C03  5079        SACL  0x79
  C04  7E20        LACK  0x20
  C05  6178        ADDS  0x78
  C06  5078        SACL  0x78
  C07  6880        LARP  0
  C08  3876        LAR   AR0,0x76
  C09  F800 0C24   CALL  LC24
  C0B  7E20        LACK  0x20
  C0C  007A        ADD   0x7A
  C0D  507A        SACL  0x7A
  C0E  657A        ZALH  0x7A
  C0F  1E65        SUB   0x65,14
  C10  FA00 0BF7   BLZ   LBF7
  C12  7F8D        RET

LC13:
  C13  6898        MAR   *-
  C14  F900 0C1A   B     LC1A

LC16:
  C16  6678        ZALS  0x78
  C17  6720        TBLR  0x20
  C18  004D        ADD   0x4D
  C19  5078        SACL  0x78
LC1A:
  C1A  F800 0C4C   CALL  LC4C
  C1C  6679        ZALS  0x79
  C1D  7D52        TBLW  0x52
  C1E  7E01        LACK  0x01
  C1F  0079        ADD   0x79
  C20  5079        SACL  0x79
  C21  F400 0C16   BANZ  LC16
  C23  7F8D        RET

LC24:
  C24  6898        MAR   *-
  C25  F900 0C2B   B     LC2B

LC27:
  C27  6678        ZALS  0x78
  C28  6720        TBLR  0x20
  C29  004D        ADD   0x4D
  C2A  5078        SACL  0x78
LC2B:
  C2B  F800 0C4C   CALL  LC4C
  C2D  6679        ZALS  0x79
  C2E  6753        TBLR  0x53
  C2F  6553        ZALH  0x53
  C30  6052        ADDH  0x52
  C31  5852        SACH  0x52
  C32  6679        ZALS  0x79
  C33  7D52        TBLW  0x52
  C34  7E01        LACK  0x01
  C35  0079        ADD   0x79
  C36  5079        SACL  0x79
  C37  F400 0C27   BANZ  LC27
  C39  7F8D        RET

LC3A:
  C3A  701F        LARK  AR0,0x1F
  C3B  711F        LARK  AR1,0x1F
  C3C  6678        ZALS  0x78
LC3D:
  C3D  6881        LARP  1
  C3E  6790        TBLR  *-,AR0
  C3F  004D        ADD   0x4D
  C40  F400 0C3D   BANZ  LC3D
  C42  7F8D        RET

LC43:
  C43  701F        LARK  AR0,0x1F
  C44  713F        LARK  AR1,0x3F
  C45  6678        ZALS  0x78
LC46:
  C46  6881        LARP  1
  C47  6790        TBLR  *-,AR0
  C48  004D        ADD   0x4D
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
  C8E  5952        SACH  0x52,1
  C8F  7F8D        RET

