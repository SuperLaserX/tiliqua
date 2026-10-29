; Eventide h3500 DSP microcode
; key 7811  algorithm 78 (STUDIO SAMPLER)  DSP 2
; source H3000-Upgrade_ROM3.BIN offset 2CE82, 1691 program words loaded at 800
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
  80B  F500 080D   BV    L80D
L80D:
  80D  7C7D        SST   0xFD
  80E  7E01        LACK  0x01
  80F  5001        SACL  0x01
  810  2901        LAC   0x01,9
  811  5005        SACL  0x05
  812  2F01        LAC   0x01,15
  813  5004        SACL  0x04
  814  7F89        ZAC
  815  5000        SACL  0x00
  816  1001        SUB   0x01
  817  5802        SACH  0x02
  818  7EFF        LACK  0xFF
  819  5006        SACL  0x06
  81A  2706        LAC   0x06,7
  81B  7A06        OR    0x06
  81C  5003        SACL  0x03
  81D  2406        LAC   0x06,4
  81E  7A06        OR    0x06
  81F  5023        SACL  0x23
  820  6503        ZALH  0x03
  821  5862        SACH  0x62
  822  6604        ZALS  0x04
  823  5063        SACL  0x63
  824  2D01        LAC   0x01,13
  825  5006        SACL  0x06
  826  6562        ZALH  0x62
  827  6163        ADDS  0x63
  828  1906        SUB   0x06,9
  829  5834        SACH  0x34
  82A  5035        SACL  0x35
  82B  2A01        LAC   0x01,10
  82C  5053        SACL  0x53
  82D  2B01        LAC   0x01,11
  82E  5052        SACL  0x52
  82F  2C01        LAC   0x01,12
  830  507F        SACL  0x7F
  831  7E08        LACK  0x08
  832  507E        SACL  0x7E
  833  2C01        LAC   0x01,12
  834  502D        SACL  0x2D
  835  7E03        LACK  0x03
  836  7802        XOR   0x02
  837  502E        SACL  0x2E
  838  7EFF        LACK  0xFF
  839  502F        SACL  0x2F
  83A  7E0D        LACK  0x0D
  83B  5030        SACL  0x30
  83C  7E11        LACK  0x11
  83D  5031        SACL  0x31
  83E  2E01        LAC   0x01,14
  83F  5054        SACL  0x54
  840  6503        ZALH  0x03
  841  5868        SACH  0x68
  842  7040        LARK  AR0,0x40
L843:
  843  F600 0847   BIOZ  L847
  845  F900 0843   B     L843

L847:
  847  4006        IN    0x06,PA0
  848  6506        ZALH  0x06
  849  FD00 084C   BGEZ  L84C
  84B  7F80        NOP
L84C:
  84C  F600 084C   BIOZ  L84C
L84E:
  84E  4506        IN    0x06,PA5
  84F  6881        LARP  1
  850  6606        ZALS  0x06
  851  7905        AND   0x05
  852  FE00 0857   BNZ   L857
  854  6880        LARP  0
  855  F900 0859   B     L859

L857:
  857  3906        LAR   AR1,0x06
  858  4680        IN    *,PA6,AR0
L859:
  859  4719        IN    0x19,PA7
  85A  7F89        ZAC
  85B  5038        SACL  0x38
  85C  6519        ZALH  0x19
  85D  7F88        ABS
  85E  583A        SACH  0x3A
  85F  6A33        LT    0x33
  860  6D55        MPY   0x55
  861  7F8E        PAC
  862  5933        SACH  0x33,1
  863  1F3A        SUB   0x3A,15
  864  FA00 0868   BLZ   L868
  866  F900 086A   B     L86A

L868:
  868  653A        ZALH  0x3A
  869  5833        SACH  0x33
L86A:
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
  874  7EF1        LACK  0xF1
  875  5030        SACL  0x30
  876  7EFB        LACK  0xFB
  877  5031        SACL  0x31
  878  655C        ZALH  0x5C
  879  FF00 0881   BZ    L881
  87B  FC00 0885   BGZ   L885
  87D  7F80        NOP
  87E  7F80        NOP
  87F  F900 0887   B     L887

L881:
  881  4933        OUT   0x33,PA1
  882  4A38        OUT   0x38,PA2
  883  F900 0887   B     L887

L885:
  885  490A        OUT   0x0A,PA1
  886  4A0B        OUT   0x0B,PA2
L887:
  887  6539        ZALH  0x39
  888  FC00 08A1   BGZ   L8A1
  88A  6533        ZALH  0x33
  88B  625D        SUBH  0x5D
  88C  FB00 08A5   BLEZ  L8A5
  88E  5839        SACH  0x39
  88F  433B        IN    0x3B,PA3
  890  4B01        OUT   0x01,PA3
  891  6558        ZALH  0x58
  892  FE00 0897   BNZ   L897
  894  7F80        NOP
  895  F900 089A   B     L89A

L897:
  897  653B        ZALH  0x3B
  898  FC00 0AA4   BGZ   LAA4
L89A:
  89A  6559        ZALH  0x59
  89B  FE00 0AD8   BNZ   LAD8
  89D  7F80        NOP
  89E  7F80        NOP
  89F  F900 08B8   B     L8B8

L8A1:
  8A1  6533        ZALH  0x33
  8A2  625E        SUBH  0x5E
  8A3  7F80        NOP
  8A4  7F80        NOP
L8A5:
  8A5  5839        SACH  0x39
  8A6  433B        IN    0x3B,PA3
  8A7  4B00        OUT   0x00,PA3
  8A8  7F80        NOP
  8A9  7F80        NOP
  8AA  7F80        NOP
  8AB  7F80        NOP
  8AC  7F80        NOP
  8AD  7F80        NOP
  8AE  7F80        NOP
  8AF  6558        ZALH  0x58
  8B0  FE00 08B5   BNZ   L8B5
  8B2  7F80        NOP
  8B3  F900 08B8   B     L8B8

L8B5:
  8B5  653B        ZALH  0x3B
  8B6  FC00 0AAB   BGZ   LAAB
L8B8:
  8B8  654B        ZALH  0x4B
  8B9  FE00 0AAE   BNZ   LAAE
  8BB  654C        ZALH  0x4C
  8BC  FE00 0AE2   BNZ   LAE2
  8BE  6550        ZALH  0x50
  8BF  FE00 09FF   BNZ   L9FF
  8C1  654D        ZALH  0x4D
  8C2  FE00 08D6   BNZ   L8D6
  8C4  7F80        NOP
  8C5  7F80        NOP
  8C6  7F80        NOP
  8C7  7F80        NOP
  8C8  7F80        NOP
  8C9  7F80        NOP
  8CA  7F80        NOP
  8CB  7F80        NOP
  8CC  7F80        NOP
  8CD  7F80        NOP
  8CE  7F80        NOP
  8CF  7F80        NOP
  8D0  7F80        NOP
  8D1  7F80        NOP
  8D2  7F89        ZAC
  8D3  5038        SACL  0x38
  8D4  F900 084E   B     L84E

L8D6:
  8D6  7E02        LACK  0x02
  8D7  5038        SACL  0x38
  8D8  6534        ZALH  0x34
  8D9  6135        ADDS  0x35
  8DA  580A        SACH  0x0A
  8DB  500B        SACL  0x0B
  8DC  7F80        NOP
  8DD  7F80        NOP
  8DE  7F80        NOP
  8DF  270A        LAC   0x0A,7
  8E0  5810        SACH  0x10
  8E1  5011        SACL  0x11
  8E2  270B        LAC   0x0B,7
  8E3  5806        SACH  0x06
  8E4  7E7F        LACK  0x7F
  8E5  7906        AND   0x06
  8E6  6111        ADDS  0x11
  8E7  5011        SACL  0x11
L8E8:
  8E8  4506        IN    0x06,PA5
  8E9  6881        LARP  1
  8EA  6606        ZALS  0x06
  8EB  7905        AND   0x05
  8EC  FE00 08F1   BNZ   L8F1
  8EE  6880        LARP  0
  8EF  F900 08F3   B     L8F3

L8F1:
  8F1  3906        LAR   AR1,0x06
  8F2  4680        IN    *,PA6,AR0
L8F3:
  8F3  4719        IN    0x19,PA7
  8F4  6519        ZALH  0x19
  8F5  7F88        ABS
  8F6  583A        SACH  0x3A
  8F7  6A33        LT    0x33
  8F8  6D55        MPY   0x55
  8F9  7F8E        PAC
  8FA  5933        SACH  0x33,1
  8FB  1F3A        SUB   0x3A,15
  8FC  FA00 0900   BLZ   L900
  8FE  F900 0902   B     L902

L900:
  900  653A        ZALH  0x3A
  901  5833        SACH  0x33
L902:
  902  270A        LAC   0x0A,7
  903  5810        SACH  0x10
  904  5011        SACL  0x11
  905  270B        LAC   0x0B,7
  906  5806        SACH  0x06
  907  7E7F        LACK  0x7F
  908  7906        AND   0x06
  909  6111        ADDS  0x11
  90A  5011        SACL  0x11
  90B  7F80        NOP
  90C  7F80        NOP
  90D  7F80        NOP
  90E  7F80        NOP
  90F  6533        ZALH  0x33
  910  6256        SUBH  0x56
  911  5806        SACH  0x06
  912  655C        ZALH  0x5C
  913  FF00 0919   BZ    L919
  915  7F80        NOP
  916  7F80        NOP
  917  F900 091B   B     L91B

L919:
  919  4933        OUT   0x33,PA1
  91A  4A38        OUT   0x38,PA2
L91B:
  91B  7F80        NOP
  91C  7F80        NOP
  91D  7F80        NOP
  91E  7F80        NOP
  91F  7F80        NOP
  920  7F80        NOP
  921  7F80        NOP
  922  4E19        OUT   0x19,PA6
  923  7F80        NOP
  924  433B        IN    0x3B,PA3
  925  4B06        OUT   0x06,PA3
  926  7F80        NOP
  927  7F80        NOP
  928  7F80        NOP
  929  7F80        NOP
  92A  7F80        NOP
  92B  650A        ZALH  0x0A
  92C  610B        ADDS  0x0B
  92D  0901        ADD   0x01,9
  92E  580A        SACH  0x0A
  92F  500B        SACL  0x0B
  930  6262        SUBH  0x62
  931  6363        SUBS  0x63
  932  FC00 0938   BGZ   L938
  934  7F80        NOP
  935  7F80        NOP
  936  F900 093C   B     L93C

L938:
  938  6534        ZALH  0x34
  939  6135        ADDS  0x35
  93A  580A        SACH  0x0A
  93B  500B        SACL  0x0B
L93C:
  93C  655A        ZALH  0x5A
  93D  FE00 0946   BNZ   L946
  93F  7F80        NOP
  940  7F80        NOP
  941  7F80        NOP
  942  7F80        NOP
  943  7F80        NOP
  944  F900 094D   B     L94D

L946:
  946  6533        ZALH  0x33
  947  6256        SUBH  0x56
  948  FC00 095E   BGZ   L95E
  94A  653B        ZALH  0x3B
  94B  FC00 0970   BGZ   L970
L94D:
  94D  654E        ZALH  0x4E
  94E  FE00 097F   BNZ   L97F
  950  7F80        NOP
  951  7F80        NOP
  952  7F80        NOP
  953  7F80        NOP
  954  7F80        NOP
  955  7F80        NOP
  956  7F80        NOP
  957  654F        ZALH  0x4F
  958  FE00 095C   BNZ   L95C
  95A  F900 08E8   B     L8E8

L95C:
  95C  F900 084E   B     L84E

L95E:
  95E  7F80        NOP
  95F  7F80        NOP
  960  7F80        NOP
  961  6544        ZALH  0x44
  962  6145        ADDS  0x45
  963  580E        SACH  0x0E
  964  500F        SACL  0x0F
  965  650A        ZALH  0x0A
  966  610B        ADDS  0x0B
  967  5836        SACH  0x36
  968  5037        SACL  0x37
  969  6542        ZALH  0x42
  96A  6143        ADDS  0x43
  96B  0957        ADD   0x57,9
  96C  580A        SACH  0x0A
  96D  500B        SACL  0x0B
  96E  F900 098B   B     L98B

L970:
  970  6544        ZALH  0x44
  971  6145        ADDS  0x45
  972  580E        SACH  0x0E
  973  500F        SACL  0x0F
  974  650A        ZALH  0x0A
  975  610B        ADDS  0x0B
  976  5836        SACH  0x36
  977  5037        SACL  0x37
  978  6542        ZALH  0x42
  979  6143        ADDS  0x43
  97A  0957        ADD   0x57,9
  97B  580A        SACH  0x0A
  97C  500B        SACL  0x0B
  97D  F900 098B   B     L98B

L97F:
  97F  7F80        NOP
  980  7F80        NOP
  981  6544        ZALH  0x44
  982  6145        ADDS  0x45
  983  580E        SACH  0x0E
  984  500F        SACL  0x0F
  985  6542        ZALH  0x42
  986  6143        ADDS  0x43
  987  580A        SACH  0x0A
  988  500B        SACL  0x0B
  989  F900 098B   B     L98B

L98B:
  98B  4506        IN    0x06,PA5
  98C  6881        LARP  1
  98D  6606        ZALS  0x06
  98E  7905        AND   0x05
  98F  FE00 0994   BNZ   L994
  991  6880        LARP  0
  992  F900 0996   B     L996

L994:
  994  3906        LAR   AR1,0x06
  995  4680        IN    *,PA6,AR0
L996:
  996  4719        IN    0x19,PA7
  997  6519        ZALH  0x19
  998  7F88        ABS
  999  583A        SACH  0x3A
  99A  6A33        LT    0x33
  99B  6D55        MPY   0x55
  99C  7F8E        PAC
  99D  5933        SACH  0x33,1
  99E  1F3A        SUB   0x3A,15
  99F  FA00 09A3   BLZ   L9A3
  9A1  F900 09A5   B     L9A5

L9A3:
  9A3  653A        ZALH  0x3A
  9A4  5833        SACH  0x33
L9A5:
  9A5  270A        LAC   0x0A,7
  9A6  5810        SACH  0x10
  9A7  5011        SACL  0x11
  9A8  270B        LAC   0x0B,7
  9A9  5806        SACH  0x06
  9AA  7E7F        LACK  0x7F
  9AB  7906        AND   0x06
  9AC  6111        ADDS  0x11
  9AD  5011        SACL  0x11
  9AE  650A        ZALH  0x0A
  9AF  610B        ADDS  0x0B
  9B0  0901        ADD   0x01,9
  9B1  580A        SACH  0x0A
  9B2  500B        SACL  0x0B
  9B3  7E03        LACK  0x03
  9B4  5038        SACL  0x38
  9B5  655C        ZALH  0x5C
  9B6  FF00 09BE   BZ    L9BE
  9B8  FC00 09C2   BGZ   L9C2
  9BA  7F80        NOP
  9BB  7F80        NOP
  9BC  F900 09C4   B     L9C4

L9BE:
  9BE  4932        OUT   0x32,PA1
  9BF  4A38        OUT   0x38,PA2
  9C0  F900 09C4   B     L9C4

L9C2:
  9C2  490A        OUT   0x0A,PA1
  9C3  4A0B        OUT   0x0B,PA2
L9C4:
  9C4  4810        OUT   0x10,PA0
  9C5  7F80        NOP
  9C6  4F11        OUT   0x11,PA7
  9C7  4C19        OUT   0x19,PA4
  9C8  4E19        OUT   0x19,PA6
  9C9  7F80        NOP
  9CA  7F80        NOP
  9CB  7F80        NOP
  9CC  7F80        NOP
  9CD  7F80        NOP
  9CE  7F80        NOP
  9CF  7F80        NOP
  9D0  7F80        NOP
  9D1  7F80        NOP
  9D2  7F80        NOP
  9D3  7F80        NOP
  9D4  7F80        NOP
  9D5  7F80        NOP
  9D6  7F80        NOP
  9D7  7F80        NOP
  9D8  7F80        NOP
  9D9  7F80        NOP
  9DA  7F80        NOP
  9DB  7F80        NOP
  9DC  7F80        NOP
  9DD  7F80        NOP
  9DE  7F80        NOP
  9DF  7F80        NOP
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
  9EB  7F80        NOP
  9EC  654F        ZALH  0x4F
  9ED  FE00 09F7   BNZ   L9F7
  9EF  650A        ZALH  0x0A
  9F0  610B        ADDS  0x0B
  9F1  620E        SUBH  0x0E
  9F2  630F        SUBS  0x0F
  9F3  FD00 09FD   BGEZ  L9FD
  9F5  F900 098B   B     L98B

L9F7:
  9F7  7F80        NOP
  9F8  7F80        NOP
  9F9  7F80        NOP
  9FA  7F80        NOP
  9FB  7F80        NOP
  9FC  7F80        NOP
L9FD:
  9FD  F900 084E   B     L84E

L9FF:
  9FF  7E04        LACK  0x04
  A00  5038        SACL  0x38
  A01  7F89        ZAC
  A02  5026        SACL  0x26
  A03  6542        ZALH  0x42
  A04  6143        ADDS  0x43
  A05  580A        SACH  0x0A
  A06  500B        SACL  0x0B
  A07  7F80        NOP
  A08  7F80        NOP
  A09  7F80        NOP
  A0A  7F80        NOP
  A0B  270A        LAC   0x0A,7
  A0C  5810        SACH  0x10
  A0D  5011        SACL  0x11
  A0E  270B        LAC   0x0B,7
  A0F  5806        SACH  0x06
  A10  7E7F        LACK  0x7F
  A11  7906        AND   0x06
  A12  6111        ADDS  0x11
  A13  5011        SACL  0x11
LA14:
  A14  4506        IN    0x06,PA5
  A15  6881        LARP  1
  A16  6606        ZALS  0x06
  A17  7905        AND   0x05
  A18  FE00 0A1D   BNZ   LA1D
  A1A  6880        LARP  0
  A1B  F900 0A1F   B     LA1F

LA1D:
  A1D  3906        LAR   AR1,0x06
  A1E  4680        IN    *,PA6,AR0
LA1F:
  A1F  270A        LAC   0x0A,7
  A20  5810        SACH  0x10
  A21  5011        SACL  0x11
  A22  270B        LAC   0x0B,7
  A23  5806        SACH  0x06
  A24  7E7F        LACK  0x7F
  A25  7906        AND   0x06
  A26  6111        ADDS  0x11
  A27  5011        SACL  0x11
  A28  260B        LAC   0x0B,6
  A29  7903        AND   0x03
  A2A  5014        SACL  0x14
  A2B  2F40        LAC   0x40,15
  A2C  6A51        LT    0x51
  A2D  6D40        MPY   0x40
  A2E  7F90        SPAC
  A2F  6D26        MPY   0x26
  A30  7F8F        APAC
  A31  5926        SACH  0x26,1
  A32  FA00 0A36   BLZ   LA36
  A34  F900 0A38   B     LA38

LA36:
  A36  0003        ADD   0x03
  A37  7F80        NOP
LA38:
  A38  5926        SACH  0x26,1
  A39  7F80        NOP
  A3A  7F80        NOP
  A3B  7F80        NOP
  A3C  7F80        NOP
  A3D  7F80        NOP
  A3E  7F80        NOP
  A3F  7F80        NOP
  A40  7F80        NOP
  A41  7F80        NOP
  A42  4810        OUT   0x10,PA0
  A43  4F11        OUT   0x11,PA7
  A44  441C        IN    0x1C,PA4
  A45  441D        IN    0x1D,PA4
  A46  6A14        LT    0x14
  A47  6D1D        MPY   0x1D
  A48  7F8E        PAC
  A49  6D1C        MPY   0x1C
  A4A  7F90        SPAC
  A4B  0F1C        ADD   0x1C,15
  A4C  591A        SACH  0x1A,1
  A4D  4E1A        OUT   0x1A,PA6
  A4E  7F80        NOP
  A4F  655C        ZALH  0x5C
  A50  FF00 0A58   BZ    LA58
  A52  FC00 0A5C   BGZ   LA5C
  A54  7F80        NOP
  A55  7F80        NOP
  A56  F900 0A5E   B     LA5E

LA58:
  A58  4932        OUT   0x32,PA1
  A59  4A38        OUT   0x38,PA2
  A5A  F900 0A5E   B     LA5E

LA5C:
  A5C  490A        OUT   0x0A,PA1
  A5D  4A0B        OUT   0x0B,PA2
LA5E:
  A5E  7F80        NOP
  A5F  7F80        NOP
  A60  7F80        NOP
  A61  7F80        NOP
  A62  7F80        NOP
  A63  7F80        NOP
  A64  7F80        NOP
  A65  650A        ZALH  0x0A
  A66  610B        ADDS  0x0B
  A67  0026        ADD   0x26
  A68  580A        SACH  0x0A
  A69  500B        SACL  0x0B
  A6A  7F80        NOP
  A6B  6550        ZALH  0x50
  A6C  FF00 0A80   BZ    LA80
  A6E  650A        ZALH  0x0A
  A6F  610B        ADDS  0x0B
  A70  6260        SUBH  0x60
  A71  6361        SUBS  0x61
  A72  FB00 0A92   BLEZ  LA92
  A74  650A        ZALH  0x0A
  A75  610B        ADDS  0x0B
  A76  6262        SUBH  0x62
  A77  6363        SUBS  0x63
  A78  FD00 0A9E   BGEZ  LA9E
  A7A  7F80        NOP
  A7B  7F80        NOP
  A7C  7F80        NOP
  A7D  7F80        NOP
  A7E  F900 0A14   B     LA14

LA80:
  A80  7F89        ZAC
  A81  580A        SACH  0x0A
  A82  500B        SACL  0x0B
  A83  7F80        NOP
  A84  7F80        NOP
  A85  7F80        NOP
  A86  7F80        NOP
  A87  7F80        NOP
  A88  7F80        NOP
  A89  7F80        NOP
  A8A  7F80        NOP
  A8B  7F80        NOP
  A8C  7F80        NOP
  A8D  7F80        NOP
  A8E  7F80        NOP
  A8F  7F80        NOP
  A90  F900 084E   B     L84E

LA92:
  A92  7F80        NOP
  A93  7F80        NOP
  A94  7F80        NOP
  A95  7F80        NOP
  A96  7F80        NOP
  A97  7F80        NOP
  A98  6560        ZALH  0x60
  A99  6161        ADDS  0x61
  A9A  580A        SACH  0x0A
  A9B  500B        SACL  0x0B
  A9C  F900 0A14   B     LA14

LA9E:
  A9E  6562        ZALH  0x62
  A9F  6163        ADDS  0x63
  AA0  580A        SACH  0x0A
  AA1  500B        SACL  0x0B
  AA2  F900 0A14   B     LA14

LAA4:
  AA4  7F80        NOP
  AA5  7F80        NOP
  AA6  7F80        NOP
  AA7  7F80        NOP
  AA8  7F80        NOP
  AA9  7F80        NOP
  AAA  7F80        NOP
LAAB:
  AAB  7F80        NOP
  AAC  7F80        NOP
  AAD  7F80        NOP
LAAE:
  AAE  7F80        NOP
  AAF  7F80        NOP
  AB0  7F80        NOP
LAB1:
  AB1  7F80        NOP
  AB2  7F80        NOP
LAB3:
  AB3  6503        ZALH  0x03
  AB4  5839        SACH  0x39
  AB5  7F89        ZAC
  AB6  5076        SACL  0x76
LAB7:
  AB7  7F80        NOP
  AB8  7F80        NOP
  AB9  7F80        NOP
  ABA  7F80        NOP
  ABB  7F80        NOP
  ABC  7F80        NOP
  ABD  7040        LARK  AR0,0x40
  ABE  7F89        ZAC
  ABF  5078        SACL  0x78
  AC0  5079        SACL  0x79
  AC1  503C        SACL  0x3C
  AC2  6564        ZALH  0x64
  AC3  583E        SACH  0x3E
  AC4  6565        ZALH  0x65
  AC5  583F        SACH  0x3F
  AC6  6542        ZALH  0x42
  AC7  6143        ADDS  0x43
  AC8  580A        SACH  0x0A
  AC9  500B        SACL  0x0B
  ACA  5816        SACH  0x16
  ACB  5017        SACL  0x17
  ACC  6544        ZALH  0x44
  ACD  6145        ADDS  0x45
  ACE  580E        SACH  0x0E
  ACF  500F        SACL  0x0F
  AD0  656B        ZALH  0x6B
  AD1  616C        ADDS  0x6C
  AD2  587A        SACH  0x7A
  AD3  507B        SACL  0x7B
  AD4  7E01        LACK  0x01
  AD5  5038        SACL  0x38
  AD6  F900 0B1B   B     LB1B

LAD8:
  AD8  7F80        NOP
  AD9  7F80        NOP
  ADA  7F80        NOP
  ADB  7F80        NOP
  ADC  7F80        NOP
  ADD  7F80        NOP
  ADE  7F80        NOP
  ADF  7F80        NOP
  AE0  7F80        NOP
  AE1  7F80        NOP
LAE2:
  AE2  7F80        NOP
  AE3  7F80        NOP
LAE4:
  AE4  7F80        NOP
LAE5:
  AE5  7F80        NOP
  AE6  7F80        NOP
  AE7  6503        ZALH  0x03
  AE8  5839        SACH  0x39
  AE9  7F89        ZAC
  AEA  5076        SACL  0x76
LAEB:
  AEB  6566        ZALH  0x66
  AEC  583E        SACH  0x3E
  AED  6567        ZALH  0x67
  AEE  583F        SACH  0x3F
  AEF  503C        SACL  0x3C
  AF0  5078        SACL  0x78
  AF1  5079        SACL  0x79
  AF2  6546        ZALH  0x46
  AF3  6147        ADDS  0x47
  AF4  580A        SACH  0x0A
  AF5  500B        SACL  0x0B
  AF6  5816        SACH  0x16
  AF7  5017        SACL  0x17
  AF8  6548        ZALH  0x48
  AF9  6149        ADDS  0x49
  AFA  580E        SACH  0x0E
  AFB  500F        SACL  0x0F
  AFC  656D        ZALH  0x6D
  AFD  616E        ADDS  0x6E
  AFE  587A        SACH  0x7A
  AFF  507B        SACL  0x7B
  B00  7E01        LACK  0x01
  B01  5038        SACL  0x38
  B02  706F        LARK  AR0,0x6F
  B03  7F80        NOP
  B04  7F80        NOP
  B05  7F80        NOP
  B06  7F80        NOP
  B07  F900 0B1B   B     LB1B

LB09:
  B09  F800 0D58   CALL  LD58
LB0B:
  B0B  4506        IN    0x06,PA5
  B0C  6881        LARP  1
  B0D  6606        ZALS  0x06
  B0E  7905        AND   0x05
  B0F  FE00 0B14   BNZ   LB14
  B11  6880        LARP  0
  B12  F900 0B16   B     LB16

LB14:
  B14  3906        LAR   AR1,0x06
  B15  4680        IN    *,PA6,AR0
LB16:
  B16  7F80        NOP
  B17  7F80        NOP
  B18  7F80        NOP
  B19  7F80        NOP
  B1A  7F80        NOP
LB1B:
  B1B  270A        LAC   0x0A,7
  B1C  5810        SACH  0x10
  B1D  5011        SACL  0x11
  B1E  270B        LAC   0x0B,7
  B1F  5806        SACH  0x06
  B20  7E7F        LACK  0x7F
  B21  7906        AND   0x06
  B22  6111        ADDS  0x11
  B23  5011        SACL  0x11
  B24  260B        LAC   0x0B,6
  B25  7903        AND   0x03
  B26  5014        SACL  0x14
  B27  650A        ZALH  0x0A
  B28  610B        ADDS  0x0B
  B29  00A8        ADD   *+
  B2A  580A        SACH  0x0A
  B2B  500B        SACL  0x0B
  B2C  6516        ZALH  0x16
  B2D  6117        ADDS  0x17
  B2E  0098        ADD   *-
  B2F  5816        SACH  0x16
  B30  5017        SACL  0x17
  B31  7F80        NOP
  B32  7F80        NOP
  B33  7F80        NOP
  B34  7F80        NOP
  B35  7F80        NOP
  B36  655C        ZALH  0x5C
  B37  FF00 0B3F   BZ    LB3F
  B39  FC00 0B43   BGZ   LB43
  B3B  7F80        NOP
  B3C  7F80        NOP
  B3D  F900 0B45   B     LB45

LB3F:
  B3F  4933        OUT   0x33,PA1
  B40  4A38        OUT   0x38,PA2
  B41  F900 0B45   B     LB45

LB43:
  B43  4916        OUT   0x16,PA1
  B44  4A17        OUT   0x17,PA2
LB45:
  B45  4810        OUT   0x10,PA0
  B46  4F11        OUT   0x11,PA7
  B47  441C        IN    0x1C,PA4
  B48  441D        IN    0x1D,PA4
  B49  6A14        LT    0x14
  B4A  6D1D        MPY   0x1D
  B4B  7F8E        PAC
  B4C  6D1C        MPY   0x1C
  B4D  7F90        SPAC
  B4E  0F1C        ADD   0x1C,15
  B4F  591A        SACH  0x1A,1
  B50  6A1A        LT    0x1A
  B51  6D3C        MPY   0x3C
  B52  7F8E        PAC
  B53  591A        SACH  0x1A,1
  B54  4E1A        OUT   0x1A,PA6
  B55  7F80        NOP
  B56  F500 0B58   BV    LB58
LB58:
  B58  653C        ZALH  0x3C
  B59  613D        ADDS  0x3D
  B5A  0B3E        ADD   0x3E,11
  B5B  583C        SACH  0x3C
  B5C  503D        SACL  0x3D
  B5D  F500 0C95   BV    LC95
  B5F  654F        ZALH  0x4F
  B60  FE00 0B85   BNZ   LB85
  B62  6588        ZALH  *
  B63  FA00 0B75   BLZ   LB75
  B65  6516        ZALH  0x16
  B66  6117        ADDS  0x17
  B67  620E        SUBH  0x0E
  B68  630F        SUBS  0x0F
  B69  FD00 0B8E   BGEZ  LB8E
  B6B  6516        ZALH  0x16
  B6C  6117        ADDS  0x17
  B6D  620A        SUBH  0x0A
  B6E  630B        SUBS  0x0B
  B6F  7F88        ABS
  B70  1952        SUB   0x52,9
  B71  FD00 0B09   BGEZ  LB09
  B73  F900 0B0B   B     LB0B

LB75:
  B75  6516        ZALH  0x16
  B76  6117        ADDS  0x17
  B77  620E        SUBH  0x0E
  B78  630F        SUBS  0x0F
  B79  FB00 0B8E   BLEZ  LB8E
  B7B  6516        ZALH  0x16
  B7C  6117        ADDS  0x17
  B7D  620A        SUBH  0x0A
  B7E  630B        SUBS  0x0B
  B7F  7F88        ABS
  B80  1952        SUB   0x52,9
  B81  FD00 0B09   BGEZ  LB09
  B83  F900 0B0B   B     LB0B

LB85:
  B85  7F80        NOP
  B86  7F80        NOP
  B87  7F80        NOP
  B88  7F80        NOP
  B89  7F80        NOP
  B8A  7F80        NOP
  B8B  7F80        NOP
  B8C  7F80        NOP
  B8D  7F80        NOP
LB8E:
  B8E  7F80        NOP
  B8F  7F80        NOP
  B90  7F80        NOP
  B91  7F80        NOP
  B92  7F80        NOP
  B93  7F80        NOP
  B94  7F80        NOP
  B95  7F80        NOP
  B96  F900 0B9A   B     LB9A

LB98:
  B98  F800 0D58   CALL  LD58
LB9A:
  B9A  4506        IN    0x06,PA5
  B9B  6881        LARP  1
  B9C  6606        ZALS  0x06
  B9D  7905        AND   0x05
  B9E  FE00 0BA3   BNZ   LBA3
  BA0  6880        LARP  0
  BA1  F900 0BA5   B     LBA5

LBA3:
  BA3  3906        LAR   AR1,0x06
  BA4  4680        IN    *,PA6,AR0
LBA5:
  BA5  270A        LAC   0x0A,7
  BA6  5810        SACH  0x10
  BA7  5011        SACL  0x11
  BA8  270B        LAC   0x0B,7
  BA9  5806        SACH  0x06
  BAA  7E7F        LACK  0x7F
  BAB  7906        AND   0x06
  BAC  6111        ADDS  0x11
  BAD  5011        SACL  0x11
  BAE  260B        LAC   0x0B,6
  BAF  7903        AND   0x03
  BB0  5014        SACL  0x14
  BB1  650A        ZALH  0x0A
  BB2  610B        ADDS  0x0B
  BB3  00A8        ADD   *+
  BB4  580A        SACH  0x0A
  BB5  500B        SACL  0x0B
  BB6  6516        ZALH  0x16
  BB7  6117        ADDS  0x17
  BB8  0098        ADD   *-
  BB9  5816        SACH  0x16
  BBA  5017        SACL  0x17
  BBB  654B        ZALH  0x4B
  BBC  FE00 0BC5   BNZ   LBC5
  BBE  654C        ZALH  0x4C
  BBF  FE00 0BCC   BNZ   LBCC
  BC1  653F        ZALH  0x3F
  BC2  5877        SACH  0x77
  BC3  F900 0BD0   B     LBD0

LBC5:
  BC5  5878        SACH  0x78
  BC6  6568        ZALH  0x68
  BC7  5877        SACH  0x77
  BC8  7F80        NOP
  BC9  7F80        NOP
  BCA  F900 0BD0   B     LBD0

LBCC:
  BCC  5879        SACH  0x79
  BCD  6568        ZALH  0x68
  BCE  5877        SACH  0x77
  BCF  7F80        NOP
LBD0:
  BD0  655C        ZALH  0x5C
  BD1  FF00 0BD9   BZ    LBD9
  BD3  FC00 0BDD   BGZ   LBDD
  BD5  7F80        NOP
  BD6  7F80        NOP
  BD7  F900 0BDF   B     LBDF

LBD9:
  BD9  4933        OUT   0x33,PA1
  BDA  4A38        OUT   0x38,PA2
  BDB  F900 0BDF   B     LBDF

LBDD:
  BDD  4916        OUT   0x16,PA1
  BDE  4A17        OUT   0x17,PA2
LBDF:
  BDF  4810        OUT   0x10,PA0
  BE0  4F11        OUT   0x11,PA7
  BE1  441C        IN    0x1C,PA4
  BE2  441D        IN    0x1D,PA4
  BE3  6A14        LT    0x14
  BE4  6D1D        MPY   0x1D
  BE5  7F8E        PAC
  BE6  6D1C        MPY   0x1C
  BE7  7F90        SPAC
  BE8  0F1C        ADD   0x1C,15
  BE9  591A        SACH  0x1A,1
  BEA  6A1A        LT    0x1A
  BEB  6D3C        MPY   0x3C
  BEC  7F8E        PAC
  BED  591A        SACH  0x1A,1
  BEE  4E1A        OUT   0x1A,PA6
  BEF  653C        ZALH  0x3C
  BF0  613D        ADDS  0x3D
  BF1  1B3F        SUB   0x3F,11
  BF2  FB00 0C19   BLEZ  LC19
  BF4  583C        SACH  0x3C
  BF5  503D        SACL  0x3D
  BF6  6577        ZALH  0x77
  BF7  583F        SACH  0x3F
  BF8  7F80        NOP
  BF9  7F80        NOP
  BFA  6588        ZALH  *
  BFB  FA00 0C05   BLZ   LC05
  BFD  6516        ZALH  0x16
  BFE  6117        ADDS  0x17
  BFF  620E        SUBH  0x0E
  C00  630F        SUBS  0x0F
  C01  FD00 0C0D   BGEZ  LC0D
  C03  F900 0C0F   B     LC0F

LC05:
  C05  6516        ZALH  0x16
  C06  6117        ADDS  0x17
  C07  620E        SUBH  0x0E
  C08  630F        SUBS  0x0F
  C09  FB00 0C0D   BLEZ  LC0D
  C0B  F900 0C0F   B     LC0F

LC0D:
  C0D  6568        ZALH  0x68
  C0E  583F        SACH  0x3F
LC0F:
  C0F  6516        ZALH  0x16
  C10  6117        ADDS  0x17
  C11  620A        SUBH  0x0A
  C12  630B        SUBS  0x0B
  C13  7F88        ABS
  C14  1952        SUB   0x52,9
  C15  FD00 0B98   BGEZ  LB98
  C17  F900 0B9A   B     LB9A

LC19:
  C19  6578        ZALH  0x78
  C1A  FE00 0AB1   BNZ   LAB1
  C1C  6579        ZALH  0x79
  C1D  FE00 0AE5   BNZ   LAE5
  C1F  6569        ZALH  0x69
  C20  FE00 0AB7   BNZ   LAB7
  C22  656A        ZALH  0x6A
  C23  FE00 0AEB   BNZ   LAEB
  C25  7F80        NOP
  C26  7F80        NOP
  C27  7F80        NOP
  C28  7F80        NOP
  C29  7F80        NOP
  C2A  7F80        NOP
  C2B  7F80        NOP
  C2C  7F80        NOP
  C2D  7F80        NOP
  C2E  650E        ZALH  0x0E
  C2F  610F        ADDS  0x0F
  C30  580A        SACH  0x0A
  C31  500B        SACL  0x0B
  C32  F900 084E   B     L84E

LC34:
  C34  F800 0D58   CALL  LD58
LC36:
  C36  4506        IN    0x06,PA5
  C37  6881        LARP  1
  C38  6606        ZALS  0x06
  C39  7905        AND   0x05
  C3A  FE00 0C3F   BNZ   LC3F
  C3C  6880        LARP  0
  C3D  F900 0C41   B     LC41

LC3F:
  C3F  3906        LAR   AR1,0x06
  C40  4680        IN    *,PA6,AR0
LC41:
  C41  4719        IN    0x19,PA7
  C42  6519        ZALH  0x19
  C43  7F88        ABS
  C44  583A        SACH  0x3A
  C45  270A        LAC   0x0A,7
  C46  5810        SACH  0x10
  C47  5011        SACL  0x11
  C48  270B        LAC   0x0B,7
  C49  5806        SACH  0x06
  C4A  7E7F        LACK  0x7F
  C4B  7906        AND   0x06
  C4C  6111        ADDS  0x11
  C4D  5011        SACL  0x11
  C4E  260B        LAC   0x0B,6
  C4F  7903        AND   0x03
  C50  5014        SACL  0x14
  C51  650A        ZALH  0x0A
  C52  610B        ADDS  0x0B
  C53  00A8        ADD   *+
  C54  580A        SACH  0x0A
  C55  500B        SACL  0x0B
  C56  6516        ZALH  0x16
  C57  6117        ADDS  0x17
  C58  0098        ADD   *-
  C59  5816        SACH  0x16
  C5A  5017        SACL  0x17
  C5B  6A33        LT    0x33
  C5C  6D55        MPY   0x55
  C5D  7F8E        PAC
  C5E  5933        SACH  0x33,1
  C5F  1F3A        SUB   0x3A,15
  C60  FA00 0C64   BLZ   LC64
  C62  F900 0C66   B     LC66

LC64:
  C64  653A        ZALH  0x3A
  C65  5833        SACH  0x33
LC66:
  C66  655C        ZALH  0x5C
  C67  FF00 0C6F   BZ    LC6F
  C69  FC00 0C73   BGZ   LC73
  C6B  7F80        NOP
  C6C  7F80        NOP
  C6D  F900 0C75   B     LC75

LC6F:
  C6F  4933        OUT   0x33,PA1
  C70  4A38        OUT   0x38,PA2
  C71  F900 0C75   B     LC75

LC73:
  C73  4916        OUT   0x16,PA1
  C74  4A17        OUT   0x17,PA2
LC75:
  C75  4810        OUT   0x10,PA0
  C76  4F11        OUT   0x11,PA7
  C77  441C        IN    0x1C,PA4
  C78  441D        IN    0x1D,PA4
  C79  6A14        LT    0x14
  C7A  6D1D        MPY   0x1D
  C7B  7F8E        PAC
  C7C  6D1C        MPY   0x1C
  C7D  7F90        SPAC
  C7E  0F1C        ADD   0x1C,15
  C7F  591A        SACH  0x1A,1
  C80  4E1A        OUT   0x1A,PA6
  C81  6539        ZALH  0x39
  C82  FB00 0C8B   BLEZ  LC8B
  C84  6533        ZALH  0x33
  C85  625E        SUBH  0x5E
  C86  5839        SACH  0x39
  C87  7F89        ZAC
  C88  5076        SACL  0x76
  C89  F900 0C95   B     LC95

LC8B:
  C8B  6533        ZALH  0x33
  C8C  625D        SUBH  0x5D
  C8D  FC00 0C92   BGZ   LC92
  C8F  5076        SACL  0x76
  C90  F900 0C95   B     LC95

LC92:
  C92  5839        SACH  0x39
  C93  7E01        LACK  0x01
  C94  5076        SACL  0x76
LC95:
  C95  654F        ZALH  0x4F
  C96  FE00 0CBB   BNZ   LCBB
  C98  6588        ZALH  *
  C99  FA00 0CAB   BLZ   LCAB
  C9B  6516        ZALH  0x16
  C9C  6117        ADDS  0x17
  C9D  627A        SUBH  0x7A
  C9E  637B        SUBS  0x7B
  C9F  FD00 0CC4   BGEZ  LCC4
  CA1  6516        ZALH  0x16
  CA2  6117        ADDS  0x17
  CA3  620A        SUBH  0x0A
  CA4  630B        SUBS  0x0B
  CA5  7F88        ABS
  CA6  1952        SUB   0x52,9
  CA7  FD00 0C34   BGEZ  LC34
  CA9  F900 0CCE   B     LCCE

LCAB:
  CAB  6516        ZALH  0x16
  CAC  6117        ADDS  0x17
  CAD  627A        SUBH  0x7A
  CAE  637B        SUBS  0x7B
  CAF  FB00 0CC4   BLEZ  LCC4
  CB1  6516        ZALH  0x16
  CB2  6117        ADDS  0x17
  CB3  620A        SUBH  0x0A
  CB4  630B        SUBS  0x0B
  CB5  7F88        ABS
  CB6  1952        SUB   0x52,9
  CB7  FD00 0C34   BGEZ  LC34
  CB9  F900 0CCE   B     LCCE

LCBB:
  CBB  7F80        NOP
  CBC  7F80        NOP
  CBD  7F80        NOP
  CBE  7F80        NOP
  CBF  7F80        NOP
  CC0  7F80        NOP
  CC1  7F80        NOP
  CC2  7F80        NOP
  CC3  7F80        NOP
LCC4:
  CC4  7F80        NOP
  CC5  7F80        NOP
  CC6  7F80        NOP
  CC7  7F80        NOP
  CC8  7F80        NOP
  CC9  7F80        NOP
  CCA  7F80        NOP
  CCB  7F80        NOP
  CCC  F900 0B9A   B     LB9A

LCCE:
  CCE  4506        IN    0x06,PA5
  CCF  6881        LARP  1
  CD0  6606        ZALS  0x06
  CD1  7905        AND   0x05
  CD2  FE00 0CD7   BNZ   LCD7
  CD4  6880        LARP  0
  CD5  F900 0CD9   B     LCD9

LCD7:
  CD7  3906        LAR   AR1,0x06
  CD8  4680        IN    *,PA6,AR0
LCD9:
  CD9  4719        IN    0x19,PA7
  CDA  6519        ZALH  0x19
  CDB  7F88        ABS
  CDC  583A        SACH  0x3A
  CDD  270A        LAC   0x0A,7
  CDE  5810        SACH  0x10
  CDF  5011        SACL  0x11
  CE0  270B        LAC   0x0B,7
  CE1  5806        SACH  0x06
  CE2  7E7F        LACK  0x7F
  CE3  7906        AND   0x06
  CE4  6111        ADDS  0x11
  CE5  5011        SACL  0x11
  CE6  260B        LAC   0x0B,6
  CE7  7903        AND   0x03
  CE8  5014        SACL  0x14
  CE9  650A        ZALH  0x0A
  CEA  610B        ADDS  0x0B
  CEB  00A8        ADD   *+
  CEC  580A        SACH  0x0A
  CED  500B        SACL  0x0B
  CEE  6516        ZALH  0x16
  CEF  6117        ADDS  0x17
  CF0  0098        ADD   *-
  CF1  5816        SACH  0x16
  CF2  5017        SACL  0x17
  CF3  7F80        NOP
  CF4  433B        IN    0x3B,PA3
  CF5  4B76        OUT   0x76,PA3
  CF6  7F80        NOP
  CF7  6A33        LT    0x33
  CF8  6D55        MPY   0x55
  CF9  7F8E        PAC
  CFA  5933        SACH  0x33,1
  CFB  1F3A        SUB   0x3A,15
  CFC  FA00 0D00   BLZ   LD00
  CFE  F900 0D02   B     LD02

LD00:
  D00  653A        ZALH  0x3A
  D01  5833        SACH  0x33
LD02:
  D02  7F80        NOP
  D03  7F80        NOP
  D04  7F80        NOP
  D05  4810        OUT   0x10,PA0
  D06  4F11        OUT   0x11,PA7
  D07  441C        IN    0x1C,PA4
  D08  441D        IN    0x1D,PA4
  D09  6A14        LT    0x14
  D0A  6D1D        MPY   0x1D
  D0B  7F8E        PAC
  D0C  6D1C        MPY   0x1C
  D0D  7F90        SPAC
  D0E  0F1C        ADD   0x1C,15
  D0F  591A        SACH  0x1A,1
  D10  4E1A        OUT   0x1A,PA6
  D11  7F80        NOP
  D12  7F80        NOP
  D13  6658        ZALS  0x58
  D14  793B        AND   0x3B
  D15  FF00 0D1B   BZ    LD1B
  D17  7F80        NOP
  D18  7F80        NOP
  D19  F900 0AB3   B     LAB3

LD1B:
  D1B  6659        ZALS  0x59
  D1C  7976        AND   0x76
  D1D  FE00 0AE4   BNZ   LAE4
  D1F  654F        ZALH  0x4F
  D20  FE00 0D45   BNZ   LD45
  D22  6588        ZALH  *
  D23  FA00 0D35   BLZ   LD35
  D25  6516        ZALH  0x16
  D26  6117        ADDS  0x17
  D27  627A        SUBH  0x7A
  D28  637B        SUBS  0x7B
  D29  FD00 0D4E   BGEZ  LD4E
  D2B  6516        ZALH  0x16
  D2C  6117        ADDS  0x17
  D2D  620A        SUBH  0x0A
  D2E  630B        SUBS  0x0B
  D2F  7F88        ABS
  D30  1952        SUB   0x52,9
  D31  FD00 0C34   BGEZ  LC34
  D33  F900 0C36   B     LC36

LD35:
  D35  6516        ZALH  0x16
  D36  6117        ADDS  0x17
  D37  627A        SUBH  0x7A
  D38  637B        SUBS  0x7B
  D39  FB00 0D4E   BLEZ  LD4E
  D3B  6516        ZALH  0x16
  D3C  6117        ADDS  0x17
  D3D  620A        SUBH  0x0A
  D3E  630B        SUBS  0x0B
  D3F  7F88        ABS
  D40  1952        SUB   0x52,9
  D41  FD00 0C34   BGEZ  LC34
  D43  F900 0C36   B     LC36

LD45:
  D45  7F80        NOP
  D46  7F80        NOP
  D47  7F80        NOP
  D48  7F80        NOP
  D49  7F80        NOP
  D4A  7F80        NOP
  D4B  7F80        NOP
  D4C  7F80        NOP
  D4D  7F80        NOP
LD4E:
  D4E  7F80        NOP
  D4F  7F80        NOP
  D50  7F80        NOP
  D51  7F80        NOP
  D52  7F80        NOP
  D53  7F80        NOP
  D54  7F80        NOP
  D55  7F80        NOP
  D56  F900 0B9A   B     LB9A

LD58:
  D58  4506        IN    0x06,PA5
  D59  6881        LARP  1
  D5A  6606        ZALS  0x06
  D5B  7905        AND   0x05
  D5C  FE00 0D61   BNZ   LD61
  D5E  6880        LARP  0
  D5F  F900 0D63   B     LD63

LD61:
  D61  3906        LAR   AR1,0x06
  D62  4680        IN    *,PA6,AR0
LD63:
  D63  270A        LAC   0x0A,7
  D64  5810        SACH  0x10
  D65  5011        SACL  0x11
  D66  270B        LAC   0x0B,7
  D67  5806        SACH  0x06
  D68  7E7F        LACK  0x7F
  D69  7906        AND   0x06
  D6A  6111        ADDS  0x11
  D6B  5011        SACL  0x11
  D6C  260B        LAC   0x0B,6
  D6D  7903        AND   0x03
  D6E  5014        SACL  0x14
  D6F  65A8        ZALH  *+
  D70  7F88        ABS
  D71  5806        SACH  0x06
  D72  6598        ZALH  *-
  D73  7F88        ABS
  D74  6006        ADDH  0x06
  D75  5806        SACH  0x06
  D76  6A06        LT    0x06
  D77  6D7F        MPY   0x7F
  D78  7F8E        PAC
  D79  594A        SACH  0x4A,1
  D7A  627E        SUBH  0x7E
  D7B  FA00 0D7F   BLZ   LD7F
  D7D  F900 0D81   B     LD81

LD7F:
  D7F  657E        ZALH  0x7E
  D80  584A        SACH  0x4A
LD81:
  D81  7F80        NOP
  D82  7F80        NOP
  D83  7F80        NOP
  D84  7F80        NOP
  D85  7F80        NOP
  D86  4810        OUT   0x10,PA0
  D87  4F11        OUT   0x11,PA7
  D88  441C        IN    0x1C,PA4
  D89  441D        IN    0x1D,PA4
  D8A  7F80        NOP
  D8B  7F80        NOP
  D8C  7F80        NOP
  D8D  7F80        NOP
  D8E  7F80        NOP
  D8F  7F80        NOP
  D90  7F80        NOP
  D91  7F80        NOP
  D92  6A14        LT    0x14
  D93  6D1D        MPY   0x1D
  D94  7F8E        PAC
  D95  6D1C        MPY   0x1C
  D96  7F90        SPAC
  D97  0F1C        ADD   0x1C,15
  D98  591A        SACH  0x1A,1
  D99  6A1A        LT    0x1A
  D9A  6D3C        MPY   0x3C
  D9B  7F8E        PAC
  D9C  591A        SACH  0x1A,1
  D9D  4E1A        OUT   0x1A,PA6
  D9E  7F80        NOP
  D9F  7F80        NOP
  DA0  7F80        NOP
  DA1  7F80        NOP
  DA2  650A        ZALH  0x0A
  DA3  610B        ADDS  0x0B
  DA4  00A8        ADD   *+
  DA5  580A        SACH  0x0A
  DA6  500B        SACL  0x0B
  DA7  6516        ZALH  0x16
  DA8  6117        ADDS  0x17
  DA9  0098        ADD   *-
  DAA  5816        SACH  0x16
  DAB  5017        SACL  0x17
  DAC  7F80        NOP
  DAD  7F80        NOP
  DAE  7F80        NOP
  DAF  7F80        NOP
  DB0  F500 0DB2   BV    LDB2
LDB2:
  DB2  7F89        ZAC
  DB3  507C        SACL  0x7C
  DB4  654F        ZALH  0x4F
  DB5  FE00 0DB9   BNZ   LDB9
  DB7  F900 0DBB   B     LDBB

LDB9:
  DB9  587C        SACH  0x7C
  DBA  7F80        NOP
LDBB:
  DBB  6630        ZALS  0x30
  DBC  0031        ADD   0x31
  DBD  5031        SACL  0x31
  DBE  0030        ADD   0x30
  DBF  5030        SACL  0x30
  DC0  4506        IN    0x06,PA5
  DC1  6881        LARP  1
  DC2  6606        ZALS  0x06
  DC3  7905        AND   0x05
  DC4  FE00 0DC9   BNZ   LDC9
  DC6  6880        LARP  0
  DC7  F900 0DCB   B     LDCB

LDC9:
  DC9  3906        LAR   AR1,0x06
  DCA  4680        IN    *,PA6,AR0
LDCB:
  DCB  270A        LAC   0x0A,7
  DCC  5810        SACH  0x10
  DCD  5011        SACL  0x11
  DCE  270B        LAC   0x0B,7
  DCF  5806        SACH  0x06
  DD0  7E7F        LACK  0x7F
  DD1  7906        AND   0x06
  DD2  6111        ADDS  0x11
  DD3  5011        SACL  0x11
  DD4  260B        LAC   0x0B,6
  DD5  7903        AND   0x03
  DD6  5014        SACL  0x14
  DD7  2A11        LAC   0x11,10
  DD8  582C        SACH  0x2C
  DD9  2A02        LAC   0x02,10
  DDA  7802        XOR   0x02
  DDB  792C        AND   0x2C
  DDC  502C        SACL  0x2C
  DDD  2A10        LAC   0x10,10
  DDE  582B        SACH  0x2B
  DDF  7A2C        OR    0x2C
  DE0  502C        SACL  0x2C
  DE1  662C        ZALS  0x2C
  DE2  792E        AND   0x2E
  DE3  502C        SACL  0x2C
  DE4  5821        SACH  0x21
  DE5  650A        ZALH  0x0A
  DE6  610B        ADDS  0x0B
  DE7  00A8        ADD   *+
  DE8  580C        SACH  0x0C
  DE9  500D        SACL  0x0D
  DEA  7F80        NOP
  DEB  7F80        NOP
  DEC  4810        OUT   0x10,PA0
  DED  4F11        OUT   0x11,PA7
  DEE  441C        IN    0x1C,PA4
  DEF  441D        IN    0x1D,PA4
  DF0  482D        OUT   0x2D,PA0
  DF1  4F2C        OUT   0x2C,PA7
  DF2  4427        IN    0x27,PA4
  DF3  4428        IN    0x28,PA4
  DF4  4429        IN    0x29,PA4
  DF5  442A        IN    0x2A,PA4
  DF6  6A14        LT    0x14
  DF7  6D1D        MPY   0x1D
  DF8  7F8E        PAC
  DF9  6D1C        MPY   0x1C
  DFA  7F90        SPAC
  DFB  0F1C        ADD   0x1C,15
  DFC  591A        SACH  0x1A,1
  DFD  6A1A        LT    0x1A
  DFE  6D3C        MPY   0x3C
  DFF  7F8E        PAC
  E00  591A        SACH  0x1A,1
  E01  7F80        NOP
  E02  6516        ZALH  0x16
  E03  6117        ADDS  0x17
  E04  0098        ADD   *-
  E05  5816        SACH  0x16
  E06  5017        SACL  0x17
  E07  6516        ZALH  0x16
  E08  6117        ADDS  0x17
  E09  620A        SUBH  0x0A
  E0A  630B        SUBS  0x0B
  E0B  FA00 0E18   BLZ   LE18
  E0D  7F80        NOP
  E0E  7F80        NOP
  E0F  7F80        NOP
  E10  7F80        NOP
  E11  7F80        NOP
  E12  7F89        ZAC
  E13  1027        SUB   0x27
  E14  5015        SACL  0x15
  E15  4E1A        OUT   0x1A,PA6
  E16  F900 0E2A   B     LE2A

LE18:
  E18  652A        ZALH  0x2A
  E19  6254        SUBH  0x54
  E1A  FA00 0E23   BLZ   LE23
  E1C  7F80        NOP
  E1D  7F80        NOP
  E1E  2029        LAC   0x29
  E1F  5015        SACL  0x15
  E20  4E1A        OUT   0x1A,PA6
  E21  F900 0E2A   B     LE2A

LE23:
  E23  6A30        LT    0x30
  E24  6D53        MPY   0x53
  E25  7F8E        PAC
  E26  7F88        ABS
  E27  4E1A        OUT   0x1A,PA6
  E28  0F53        ADD   0x53,15
  E29  5815        SACH  0x15
LE2A:
  E2A  650C        ZALH  0x0C
  E2B  610D        ADDS  0x0D
  E2C  1915        SUB   0x15,9
  E2D  580A        SACH  0x0A
  E2E  500B        SACL  0x0B
  E2F  7F80        NOP
LE30:
  E30  4506        IN    0x06,PA5
  E31  6881        LARP  1
  E32  6606        ZALS  0x06
  E33  7905        AND   0x05
  E34  FE00 0E39   BNZ   LE39
  E36  6880        LARP  0
  E37  F900 0E3B   B     LE3B

LE39:
  E39  3906        LAR   AR1,0x06
  E3A  4680        IN    *,PA6,AR0
LE3B:
  E3B  270A        LAC   0x0A,7
  E3C  5810        SACH  0x10
  E3D  5011        SACL  0x11
  E3E  270B        LAC   0x0B,7
  E3F  5806        SACH  0x06
  E40  7E7F        LACK  0x7F
  E41  7906        AND   0x06
  E42  6111        ADDS  0x11
  E43  5011        SACL  0x11
  E44  270C        LAC   0x0C,7
  E45  5812        SACH  0x12
  E46  5013        SACL  0x13
  E47  270D        LAC   0x0D,7
  E48  5806        SACH  0x06
  E49  7E7F        LACK  0x7F
  E4A  7906        AND   0x06
  E4B  6113        ADDS  0x13
  E4C  5013        SACL  0x13
  E4D  260B        LAC   0x0B,6
  E4E  7903        AND   0x03
  E4F  5014        SACL  0x14
  E50  650A        ZALH  0x0A
  E51  610B        ADDS  0x0B
  E52  00A8        ADD   *+
  E53  580A        SACH  0x0A
  E54  500B        SACL  0x0B
  E55  0915        ADD   0x15,9
  E56  580C        SACH  0x0C
  E57  500D        SACL  0x0D
  E58  6516        ZALH  0x16
  E59  6117        ADDS  0x17
  E5A  0098        ADD   *-
  E5B  5816        SACH  0x16
  E5C  5017        SACL  0x17
  E5D  6A14        LT    0x14
  E5E  4810        OUT   0x10,PA0
  E5F  4F11        OUT   0x11,PA7
  E60  441C        IN    0x1C,PA4
  E61  441D        IN    0x1D,PA4
  E62  4812        OUT   0x12,PA0
  E63  4F13        OUT   0x13,PA7
  E64  441F        IN    0x1F,PA4
  E65  4420        IN    0x20,PA4
  E66  6D1D        MPY   0x1D
  E67  7F8E        PAC
  E68  6D1C        MPY   0x1C
  E69  7F90        SPAC
  E6A  0F1C        ADD   0x1C,15
  E6B  591B        SACH  0x1B,1
  E6C  6D20        MPY   0x20
  E6D  7F8E        PAC
  E6E  6D1F        MPY   0x1F
  E6F  7F90        SPAC
  E70  0F1F        ADD   0x1F,15
  E71  591E        SACH  0x1E,1
  E72  6A21        LT    0x21
  E73  6D1B        MPY   0x1B
  E74  7F8E        PAC
  E75  6D1E        MPY   0x1E
  E76  7F90        SPAC
  E77  0F1E        ADD   0x1E,15
  E78  591A        SACH  0x1A,1
  E79  6A1A        LT    0x1A
  E7A  6D3C        MPY   0x3C
  E7B  7F8E        PAC
  E7C  591A        SACH  0x1A,1
  E7D  654F        ZALH  0x4F
  E7E  FE00 0E82   BNZ   LE82
  E80  F900 0E84   B     LE84

LE82:
  E82  587C        SACH  0x7C
  E83  7F80        NOP
LE84:
  E84  7F80        NOP
  E85  4E1A        OUT   0x1A,PA6
  E86  6521        ZALH  0x21
  E87  604A        ADDH  0x4A
  E88  5821        SACH  0x21
  E89  F500 0E92   BV    LE92
  E8B  7F80        NOP
  E8C  7F80        NOP
  E8D  7F80        NOP
  E8E  7F80        NOP
  E8F  7F80        NOP
  E90  F900 0E30   B     LE30

LE92:
  E92  657C        ZALH  0x7C
  E93  FE00 0E98   BNZ   LE98
  E95  7F80        NOP
  E96  7F80        NOP
  E97  7F8D        RET

LE98:
  E98  7F9D        POP
  E99  F900 0B9A   B     LB9A

