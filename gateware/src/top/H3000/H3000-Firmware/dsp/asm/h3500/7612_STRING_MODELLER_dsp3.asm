; Eventide h3500 DSP microcode
; key 7612  algorithm 76 (STRING MODELLER)  DSP 3
; source H3000-Upgrade_ROM4.BIN offset 0FA78, 647 program words loaded at 800
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
  80C  5065        SACL  0x65
  80D  2A65        LAC   0x65,10
  80E  5069        SACL  0x69
  80F  2F65        LAC   0x65,15
  810  5068        SACL  0x68
  811  7F89        ZAC
  812  5064        SACL  0x64
  813  1065        SUB   0x65
  814  5866        SACH  0x66
  815  7EFF        LACK  0xFF
  816  506A        SACL  0x6A
  817  276A        LAC   0x6A,7
  818  7A6A        OR    0x6A
  819  5067        SACL  0x67
  81A  F800 0A3D   CALL  LA3D
  81C  6881        LARP  1
L81D:
  81D  F600 0821   BIOZ  L821
  81F  F900 081D   B     L81D

L821:
  821  406A        IN    0x6A,PA0
  822  656A        ZALH  0x6A
  823  FD00 0826   BGEZ  L826
  825  7F80        NOP
L826:
  826  F600 0826   BIOZ  L826
L828:
  828  456A        IN    0x6A,PA5
  829  396A        LAR   AR1,0x6A
  82A  4681        IN    *,PA6,AR1
  82B  7F80        NOP
  82C  6644        ZALS  0x44
  82D  0030        ADD   0x30
  82E  4144        IN    0x44,PA1
  82F  5050        SACL  0x50
  830  002A        ADD   0x2A
  831  504F        SACL  0x4F
  832  7F80        NOP
  833  7F80        NOP
  834  6646        ZALS  0x46
  835  6D29        MPY   0x29
  836  6C4D        LTA   0x4D
  837  6D2F        MPY   0x2F
  838  6B4C        LTD   0x4C
  839  6D2E        MPY   0x2E
  83A  6B4B        LTD   0x4B
  83B  6D2D        MPY   0x2D
  83C  6B4A        LTD   0x4A
  83D  6D2C        MPY   0x2C
  83E  6B49        LTD   0x49
  83F  6D2B        MPY   0x2B
  840  6C45        LTA   0x45
  841  584E        SACH  0x4E
  842  6644        ZALS  0x44
  843  0039        ADD   0x39
  844  5059        SACL  0x59
  845  0033        ADD   0x33
  846  5058        SACL  0x58
  847  6646        ZALS  0x46
  848  6D32        MPY   0x32
  849  6C56        LTA   0x56
  84A  6D38        MPY   0x38
  84B  6B55        LTD   0x55
  84C  6D37        MPY   0x37
  84D  6B54        LTD   0x54
  84E  6D36        MPY   0x36
  84F  6B53        LTD   0x53
  850  6D35        MPY   0x35
  851  6B52        LTD   0x52
  852  6D34        MPY   0x34
  853  6C45        LTA   0x45
  854  5857        SACH  0x57
  855  6644        ZALS  0x44
  856  0042        ADD   0x42
  857  5062        SACL  0x62
  858  003C        ADD   0x3C
  859  5061        SACL  0x61
  85A  6646        ZALS  0x46
  85B  6D3B        MPY   0x3B
  85C  6C5F        LTA   0x5F
  85D  6D41        MPY   0x41
  85E  6B5E        LTD   0x5E
  85F  6D40        MPY   0x40
  860  6B5D        LTD   0x5D
  861  6D3F        MPY   0x3F
  862  6B5C        LTD   0x5C
  863  6D3E        MPY   0x3E
  864  4346        IN    0x46,PA3
  865  4145        IN    0x45,PA1
  866  4F4F        OUT   0x4F,PA7
  867  4449        IN    0x49,PA4
  868  4F50        OUT   0x50,PA7
  869  4C4E        OUT   0x4E,PA4
  86A  4F58        OUT   0x58,PA7
  86B  4452        IN    0x52,PA4
  86C  4F59        OUT   0x59,PA7
  86D  4C57        OUT   0x57,PA4
  86E  4F61        OUT   0x61,PA7
  86F  445B        IN    0x5B,PA4
  870  4F62        OUT   0x62,PA7
  871  4C60        OUT   0x60,PA4
  872  6B5B        LTD   0x5B
  873  6D3D        MPY   0x3D
  874  6C45        LTA   0x45
  875  5860        SACH  0x60
  876  6549        ZALH  0x49
  877  6052        ADDH  0x52
  878  605B        ADDH  0x5B
  879  5848        SACH  0x48
  87A  4A48        OUT   0x48,PA2
  87B  7F80        NOP
  87C  2029        LAC   0x29
  87D  FB00 0882   BLEZ  L882
  87F  1031        SUB   0x31
  880  F900 0885   B     L885

L882:
  882  7F89        ZAC
  883  7F80        NOP
  884  7F80        NOP
L885:
  885  5029        SACL  0x29
  886  7F80        NOP
  887  6644        ZALS  0x44
  888  0030        ADD   0x30
  889  4144        IN    0x44,PA1
  88A  5050        SACL  0x50
  88B  002A        ADD   0x2A
  88C  504F        SACL  0x4F
  88D  7F80        NOP
  88E  7F80        NOP
  88F  6646        ZALS  0x46
  890  6D29        MPY   0x29
  891  6C4D        LTA   0x4D
  892  6D2F        MPY   0x2F
  893  6B4C        LTD   0x4C
  894  6D2E        MPY   0x2E
  895  6B4B        LTD   0x4B
  896  6D2D        MPY   0x2D
  897  6B4A        LTD   0x4A
  898  6D2C        MPY   0x2C
  899  6B49        LTD   0x49
  89A  6D2B        MPY   0x2B
  89B  6C45        LTA   0x45
  89C  584E        SACH  0x4E
  89D  6644        ZALS  0x44
  89E  0039        ADD   0x39
  89F  5059        SACL  0x59
  8A0  0033        ADD   0x33
  8A1  5058        SACL  0x58
  8A2  6646        ZALS  0x46
  8A3  6D32        MPY   0x32
  8A4  6C56        LTA   0x56
  8A5  6D38        MPY   0x38
  8A6  6B55        LTD   0x55
  8A7  6D37        MPY   0x37
  8A8  6B54        LTD   0x54
  8A9  6D36        MPY   0x36
  8AA  6B53        LTD   0x53
  8AB  6D35        MPY   0x35
  8AC  6B52        LTD   0x52
  8AD  6D34        MPY   0x34
  8AE  6C45        LTA   0x45
  8AF  5857        SACH  0x57
  8B0  6644        ZALS  0x44
  8B1  0042        ADD   0x42
  8B2  5062        SACL  0x62
  8B3  003C        ADD   0x3C
  8B4  5061        SACL  0x61
  8B5  6646        ZALS  0x46
  8B6  6D3B        MPY   0x3B
  8B7  6C5F        LTA   0x5F
  8B8  6D41        MPY   0x41
  8B9  6B5E        LTD   0x5E
  8BA  6D40        MPY   0x40
  8BB  6B5D        LTD   0x5D
  8BC  6D3F        MPY   0x3F
  8BD  6B5C        LTD   0x5C
  8BE  6D3E        MPY   0x3E
  8BF  4346        IN    0x46,PA3
  8C0  4145        IN    0x45,PA1
  8C1  4F4F        OUT   0x4F,PA7
  8C2  4449        IN    0x49,PA4
  8C3  4F50        OUT   0x50,PA7
  8C4  4C4E        OUT   0x4E,PA4
  8C5  4F58        OUT   0x58,PA7
  8C6  4452        IN    0x52,PA4
  8C7  4F59        OUT   0x59,PA7
  8C8  4C57        OUT   0x57,PA4
  8C9  4F61        OUT   0x61,PA7
  8CA  445B        IN    0x5B,PA4
  8CB  4F62        OUT   0x62,PA7
  8CC  4C60        OUT   0x60,PA4
  8CD  6B5B        LTD   0x5B
  8CE  6D3D        MPY   0x3D
  8CF  6C45        LTA   0x45
  8D0  5860        SACH  0x60
  8D1  6549        ZALH  0x49
  8D2  6052        ADDH  0x52
  8D3  605B        ADDH  0x5B
  8D4  5848        SACH  0x48
  8D5  4A48        OUT   0x48,PA2
  8D6  7F80        NOP
  8D7  2032        LAC   0x32
  8D8  FB00 08DD   BLEZ  L8DD
  8DA  103A        SUB   0x3A
  8DB  F900 08E0   B     L8E0

L8DD:
  8DD  7F89        ZAC
  8DE  7F80        NOP
  8DF  7F80        NOP
L8E0:
  8E0  5032        SACL  0x32
  8E1  7F80        NOP
  8E2  6644        ZALS  0x44
  8E3  0030        ADD   0x30
  8E4  4144        IN    0x44,PA1
  8E5  5050        SACL  0x50
  8E6  002A        ADD   0x2A
  8E7  504F        SACL  0x4F
  8E8  7F80        NOP
  8E9  7F80        NOP
  8EA  6646        ZALS  0x46
  8EB  6D29        MPY   0x29
  8EC  6C4D        LTA   0x4D
  8ED  6D2F        MPY   0x2F
  8EE  6B4C        LTD   0x4C
  8EF  6D2E        MPY   0x2E
  8F0  6B4B        LTD   0x4B
  8F1  6D2D        MPY   0x2D
  8F2  6B4A        LTD   0x4A
  8F3  6D2C        MPY   0x2C
  8F4  6B49        LTD   0x49
  8F5  6D2B        MPY   0x2B
  8F6  6C45        LTA   0x45
  8F7  584E        SACH  0x4E
  8F8  6644        ZALS  0x44
  8F9  0039        ADD   0x39
  8FA  5059        SACL  0x59
  8FB  0033        ADD   0x33
  8FC  5058        SACL  0x58
  8FD  6646        ZALS  0x46
  8FE  6D32        MPY   0x32
  8FF  6C56        LTA   0x56
  900  6D38        MPY   0x38
  901  6B55        LTD   0x55
  902  6D37        MPY   0x37
  903  6B54        LTD   0x54
  904  6D36        MPY   0x36
  905  6B53        LTD   0x53
  906  6D35        MPY   0x35
  907  6B52        LTD   0x52
  908  6D34        MPY   0x34
  909  6C45        LTA   0x45
  90A  5857        SACH  0x57
  90B  6644        ZALS  0x44
  90C  0042        ADD   0x42
  90D  5062        SACL  0x62
  90E  003C        ADD   0x3C
  90F  5061        SACL  0x61
  910  6646        ZALS  0x46
  911  6D3B        MPY   0x3B
  912  6C5F        LTA   0x5F
  913  6D41        MPY   0x41
  914  6B5E        LTD   0x5E
  915  6D40        MPY   0x40
  916  6B5D        LTD   0x5D
  917  6D3F        MPY   0x3F
  918  6B5C        LTD   0x5C
  919  6D3E        MPY   0x3E
  91A  4346        IN    0x46,PA3
  91B  4145        IN    0x45,PA1
  91C  4F4F        OUT   0x4F,PA7
  91D  4449        IN    0x49,PA4
  91E  4F50        OUT   0x50,PA7
  91F  4C4E        OUT   0x4E,PA4
  920  4F58        OUT   0x58,PA7
  921  4452        IN    0x52,PA4
  922  4F59        OUT   0x59,PA7
  923  4C57        OUT   0x57,PA4
  924  4F61        OUT   0x61,PA7
  925  445B        IN    0x5B,PA4
  926  4F62        OUT   0x62,PA7
  927  4C60        OUT   0x60,PA4
  928  6B5B        LTD   0x5B
  929  6D3D        MPY   0x3D
  92A  6C45        LTA   0x45
  92B  5860        SACH  0x60
  92C  6549        ZALH  0x49
  92D  6052        ADDH  0x52
  92E  605B        ADDH  0x5B
  92F  5848        SACH  0x48
  930  4A48        OUT   0x48,PA2
  931  7F80        NOP
  932  7F80        NOP
  933  7F80        NOP
  934  456A        IN    0x6A,PA5
  935  396A        LAR   AR1,0x6A
  936  4681        IN    *,PA6,AR1
  937  7F80        NOP
  938  6644        ZALS  0x44
  939  0030        ADD   0x30
  93A  4144        IN    0x44,PA1
  93B  5050        SACL  0x50
  93C  002A        ADD   0x2A
  93D  504F        SACL  0x4F
  93E  7F80        NOP
  93F  7F80        NOP
  940  6646        ZALS  0x46
  941  6D29        MPY   0x29
  942  6C4D        LTA   0x4D
  943  6D2F        MPY   0x2F
  944  6B4C        LTD   0x4C
  945  6D2E        MPY   0x2E
  946  6B4B        LTD   0x4B
  947  6D2D        MPY   0x2D
  948  6B4A        LTD   0x4A
  949  6D2C        MPY   0x2C
  94A  6B49        LTD   0x49
  94B  6D2B        MPY   0x2B
  94C  6C45        LTA   0x45
  94D  584E        SACH  0x4E
  94E  6644        ZALS  0x44
  94F  0039        ADD   0x39
  950  5059        SACL  0x59
  951  0033        ADD   0x33
  952  5058        SACL  0x58
  953  6646        ZALS  0x46
  954  6D32        MPY   0x32
  955  6C56        LTA   0x56
  956  6D38        MPY   0x38
  957  6B55        LTD   0x55
  958  6D37        MPY   0x37
  959  6B54        LTD   0x54
  95A  6D36        MPY   0x36
  95B  6B53        LTD   0x53
  95C  6D35        MPY   0x35
  95D  6B52        LTD   0x52
  95E  6D34        MPY   0x34
  95F  6C45        LTA   0x45
  960  5857        SACH  0x57
  961  6644        ZALS  0x44
  962  0042        ADD   0x42
  963  5062        SACL  0x62
  964  003C        ADD   0x3C
  965  5061        SACL  0x61
  966  6646        ZALS  0x46
  967  6D3B        MPY   0x3B
  968  6C5F        LTA   0x5F
  969  6D41        MPY   0x41
  96A  6B5E        LTD   0x5E
  96B  6D40        MPY   0x40
  96C  6B5D        LTD   0x5D
  96D  6D3F        MPY   0x3F
  96E  6B5C        LTD   0x5C
  96F  6D3E        MPY   0x3E
  970  4346        IN    0x46,PA3
  971  4145        IN    0x45,PA1
  972  4F4F        OUT   0x4F,PA7
  973  4449        IN    0x49,PA4
  974  4F50        OUT   0x50,PA7
  975  4C4E        OUT   0x4E,PA4
  976  4F58        OUT   0x58,PA7
  977  4452        IN    0x52,PA4
  978  4F59        OUT   0x59,PA7
  979  4C57        OUT   0x57,PA4
  97A  4F61        OUT   0x61,PA7
  97B  445B        IN    0x5B,PA4
  97C  4F62        OUT   0x62,PA7
  97D  4C60        OUT   0x60,PA4
  97E  6B5B        LTD   0x5B
  97F  6D3D        MPY   0x3D
  980  6C45        LTA   0x45
  981  5860        SACH  0x60
  982  6549        ZALH  0x49
  983  6052        ADDH  0x52
  984  605B        ADDH  0x5B
  985  5848        SACH  0x48
  986  4A48        OUT   0x48,PA2
  987  7F80        NOP
  988  203B        LAC   0x3B
  989  FB00 098E   BLEZ  L98E
  98B  1043        SUB   0x43
  98C  F900 0991   B     L991

L98E:
  98E  7F89        ZAC
  98F  7F80        NOP
  990  7F80        NOP
L991:
  991  503B        SACL  0x3B
  992  7F80        NOP
  993  6644        ZALS  0x44
  994  0030        ADD   0x30
  995  4144        IN    0x44,PA1
  996  5050        SACL  0x50
  997  002A        ADD   0x2A
  998  504F        SACL  0x4F
  999  7F80        NOP
  99A  7F80        NOP
  99B  6646        ZALS  0x46
  99C  6D29        MPY   0x29
  99D  6C4D        LTA   0x4D
  99E  6D2F        MPY   0x2F
  99F  6B4C        LTD   0x4C
  9A0  6D2E        MPY   0x2E
  9A1  6B4B        LTD   0x4B
  9A2  6D2D        MPY   0x2D
  9A3  6B4A        LTD   0x4A
  9A4  6D2C        MPY   0x2C
  9A5  6B49        LTD   0x49
  9A6  6D2B        MPY   0x2B
  9A7  6C45        LTA   0x45
  9A8  584E        SACH  0x4E
  9A9  6644        ZALS  0x44
  9AA  0039        ADD   0x39
  9AB  5059        SACL  0x59
  9AC  0033        ADD   0x33
  9AD  5058        SACL  0x58
  9AE  6646        ZALS  0x46
  9AF  6D32        MPY   0x32
  9B0  6C56        LTA   0x56
  9B1  6D38        MPY   0x38
  9B2  6B55        LTD   0x55
  9B3  6D37        MPY   0x37
  9B4  6B54        LTD   0x54
  9B5  6D36        MPY   0x36
  9B6  6B53        LTD   0x53
  9B7  6D35        MPY   0x35
  9B8  6B52        LTD   0x52
  9B9  6D34        MPY   0x34
  9BA  6C45        LTA   0x45
  9BB  5857        SACH  0x57
  9BC  6644        ZALS  0x44
  9BD  0042        ADD   0x42
  9BE  5062        SACL  0x62
  9BF  003C        ADD   0x3C
  9C0  5061        SACL  0x61
  9C1  6646        ZALS  0x46
  9C2  6D3B        MPY   0x3B
  9C3  6C5F        LTA   0x5F
  9C4  6D41        MPY   0x41
  9C5  6B5E        LTD   0x5E
  9C6  6D40        MPY   0x40
  9C7  6B5D        LTD   0x5D
  9C8  6D3F        MPY   0x3F
  9C9  6B5C        LTD   0x5C
  9CA  6D3E        MPY   0x3E
  9CB  4346        IN    0x46,PA3
  9CC  4145        IN    0x45,PA1
  9CD  4F4F        OUT   0x4F,PA7
  9CE  4449        IN    0x49,PA4
  9CF  4F50        OUT   0x50,PA7
  9D0  4C4E        OUT   0x4E,PA4
  9D1  4F58        OUT   0x58,PA7
  9D2  4452        IN    0x52,PA4
  9D3  4F59        OUT   0x59,PA7
  9D4  4C57        OUT   0x57,PA4
  9D5  4F61        OUT   0x61,PA7
  9D6  445B        IN    0x5B,PA4
  9D7  4F62        OUT   0x62,PA7
  9D8  4C60        OUT   0x60,PA4
  9D9  6B5B        LTD   0x5B
  9DA  6D3D        MPY   0x3D
  9DB  6C45        LTA   0x45
  9DC  5860        SACH  0x60
  9DD  6549        ZALH  0x49
  9DE  6052        ADDH  0x52
  9DF  605B        ADDH  0x5B
  9E0  5848        SACH  0x48
  9E1  4A48        OUT   0x48,PA2
  9E2  7F80        NOP
  9E3  7F80        NOP
  9E4  7F80        NOP
  9E5  7F80        NOP
  9E6  7F80        NOP
  9E7  7F80        NOP
  9E8  7F80        NOP
  9E9  7F80        NOP
  9EA  7F80        NOP
  9EB  6644        ZALS  0x44
  9EC  0030        ADD   0x30
  9ED  4144        IN    0x44,PA1
  9EE  5050        SACL  0x50
  9EF  002A        ADD   0x2A
  9F0  504F        SACL  0x4F
  9F1  7F80        NOP
  9F2  7F80        NOP
  9F3  6646        ZALS  0x46
  9F4  6D29        MPY   0x29
  9F5  6C4D        LTA   0x4D
  9F6  6D2F        MPY   0x2F
  9F7  6B4C        LTD   0x4C
  9F8  6D2E        MPY   0x2E
  9F9  6B4B        LTD   0x4B
  9FA  6D2D        MPY   0x2D
  9FB  6B4A        LTD   0x4A
  9FC  6D2C        MPY   0x2C
  9FD  6B49        LTD   0x49
  9FE  6D2B        MPY   0x2B
  9FF  6C45        LTA   0x45
  A00  584E        SACH  0x4E
  A01  6644        ZALS  0x44
  A02  0039        ADD   0x39
  A03  5059        SACL  0x59
  A04  0033        ADD   0x33
  A05  5058        SACL  0x58
  A06  6646        ZALS  0x46
  A07  6D32        MPY   0x32
  A08  6C56        LTA   0x56
  A09  6D38        MPY   0x38
  A0A  6B55        LTD   0x55
  A0B  6D37        MPY   0x37
  A0C  6B54        LTD   0x54
  A0D  6D36        MPY   0x36
  A0E  6B53        LTD   0x53
  A0F  6D35        MPY   0x35
  A10  6B52        LTD   0x52
  A11  6D34        MPY   0x34
  A12  6C45        LTA   0x45
  A13  5857        SACH  0x57
  A14  6644        ZALS  0x44
  A15  0042        ADD   0x42
  A16  5062        SACL  0x62
  A17  003C        ADD   0x3C
  A18  5061        SACL  0x61
  A19  6646        ZALS  0x46
  A1A  6D3B        MPY   0x3B
  A1B  6C5F        LTA   0x5F
  A1C  6D41        MPY   0x41
  A1D  6B5E        LTD   0x5E
  A1E  6D40        MPY   0x40
  A1F  6B5D        LTD   0x5D
  A20  6D3F        MPY   0x3F
  A21  6B5C        LTD   0x5C
  A22  6D3E        MPY   0x3E
  A23  4346        IN    0x46,PA3
  A24  4145        IN    0x45,PA1
  A25  4F4F        OUT   0x4F,PA7
  A26  4449        IN    0x49,PA4
  A27  4F50        OUT   0x50,PA7
  A28  4C4E        OUT   0x4E,PA4
  A29  4F58        OUT   0x58,PA7
  A2A  4452        IN    0x52,PA4
  A2B  4F59        OUT   0x59,PA7
  A2C  4C57        OUT   0x57,PA4
  A2D  4F61        OUT   0x61,PA7
  A2E  445B        IN    0x5B,PA4
  A2F  4F62        OUT   0x62,PA7
  A30  4C60        OUT   0x60,PA4
  A31  6B5B        LTD   0x5B
  A32  6D3D        MPY   0x3D
  A33  6C45        LTA   0x45
  A34  5860        SACH  0x60
  A35  6549        ZALH  0x49
  A36  6052        ADDH  0x52
  A37  605B        ADDH  0x5B
  A38  5848        SACH  0x48
  A39  4A48        OUT   0x48,PA2
  A3A  7F80        NOP
  A3B  F900 0828   B     L828

LA3D:
  A3D  7F89        ZAC
  A3E  506B        SACL  0x6B
LA3F:
  A3F  F600 0A43   BIOZ  LA43
  A41  F900 0A3F   B     LA3F

LA43:
  A43  406A        IN    0x6A,PA0
  A44  656A        ZALH  0x6A
  A45  FD00 0A48   BGEZ  LA48
  A47  7F80        NOP
LA48:
  A48  F600 0A48   BIOZ  LA48
LA4A:
  A4A  456A        IN    0x6A,PA5
  A4B  396A        LAR   AR1,0x6A
  A4C  4681        IN    *,PA6,AR1
  A4D  7F80        NOP
  A4E  7F80        NOP
  A4F  7F80        NOP
  A50  7F80        NOP
  A51  7F80        NOP
  A52  7E15        LACK  0x15
  A53  616B        ADDS  0x6B
  A54  506B        SACL  0x6B
  A55  4C64        OUT   0x64,PA4
  A56  4C64        OUT   0x64,PA4
  A57  4C64        OUT   0x64,PA4
  A58  4C64        OUT   0x64,PA4
  A59  4C64        OUT   0x64,PA4
  A5A  4C64        OUT   0x64,PA4
  A5B  4C64        OUT   0x64,PA4
  A5C  4C64        OUT   0x64,PA4
  A5D  4C64        OUT   0x64,PA4
  A5E  4C64        OUT   0x64,PA4
  A5F  4C64        OUT   0x64,PA4
  A60  4C64        OUT   0x64,PA4
  A61  4C64        OUT   0x64,PA4
  A62  4C64        OUT   0x64,PA4
  A63  4C64        OUT   0x64,PA4
  A64  4C64        OUT   0x64,PA4
  A65  4C64        OUT   0x64,PA4
  A66  4C64        OUT   0x64,PA4
  A67  4C64        OUT   0x64,PA4
  A68  4C64        OUT   0x64,PA4
  A69  4C64        OUT   0x64,PA4
  A6A  4C64        OUT   0x64,PA4
  A6B  4C64        OUT   0x64,PA4
  A6C  4C64        OUT   0x64,PA4
  A6D  4C64        OUT   0x64,PA4
  A6E  4C64        OUT   0x64,PA4
  A6F  4C64        OUT   0x64,PA4
  A70  4C64        OUT   0x64,PA4
  A71  4C64        OUT   0x64,PA4
  A72  4C64        OUT   0x64,PA4
  A73  4C64        OUT   0x64,PA4
  A74  4C64        OUT   0x64,PA4
  A75  4C64        OUT   0x64,PA4
  A76  4C64        OUT   0x64,PA4
  A77  4C64        OUT   0x64,PA4
  A78  4C64        OUT   0x64,PA4
  A79  4C64        OUT   0x64,PA4
  A7A  4C64        OUT   0x64,PA4
  A7B  4C64        OUT   0x64,PA4
  A7C  4C64        OUT   0x64,PA4
  A7D  4C64        OUT   0x64,PA4
  A7E  4C64        OUT   0x64,PA4
  A7F  7F80        NOP
  A80  7F80        NOP
  A81  7F80        NOP
  A82  7F80        NOP
  A83  206B        LAC   0x6B
  A84  FC00 0A4A   BGZ   LA4A
  A86  7F8D        RET

