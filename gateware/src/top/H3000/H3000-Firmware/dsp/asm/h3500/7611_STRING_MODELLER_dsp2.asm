; Eventide h3500 DSP microcode
; key 7611  algorithm 76 (STRING MODELLER)  DSP 2
; source H3000-Upgrade_ROM4.BIN offset 0F536, 668 program words loaded at 800
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
  80D  2965        LAC   0x65,9
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
  82D  0015        ADD   0x15
  82E  5050        SACL  0x50
  82F  000F        ADD   0x0F
  830  504F        SACL  0x4F
  831  6646        ZALS  0x46
  832  6D0E        MPY   0x0E
  833  6C4D        LTA   0x4D
  834  6D14        MPY   0x14
  835  4144        IN    0x44,PA1
  836  4F4F        OUT   0x4F,PA7
  837  4449        IN    0x49,PA4
  838  4F50        OUT   0x50,PA7
  839  4C4E        OUT   0x4E,PA4
  83A  4F58        OUT   0x58,PA7
  83B  4452        IN    0x52,PA4
  83C  4F59        OUT   0x59,PA7
  83D  4C57        OUT   0x57,PA4
  83E  4F62        OUT   0x62,PA7
  83F  4C60        OUT   0x60,PA4
  840  4F61        OUT   0x61,PA7
  841  445B        IN    0x5B,PA4
  842  4A48        OUT   0x48,PA2
  843  4145        IN    0x45,PA1
  844  4346        IN    0x46,PA3
  845  6B4C        LTD   0x4C
  846  6D13        MPY   0x13
  847  6B4B        LTD   0x4B
  848  6D12        MPY   0x12
  849  6B4A        LTD   0x4A
  84A  6D11        MPY   0x11
  84B  6B49        LTD   0x49
  84C  6D10        MPY   0x10
  84D  6C45        LTA   0x45
  84E  584E        SACH  0x4E
  84F  6644        ZALS  0x44
  850  001E        ADD   0x1E
  851  5059        SACL  0x59
  852  0018        ADD   0x18
  853  5058        SACL  0x58
  854  6646        ZALS  0x46
  855  6D17        MPY   0x17
  856  6C56        LTA   0x56
  857  6D1D        MPY   0x1D
  858  6B55        LTD   0x55
  859  6D1C        MPY   0x1C
  85A  6B54        LTD   0x54
  85B  6D1B        MPY   0x1B
  85C  6B53        LTD   0x53
  85D  6D1A        MPY   0x1A
  85E  6B52        LTD   0x52
  85F  6D19        MPY   0x19
  860  6C45        LTA   0x45
  861  5857        SACH  0x57
  862  6644        ZALS  0x44
  863  0027        ADD   0x27
  864  5062        SACL  0x62
  865  0021        ADD   0x21
  866  5061        SACL  0x61
  867  6646        ZALS  0x46
  868  6D20        MPY   0x20
  869  6C5F        LTA   0x5F
  86A  6D26        MPY   0x26
  86B  6B5E        LTD   0x5E
  86C  6D25        MPY   0x25
  86D  6B5D        LTD   0x5D
  86E  6D24        MPY   0x24
  86F  6B5C        LTD   0x5C
  870  6D23        MPY   0x23
  871  6B5B        LTD   0x5B
  872  6D22        MPY   0x22
  873  6C45        LTA   0x45
  874  5860        SACH  0x60
  875  6549        ZALH  0x49
  876  6052        ADDH  0x52
  877  605B        ADDH  0x5B
  878  5848        SACH  0x48
  879  7F80        NOP
  87A  7F80        NOP
  87B  7F80        NOP
  87C  200E        LAC   0x0E
  87D  FB00 0882   BLEZ  L882
  87F  1016        SUB   0x16
  880  F900 0885   B     L885

L882:
  882  7F89        ZAC
  883  7F80        NOP
  884  7F80        NOP
L885:
  885  500E        SACL  0x0E
  886  7F80        NOP
  887  6644        ZALS  0x44
  888  0015        ADD   0x15
  889  5050        SACL  0x50
  88A  000F        ADD   0x0F
  88B  504F        SACL  0x4F
  88C  6646        ZALS  0x46
  88D  6D0E        MPY   0x0E
  88E  6C4D        LTA   0x4D
  88F  6D14        MPY   0x14
  890  4144        IN    0x44,PA1
  891  4F4F        OUT   0x4F,PA7
  892  4449        IN    0x49,PA4
  893  4F50        OUT   0x50,PA7
  894  4C4E        OUT   0x4E,PA4
  895  4F58        OUT   0x58,PA7
  896  4452        IN    0x52,PA4
  897  4F59        OUT   0x59,PA7
  898  4C57        OUT   0x57,PA4
  899  4F62        OUT   0x62,PA7
  89A  4C60        OUT   0x60,PA4
  89B  4F61        OUT   0x61,PA7
  89C  445B        IN    0x5B,PA4
  89D  4A48        OUT   0x48,PA2
  89E  4145        IN    0x45,PA1
  89F  4346        IN    0x46,PA3
  8A0  6B4C        LTD   0x4C
  8A1  6D13        MPY   0x13
  8A2  6B4B        LTD   0x4B
  8A3  6D12        MPY   0x12
  8A4  6B4A        LTD   0x4A
  8A5  6D11        MPY   0x11
  8A6  6B49        LTD   0x49
  8A7  6D10        MPY   0x10
  8A8  6C45        LTA   0x45
  8A9  584E        SACH  0x4E
  8AA  6644        ZALS  0x44
  8AB  001E        ADD   0x1E
  8AC  5059        SACL  0x59
  8AD  0018        ADD   0x18
  8AE  5058        SACL  0x58
  8AF  6646        ZALS  0x46
  8B0  6D17        MPY   0x17
  8B1  6C56        LTA   0x56
  8B2  6D1D        MPY   0x1D
  8B3  6B55        LTD   0x55
  8B4  6D1C        MPY   0x1C
  8B5  6B54        LTD   0x54
  8B6  6D1B        MPY   0x1B
  8B7  6B53        LTD   0x53
  8B8  6D1A        MPY   0x1A
  8B9  6B52        LTD   0x52
  8BA  6D19        MPY   0x19
  8BB  6C45        LTA   0x45
  8BC  5857        SACH  0x57
  8BD  6644        ZALS  0x44
  8BE  0027        ADD   0x27
  8BF  5062        SACL  0x62
  8C0  0021        ADD   0x21
  8C1  5061        SACL  0x61
  8C2  6646        ZALS  0x46
  8C3  6D20        MPY   0x20
  8C4  6C5F        LTA   0x5F
  8C5  6D26        MPY   0x26
  8C6  6B5E        LTD   0x5E
  8C7  6D25        MPY   0x25
  8C8  6B5D        LTD   0x5D
  8C9  6D24        MPY   0x24
  8CA  6B5C        LTD   0x5C
  8CB  6D23        MPY   0x23
  8CC  6B5B        LTD   0x5B
  8CD  6D22        MPY   0x22
  8CE  6C45        LTA   0x45
  8CF  5860        SACH  0x60
  8D0  6549        ZALH  0x49
  8D1  6052        ADDH  0x52
  8D2  605B        ADDH  0x5B
  8D3  5848        SACH  0x48
  8D4  7F80        NOP
  8D5  7F80        NOP
  8D6  7F80        NOP
  8D7  2017        LAC   0x17
  8D8  FB00 08DD   BLEZ  L8DD
  8DA  101F        SUB   0x1F
  8DB  F900 08E0   B     L8E0

L8DD:
  8DD  7F89        ZAC
  8DE  7F80        NOP
  8DF  7F80        NOP
L8E0:
  8E0  5017        SACL  0x17
  8E1  7F80        NOP
  8E2  6644        ZALS  0x44
  8E3  0015        ADD   0x15
  8E4  5050        SACL  0x50
  8E5  000F        ADD   0x0F
  8E6  504F        SACL  0x4F
  8E7  6646        ZALS  0x46
  8E8  6D0E        MPY   0x0E
  8E9  6C4D        LTA   0x4D
  8EA  6D14        MPY   0x14
  8EB  4144        IN    0x44,PA1
  8EC  4F4F        OUT   0x4F,PA7
  8ED  4449        IN    0x49,PA4
  8EE  4F50        OUT   0x50,PA7
  8EF  4C4E        OUT   0x4E,PA4
  8F0  4F58        OUT   0x58,PA7
  8F1  4452        IN    0x52,PA4
  8F2  4F59        OUT   0x59,PA7
  8F3  4C57        OUT   0x57,PA4
  8F4  4F62        OUT   0x62,PA7
  8F5  4C60        OUT   0x60,PA4
  8F6  4F61        OUT   0x61,PA7
  8F7  445B        IN    0x5B,PA4
  8F8  4A48        OUT   0x48,PA2
  8F9  4145        IN    0x45,PA1
  8FA  4346        IN    0x46,PA3
  8FB  6B4C        LTD   0x4C
  8FC  6D13        MPY   0x13
  8FD  6B4B        LTD   0x4B
  8FE  6D12        MPY   0x12
  8FF  6B4A        LTD   0x4A
  900  6D11        MPY   0x11
  901  6B49        LTD   0x49
  902  6D10        MPY   0x10
  903  6C45        LTA   0x45
  904  584E        SACH  0x4E
  905  6644        ZALS  0x44
  906  001E        ADD   0x1E
  907  5059        SACL  0x59
  908  0018        ADD   0x18
  909  5058        SACL  0x58
  90A  6646        ZALS  0x46
  90B  6D17        MPY   0x17
  90C  6C56        LTA   0x56
  90D  6D1D        MPY   0x1D
  90E  6B55        LTD   0x55
  90F  6D1C        MPY   0x1C
  910  6B54        LTD   0x54
  911  6D1B        MPY   0x1B
  912  6B53        LTD   0x53
  913  6D1A        MPY   0x1A
  914  6B52        LTD   0x52
  915  6D19        MPY   0x19
  916  6C45        LTA   0x45
  917  5857        SACH  0x57
  918  6644        ZALS  0x44
  919  0027        ADD   0x27
  91A  5062        SACL  0x62
  91B  0021        ADD   0x21
  91C  5061        SACL  0x61
  91D  6646        ZALS  0x46
  91E  6D20        MPY   0x20
  91F  6C5F        LTA   0x5F
  920  6D26        MPY   0x26
  921  6B5E        LTD   0x5E
  922  6D25        MPY   0x25
  923  6B5D        LTD   0x5D
  924  6D24        MPY   0x24
  925  6B5C        LTD   0x5C
  926  6D23        MPY   0x23
  927  6B5B        LTD   0x5B
  928  6D22        MPY   0x22
  929  6C45        LTA   0x45
  92A  5860        SACH  0x60
  92B  6549        ZALH  0x49
  92C  6052        ADDH  0x52
  92D  605B        ADDH  0x5B
  92E  5848        SACH  0x48
  92F  7F80        NOP
  930  7F80        NOP
  931  7F80        NOP
  932  7F80        NOP
  933  7F80        NOP
  934  456A        IN    0x6A,PA5
  935  396A        LAR   AR1,0x6A
  936  4681        IN    *,PA6,AR1
  937  7F80        NOP
  938  6644        ZALS  0x44
  939  0015        ADD   0x15
  93A  5050        SACL  0x50
  93B  000F        ADD   0x0F
  93C  504F        SACL  0x4F
  93D  6646        ZALS  0x46
  93E  6D0E        MPY   0x0E
  93F  6C4D        LTA   0x4D
  940  6D14        MPY   0x14
  941  4144        IN    0x44,PA1
  942  4F4F        OUT   0x4F,PA7
  943  4449        IN    0x49,PA4
  944  4F50        OUT   0x50,PA7
  945  4C4E        OUT   0x4E,PA4
  946  4F58        OUT   0x58,PA7
  947  4452        IN    0x52,PA4
  948  4F59        OUT   0x59,PA7
  949  4C57        OUT   0x57,PA4
  94A  4F62        OUT   0x62,PA7
  94B  4C60        OUT   0x60,PA4
  94C  4F61        OUT   0x61,PA7
  94D  445B        IN    0x5B,PA4
  94E  4A48        OUT   0x48,PA2
  94F  4145        IN    0x45,PA1
  950  4346        IN    0x46,PA3
  951  6B4C        LTD   0x4C
  952  6D13        MPY   0x13
  953  6B4B        LTD   0x4B
  954  6D12        MPY   0x12
  955  6B4A        LTD   0x4A
  956  6D11        MPY   0x11
  957  6B49        LTD   0x49
  958  6D10        MPY   0x10
  959  6C45        LTA   0x45
  95A  584E        SACH  0x4E
  95B  6644        ZALS  0x44
  95C  001E        ADD   0x1E
  95D  5059        SACL  0x59
  95E  0018        ADD   0x18
  95F  5058        SACL  0x58
  960  6646        ZALS  0x46
  961  6D17        MPY   0x17
  962  6C56        LTA   0x56
  963  6D1D        MPY   0x1D
  964  6B55        LTD   0x55
  965  6D1C        MPY   0x1C
  966  6B54        LTD   0x54
  967  6D1B        MPY   0x1B
  968  6B53        LTD   0x53
  969  6D1A        MPY   0x1A
  96A  6B52        LTD   0x52
  96B  6D19        MPY   0x19
  96C  6C45        LTA   0x45
  96D  5857        SACH  0x57
  96E  6644        ZALS  0x44
  96F  0027        ADD   0x27
  970  5062        SACL  0x62
  971  0021        ADD   0x21
  972  5061        SACL  0x61
  973  6646        ZALS  0x46
  974  6D20        MPY   0x20
  975  6C5F        LTA   0x5F
  976  6D26        MPY   0x26
  977  6B5E        LTD   0x5E
  978  6D25        MPY   0x25
  979  6B5D        LTD   0x5D
  97A  6D24        MPY   0x24
  97B  6B5C        LTD   0x5C
  97C  6D23        MPY   0x23
  97D  6B5B        LTD   0x5B
  97E  6D22        MPY   0x22
  97F  6C45        LTA   0x45
  980  5860        SACH  0x60
  981  6549        ZALH  0x49
  982  6052        ADDH  0x52
  983  605B        ADDH  0x5B
  984  5848        SACH  0x48
  985  7F80        NOP
  986  7F80        NOP
  987  7F80        NOP
  988  2020        LAC   0x20
  989  FB00 098E   BLEZ  L98E
  98B  1028        SUB   0x28
  98C  F900 0991   B     L991

L98E:
  98E  7F89        ZAC
  98F  7F80        NOP
  990  7F80        NOP
L991:
  991  5020        SACL  0x20
  992  7F80        NOP
  993  6644        ZALS  0x44
  994  0015        ADD   0x15
  995  5050        SACL  0x50
  996  000F        ADD   0x0F
  997  504F        SACL  0x4F
  998  6646        ZALS  0x46
  999  6D0E        MPY   0x0E
  99A  6C4D        LTA   0x4D
  99B  6D14        MPY   0x14
  99C  4144        IN    0x44,PA1
  99D  4F4F        OUT   0x4F,PA7
  99E  4449        IN    0x49,PA4
  99F  4F50        OUT   0x50,PA7
  9A0  4C4E        OUT   0x4E,PA4
  9A1  4F58        OUT   0x58,PA7
  9A2  4452        IN    0x52,PA4
  9A3  4F59        OUT   0x59,PA7
  9A4  4C57        OUT   0x57,PA4
  9A5  4F62        OUT   0x62,PA7
  9A6  4C60        OUT   0x60,PA4
  9A7  4F61        OUT   0x61,PA7
  9A8  445B        IN    0x5B,PA4
  9A9  4A48        OUT   0x48,PA2
  9AA  4145        IN    0x45,PA1
  9AB  4346        IN    0x46,PA3
  9AC  6B4C        LTD   0x4C
  9AD  6D13        MPY   0x13
  9AE  6B4B        LTD   0x4B
  9AF  6D12        MPY   0x12
  9B0  6B4A        LTD   0x4A
  9B1  6D11        MPY   0x11
  9B2  6B49        LTD   0x49
  9B3  6D10        MPY   0x10
  9B4  6C45        LTA   0x45
  9B5  584E        SACH  0x4E
  9B6  6644        ZALS  0x44
  9B7  001E        ADD   0x1E
  9B8  5059        SACL  0x59
  9B9  0018        ADD   0x18
  9BA  5058        SACL  0x58
  9BB  6646        ZALS  0x46
  9BC  6D17        MPY   0x17
  9BD  6C56        LTA   0x56
  9BE  6D1D        MPY   0x1D
  9BF  6B55        LTD   0x55
  9C0  6D1C        MPY   0x1C
  9C1  6B54        LTD   0x54
  9C2  6D1B        MPY   0x1B
  9C3  6B53        LTD   0x53
  9C4  6D1A        MPY   0x1A
  9C5  6B52        LTD   0x52
  9C6  6D19        MPY   0x19
  9C7  6C45        LTA   0x45
  9C8  5857        SACH  0x57
  9C9  6644        ZALS  0x44
  9CA  0027        ADD   0x27
  9CB  5062        SACL  0x62
  9CC  0021        ADD   0x21
  9CD  5061        SACL  0x61
  9CE  6646        ZALS  0x46
  9CF  6D20        MPY   0x20
  9D0  6C5F        LTA   0x5F
  9D1  6D26        MPY   0x26
  9D2  6B5E        LTD   0x5E
  9D3  6D25        MPY   0x25
  9D4  6B5D        LTD   0x5D
  9D5  6D24        MPY   0x24
  9D6  6B5C        LTD   0x5C
  9D7  6D23        MPY   0x23
  9D8  6B5B        LTD   0x5B
  9D9  6D22        MPY   0x22
  9DA  6C45        LTA   0x45
  9DB  5860        SACH  0x60
  9DC  6549        ZALH  0x49
  9DD  6052        ADDH  0x52
  9DE  605B        ADDH  0x5B
  9DF  5848        SACH  0x48
  9E0  7F80        NOP
  9E1  7F80        NOP
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
  9EC  0015        ADD   0x15
  9ED  5050        SACL  0x50
  9EE  000F        ADD   0x0F
  9EF  504F        SACL  0x4F
  9F0  6646        ZALS  0x46
  9F1  6D0E        MPY   0x0E
  9F2  6C4D        LTA   0x4D
  9F3  6D14        MPY   0x14
  9F4  4144        IN    0x44,PA1
  9F5  4F4F        OUT   0x4F,PA7
  9F6  4449        IN    0x49,PA4
  9F7  4F50        OUT   0x50,PA7
  9F8  4C4E        OUT   0x4E,PA4
  9F9  4F58        OUT   0x58,PA7
  9FA  4452        IN    0x52,PA4
  9FB  4F59        OUT   0x59,PA7
  9FC  4C57        OUT   0x57,PA4
  9FD  4F62        OUT   0x62,PA7
  9FE  4C60        OUT   0x60,PA4
  9FF  4F61        OUT   0x61,PA7
  A00  445B        IN    0x5B,PA4
  A01  4A48        OUT   0x48,PA2
  A02  4145        IN    0x45,PA1
  A03  4346        IN    0x46,PA3
  A04  6B4C        LTD   0x4C
  A05  6D13        MPY   0x13
  A06  6B4B        LTD   0x4B
  A07  6D12        MPY   0x12
  A08  6B4A        LTD   0x4A
  A09  6D11        MPY   0x11
  A0A  6B49        LTD   0x49
  A0B  6D10        MPY   0x10
  A0C  6C45        LTA   0x45
  A0D  584E        SACH  0x4E
  A0E  6644        ZALS  0x44
  A0F  001E        ADD   0x1E
  A10  5059        SACL  0x59
  A11  0018        ADD   0x18
  A12  5058        SACL  0x58
  A13  6646        ZALS  0x46
  A14  6D17        MPY   0x17
  A15  6C56        LTA   0x56
  A16  6D1D        MPY   0x1D
  A17  6B55        LTD   0x55
  A18  6D1C        MPY   0x1C
  A19  6B54        LTD   0x54
  A1A  6D1B        MPY   0x1B
  A1B  6B53        LTD   0x53
  A1C  6D1A        MPY   0x1A
  A1D  6B52        LTD   0x52
  A1E  6D19        MPY   0x19
  A1F  6C45        LTA   0x45
  A20  5857        SACH  0x57
  A21  6644        ZALS  0x44
  A22  0027        ADD   0x27
  A23  5062        SACL  0x62
  A24  0021        ADD   0x21
  A25  5061        SACL  0x61
  A26  6646        ZALS  0x46
  A27  6D20        MPY   0x20
  A28  6C5F        LTA   0x5F
  A29  6D26        MPY   0x26
  A2A  6B5E        LTD   0x5E
  A2B  6D25        MPY   0x25
  A2C  6B5D        LTD   0x5D
  A2D  6D24        MPY   0x24
  A2E  6B5C        LTD   0x5C
  A2F  6D23        MPY   0x23
  A30  6B5B        LTD   0x5B
  A31  6D22        MPY   0x22
  A32  6C45        LTA   0x45
  A33  5860        SACH  0x60
  A34  6549        ZALH  0x49
  A35  6052        ADDH  0x52
  A36  605B        ADDH  0x5B
  A37  5848        SACH  0x48
  A38  7F80        NOP
  A39  7F80        NOP
  A3A  7F80        NOP
  A3B  F900 0828   B     L828

LA3D:
  A3D  6667        ZALS  0x67
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
  A52  7F80        NOP
  A53  666B        ZALS  0x6B
  A54  6165        ADDS  0x65
  A55  506B        SACL  0x6B
  A56  4F6B        OUT   0x6B,PA7
  A57  6165        ADDS  0x65
  A58  506B        SACL  0x6B
  A59  4F6B        OUT   0x6B,PA7
  A5A  6165        ADDS  0x65
  A5B  506B        SACL  0x6B
  A5C  4F6B        OUT   0x6B,PA7
  A5D  6165        ADDS  0x65
  A5E  506B        SACL  0x6B
  A5F  4F6B        OUT   0x6B,PA7
  A60  6165        ADDS  0x65
  A61  506B        SACL  0x6B
  A62  4F6B        OUT   0x6B,PA7
  A63  6165        ADDS  0x65
  A64  506B        SACL  0x6B
  A65  4F6B        OUT   0x6B,PA7
  A66  6165        ADDS  0x65
  A67  506B        SACL  0x6B
  A68  4F6B        OUT   0x6B,PA7
  A69  6165        ADDS  0x65
  A6A  506B        SACL  0x6B
  A6B  4F6B        OUT   0x6B,PA7
  A6C  6165        ADDS  0x65
  A6D  506B        SACL  0x6B
  A6E  4F6B        OUT   0x6B,PA7
  A6F  6165        ADDS  0x65
  A70  506B        SACL  0x6B
  A71  4F6B        OUT   0x6B,PA7
  A72  6165        ADDS  0x65
  A73  506B        SACL  0x6B
  A74  4F6B        OUT   0x6B,PA7
  A75  6165        ADDS  0x65
  A76  506B        SACL  0x6B
  A77  4F6B        OUT   0x6B,PA7
  A78  6165        ADDS  0x65
  A79  506B        SACL  0x6B
  A7A  4F6B        OUT   0x6B,PA7
  A7B  6165        ADDS  0x65
  A7C  506B        SACL  0x6B
  A7D  4F6B        OUT   0x6B,PA7
  A7E  6165        ADDS  0x65
  A7F  506B        SACL  0x6B
  A80  4F6B        OUT   0x6B,PA7
  A81  6165        ADDS  0x65
  A82  506B        SACL  0x6B
  A83  4F6B        OUT   0x6B,PA7
  A84  6165        ADDS  0x65
  A85  506B        SACL  0x6B
  A86  4F6B        OUT   0x6B,PA7
  A87  6165        ADDS  0x65
  A88  506B        SACL  0x6B
  A89  4F6B        OUT   0x6B,PA7
  A8A  6165        ADDS  0x65
  A8B  506B        SACL  0x6B
  A8C  4F6B        OUT   0x6B,PA7
  A8D  6165        ADDS  0x65
  A8E  506B        SACL  0x6B
  A8F  4F6B        OUT   0x6B,PA7
  A90  6165        ADDS  0x65
  A91  506B        SACL  0x6B
  A92  4F6B        OUT   0x6B,PA7
  A93  7F80        NOP
  A94  7F80        NOP
  A95  7F80        NOP
  A96  7F80        NOP
  A97  7F80        NOP
  A98  206B        LAC   0x6B
  A99  FA00 0A4A   BLZ   LA4A
  A9B  7F8D        RET

