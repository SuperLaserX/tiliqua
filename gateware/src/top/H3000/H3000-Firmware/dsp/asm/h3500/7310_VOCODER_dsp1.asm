; Eventide h3500 DSP microcode
; key 7310  algorithm 73 (VOCODER)  DSP 1
; source H3000-Upgrade_ROM4.BIN offset 3CDA8, 784 program words loaded at 800
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
  80C  506D        SACL  0x6D
  80D  286D        LAC   0x6D,8
  80E  5071        SACL  0x71
  80F  2F6D        LAC   0x6D,15
  810  5070        SACL  0x70
  811  7F89        ZAC
  812  506C        SACL  0x6C
  813  106D        SUB   0x6D
  814  586E        SACH  0x6E
  815  7EFF        LACK  0xFF
  816  5072        SACL  0x72
  817  2772        LAC   0x72,7
  818  7A72        OR    0x72
  819  506F        SACL  0x6F
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
  848  7F89        ZAC
  849  5073        SACL  0x73
L84A:
  84A  F600 084E   BIOZ  L84E
  84C  F900 084A   B     L84A

L84E:
  84E  4072        IN    0x72,PA0
  84F  6572        ZALH  0x72
  850  FD00 0853   BGEZ  L853
  852  7F80        NOP
L853:
  853  F600 0853   BIOZ  L853
L855:
  855  4572        IN    0x72,PA5
  856  6881        LARP  1
  857  6672        ZALS  0x72
  858  7971        AND   0x71
  859  FE00 085E   BNZ   L85E
  85B  6880        LARP  0
  85C  F900 0860   B     L860

L85E:
  85E  3972        LAR   AR1,0x72
  85F  4680        IN    *,PA6,AR0
L860:
  860  7F80        NOP
  861  6673        ZALS  0x73
  862  4F73        OUT   0x73,PA7
  863  616D        ADDS  0x6D
  864  5073        SACL  0x73
  865  4F73        OUT   0x73,PA7
  866  616D        ADDS  0x6D
  867  5073        SACL  0x73
  868  4F73        OUT   0x73,PA7
  869  616D        ADDS  0x6D
  86A  5073        SACL  0x73
  86B  4F73        OUT   0x73,PA7
  86C  616D        ADDS  0x6D
  86D  5073        SACL  0x73
  86E  4F73        OUT   0x73,PA7
  86F  616D        ADDS  0x6D
  870  5073        SACL  0x73
  871  4F73        OUT   0x73,PA7
  872  616D        ADDS  0x6D
  873  5073        SACL  0x73
  874  4F73        OUT   0x73,PA7
  875  616D        ADDS  0x6D
  876  5073        SACL  0x73
  877  4F73        OUT   0x73,PA7
  878  616D        ADDS  0x6D
  879  5073        SACL  0x73
  87A  4F73        OUT   0x73,PA7
  87B  616D        ADDS  0x6D
  87C  5073        SACL  0x73
  87D  4F73        OUT   0x73,PA7
  87E  616D        ADDS  0x6D
  87F  5073        SACL  0x73
  880  4F73        OUT   0x73,PA7
  881  616D        ADDS  0x6D
  882  5073        SACL  0x73
  883  4F73        OUT   0x73,PA7
  884  616D        ADDS  0x6D
  885  5073        SACL  0x73
  886  4F73        OUT   0x73,PA7
  887  616D        ADDS  0x6D
  888  5073        SACL  0x73
  889  4F73        OUT   0x73,PA7
  88A  616D        ADDS  0x6D
  88B  5073        SACL  0x73
  88C  4F73        OUT   0x73,PA7
  88D  616D        ADDS  0x6D
  88E  5073        SACL  0x73
  88F  4F73        OUT   0x73,PA7
  890  616D        ADDS  0x6D
  891  5073        SACL  0x73
  892  4F73        OUT   0x73,PA7
  893  616D        ADDS  0x6D
  894  5073        SACL  0x73
  895  4F73        OUT   0x73,PA7
  896  616D        ADDS  0x6D
  897  5073        SACL  0x73
  898  4F73        OUT   0x73,PA7
  899  616D        ADDS  0x6D
  89A  5073        SACL  0x73
  89B  4F73        OUT   0x73,PA7
  89C  616D        ADDS  0x6D
  89D  5073        SACL  0x73
  89E  4F73        OUT   0x73,PA7
  89F  616D        ADDS  0x6D
  8A0  5073        SACL  0x73
  8A1  7F80        NOP
  8A2  7F80        NOP
  8A3  7F80        NOP
  8A4  7F80        NOP
  8A5  7F80        NOP
  8A6  2073        LAC   0x73
  8A7  FD00 0855   BGEZ  L855
L8A9:
  8A9  F600 08AD   BIOZ  L8AD
  8AB  F900 08A9   B     L8A9

L8AD:
  8AD  4072        IN    0x72,PA0
  8AE  6572        ZALH  0x72
  8AF  FD00 08B2   BGEZ  L8B2
  8B1  7F80        NOP
L8B2:
  8B2  F600 08B2   BIOZ  L8B2
L8B4:
  8B4  4572        IN    0x72,PA5
  8B5  6881        LARP  1
  8B6  6672        ZALS  0x72
  8B7  7971        AND   0x71
  8B8  FE00 08BD   BNZ   L8BD
  8BA  6880        LARP  0
  8BB  F900 08BF   B     L8BF

L8BD:
  8BD  3972        LAR   AR1,0x72
  8BE  4680        IN    *,PA6,AR0
L8BF:
  8BF  4272        IN    0x72,PA2
  8C0  3872        LAR   AR0,0x72
  8C1  4388        IN    *,PA3
  8C2  4179        IN    0x79,PA1
  8C3  497F        OUT   0x7F,PA1
  8C4  4944        OUT   0x44,PA1
  8C5  4945        OUT   0x45,PA1
  8C6  4946        OUT   0x46,PA1
  8C7  7F80        NOP
  8C8  7F89        ZAC
  8C9  6A79        LT    0x79
  8CA  6D16        MPY   0x16
  8CB  6C3E        LTA   0x3E
  8CC  6D29        MPY   0x29
  8CD  6A3D        LT    0x3D
  8CE  7F90        SPAC
  8CF  7F90        SPAC
  8D0  6D28        MPY   0x28
  8D1  6A3C        LT    0x3C
  8D2  7F90        SPAC
  8D3  7F90        SPAC
  8D4  5869        SACH  0x69
  8D5  6D27        MPY   0x27
  8D6  6A3B        LT    0x3B
  8D7  7F90        SPAC
  8D8  7F90        SPAC
  8D9  5868        SACH  0x68
  8DA  6D26        MPY   0x26
  8DB  6A3A        LT    0x3A
  8DC  7F90        SPAC
  8DD  7F90        SPAC
  8DE  5867        SACH  0x67
  8DF  6D25        MPY   0x25
  8E0  6A39        LT    0x39
  8E1  7F90        SPAC
  8E2  7F90        SPAC
  8E3  5866        SACH  0x66
  8E4  6D24        MPY   0x24
  8E5  6A38        LT    0x38
  8E6  7F90        SPAC
  8E7  7F90        SPAC
  8E8  5865        SACH  0x65
  8E9  6D23        MPY   0x23
  8EA  6A37        LT    0x37
  8EB  7F90        SPAC
  8EC  7F90        SPAC
  8ED  5864        SACH  0x64
  8EE  6D22        MPY   0x22
  8EF  6A36        LT    0x36
  8F0  7F90        SPAC
  8F1  7F90        SPAC
  8F2  5863        SACH  0x63
  8F3  6D21        MPY   0x21
  8F4  6A35        LT    0x35
  8F5  7F90        SPAC
  8F6  7F90        SPAC
  8F7  5862        SACH  0x62
  8F8  6D20        MPY   0x20
  8F9  6A34        LT    0x34
  8FA  7F90        SPAC
  8FB  7F90        SPAC
  8FC  5861        SACH  0x61
  8FD  6D1F        MPY   0x1F
  8FE  6A33        LT    0x33
  8FF  7F90        SPAC
  900  7F90        SPAC
  901  5860        SACH  0x60
  902  6D1E        MPY   0x1E
  903  6A32        LT    0x32
  904  7F90        SPAC
  905  7F90        SPAC
  906  585F        SACH  0x5F
  907  6D1D        MPY   0x1D
  908  6A31        LT    0x31
  909  7F90        SPAC
  90A  7F90        SPAC
  90B  585E        SACH  0x5E
  90C  6D1C        MPY   0x1C
  90D  6A30        LT    0x30
  90E  7F90        SPAC
  90F  7F90        SPAC
  910  585D        SACH  0x5D
  911  6D1B        MPY   0x1B
  912  6A2F        LT    0x2F
  913  7F90        SPAC
  914  7F90        SPAC
  915  585C        SACH  0x5C
  916  6D1A        MPY   0x1A
  917  6A2E        LT    0x2E
  918  7F90        SPAC
  919  7F90        SPAC
  91A  585B        SACH  0x5B
  91B  6D19        MPY   0x19
  91C  6A2D        LT    0x2D
  91D  7F90        SPAC
  91E  7F90        SPAC
  91F  585A        SACH  0x5A
  920  6D18        MPY   0x18
  921  6A2C        LT    0x2C
  922  7F90        SPAC
  923  7F90        SPAC
  924  5859        SACH  0x59
  925  6D17        MPY   0x17
  926  6A66        LT    0x66
  927  7F90        SPAC
  928  7F90        SPAC
  929  5858        SACH  0x58
  92A  2F58        LAC   0x58,15
  92B  0F2C        ADD   0x2C,15
  92C  587F        SACH  0x7F
  92D  653D        ZALH  0x3D
  92E  6D28        MPY   0x28
  92F  6C68        LTA   0x68
  930  7F8F        APAC
  931  583E        SACH  0x3E
  932  653C        ZALH  0x3C
  933  6D27        MPY   0x27
  934  4272        IN    0x72,PA2
  935  3872        LAR   AR0,0x72
  936  4388        IN    *,PA3
  937  6C67        LTA   0x67
  938  7F8F        APAC
  939  583D        SACH  0x3D
  93A  653B        ZALH  0x3B
  93B  6D26        MPY   0x26
  93C  6C66        LTA   0x66
  93D  7F8F        APAC
  93E  583C        SACH  0x3C
  93F  653A        ZALH  0x3A
  940  6D25        MPY   0x25
  941  6C65        LTA   0x65
  942  7F8F        APAC
  943  583B        SACH  0x3B
  944  6539        ZALH  0x39
  945  6D24        MPY   0x24
  946  6C64        LTA   0x64
  947  7F8F        APAC
  948  583A        SACH  0x3A
  949  6538        ZALH  0x38
  94A  6D23        MPY   0x23
  94B  6C63        LTA   0x63
  94C  7F8F        APAC
  94D  5839        SACH  0x39
  94E  6537        ZALH  0x37
  94F  6D22        MPY   0x22
  950  6C62        LTA   0x62
  951  7F8F        APAC
  952  5838        SACH  0x38
  953  6536        ZALH  0x36
  954  6D21        MPY   0x21
  955  6C61        LTA   0x61
  956  7F8F        APAC
  957  5837        SACH  0x37
  958  6535        ZALH  0x35
  959  6D20        MPY   0x20
  95A  6C60        LTA   0x60
  95B  7F8F        APAC
  95C  5836        SACH  0x36
  95D  6534        ZALH  0x34
  95E  6D1F        MPY   0x1F
  95F  6C5F        LTA   0x5F
  960  7F8F        APAC
  961  5835        SACH  0x35
  962  6533        ZALH  0x33
  963  6D1E        MPY   0x1E
  964  6C5E        LTA   0x5E
  965  7F8F        APAC
  966  5834        SACH  0x34
  967  6532        ZALH  0x32
  968  6D1D        MPY   0x1D
  969  6C5D        LTA   0x5D
  96A  7F8F        APAC
  96B  5833        SACH  0x33
  96C  6531        ZALH  0x31
  96D  6D1C        MPY   0x1C
  96E  6C5C        LTA   0x5C
  96F  7F8F        APAC
  970  5832        SACH  0x32
  971  6530        ZALH  0x30
  972  6D1B        MPY   0x1B
  973  6C5B        LTA   0x5B
  974  7F8F        APAC
  975  5831        SACH  0x31
  976  652F        ZALH  0x2F
  977  6D1A        MPY   0x1A
  978  6C5A        LTA   0x5A
  979  7F8F        APAC
  97A  5830        SACH  0x30
  97B  652E        ZALH  0x2E
  97C  6D19        MPY   0x19
  97D  6C59        LTA   0x59
  97E  7F8F        APAC
  97F  582F        SACH  0x2F
  980  652D        ZALH  0x2D
  981  6D18        MPY   0x18
  982  6C58        LTA   0x58
  983  7F8F        APAC
  984  582E        SACH  0x2E
  985  652C        ZALH  0x2C
  986  6D17        MPY   0x17
  987  7F8F        APAC
  988  7F8F        APAC
  989  582D        SACH  0x2D
  98A  6558        ZALH  0x58
  98B  582C        SACH  0x2C
  98C  7F89        ZAC
  98D  6A00        LT    0x00
  98E  6D42        MPY   0x42
  98F  6C16        LTA   0x16
  990  6D43        MPY   0x43
  991  6C01        LTA   0x01
  992  5816        SACH  0x16
  993  6016        ADDH  0x16
  994  5816        SACH  0x16
  995  7F89        ZAC
  996  4272        IN    0x72,PA2
  997  3872        LAR   AR0,0x72
  998  4388        IN    *,PA3
  999  6D40        MPY   0x40
  99A  6C17        LTA   0x17
  99B  6D41        MPY   0x41
  99C  6C02        LTA   0x02
  99D  5817        SACH  0x17
  99E  6017        ADDH  0x17
  99F  5817        SACH  0x17
  9A0  7F89        ZAC
  9A1  6D40        MPY   0x40
  9A2  6C18        LTA   0x18
  9A3  6D41        MPY   0x41
  9A4  6C03        LTA   0x03
  9A5  5818        SACH  0x18
  9A6  6018        ADDH  0x18
  9A7  5818        SACH  0x18
  9A8  7F89        ZAC
  9A9  6D40        MPY   0x40
  9AA  6C19        LTA   0x19
  9AB  6D41        MPY   0x41
  9AC  6C04        LTA   0x04
  9AD  5819        SACH  0x19
  9AE  6019        ADDH  0x19
  9AF  5819        SACH  0x19
  9B0  7F89        ZAC
  9B1  6D40        MPY   0x40
  9B2  6C1A        LTA   0x1A
  9B3  6D41        MPY   0x41
  9B4  6C05        LTA   0x05
  9B5  581A        SACH  0x1A
  9B6  601A        ADDH  0x1A
  9B7  581A        SACH  0x1A
  9B8  7F89        ZAC
  9B9  6D40        MPY   0x40
  9BA  6C1B        LTA   0x1B
  9BB  6D41        MPY   0x41
  9BC  6C06        LTA   0x06
  9BD  581B        SACH  0x1B
  9BE  601B        ADDH  0x1B
  9BF  581B        SACH  0x1B
  9C0  7F89        ZAC
  9C1  6D40        MPY   0x40
  9C2  6C1C        LTA   0x1C
  9C3  6D41        MPY   0x41
  9C4  6C07        LTA   0x07
  9C5  581C        SACH  0x1C
  9C6  601C        ADDH  0x1C
  9C7  581C        SACH  0x1C
  9C8  7F89        ZAC
  9C9  6D40        MPY   0x40
  9CA  6C1D        LTA   0x1D
  9CB  6D41        MPY   0x41
  9CC  6C08        LTA   0x08
  9CD  581D        SACH  0x1D
  9CE  601D        ADDH  0x1D
  9CF  581D        SACH  0x1D
  9D0  7F89        ZAC
  9D1  6D40        MPY   0x40
  9D2  6C1E        LTA   0x1E
  9D3  6D41        MPY   0x41
  9D4  6C09        LTA   0x09
  9D5  581E        SACH  0x1E
  9D6  601E        ADDH  0x1E
  9D7  581E        SACH  0x1E
  9D8  7F89        ZAC
  9D9  6D40        MPY   0x40
  9DA  6C1F        LTA   0x1F
  9DB  6D41        MPY   0x41
  9DC  7F8F        APAC
  9DD  581F        SACH  0x1F
  9DE  601F        ADDH  0x1F
  9DF  581F        SACH  0x1F
  9E0  7F80        NOP
  9E1  7F80        NOP
  9E2  4572        IN    0x72,PA5
  9E3  6881        LARP  1
  9E4  6672        ZALS  0x72
  9E5  7971        AND   0x71
  9E6  FE00 09EB   BNZ   L9EB
  9E8  6880        LARP  0
  9E9  F900 09ED   B     L9ED

L9EB:
  9EB  3972        LAR   AR1,0x72
  9EC  4680        IN    *,PA6,AR0
L9ED:
  9ED  4272        IN    0x72,PA2
  9EE  3872        LAR   AR0,0x72
  9EF  4388        IN    *,PA3
  9F0  4179        IN    0x79,PA1
  9F1  497F        OUT   0x7F,PA1
  9F2  4944        OUT   0x44,PA1
  9F3  4945        OUT   0x45,PA1
  9F4  4946        OUT   0x46,PA1
  9F5  7F80        NOP
  9F6  7F89        ZAC
  9F7  6A79        LT    0x79
  9F8  6D16        MPY   0x16
  9F9  6C3E        LTA   0x3E
  9FA  6D29        MPY   0x29
  9FB  6A3D        LT    0x3D
  9FC  7F90        SPAC
  9FD  7F90        SPAC
  9FE  6D28        MPY   0x28
  9FF  6A3C        LT    0x3C
  A00  7F90        SPAC
  A01  7F90        SPAC
  A02  5869        SACH  0x69
  A03  6D27        MPY   0x27
  A04  6A3B        LT    0x3B
  A05  7F90        SPAC
  A06  7F90        SPAC
  A07  5868        SACH  0x68
  A08  6D26        MPY   0x26
  A09  6A3A        LT    0x3A
  A0A  7F90        SPAC
  A0B  7F90        SPAC
  A0C  5867        SACH  0x67
  A0D  6D25        MPY   0x25
  A0E  6A39        LT    0x39
  A0F  7F90        SPAC
  A10  7F90        SPAC
  A11  5866        SACH  0x66
  A12  6D24        MPY   0x24
  A13  6A38        LT    0x38
  A14  7F90        SPAC
  A15  7F90        SPAC
  A16  5865        SACH  0x65
  A17  6D23        MPY   0x23
  A18  6A37        LT    0x37
  A19  7F90        SPAC
  A1A  7F90        SPAC
  A1B  5864        SACH  0x64
  A1C  6D22        MPY   0x22
  A1D  6A36        LT    0x36
  A1E  7F90        SPAC
  A1F  7F90        SPAC
  A20  5863        SACH  0x63
  A21  6D21        MPY   0x21
  A22  6A35        LT    0x35
  A23  7F90        SPAC
  A24  7F90        SPAC
  A25  5862        SACH  0x62
  A26  6D20        MPY   0x20
  A27  6A34        LT    0x34
  A28  7F90        SPAC
  A29  7F90        SPAC
  A2A  5861        SACH  0x61
  A2B  6D1F        MPY   0x1F
  A2C  6A33        LT    0x33
  A2D  7F90        SPAC
  A2E  7F90        SPAC
  A2F  5860        SACH  0x60
  A30  6D1E        MPY   0x1E
  A31  6A32        LT    0x32
  A32  7F90        SPAC
  A33  7F90        SPAC
  A34  585F        SACH  0x5F
  A35  6D1D        MPY   0x1D
  A36  6A31        LT    0x31
  A37  7F90        SPAC
  A38  7F90        SPAC
  A39  585E        SACH  0x5E
  A3A  6D1C        MPY   0x1C
  A3B  6A30        LT    0x30
  A3C  7F90        SPAC
  A3D  7F90        SPAC
  A3E  585D        SACH  0x5D
  A3F  6D1B        MPY   0x1B
  A40  6A2F        LT    0x2F
  A41  7F90        SPAC
  A42  7F90        SPAC
  A43  585C        SACH  0x5C
  A44  6D1A        MPY   0x1A
  A45  6A2E        LT    0x2E
  A46  7F90        SPAC
  A47  7F90        SPAC
  A48  585B        SACH  0x5B
  A49  6D19        MPY   0x19
  A4A  6A2D        LT    0x2D
  A4B  7F90        SPAC
  A4C  7F90        SPAC
  A4D  585A        SACH  0x5A
  A4E  6D18        MPY   0x18
  A4F  6A2C        LT    0x2C
  A50  7F90        SPAC
  A51  7F90        SPAC
  A52  5859        SACH  0x59
  A53  6D17        MPY   0x17
  A54  6A66        LT    0x66
  A55  7F90        SPAC
  A56  7F90        SPAC
  A57  5858        SACH  0x58
  A58  2F58        LAC   0x58,15
  A59  0F2C        ADD   0x2C,15
  A5A  587F        SACH  0x7F
  A5B  653D        ZALH  0x3D
  A5C  6D28        MPY   0x28
  A5D  6C68        LTA   0x68
  A5E  7F8F        APAC
  A5F  583E        SACH  0x3E
  A60  653C        ZALH  0x3C
  A61  6D27        MPY   0x27
  A62  4272        IN    0x72,PA2
  A63  3872        LAR   AR0,0x72
  A64  4388        IN    *,PA3
  A65  6C67        LTA   0x67
  A66  7F8F        APAC
  A67  583D        SACH  0x3D
  A68  653B        ZALH  0x3B
  A69  6D26        MPY   0x26
  A6A  6C66        LTA   0x66
  A6B  7F8F        APAC
  A6C  583C        SACH  0x3C
  A6D  653A        ZALH  0x3A
  A6E  6D25        MPY   0x25
  A6F  6C65        LTA   0x65
  A70  7F8F        APAC
  A71  583B        SACH  0x3B
  A72  6539        ZALH  0x39
  A73  6D24        MPY   0x24
  A74  6C64        LTA   0x64
  A75  7F8F        APAC
  A76  583A        SACH  0x3A
  A77  6538        ZALH  0x38
  A78  6D23        MPY   0x23
  A79  6C63        LTA   0x63
  A7A  7F8F        APAC
  A7B  5839        SACH  0x39
  A7C  6537        ZALH  0x37
  A7D  6D22        MPY   0x22
  A7E  6C62        LTA   0x62
  A7F  7F8F        APAC
  A80  5838        SACH  0x38
  A81  6536        ZALH  0x36
  A82  6D21        MPY   0x21
  A83  6C61        LTA   0x61
  A84  7F8F        APAC
  A85  5837        SACH  0x37
  A86  6535        ZALH  0x35
  A87  6D20        MPY   0x20
  A88  6C60        LTA   0x60
  A89  7F8F        APAC
  A8A  5836        SACH  0x36
  A8B  6534        ZALH  0x34
  A8C  6D1F        MPY   0x1F
  A8D  6C5F        LTA   0x5F
  A8E  7F8F        APAC
  A8F  5835        SACH  0x35
  A90  6533        ZALH  0x33
  A91  6D1E        MPY   0x1E
  A92  6C5E        LTA   0x5E
  A93  7F8F        APAC
  A94  5834        SACH  0x34
  A95  6532        ZALH  0x32
  A96  6D1D        MPY   0x1D
  A97  6C5D        LTA   0x5D
  A98  7F8F        APAC
  A99  5833        SACH  0x33
  A9A  6531        ZALH  0x31
  A9B  6D1C        MPY   0x1C
  A9C  6C5C        LTA   0x5C
  A9D  7F8F        APAC
  A9E  5832        SACH  0x32
  A9F  6530        ZALH  0x30
  AA0  6D1B        MPY   0x1B
  AA1  6C5B        LTA   0x5B
  AA2  7F8F        APAC
  AA3  5831        SACH  0x31
  AA4  652F        ZALH  0x2F
  AA5  6D1A        MPY   0x1A
  AA6  6C5A        LTA   0x5A
  AA7  7F8F        APAC
  AA8  5830        SACH  0x30
  AA9  652E        ZALH  0x2E
  AAA  6D19        MPY   0x19
  AAB  6C59        LTA   0x59
  AAC  7F8F        APAC
  AAD  582F        SACH  0x2F
  AAE  652D        ZALH  0x2D
  AAF  6D18        MPY   0x18
  AB0  6C58        LTA   0x58
  AB1  7F8F        APAC
  AB2  582E        SACH  0x2E
  AB3  652C        ZALH  0x2C
  AB4  6D17        MPY   0x17
  AB5  7F8F        APAC
  AB6  7F8F        APAC
  AB7  582D        SACH  0x2D
  AB8  6558        ZALH  0x58
  AB9  582C        SACH  0x2C
  ABA  7F89        ZAC
  ABB  6A0A        LT    0x0A
  ABC  6D40        MPY   0x40
  ABD  6C20        LTA   0x20
  ABE  6D41        MPY   0x41
  ABF  6C0B        LTA   0x0B
  AC0  5820        SACH  0x20
  AC1  6020        ADDH  0x20
  AC2  5820        SACH  0x20
  AC3  7F89        ZAC
  AC4  4272        IN    0x72,PA2
  AC5  3872        LAR   AR0,0x72
  AC6  4388        IN    *,PA3
  AC7  6D40        MPY   0x40
  AC8  6C21        LTA   0x21
  AC9  6D41        MPY   0x41
  ACA  6C0C        LTA   0x0C
  ACB  5821        SACH  0x21
  ACC  6021        ADDH  0x21
  ACD  5821        SACH  0x21
  ACE  7F89        ZAC
  ACF  6D40        MPY   0x40
  AD0  6C22        LTA   0x22
  AD1  6D41        MPY   0x41
  AD2  6C0D        LTA   0x0D
  AD3  5822        SACH  0x22
  AD4  6022        ADDH  0x22
  AD5  5822        SACH  0x22
  AD6  7F89        ZAC
  AD7  6D40        MPY   0x40
  AD8  6C23        LTA   0x23
  AD9  6D41        MPY   0x41
  ADA  6C0E        LTA   0x0E
  ADB  5823        SACH  0x23
  ADC  6023        ADDH  0x23
  ADD  5823        SACH  0x23
  ADE  7F89        ZAC
  ADF  6D40        MPY   0x40
  AE0  6C24        LTA   0x24
  AE1  6D41        MPY   0x41
  AE2  6C0F        LTA   0x0F
  AE3  5824        SACH  0x24
  AE4  6024        ADDH  0x24
  AE5  5824        SACH  0x24
  AE6  7F89        ZAC
  AE7  6D40        MPY   0x40
  AE8  6C25        LTA   0x25
  AE9  6D41        MPY   0x41
  AEA  6C10        LTA   0x10
  AEB  5825        SACH  0x25
  AEC  6025        ADDH  0x25
  AED  5825        SACH  0x25
  AEE  7F89        ZAC
  AEF  6D40        MPY   0x40
  AF0  6C26        LTA   0x26
  AF1  6D41        MPY   0x41
  AF2  6C11        LTA   0x11
  AF3  5826        SACH  0x26
  AF4  6026        ADDH  0x26
  AF5  5826        SACH  0x26
  AF6  7F89        ZAC
  AF7  6D40        MPY   0x40
  AF8  6C27        LTA   0x27
  AF9  6D41        MPY   0x41
  AFA  6C12        LTA   0x12
  AFB  5827        SACH  0x27
  AFC  6027        ADDH  0x27
  AFD  5827        SACH  0x27
  AFE  7F89        ZAC
  AFF  6D40        MPY   0x40
  B00  6C28        LTA   0x28
  B01  6D41        MPY   0x41
  B02  6C13        LTA   0x13
  B03  5828        SACH  0x28
  B04  6028        ADDH  0x28
  B05  5828        SACH  0x28
  B06  7F89        ZAC
  B07  6D40        MPY   0x40
  B08  6C29        LTA   0x29
  B09  6D41        MPY   0x41
  B0A  7F8F        APAC
  B0B  5829        SACH  0x29
  B0C  6029        ADDH  0x29
  B0D  5829        SACH  0x29
  B0E  F900 08B4   B     L8B4

