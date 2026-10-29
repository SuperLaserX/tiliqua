; Eventide h3500 DSP microcode
; key 7610  algorithm 76 (STRING MODELLER)  DSP 1
; source H3000-Upgrade_ROM4.BIN offset 0EFBE, 695 program words loaded at 800
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
  80C  5061        SACL  0x61
  80D  2861        LAC   0x61,8
  80E  5065        SACL  0x65
  80F  2F61        LAC   0x61,15
  810  5064        SACL  0x64
  811  7F89        ZAC
  812  5060        SACL  0x60
  813  1061        SUB   0x61
  814  5862        SACH  0x62
  815  7EFF        LACK  0xFF
  816  5066        SACL  0x66
  817  2766        LAC   0x66,7
  818  7A66        OR    0x66
  819  5063        SACL  0x63
  81A  F800 0A58   CALL  LA58
  81C  7E53        LACK  0x53
  81D  504A        SACL  0x4A
  81E  7E43        LACK  0x43
  81F  504B        SACL  0x4B
  820  6E00        LDPK  0
  821  6881        LARP  1
  822  7F8B        SOVM
L823:
  823  F600 0827   BIOZ  L827
  825  F900 0823   B     L823

L827:
  827  4066        IN    0x66,PA0
  828  6566        ZALH  0x66
  829  FD00 082C   BGEZ  L82C
  82B  7F80        NOP
L82C:
  82C  F600 082C   BIOZ  L82C
L82E:
  82E  4566        IN    0x66,PA5
  82F  3966        LAR   AR1,0x66
  830  4681        IN    *,PA6,AR1
  831  7F80        NOP
  832  4944        OUT   0x44,PA1
  833  664A        ZALS  0x4A
  834  004B        ADD   0x4B
  835  504B        SACL  0x4B
  836  004A        ADD   0x4A
  837  504A        SACL  0x4A
  838  6644        ZALS  0x44
  839  1061        SUB   0x61
  83A  5044        SACL  0x44
  83B  6547        ZALH  0x47
  83C  6D48        MPY   0x48
  83D  6C48        LTA   0x48
  83E  7F8F        APAC
  83F  5847        SACH  0x47
  840  654A        ZALH  0x4A
  841  6D01        MPY   0x01
  842  7F8F        APAC
  843  6C02        LTA   0x02
  844  6247        SUBH  0x47
  845  5849        SACH  0x49
  846  6D49        MPY   0x49
  847  7F8E        PAC
  848  6C4C        LTA   0x4C
  849  6048        ADDH  0x48
  84A  5848        SACH  0x48
  84B  665E        ZALS  0x5E
  84C  605D        ADDH  0x5D
  84D  6D07        MPY   0x07
  84E  6C47        LTA   0x47
  84F  4945        OUT   0x45,PA1
  850  424D        IN    0x4D,PA2
  851  4B4A        OUT   0x4A,PA3
  852  585F        SACH  0x5F
  853  6D05        MPY   0x05
  854  6C48        LTA   0x48
  855  6D04        MPY   0x04
  856  6C49        LTA   0x49
  857  6D03        MPY   0x03
  858  6C54        LTA   0x54
  859  5845        SACH  0x45
  85A  654D        ZALH  0x4D
  85B  604E        ADDH  0x4E
  85C  4F44        OUT   0x44,PA7
  85D  4C4F        OUT   0x4F,PA4
  85E  4F53        OUT   0x53,PA7
  85F  584F        SACH  0x4F
  860  4455        IN    0x55,PA4
  861  4456        IN    0x56,PA4
  862  6D0D        MPY   0x0D
  863  7F90        SPAC
  864  5850        SACH  0x50
  865  654F        ZALH  0x4F
  866  6C55        LTA   0x55
  867  5851        SACH  0x51
  868  7F89        ZAC
  869  6D57        MPY   0x57
  86A  6C56        LTA   0x56
  86B  6D58        MPY   0x58
  86C  6C02        LTA   0x02
  86D  5854        SACH  0x54
  86E  6054        ADDH  0x54
  86F  6054        ADDH  0x54
  870  5854        SACH  0x54
  871  665C        ZALS  0x5C
  872  605B        ADDH  0x5B
  873  0059        ADD   0x59
  874  505C        SACL  0x5C
  875  585B        SACH  0x5B
  876  2F5C        LAC   0x5C,15
  877  585A        SACH  0x5A
  878  205A        LAC   0x5A
  879  7963        AND   0x63
  87A  5058        SACL  0x58
  87B  2063        LAC   0x63
  87C  1058        SUB   0x58
  87D  5057        SACL  0x57
  87E  6644        ZALS  0x44
  87F  4D50        OUT   0x50,PA5
  880  4E51        OUT   0x51,PA6
  881  424E        IN    0x4E,PA2
  882  474C        IN    0x4C,PA7
  883  005B        ADD   0x5B
  884  5053        SACL  0x53
  885  205B        LAC   0x5B
  886  100B        SUB   0x0B
  887  FA00 088D   BLZ   L88D
  889  660A        ZALS  0x0A
  88A  5059        SACL  0x59
  88B  F900 0891   B     L891

L88D:
  88D  7F80        NOP
  88E  7F80        NOP
  88F  7F80        NOP
  890  7F80        NOP
L891:
  891  4944        OUT   0x44,PA1
  892  664A        ZALS  0x4A
  893  004B        ADD   0x4B
  894  504B        SACL  0x4B
  895  004A        ADD   0x4A
  896  504A        SACL  0x4A
  897  6644        ZALS  0x44
  898  1061        SUB   0x61
  899  5044        SACL  0x44
  89A  6547        ZALH  0x47
  89B  6D48        MPY   0x48
  89C  6C48        LTA   0x48
  89D  7F8F        APAC
  89E  5847        SACH  0x47
  89F  654A        ZALH  0x4A
  8A0  6D01        MPY   0x01
  8A1  7F8F        APAC
  8A2  6C02        LTA   0x02
  8A3  6247        SUBH  0x47
  8A4  5849        SACH  0x49
  8A5  6D49        MPY   0x49
  8A6  7F8E        PAC
  8A7  6C4C        LTA   0x4C
  8A8  6048        ADDH  0x48
  8A9  5848        SACH  0x48
  8AA  665E        ZALS  0x5E
  8AB  605D        ADDH  0x5D
  8AC  6D07        MPY   0x07
  8AD  6C47        LTA   0x47
  8AE  4945        OUT   0x45,PA1
  8AF  424D        IN    0x4D,PA2
  8B0  4B4A        OUT   0x4A,PA3
  8B1  585F        SACH  0x5F
  8B2  6D05        MPY   0x05
  8B3  6C48        LTA   0x48
  8B4  6D04        MPY   0x04
  8B5  6C49        LTA   0x49
  8B6  6D03        MPY   0x03
  8B7  6C54        LTA   0x54
  8B8  5845        SACH  0x45
  8B9  654D        ZALH  0x4D
  8BA  604E        ADDH  0x4E
  8BB  4F44        OUT   0x44,PA7
  8BC  4C4F        OUT   0x4F,PA4
  8BD  4F53        OUT   0x53,PA7
  8BE  584F        SACH  0x4F
  8BF  4455        IN    0x55,PA4
  8C0  4456        IN    0x56,PA4
  8C1  6D0D        MPY   0x0D
  8C2  7F90        SPAC
  8C3  5850        SACH  0x50
  8C4  654F        ZALH  0x4F
  8C5  6C55        LTA   0x55
  8C6  5851        SACH  0x51
  8C7  7F89        ZAC
  8C8  6D57        MPY   0x57
  8C9  6C56        LTA   0x56
  8CA  6D58        MPY   0x58
  8CB  6C02        LTA   0x02
  8CC  5854        SACH  0x54
  8CD  6054        ADDH  0x54
  8CE  6054        ADDH  0x54
  8CF  5854        SACH  0x54
  8D0  665C        ZALS  0x5C
  8D1  605B        ADDH  0x5B
  8D2  0059        ADD   0x59
  8D3  505C        SACL  0x5C
  8D4  585B        SACH  0x5B
  8D5  2F5C        LAC   0x5C,15
  8D6  585A        SACH  0x5A
  8D7  205A        LAC   0x5A
  8D8  7963        AND   0x63
  8D9  5058        SACL  0x58
  8DA  2063        LAC   0x63
  8DB  1058        SUB   0x58
  8DC  5057        SACL  0x57
  8DD  6644        ZALS  0x44
  8DE  4D50        OUT   0x50,PA5
  8DF  4E51        OUT   0x51,PA6
  8E0  424E        IN    0x4E,PA2
  8E1  474C        IN    0x4C,PA7
  8E2  005B        ADD   0x5B
  8E3  5053        SACL  0x53
  8E4  205B        LAC   0x5B
  8E5  100C        SUB   0x0C
  8E6  FC00 08EC   BGZ   L8EC
  8E8  6609        ZALS  0x09
  8E9  5059        SACL  0x59
  8EA  F900 08F0   B     L8F0

L8EC:
  8EC  7F80        NOP
  8ED  7F80        NOP
  8EE  7F80        NOP
  8EF  7F80        NOP
L8F0:
  8F0  4944        OUT   0x44,PA1
  8F1  664A        ZALS  0x4A
  8F2  004B        ADD   0x4B
  8F3  504B        SACL  0x4B
  8F4  004A        ADD   0x4A
  8F5  504A        SACL  0x4A
  8F6  6644        ZALS  0x44
  8F7  1061        SUB   0x61
  8F8  5044        SACL  0x44
  8F9  6547        ZALH  0x47
  8FA  6D48        MPY   0x48
  8FB  6C48        LTA   0x48
  8FC  7F8F        APAC
  8FD  5847        SACH  0x47
  8FE  654A        ZALH  0x4A
  8FF  6D01        MPY   0x01
  900  7F8F        APAC
  901  6C02        LTA   0x02
  902  6247        SUBH  0x47
  903  5849        SACH  0x49
  904  6D49        MPY   0x49
  905  7F8E        PAC
  906  6C4C        LTA   0x4C
  907  6048        ADDH  0x48
  908  5848        SACH  0x48
  909  665E        ZALS  0x5E
  90A  605D        ADDH  0x5D
  90B  6D07        MPY   0x07
  90C  6C47        LTA   0x47
  90D  4945        OUT   0x45,PA1
  90E  424D        IN    0x4D,PA2
  90F  4B4A        OUT   0x4A,PA3
  910  585F        SACH  0x5F
  911  6D05        MPY   0x05
  912  6C48        LTA   0x48
  913  6D04        MPY   0x04
  914  6C49        LTA   0x49
  915  6D03        MPY   0x03
  916  6C54        LTA   0x54
  917  5845        SACH  0x45
  918  654D        ZALH  0x4D
  919  604E        ADDH  0x4E
  91A  4F44        OUT   0x44,PA7
  91B  4C4F        OUT   0x4F,PA4
  91C  4F53        OUT   0x53,PA7
  91D  584F        SACH  0x4F
  91E  4455        IN    0x55,PA4
  91F  4456        IN    0x56,PA4
  920  6D0D        MPY   0x0D
  921  7F90        SPAC
  922  5850        SACH  0x50
  923  654F        ZALH  0x4F
  924  6C55        LTA   0x55
  925  5851        SACH  0x51
  926  7F89        ZAC
  927  6D57        MPY   0x57
  928  6C56        LTA   0x56
  929  6D58        MPY   0x58
  92A  6C02        LTA   0x02
  92B  5854        SACH  0x54
  92C  6054        ADDH  0x54
  92D  6054        ADDH  0x54
  92E  5854        SACH  0x54
  92F  665C        ZALS  0x5C
  930  605B        ADDH  0x5B
  931  0059        ADD   0x59
  932  505C        SACL  0x5C
  933  585B        SACH  0x5B
  934  2F5C        LAC   0x5C,15
  935  585A        SACH  0x5A
  936  205A        LAC   0x5A
  937  7963        AND   0x63
  938  5058        SACL  0x58
  939  2063        LAC   0x63
  93A  1058        SUB   0x58
  93B  5057        SACL  0x57
  93C  6644        ZALS  0x44
  93D  4D50        OUT   0x50,PA5
  93E  4E51        OUT   0x51,PA6
  93F  424E        IN    0x4E,PA2
  940  474C        IN    0x4C,PA7
  941  005B        ADD   0x5B
  942  5053        SACL  0x53
  943  7F80        NOP
  944  7F80        NOP
  945  4566        IN    0x66,PA5
  946  3966        LAR   AR1,0x66
  947  4681        IN    *,PA6,AR1
  948  7F80        NOP
  949  4944        OUT   0x44,PA1
  94A  664A        ZALS  0x4A
  94B  004B        ADD   0x4B
  94C  504B        SACL  0x4B
  94D  004A        ADD   0x4A
  94E  504A        SACL  0x4A
  94F  6644        ZALS  0x44
  950  1061        SUB   0x61
  951  5044        SACL  0x44
  952  6547        ZALH  0x47
  953  6D48        MPY   0x48
  954  6C48        LTA   0x48
  955  7F8F        APAC
  956  5847        SACH  0x47
  957  654A        ZALH  0x4A
  958  6D01        MPY   0x01
  959  7F8F        APAC
  95A  6C02        LTA   0x02
  95B  6247        SUBH  0x47
  95C  5849        SACH  0x49
  95D  6D49        MPY   0x49
  95E  7F8E        PAC
  95F  6C4C        LTA   0x4C
  960  6048        ADDH  0x48
  961  5848        SACH  0x48
  962  665E        ZALS  0x5E
  963  605D        ADDH  0x5D
  964  6D07        MPY   0x07
  965  6C47        LTA   0x47
  966  4945        OUT   0x45,PA1
  967  424D        IN    0x4D,PA2
  968  4B4A        OUT   0x4A,PA3
  969  585F        SACH  0x5F
  96A  6D05        MPY   0x05
  96B  6C48        LTA   0x48
  96C  6D04        MPY   0x04
  96D  6C49        LTA   0x49
  96E  6D03        MPY   0x03
  96F  6C54        LTA   0x54
  970  5845        SACH  0x45
  971  654D        ZALH  0x4D
  972  604E        ADDH  0x4E
  973  4F44        OUT   0x44,PA7
  974  4C4F        OUT   0x4F,PA4
  975  4F53        OUT   0x53,PA7
  976  584F        SACH  0x4F
  977  4455        IN    0x55,PA4
  978  4456        IN    0x56,PA4
  979  6D0D        MPY   0x0D
  97A  7F90        SPAC
  97B  5850        SACH  0x50
  97C  654F        ZALH  0x4F
  97D  6C55        LTA   0x55
  97E  5851        SACH  0x51
  97F  7F89        ZAC
  980  6D57        MPY   0x57
  981  6C56        LTA   0x56
  982  6D58        MPY   0x58
  983  6C02        LTA   0x02
  984  5854        SACH  0x54
  985  6054        ADDH  0x54
  986  6054        ADDH  0x54
  987  5854        SACH  0x54
  988  665C        ZALS  0x5C
  989  605B        ADDH  0x5B
  98A  0059        ADD   0x59
  98B  505C        SACL  0x5C
  98C  585B        SACH  0x5B
  98D  2F5C        LAC   0x5C,15
  98E  585A        SACH  0x5A
  98F  205A        LAC   0x5A
  990  7963        AND   0x63
  991  5058        SACL  0x58
  992  2063        LAC   0x63
  993  1058        SUB   0x58
  994  5057        SACL  0x57
  995  6644        ZALS  0x44
  996  4D50        OUT   0x50,PA5
  997  4E51        OUT   0x51,PA6
  998  424E        IN    0x4E,PA2
  999  474C        IN    0x4C,PA7
  99A  005B        ADD   0x5B
  99B  5053        SACL  0x53
  99C  665E        ZALS  0x5E
  99D  605D        ADDH  0x5D
  99E  7F80        NOP
  99F  1A45        SUB   0x45,10
  9A0  7F80        NOP
  9A1  105D        SUB   0x5D
  9A2  505E        SACL  0x5E
  9A3  585D        SACH  0x5D
  9A4  4944        OUT   0x44,PA1
  9A5  664A        ZALS  0x4A
  9A6  004B        ADD   0x4B
  9A7  504B        SACL  0x4B
  9A8  004A        ADD   0x4A
  9A9  504A        SACL  0x4A
  9AA  6644        ZALS  0x44
  9AB  1061        SUB   0x61
  9AC  5044        SACL  0x44
  9AD  6547        ZALH  0x47
  9AE  6D48        MPY   0x48
  9AF  6C48        LTA   0x48
  9B0  7F8F        APAC
  9B1  5847        SACH  0x47
  9B2  654A        ZALH  0x4A
  9B3  6D01        MPY   0x01
  9B4  7F8F        APAC
  9B5  6C02        LTA   0x02
  9B6  6247        SUBH  0x47
  9B7  5849        SACH  0x49
  9B8  6D49        MPY   0x49
  9B9  7F8E        PAC
  9BA  6C4C        LTA   0x4C
  9BB  6048        ADDH  0x48
  9BC  5848        SACH  0x48
  9BD  665E        ZALS  0x5E
  9BE  605D        ADDH  0x5D
  9BF  6D07        MPY   0x07
  9C0  6C47        LTA   0x47
  9C1  4945        OUT   0x45,PA1
  9C2  424D        IN    0x4D,PA2
  9C3  4B4A        OUT   0x4A,PA3
  9C4  585F        SACH  0x5F
  9C5  6D05        MPY   0x05
  9C6  6C48        LTA   0x48
  9C7  6D04        MPY   0x04
  9C8  6C49        LTA   0x49
  9C9  6D03        MPY   0x03
  9CA  6C54        LTA   0x54
  9CB  5845        SACH  0x45
  9CC  654D        ZALH  0x4D
  9CD  604E        ADDH  0x4E
  9CE  4F44        OUT   0x44,PA7
  9CF  4C4F        OUT   0x4F,PA4
  9D0  4F53        OUT   0x53,PA7
  9D1  584F        SACH  0x4F
  9D2  4455        IN    0x55,PA4
  9D3  4456        IN    0x56,PA4
  9D4  6D0D        MPY   0x0D
  9D5  7F90        SPAC
  9D6  5850        SACH  0x50
  9D7  654F        ZALH  0x4F
  9D8  6C55        LTA   0x55
  9D9  5851        SACH  0x51
  9DA  7F89        ZAC
  9DB  6D57        MPY   0x57
  9DC  6C56        LTA   0x56
  9DD  6D58        MPY   0x58
  9DE  6C02        LTA   0x02
  9DF  5854        SACH  0x54
  9E0  6054        ADDH  0x54
  9E1  6054        ADDH  0x54
  9E2  5854        SACH  0x54
  9E3  665C        ZALS  0x5C
  9E4  605B        ADDH  0x5B
  9E5  0059        ADD   0x59
  9E6  505C        SACL  0x5C
  9E7  585B        SACH  0x5B
  9E8  2F5C        LAC   0x5C,15
  9E9  585A        SACH  0x5A
  9EA  205A        LAC   0x5A
  9EB  7963        AND   0x63
  9EC  5058        SACL  0x58
  9ED  2063        LAC   0x63
  9EE  1058        SUB   0x58
  9EF  5057        SACL  0x57
  9F0  6644        ZALS  0x44
  9F1  4D50        OUT   0x50,PA5
  9F2  4E51        OUT   0x51,PA6
  9F3  424E        IN    0x4E,PA2
  9F4  474C        IN    0x4C,PA7
  9F5  005B        ADD   0x5B
  9F6  5053        SACL  0x53
  9F7  2059        LAC   0x59
  9F8  FA00 09FE   BLZ   L9FE
  9FA  6609        ZALS  0x09
  9FB  5059        SACL  0x59
  9FC  F900 0A02   B     LA02

L9FE:
  9FE  660A        ZALS  0x0A
  9FF  5059        SACL  0x59
  A00  7F80        NOP
  A01  7F80        NOP
LA02:
  A02  7F80        NOP
  A03  4944        OUT   0x44,PA1
  A04  664A        ZALS  0x4A
  A05  004B        ADD   0x4B
  A06  504B        SACL  0x4B
  A07  004A        ADD   0x4A
  A08  504A        SACL  0x4A
  A09  6644        ZALS  0x44
  A0A  1061        SUB   0x61
  A0B  5044        SACL  0x44
  A0C  6547        ZALH  0x47
  A0D  6D48        MPY   0x48
  A0E  6C48        LTA   0x48
  A0F  7F8F        APAC
  A10  5847        SACH  0x47
  A11  654A        ZALH  0x4A
  A12  6D01        MPY   0x01
  A13  7F8F        APAC
  A14  6C02        LTA   0x02
  A15  6247        SUBH  0x47
  A16  5849        SACH  0x49
  A17  6D49        MPY   0x49
  A18  7F8E        PAC
  A19  6C4C        LTA   0x4C
  A1A  6048        ADDH  0x48
  A1B  5848        SACH  0x48
  A1C  665E        ZALS  0x5E
  A1D  605D        ADDH  0x5D
  A1E  6D07        MPY   0x07
  A1F  6C47        LTA   0x47
  A20  4945        OUT   0x45,PA1
  A21  424D        IN    0x4D,PA2
  A22  4B4A        OUT   0x4A,PA3
  A23  585F        SACH  0x5F
  A24  6D05        MPY   0x05
  A25  6C48        LTA   0x48
  A26  6D04        MPY   0x04
  A27  6C49        LTA   0x49
  A28  6D03        MPY   0x03
  A29  6C54        LTA   0x54
  A2A  5845        SACH  0x45
  A2B  654D        ZALH  0x4D
  A2C  604E        ADDH  0x4E
  A2D  4F44        OUT   0x44,PA7
  A2E  4C4F        OUT   0x4F,PA4
  A2F  4F53        OUT   0x53,PA7
  A30  584F        SACH  0x4F
  A31  4455        IN    0x55,PA4
  A32  4456        IN    0x56,PA4
  A33  6D0D        MPY   0x0D
  A34  7F90        SPAC
  A35  5850        SACH  0x50
  A36  654F        ZALH  0x4F
  A37  6C55        LTA   0x55
  A38  5851        SACH  0x51
  A39  7F89        ZAC
  A3A  6D57        MPY   0x57
  A3B  6C56        LTA   0x56
  A3C  6D58        MPY   0x58
  A3D  6C02        LTA   0x02
  A3E  5854        SACH  0x54
  A3F  6054        ADDH  0x54
  A40  6054        ADDH  0x54
  A41  5854        SACH  0x54
  A42  665C        ZALS  0x5C
  A43  605B        ADDH  0x5B
  A44  0059        ADD   0x59
  A45  505C        SACL  0x5C
  A46  585B        SACH  0x5B
  A47  2F5C        LAC   0x5C,15
  A48  585A        SACH  0x5A
  A49  205A        LAC   0x5A
  A4A  7963        AND   0x63
  A4B  5058        SACL  0x58
  A4C  2063        LAC   0x63
  A4D  1058        SUB   0x58
  A4E  5057        SACL  0x57
  A4F  6644        ZALS  0x44
  A50  4D50        OUT   0x50,PA5
  A51  4E51        OUT   0x51,PA6
  A52  424E        IN    0x4E,PA2
  A53  474C        IN    0x4C,PA7
  A54  005B        ADD   0x5B
  A55  5053        SACL  0x53
  A56  F900 082E   B     L82E

LA58:
  A58  7F89        ZAC
  A59  5067        SACL  0x67
LA5A:
  A5A  F600 0A5E   BIOZ  LA5E
  A5C  F900 0A5A   B     LA5A

LA5E:
  A5E  4066        IN    0x66,PA0
  A5F  6566        ZALH  0x66
  A60  FD00 0A63   BGEZ  LA63
  A62  7F80        NOP
LA63:
  A63  F600 0A63   BIOZ  LA63
LA65:
  A65  4566        IN    0x66,PA5
  A66  3966        LAR   AR1,0x66
  A67  4681        IN    *,PA6,AR1
  A68  7F80        NOP
  A69  7F80        NOP
  A6A  7F80        NOP
  A6B  7F80        NOP
  A6C  7F80        NOP
  A6D  7F80        NOP
  A6E  6667        ZALS  0x67
  A6F  4F67        OUT   0x67,PA7
  A70  6161        ADDS  0x61
  A71  5067        SACL  0x67
  A72  4F67        OUT   0x67,PA7
  A73  6161        ADDS  0x61
  A74  5067        SACL  0x67
  A75  4F67        OUT   0x67,PA7
  A76  6161        ADDS  0x61
  A77  5067        SACL  0x67
  A78  4F67        OUT   0x67,PA7
  A79  6161        ADDS  0x61
  A7A  5067        SACL  0x67
  A7B  4F67        OUT   0x67,PA7
  A7C  6161        ADDS  0x61
  A7D  5067        SACL  0x67
  A7E  4F67        OUT   0x67,PA7
  A7F  6161        ADDS  0x61
  A80  5067        SACL  0x67
  A81  4F67        OUT   0x67,PA7
  A82  6161        ADDS  0x61
  A83  5067        SACL  0x67
  A84  4F67        OUT   0x67,PA7
  A85  6161        ADDS  0x61
  A86  5067        SACL  0x67
  A87  4F67        OUT   0x67,PA7
  A88  6161        ADDS  0x61
  A89  5067        SACL  0x67
  A8A  4F67        OUT   0x67,PA7
  A8B  6161        ADDS  0x61
  A8C  5067        SACL  0x67
  A8D  4F67        OUT   0x67,PA7
  A8E  6161        ADDS  0x61
  A8F  5067        SACL  0x67
  A90  4F67        OUT   0x67,PA7
  A91  6161        ADDS  0x61
  A92  5067        SACL  0x67
  A93  4F67        OUT   0x67,PA7
  A94  6161        ADDS  0x61
  A95  5067        SACL  0x67
  A96  4F67        OUT   0x67,PA7
  A97  6161        ADDS  0x61
  A98  5067        SACL  0x67
  A99  4F67        OUT   0x67,PA7
  A9A  6161        ADDS  0x61
  A9B  5067        SACL  0x67
  A9C  4F67        OUT   0x67,PA7
  A9D  6161        ADDS  0x61
  A9E  5067        SACL  0x67
  A9F  4F67        OUT   0x67,PA7
  AA0  6161        ADDS  0x61
  AA1  5067        SACL  0x67
  AA2  4F67        OUT   0x67,PA7
  AA3  6161        ADDS  0x61
  AA4  5067        SACL  0x67
  AA5  4F67        OUT   0x67,PA7
  AA6  6161        ADDS  0x61
  AA7  5067        SACL  0x67
  AA8  4F67        OUT   0x67,PA7
  AA9  6161        ADDS  0x61
  AAA  5067        SACL  0x67
  AAB  4F67        OUT   0x67,PA7
  AAC  6161        ADDS  0x61
  AAD  5067        SACL  0x67
  AAE  7F80        NOP
  AAF  7F80        NOP
  AB0  7F80        NOP
  AB1  7F80        NOP
  AB2  7F80        NOP
  AB3  2067        LAC   0x67
  AB4  FD00 0A65   BGEZ  LA65
  AB6  7F8D        RET

