; Eventide h3500 DSP microcode
; key 7810  algorithm 78 (STUDIO SAMPLER)  DSP 1
; source H3000-Upgrade_ROM3.BIN offset 2C008, 1848 program words loaded at 800
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
  810  2801        LAC   0x01,8
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
  859  7F89        ZAC
  85A  5038        SACL  0x38
  85B  6518        ZALH  0x18
  85C  7F88        ABS
  85D  583A        SACH  0x3A
  85E  6A32        LT    0x32
  85F  6D55        MPY   0x55
  860  7F8E        PAC
  861  5932        SACH  0x32,1
  862  1F3A        SUB   0x3A,15
  863  FA00 0867   BLZ   L867
  865  F900 0869   B     L869

L867:
  867  653A        ZALH  0x3A
  868  5832        SACH  0x32
L869:
  869  655C        ZALH  0x5C
  86A  FF00 0872   BZ    L872
  86C  FC00 0876   BGZ   L876
  86E  7F80        NOP
  86F  7F80        NOP
  870  F900 0878   B     L878

L872:
  872  4932        OUT   0x32,PA1
  873  4A38        OUT   0x38,PA2
  874  F900 0878   B     L878

L876:
  876  490A        OUT   0x0A,PA1
  877  4A0B        OUT   0x0B,PA2
L878:
  878  7F80        NOP
  879  7F80        NOP
  87A  7F80        NOP
  87B  7F80        NOP
  87C  7F80        NOP
  87D  7F80        NOP
  87E  7F80        NOP
  87F  7F80        NOP
  880  7F80        NOP
  881  7F80        NOP
  882  7F80        NOP
  883  7EF1        LACK  0xF1
  884  5030        SACL  0x30
  885  7EFB        LACK  0xFB
  886  5031        SACL  0x31
  887  6539        ZALH  0x39
  888  FC00 0898   BGZ   L898
  88A  6532        ZALH  0x32
  88B  625D        SUBH  0x5D
  88C  5839        SACH  0x39
  88D  FA00 089D   BLZ   L89D
  88F  4B01        OUT   0x01,PA3
  890  7F80        NOP
  891  7F80        NOP
  892  433B        IN    0x3B,PA3
  893  6558        ZALH  0x58
  894  FF00 08A4   BZ    L8A4
  896  F900 0B23   B     LB23

L898:
  898  6532        ZALH  0x32
  899  625E        SUBH  0x5E
  89A  5839        SACH  0x39
  89B  7F80        NOP
  89C  7F80        NOP
L89D:
  89D  4B00        OUT   0x00,PA3
  89E  7F80        NOP
  89F  7F80        NOP
  8A0  433B        IN    0x3B,PA3
  8A1  7F80        NOP
  8A2  7F80        NOP
  8A3  7F80        NOP
L8A4:
  8A4  6559        ZALH  0x59
  8A5  FE00 08AA   BNZ   L8AA
  8A7  7F80        NOP
  8A8  F900 08AD   B     L8AD

L8AA:
  8AA  653B        ZALH  0x3B
  8AB  FC00 0B55   BGZ   LB55
L8AD:
  8AD  654B        ZALH  0x4B
  8AE  FE00 0B2A   BNZ   LB2A
  8B0  654C        ZALH  0x4C
  8B1  FE00 0B5B   BNZ   LB5B
  8B3  655F        ZALH  0x5F
  8B4  FE00 0A01   BNZ   LA01
  8B6  6550        ZALH  0x50
  8B7  FE00 0A7F   BNZ   LA7F
  8B9  654D        ZALH  0x4D
  8BA  FE00 08CD   BNZ   L8CD
  8BC  7F80        NOP
  8BD  7F80        NOP
  8BE  7F80        NOP
  8BF  7F80        NOP
  8C0  7F80        NOP
  8C1  7F80        NOP
  8C2  4718        IN    0x18,PA7
  8C3  7F80        NOP
  8C4  7F80        NOP
  8C5  7F80        NOP
  8C6  7F80        NOP
  8C7  7F80        NOP
  8C8  7F80        NOP
  8C9  7F89        ZAC
  8CA  5038        SACL  0x38
  8CB  F900 084E   B     L84E

L8CD:
  8CD  7E02        LACK  0x02
  8CE  5038        SACL  0x38
  8CF  6534        ZALH  0x34
  8D0  6135        ADDS  0x35
  8D1  580A        SACH  0x0A
  8D2  500B        SACL  0x0B
  8D3  4718        IN    0x18,PA7
  8D4  7F80        NOP
  8D5  270A        LAC   0x0A,7
  8D6  5810        SACH  0x10
  8D7  5011        SACL  0x11
  8D8  270B        LAC   0x0B,7
  8D9  5806        SACH  0x06
  8DA  7E7F        LACK  0x7F
  8DB  7906        AND   0x06
  8DC  6111        ADDS  0x11
  8DD  5011        SACL  0x11
L8DE:
  8DE  4506        IN    0x06,PA5
  8DF  6881        LARP  1
  8E0  6606        ZALS  0x06
  8E1  7905        AND   0x05
  8E2  FE00 08E7   BNZ   L8E7
  8E4  6880        LARP  0
  8E5  F900 08E9   B     L8E9

L8E7:
  8E7  3906        LAR   AR1,0x06
  8E8  4680        IN    *,PA6,AR0
L8E9:
  8E9  6518        ZALH  0x18
  8EA  7F88        ABS
  8EB  583A        SACH  0x3A
  8EC  4D18        OUT   0x18,PA5
  8ED  6A32        LT    0x32
  8EE  6D55        MPY   0x55
  8EF  7F8E        PAC
  8F0  5932        SACH  0x32,1
  8F1  1F3A        SUB   0x3A,15
  8F2  FA00 08F6   BLZ   L8F6
  8F4  F900 08F8   B     L8F8

L8F6:
  8F6  653A        ZALH  0x3A
  8F7  5832        SACH  0x32
L8F8:
  8F8  7F80        NOP
  8F9  7F80        NOP
  8FA  7F80        NOP
  8FB  7F80        NOP
  8FC  7F80        NOP
  8FD  7F80        NOP
  8FE  7F80        NOP
  8FF  7F80        NOP
  900  655C        ZALH  0x5C
  901  FF00 0909   BZ    L909
  903  FC00 090D   BGZ   L90D
  905  7F80        NOP
  906  7F80        NOP
  907  F900 090F   B     L90F

L909:
  909  4932        OUT   0x32,PA1
  90A  4A38        OUT   0x38,PA2
  90B  F900 090F   B     L90F

L90D:
  90D  490A        OUT   0x0A,PA1
  90E  4A0B        OUT   0x0B,PA2
L90F:
  90F  7F80        NOP
  910  6532        ZALH  0x32
  911  6256        SUBH  0x56
  912  5806        SACH  0x06
  913  650A        ZALH  0x0A
  914  610B        ADDS  0x0B
  915  0901        ADD   0x01,9
  916  580A        SACH  0x0A
  917  500B        SACL  0x0B
  918  FC00 091E   BGZ   L91E
  91A  7F80        NOP
  91B  7F80        NOP
  91C  F900 0922   B     L922

L91E:
  91E  6534        ZALH  0x34
  91F  6135        ADDS  0x35
  920  580A        SACH  0x0A
  921  500B        SACL  0x0B
L922:
  922  4B06        OUT   0x06,PA3
  923  6262        SUBH  0x62
  924  6363        SUBS  0x63
  925  433B        IN    0x3B,PA3
  926  7F80        NOP
  927  270A        LAC   0x0A,7
  928  5810        SACH  0x10
  929  5011        SACL  0x11
  92A  270B        LAC   0x0B,7
  92B  5806        SACH  0x06
  92C  7E7F        LACK  0x7F
  92D  7906        AND   0x06
  92E  6111        ADDS  0x11
  92F  5011        SACL  0x11
  930  7F80        NOP
  931  7F80        NOP
  932  7F80        NOP
  933  7F80        NOP
  934  655A        ZALH  0x5A
  935  FC00 0947   BGZ   L947
  937  FA00 0940   BLZ   L940
  939  7F80        NOP
  93A  7F80        NOP
  93B  7F80        NOP
  93C  7F80        NOP
  93D  7F80        NOP
  93E  F900 0950   B     L950

L940:
  940  6532        ZALH  0x32
  941  6256        SUBH  0x56
  942  FC00 0961   BGZ   L961
  944  7F80        NOP
  945  F900 0950   B     L950

L947:
  947  7F80        NOP
  948  7F80        NOP
  949  6532        ZALH  0x32
  94A  6256        SUBH  0x56
  94B  FC00 0961   BGZ   L961
  94D  653B        ZALH  0x3B
  94E  FC00 097F   BGZ   L97F
L950:
  950  654E        ZALH  0x4E
  951  FE00 0973   BNZ   L973
  953  7F80        NOP
  954  4718        IN    0x18,PA7
  955  7F80        NOP
  956  7F80        NOP
  957  7F80        NOP
  958  7F80        NOP
  959  7F80        NOP
  95A  654F        ZALH  0x4F
  95B  FE00 095F   BNZ   L95F
  95D  F900 08DE   B     L8DE

L95F:
  95F  F900 084E   B     L84E

L961:
  961  7F80        NOP
  962  650A        ZALH  0x0A
  963  610B        ADDS  0x0B
  964  5836        SACH  0x36
  965  5037        SACL  0x37
  966  6544        ZALH  0x44
  967  6145        ADDS  0x45
  968  4718        IN    0x18,PA7
  969  580E        SACH  0x0E
  96A  500F        SACL  0x0F
  96B  7F80        NOP
  96C  6542        ZALH  0x42
  96D  6143        ADDS  0x43
  96E  0957        ADD   0x57,9
  96F  580A        SACH  0x0A
  970  500B        SACL  0x0B
  971  F900 098E   B     L98E

L973:
  973  7F80        NOP
  974  4718        IN    0x18,PA7
  975  6544        ZALH  0x44
  976  6145        ADDS  0x45
  977  580E        SACH  0x0E
  978  500F        SACL  0x0F
  979  6542        ZALH  0x42
  97A  6143        ADDS  0x43
  97B  580A        SACH  0x0A
  97C  500B        SACL  0x0B
  97D  F900 098E   B     L98E

L97F:
  97F  650A        ZALH  0x0A
  980  610B        ADDS  0x0B
  981  5836        SACH  0x36
  982  5037        SACL  0x37
  983  4718        IN    0x18,PA7
  984  6544        ZALH  0x44
  985  6145        ADDS  0x45
  986  580E        SACH  0x0E
  987  500F        SACL  0x0F
  988  7F80        NOP
  989  6542        ZALH  0x42
  98A  6143        ADDS  0x43
  98B  0957        ADD   0x57,9
  98C  580A        SACH  0x0A
  98D  500B        SACL  0x0B
L98E:
  98E  4506        IN    0x06,PA5
  98F  6881        LARP  1
  990  6606        ZALS  0x06
  991  7905        AND   0x05
  992  FE00 0997   BNZ   L997
  994  6880        LARP  0
  995  F900 0999   B     L999

L997:
  997  3906        LAR   AR1,0x06
  998  4680        IN    *,PA6,AR0
L999:
  999  7F80        NOP
  99A  4810        OUT   0x10,PA0
  99B  7F80        NOP
  99C  4F11        OUT   0x11,PA7
  99D  4C18        OUT   0x18,PA4
  99E  4D18        OUT   0x18,PA5
  99F  4E18        OUT   0x18,PA6
  9A0  7E03        LACK  0x03
  9A1  5038        SACL  0x38
  9A2  655C        ZALH  0x5C
  9A3  FF00 09AB   BZ    L9AB
  9A5  FC00 09AF   BGZ   L9AF
  9A7  7F80        NOP
  9A8  7F80        NOP
  9A9  F900 09B1   B     L9B1

L9AB:
  9AB  4932        OUT   0x32,PA1
  9AC  4A38        OUT   0x38,PA2
  9AD  F900 09B1   B     L9B1

L9AF:
  9AF  490A        OUT   0x0A,PA1
  9B0  4A0B        OUT   0x0B,PA2
L9B1:
  9B1  650A        ZALH  0x0A
  9B2  610B        ADDS  0x0B
  9B3  0901        ADD   0x01,9
  9B4  580A        SACH  0x0A
  9B5  500B        SACL  0x0B
  9B6  270A        LAC   0x0A,7
  9B7  5810        SACH  0x10
  9B8  5011        SACL  0x11
  9B9  270B        LAC   0x0B,7
  9BA  5806        SACH  0x06
  9BB  7E7F        LACK  0x7F
  9BC  7906        AND   0x06
  9BD  6111        ADDS  0x11
  9BE  5011        SACL  0x11
  9BF  6518        ZALH  0x18
  9C0  7F88        ABS
  9C1  583A        SACH  0x3A
  9C2  6A32        LT    0x32
  9C3  6D55        MPY   0x55
  9C4  7F8E        PAC
  9C5  5932        SACH  0x32,1
  9C6  1F3A        SUB   0x3A,15
  9C7  FA00 09CB   BLZ   L9CB
  9C9  F900 09CD   B     L9CD

L9CB:
  9CB  653A        ZALH  0x3A
  9CC  5832        SACH  0x32
L9CD:
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
  9EC  7F80        NOP
  9ED  654F        ZALH  0x4F
  9EE  4718        IN    0x18,PA7
  9EF  FE00 09F9   BNZ   L9F9
  9F1  650A        ZALH  0x0A
  9F2  610B        ADDS  0x0B
  9F3  6244        SUBH  0x44
  9F4  6345        SUBS  0x45
  9F5  FD00 09FF   BGEZ  L9FF
  9F7  F900 098E   B     L98E

L9F9:
  9F9  7F80        NOP
  9FA  7F80        NOP
  9FB  7F80        NOP
  9FC  7F80        NOP
  9FD  7F80        NOP
  9FE  7F80        NOP
L9FF:
  9FF  F900 084E   B     L84E

LA01:
  A01  7F80        NOP
  A02  7F80        NOP
  A03  7F80        NOP
  A04  7F80        NOP
  A05  7F80        NOP
  A06  7F80        NOP
  A07  7F80        NOP
  A08  7F80        NOP
  A09  7F80        NOP
  A0A  7E05        LACK  0x05
  A0B  5038        SACL  0x38
  A0C  6542        ZALH  0x42
  A0D  6143        ADDS  0x43
  A0E  580A        SACH  0x0A
  A0F  500B        SACL  0x0B
  A10  270A        LAC   0x0A,7
  A11  5810        SACH  0x10
  A12  5011        SACL  0x11
  A13  270B        LAC   0x0B,7
  A14  5806        SACH  0x06
  A15  7E7F        LACK  0x7F
  A16  7906        AND   0x06
  A17  6111        ADDS  0x11
  A18  5011        SACL  0x11
LA19:
  A19  4506        IN    0x06,PA5
  A1A  6881        LARP  1
  A1B  6606        ZALS  0x06
  A1C  7905        AND   0x05
  A1D  FE00 0A22   BNZ   LA22
  A1F  6880        LARP  0
  A20  F900 0A24   B     LA24

LA22:
  A22  3906        LAR   AR1,0x06
  A23  4680        IN    *,PA6,AR0
LA24:
  A24  7F80        NOP
  A25  4810        OUT   0x10,PA0
  A26  7F80        NOP
  A27  4F11        OUT   0x11,PA7
  A28  4C00        OUT   0x00,PA4
  A29  4406        IN    0x06,PA4
  A2A  4C00        OUT   0x00,PA4
  A2B  4406        IN    0x06,PA4
  A2C  4C00        OUT   0x00,PA4
  A2D  4406        IN    0x06,PA4
  A2E  4C00        OUT   0x00,PA4
  A2F  4406        IN    0x06,PA4
  A30  4C00        OUT   0x00,PA4
  A31  4406        IN    0x06,PA4
  A32  4C00        OUT   0x00,PA4
  A33  4406        IN    0x06,PA4
  A34  4C00        OUT   0x00,PA4
  A35  4406        IN    0x06,PA4
  A36  4C00        OUT   0x00,PA4
  A37  655C        ZALH  0x5C
  A38  FF00 0A40   BZ    LA40
  A3A  FC00 0A44   BGZ   LA44
  A3C  7F80        NOP
  A3D  7F80        NOP
  A3E  F900 0A46   B     LA46

LA40:
  A40  4900        OUT   0x00,PA1
  A41  4A38        OUT   0x38,PA2
  A42  F900 0A46   B     LA46

LA44:
  A44  490A        OUT   0x0A,PA1
  A45  4A0B        OUT   0x0B,PA2
LA46:
  A46  650A        ZALH  0x0A
  A47  610B        ADDS  0x0B
  A48  0C01        ADD   0x01,12
  A49  580A        SACH  0x0A
  A4A  500B        SACL  0x0B
  A4B  270A        LAC   0x0A,7
  A4C  5810        SACH  0x10
  A4D  5011        SACL  0x11
  A4E  270B        LAC   0x0B,7
  A4F  5806        SACH  0x06
  A50  7E7F        LACK  0x7F
  A51  7906        AND   0x06
  A52  6111        ADDS  0x11
  A53  5011        SACL  0x11
  A54  7F80        NOP
  A55  7F80        NOP
  A56  7F80        NOP
  A57  7F80        NOP
  A58  7F80        NOP
  A59  7F80        NOP
  A5A  7F80        NOP
  A5B  7F80        NOP
  A5C  7F80        NOP
  A5D  7F80        NOP
  A5E  7F80        NOP
  A5F  7F80        NOP
  A60  7F80        NOP
  A61  7F80        NOP
  A62  7F80        NOP
  A63  7F80        NOP
  A64  7F80        NOP
  A65  7F80        NOP
  A66  7F80        NOP
  A67  7F80        NOP
  A68  7F80        NOP
  A69  7F80        NOP
  A6A  7F80        NOP
  A6B  7F80        NOP
  A6C  654F        ZALH  0x4F
  A6D  FE00 0A77   BNZ   LA77
  A6F  650A        ZALH  0x0A
  A70  610B        ADDS  0x0B
  A71  6244        SUBH  0x44
  A72  6345        SUBS  0x45
  A73  FD00 0A7D   BGEZ  LA7D
  A75  F900 0A19   B     LA19

LA77:
  A77  7F80        NOP
  A78  7F80        NOP
  A79  7F80        NOP
  A7A  7F80        NOP
  A7B  7F80        NOP
  A7C  7F80        NOP
LA7D:
  A7D  F900 084E   B     L84E

LA7F:
  A7F  7E04        LACK  0x04
  A80  5038        SACL  0x38
  A81  7F89        ZAC
  A82  5026        SACL  0x26
  A83  6542        ZALH  0x42
  A84  6143        ADDS  0x43
  A85  580A        SACH  0x0A
  A86  500B        SACL  0x0B
  A87  7F80        NOP
  A88  4718        IN    0x18,PA7
  A89  7F80        NOP
  A8A  270A        LAC   0x0A,7
  A8B  5810        SACH  0x10
  A8C  5011        SACL  0x11
  A8D  270B        LAC   0x0B,7
  A8E  5806        SACH  0x06
  A8F  7E7F        LACK  0x7F
  A90  7906        AND   0x06
  A91  6111        ADDS  0x11
  A92  5011        SACL  0x11
LA93:
  A93  4506        IN    0x06,PA5
  A94  6881        LARP  1
  A95  6606        ZALS  0x06
  A96  7905        AND   0x05
  A97  FE00 0A9C   BNZ   LA9C
  A99  6880        LARP  0
  A9A  F900 0A9E   B     LA9E

LA9C:
  A9C  3906        LAR   AR1,0x06
  A9D  4680        IN    *,PA6,AR0
LA9E:
  A9E  270A        LAC   0x0A,7
  A9F  5810        SACH  0x10
  AA0  5011        SACL  0x11
  AA1  270B        LAC   0x0B,7
  AA2  5806        SACH  0x06
  AA3  7E7F        LACK  0x7F
  AA4  7906        AND   0x06
  AA5  6111        ADDS  0x11
  AA6  5011        SACL  0x11
  AA7  260B        LAC   0x0B,6
  AA8  7903        AND   0x03
  AA9  5014        SACL  0x14
  AAA  7F80        NOP
  AAB  4810        OUT   0x10,PA0
  AAC  4F11        OUT   0x11,PA7
  AAD  441C        IN    0x1C,PA4
  AAE  441D        IN    0x1D,PA4
  AAF  6A14        LT    0x14
  AB0  6D1D        MPY   0x1D
  AB1  7F8E        PAC
  AB2  6D1C        MPY   0x1C
  AB3  7F90        SPAC
  AB4  0F1C        ADD   0x1C,15
  AB5  591A        SACH  0x1A,1
  AB6  4D1A        OUT   0x1A,PA5
  AB7  7F80        NOP
  AB8  655C        ZALH  0x5C
  AB9  FF00 0AC1   BZ    LAC1
  ABB  FC00 0AC5   BGZ   LAC5
  ABD  7F80        NOP
  ABE  7F80        NOP
  ABF  F900 0AC7   B     LAC7

LAC1:
  AC1  4932        OUT   0x32,PA1
  AC2  4A38        OUT   0x38,PA2
  AC3  F900 0AC7   B     LAC7

LAC5:
  AC5  490A        OUT   0x0A,PA1
  AC6  4A0B        OUT   0x0B,PA2
LAC7:
  AC7  650A        ZALH  0x0A
  AC8  610B        ADDS  0x0B
  AC9  0026        ADD   0x26
  ACA  580A        SACH  0x0A
  ACB  500B        SACL  0x0B
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
  ADC  2F40        LAC   0x40,15
  ADD  6A51        LT    0x51
  ADE  6D40        MPY   0x40
  ADF  7F90        SPAC
  AE0  6D26        MPY   0x26
  AE1  7F8F        APAC
  AE2  5926        SACH  0x26,1
  AE3  FA00 0AE7   BLZ   LAE7
  AE5  F900 0AE9   B     LAE9

LAE7:
  AE7  0003        ADD   0x03
  AE8  7F80        NOP
LAE9:
  AE9  5926        SACH  0x26,1
  AEA  6550        ZALH  0x50
  AEB  FF00 0AFF   BZ    LAFF
  AED  650A        ZALH  0x0A
  AEE  610B        ADDS  0x0B
  AEF  6260        SUBH  0x60
  AF0  6361        SUBS  0x61
  AF1  FB00 0B11   BLEZ  LB11
  AF3  650A        ZALH  0x0A
  AF4  610B        ADDS  0x0B
  AF5  6262        SUBH  0x62
  AF6  6363        SUBS  0x63
  AF7  FD00 0B1D   BGEZ  LB1D
  AF9  7F80        NOP
  AFA  7F80        NOP
  AFB  7F80        NOP
  AFC  7F80        NOP
  AFD  F900 0A93   B     LA93

LAFF:
  AFF  7F89        ZAC
  B00  580A        SACH  0x0A
  B01  500B        SACL  0x0B
  B02  7F80        NOP
  B03  7F80        NOP
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
  B0F  F900 084E   B     L84E

LB11:
  B11  7F80        NOP
  B12  7F80        NOP
  B13  7F80        NOP
  B14  7F80        NOP
  B15  7F80        NOP
  B16  7F80        NOP
  B17  6560        ZALH  0x60
  B18  6161        ADDS  0x61
  B19  580A        SACH  0x0A
  B1A  500B        SACL  0x0B
  B1B  F900 0A93   B     LA93

LB1D:
  B1D  6562        ZALH  0x62
  B1E  6163        ADDS  0x63
  B1F  580A        SACH  0x0A
  B20  500B        SACL  0x0B
  B21  F900 0A93   B     LA93

LB23:
  B23  7F80        NOP
  B24  7F80        NOP
  B25  7F80        NOP
  B26  7F80        NOP
  B27  7F80        NOP
  B28  7F80        NOP
  B29  7F80        NOP
LB2A:
  B2A  7F80        NOP
  B2B  7F80        NOP
  B2C  7F80        NOP
  B2D  7F80        NOP
  B2E  7F80        NOP
  B2F  7F80        NOP
LB30:
  B30  7F89        ZAC
  B31  5077        SACL  0x77
  B32  503C        SACL  0x3C
  B33  5078        SACL  0x78
  B34  5079        SACL  0x79
  B35  6503        ZALH  0x03
  B36  5839        SACH  0x39
  B37  6564        ZALH  0x64
  B38  583E        SACH  0x3E
  B39  6565        ZALH  0x65
  B3A  583F        SACH  0x3F
  B3B  656B        ZALH  0x6B
  B3C  616C        ADDS  0x6C
  B3D  587B        SACH  0x7B
  B3E  507C        SACL  0x7C
  B3F  6544        ZALH  0x44
  B40  6145        ADDS  0x45
  B41  580E        SACH  0x0E
  B42  500F        SACL  0x0F
  B43  6542        ZALH  0x42
  B44  6143        ADDS  0x43
  B45  580A        SACH  0x0A
  B46  500B        SACL  0x0B
  B47  5816        SACH  0x16
  B48  5017        SACL  0x17
  B49  270A        LAC   0x0A,7
  B4A  5810        SACH  0x10
  B4B  5011        SACL  0x11
  B4C  270B        LAC   0x0B,7
  B4D  5806        SACH  0x06
  B4E  7E7F        LACK  0x7F
  B4F  7906        AND   0x06
  B50  6111        ADDS  0x11
  B51  5011        SACL  0x11
  B52  7040        LARK  AR0,0x40
  B53  F900 0B91   B     LB91

LB55:
  B55  7F80        NOP
  B56  7F80        NOP
  B57  7F80        NOP
  B58  7F80        NOP
  B59  7F80        NOP
  B5A  7F80        NOP
LB5B:
  B5B  7F80        NOP
  B5C  7F80        NOP
  B5D  7F80        NOP
LB5E:
  B5E  7F80        NOP
  B5F  6503        ZALH  0x03
  B60  5839        SACH  0x39
LB61:
  B61  6566        ZALH  0x66
  B62  583E        SACH  0x3E
  B63  6567        ZALH  0x67
  B64  583F        SACH  0x3F
  B65  5078        SACL  0x78
  B66  5079        SACL  0x79
  B67  503C        SACL  0x3C
  B68  5077        SACL  0x77
  B69  656D        ZALH  0x6D
  B6A  616E        ADDS  0x6E
  B6B  587B        SACH  0x7B
  B6C  507C        SACL  0x7C
  B6D  6548        ZALH  0x48
  B6E  6149        ADDS  0x49
  B6F  580E        SACH  0x0E
  B70  500F        SACL  0x0F
  B71  6546        ZALH  0x46
  B72  6147        ADDS  0x47
  B73  580A        SACH  0x0A
  B74  500B        SACL  0x0B
  B75  5816        SACH  0x16
  B76  5017        SACL  0x17
  B77  270A        LAC   0x0A,7
  B78  5810        SACH  0x10
  B79  5011        SACL  0x11
  B7A  270B        LAC   0x0B,7
  B7B  5806        SACH  0x06
  B7C  7E7F        LACK  0x7F
  B7D  7906        AND   0x06
  B7E  6111        ADDS  0x11
  B7F  5011        SACL  0x11
  B80  706F        LARK  AR0,0x6F
  B81  F900 0B91   B     LB91

LB83:
  B83  4506        IN    0x06,PA5
  B84  6881        LARP  1
  B85  6606        ZALS  0x06
  B86  7905        AND   0x05
  B87  FE00 0B8C   BNZ   LB8C
  B89  6880        LARP  0
  B8A  F900 0B8E   B     LB8E

LB8C:
  B8C  3906        LAR   AR1,0x06
  B8D  4680        IN    *,PA6,AR0
LB8E:
  B8E  7E01        LACK  0x01
  B8F  5038        SACL  0x38
  B90  7F80        NOP
LB91:
  B91  4810        OUT   0x10,PA0
  B92  4F11        OUT   0x11,PA7
  B93  441C        IN    0x1C,PA4
  B94  441D        IN    0x1D,PA4
  B95  6A14        LT    0x14
  B96  6D1D        MPY   0x1D
  B97  7F8E        PAC
  B98  6D1C        MPY   0x1C
  B99  7F90        SPAC
  B9A  0F1C        ADD   0x1C,15
  B9B  591A        SACH  0x1A,1
  B9C  6A1A        LT    0x1A
  B9D  6D3C        MPY   0x3C
  B9E  7F8E        PAC
  B9F  591A        SACH  0x1A,1
  BA0  4D1A        OUT   0x1A,PA5
  BA1  655C        ZALH  0x5C
  BA2  FF00 0BAA   BZ    LBAA
  BA4  FC00 0BAE   BGZ   LBAE
  BA6  7F80        NOP
  BA7  7F80        NOP
  BA8  F900 0BB0   B     LBB0

LBAA:
  BAA  4932        OUT   0x32,PA1
  BAB  4A38        OUT   0x38,PA2
  BAC  F900 0BB0   B     LBB0

LBAE:
  BAE  4916        OUT   0x16,PA1
  BAF  4A17        OUT   0x17,PA2
LBB0:
  BB0  650A        ZALH  0x0A
  BB1  610B        ADDS  0x0B
  BB2  00A8        ADD   *+
  BB3  580A        SACH  0x0A
  BB4  500B        SACL  0x0B
  BB5  270A        LAC   0x0A,7
  BB6  5810        SACH  0x10
  BB7  5011        SACL  0x11
  BB8  270B        LAC   0x0B,7
  BB9  5806        SACH  0x06
  BBA  7E7F        LACK  0x7F
  BBB  7906        AND   0x06
  BBC  6111        ADDS  0x11
  BBD  5011        SACL  0x11
  BBE  260B        LAC   0x0B,6
  BBF  7903        AND   0x03
  BC0  5014        SACL  0x14
  BC1  6516        ZALH  0x16
  BC2  6117        ADDS  0x17
  BC3  0098        ADD   *-
  BC4  5816        SACH  0x16
  BC5  5017        SACL  0x17
  BC6  7F80        NOP
  BC7  7F80        NOP
  BC8  7F80        NOP
  BC9  7F80        NOP
  BCA  7F80        NOP
  BCB  7F80        NOP
  BCC  F500 0BCE   BV    LBCE
LBCE:
  BCE  653C        ZALH  0x3C
  BCF  613D        ADDS  0x3D
  BD0  0B3E        ADD   0x3E,11
  BD1  583C        SACH  0x3C
  BD2  503D        SACL  0x3D
  BD3  F500 0D23   BV    LD23
  BD5  654F        ZALH  0x4F
  BD6  FE00 0BFD   BNZ   LBFD
  BD8  6588        ZALH  *
  BD9  FA00 0BEC   BLZ   LBEC
  BDB  6516        ZALH  0x16
  BDC  6117        ADDS  0x17
  BDD  620E        SUBH  0x0E
  BDE  630F        SUBS  0x0F
  BDF  FD00 0C06   BGEZ  LC06
  BE1  4718        IN    0x18,PA7
  BE2  6516        ZALH  0x16
  BE3  6117        ADDS  0x17
  BE4  620A        SUBH  0x0A
  BE5  630B        SUBS  0x0B
  BE6  7F88        ABS
  BE7  1952        SUB   0x52,9
  BE8  FD00 0C12   BGEZ  LC12
  BEA  F900 0B83   B     LB83

LBEC:
  BEC  6516        ZALH  0x16
  BED  6117        ADDS  0x17
  BEE  620E        SUBH  0x0E
  BEF  630F        SUBS  0x0F
  BF0  FB00 0C06   BLEZ  LC06
  BF2  4718        IN    0x18,PA7
  BF3  6516        ZALH  0x16
  BF4  6117        ADDS  0x17
  BF5  620A        SUBH  0x0A
  BF6  630B        SUBS  0x0B
  BF7  7F88        ABS
  BF8  1952        SUB   0x52,9
  BF9  FD00 0C12   BGEZ  LC12
  BFB  F900 0B83   B     LB83

LBFD:
  BFD  7F80        NOP
  BFE  7F80        NOP
  BFF  7F80        NOP
  C00  7F80        NOP
  C01  7F80        NOP
  C02  7F80        NOP
  C03  7F80        NOP
  C04  7F80        NOP
  C05  7F80        NOP
LC06:
  C06  7F80        NOP
  C07  7F80        NOP
  C08  7F80        NOP
  C09  7F80        NOP
  C0A  7F80        NOP
  C0B  7F80        NOP
  C0C  7F80        NOP
  C0D  7F80        NOP
  C0E  7F80        NOP
  C0F  7F80        NOP
  C10  F900 0C24   B     LC24

LC12:
  C12  F800 0DED   CALL  LDED
  C14  4506        IN    0x06,PA5
  C15  6881        LARP  1
  C16  6606        ZALS  0x06
  C17  7905        AND   0x05
  C18  FE00 0C1D   BNZ   LC1D
  C1A  6880        LARP  0
  C1B  F900 0C1F   B     LC1F

LC1D:
  C1D  3906        LAR   AR1,0x06
  C1E  4680        IN    *,PA6,AR0
LC1F:
  C1F  7F80        NOP
  C20  F900 0B91   B     LB91

LC22:
  C22  F800 0DED   CALL  LDED
LC24:
  C24  4506        IN    0x06,PA5
  C25  6881        LARP  1
  C26  6606        ZALS  0x06
  C27  7905        AND   0x05
  C28  FE00 0C2D   BNZ   LC2D
  C2A  6880        LARP  0
  C2B  F900 0C2F   B     LC2F

LC2D:
  C2D  3906        LAR   AR1,0x06
  C2E  4680        IN    *,PA6,AR0
LC2F:
  C2F  7F80        NOP
  C30  7F80        NOP
  C31  7F80        NOP
  C32  4810        OUT   0x10,PA0
  C33  4F11        OUT   0x11,PA7
  C34  441C        IN    0x1C,PA4
  C35  441D        IN    0x1D,PA4
  C36  6A14        LT    0x14
  C37  6D1D        MPY   0x1D
  C38  7F8E        PAC
  C39  6D1C        MPY   0x1C
  C3A  7F90        SPAC
  C3B  0F1C        ADD   0x1C,15
  C3C  591A        SACH  0x1A,1
  C3D  6A1A        LT    0x1A
  C3E  6D3C        MPY   0x3C
  C3F  7F8E        PAC
  C40  591A        SACH  0x1A,1
  C41  4D1A        OUT   0x1A,PA5
  C42  655C        ZALH  0x5C
  C43  FF00 0C4B   BZ    LC4B
  C45  FC00 0C4F   BGZ   LC4F
  C47  7F80        NOP
  C48  7F80        NOP
  C49  F900 0C51   B     LC51

LC4B:
  C4B  4932        OUT   0x32,PA1
  C4C  4A38        OUT   0x38,PA2
  C4D  F900 0C51   B     LC51

LC4F:
  C4F  4916        OUT   0x16,PA1
  C50  4A17        OUT   0x17,PA2
LC51:
  C51  650A        ZALH  0x0A
  C52  610B        ADDS  0x0B
  C53  00A8        ADD   *+
  C54  580A        SACH  0x0A
  C55  500B        SACL  0x0B
  C56  270A        LAC   0x0A,7
  C57  5810        SACH  0x10
  C58  5011        SACL  0x11
  C59  270B        LAC   0x0B,7
  C5A  5806        SACH  0x06
  C5B  7E7F        LACK  0x7F
  C5C  7906        AND   0x06
  C5D  6111        ADDS  0x11
  C5E  5011        SACL  0x11
  C5F  260B        LAC   0x0B,6
  C60  7903        AND   0x03
  C61  5014        SACL  0x14
  C62  6516        ZALH  0x16
  C63  6117        ADDS  0x17
  C64  0098        ADD   *-
  C65  5816        SACH  0x16
  C66  5017        SACL  0x17
  C67  653C        ZALH  0x3C
  C68  613D        ADDS  0x3D
  C69  1B3F        SUB   0x3F,11
  C6A  FB00 0CA1   BLEZ  LCA1
  C6C  583C        SACH  0x3C
  C6D  503D        SACL  0x3D
  C6E  654B        ZALH  0x4B
  C6F  FE00 0C77   BNZ   LC77
  C71  654C        ZALH  0x4C
  C72  FE00 0C7D   BNZ   LC7D
  C74  7F80        NOP
  C75  F900 0C80   B     LC80

LC77:
  C77  5878        SACH  0x78
  C78  6568        ZALH  0x68
  C79  583F        SACH  0x3F
  C7A  7F80        NOP
  C7B  F900 0C80   B     LC80

LC7D:
  C7D  5879        SACH  0x79
  C7E  6568        ZALH  0x68
  C7F  583F        SACH  0x3F
LC80:
  C80  7F80        NOP
  C81  7F80        NOP
  C82  6588        ZALH  *
  C83  FA00 0C8D   BLZ   LC8D
  C85  6516        ZALH  0x16
  C86  6117        ADDS  0x17
  C87  620E        SUBH  0x0E
  C88  630F        SUBS  0x0F
  C89  FD00 0C95   BGEZ  LC95
  C8B  F900 0C97   B     LC97

LC8D:
  C8D  6516        ZALH  0x16
  C8E  6117        ADDS  0x17
  C8F  620E        SUBH  0x0E
  C90  630F        SUBS  0x0F
  C91  FB00 0C95   BLEZ  LC95
  C93  F900 0C97   B     LC97

LC95:
  C95  6568        ZALH  0x68
  C96  583F        SACH  0x3F
LC97:
  C97  6516        ZALH  0x16
  C98  6117        ADDS  0x17
  C99  620A        SUBH  0x0A
  C9A  630B        SUBS  0x0B
  C9B  7F88        ABS
  C9C  1952        SUB   0x52,9
  C9D  FD00 0C22   BGEZ  LC22
  C9F  F900 0C24   B     LC24

LCA1:
  CA1  7F80        NOP
  CA2  6578        ZALH  0x78
  CA3  FE00 0B2A   BNZ   LB2A
  CA5  6579        ZALH  0x79
  CA6  FE00 0B5B   BNZ   LB5B
  CA8  6569        ZALH  0x69
  CA9  FE00 0B30   BNZ   LB30
  CAB  656A        ZALH  0x6A
  CAC  FE00 0B61   BNZ   LB61
  CAE  7F80        NOP
  CAF  7F80        NOP
  CB0  7F80        NOP
  CB1  7F80        NOP
  CB2  7F80        NOP
  CB3  7F80        NOP
  CB4  7F80        NOP
  CB5  7F80        NOP
  CB6  7F80        NOP
  CB7  7F80        NOP
  CB8  7F80        NOP
  CB9  7F80        NOP
  CBA  7F80        NOP
  CBB  7F80        NOP
  CBC  7F80        NOP
  CBD  650E        ZALH  0x0E
  CBE  610F        ADDS  0x0F
  CBF  580A        SACH  0x0A
  CC0  500B        SACL  0x0B
  CC1  F900 084E   B     L84E

LCC3:
  CC3  F800 0DED   CALL  LDED
LCC5:
  CC5  4506        IN    0x06,PA5
  CC6  6881        LARP  1
  CC7  6606        ZALS  0x06
  CC8  7905        AND   0x05
  CC9  FE00 0CCE   BNZ   LCCE
  CCB  6880        LARP  0
  CCC  F900 0CD0   B     LCD0

LCCE:
  CCE  3906        LAR   AR1,0x06
  CCF  4680        IN    *,PA6,AR0
LCD0:
  CD0  6518        ZALH  0x18
  CD1  7F88        ABS
  CD2  583A        SACH  0x3A
  CD3  4810        OUT   0x10,PA0
  CD4  4F11        OUT   0x11,PA7
  CD5  441C        IN    0x1C,PA4
  CD6  441D        IN    0x1D,PA4
  CD7  6A14        LT    0x14
  CD8  6D1D        MPY   0x1D
  CD9  7F8E        PAC
  CDA  6D1C        MPY   0x1C
  CDB  7F90        SPAC
  CDC  0F1C        ADD   0x1C,15
  CDD  591A        SACH  0x1A,1
  CDE  4D1A        OUT   0x1A,PA5
  CDF  655C        ZALH  0x5C
  CE0  FF00 0CE8   BZ    LCE8
  CE2  FC00 0CEC   BGZ   LCEC
  CE4  7F80        NOP
  CE5  7F80        NOP
  CE6  F900 0CEE   B     LCEE

LCE8:
  CE8  4932        OUT   0x32,PA1
  CE9  4A38        OUT   0x38,PA2
  CEA  F900 0CEE   B     LCEE

LCEC:
  CEC  4916        OUT   0x16,PA1
  CED  4A17        OUT   0x17,PA2
LCEE:
  CEE  650A        ZALH  0x0A
  CEF  610B        ADDS  0x0B
  CF0  00A8        ADD   *+
  CF1  580A        SACH  0x0A
  CF2  500B        SACL  0x0B
  CF3  270A        LAC   0x0A,7
  CF4  5810        SACH  0x10
  CF5  5011        SACL  0x11
  CF6  270B        LAC   0x0B,7
  CF7  5806        SACH  0x06
  CF8  7E7F        LACK  0x7F
  CF9  7906        AND   0x06
  CFA  6111        ADDS  0x11
  CFB  5011        SACL  0x11
  CFC  260B        LAC   0x0B,6
  CFD  7903        AND   0x03
  CFE  5014        SACL  0x14
  CFF  6516        ZALH  0x16
  D00  6117        ADDS  0x17
  D01  0098        ADD   *-
  D02  5816        SACH  0x16
  D03  5017        SACL  0x17
  D04  6A32        LT    0x32
  D05  6D55        MPY   0x55
  D06  7F8E        PAC
  D07  5932        SACH  0x32,1
  D08  1F3A        SUB   0x3A,15
  D09  FA00 0D0D   BLZ   LD0D
  D0B  F900 0D0F   B     LD0F

LD0D:
  D0D  653A        ZALH  0x3A
  D0E  5832        SACH  0x32
LD0F:
  D0F  6539        ZALH  0x39
  D10  FB00 0D19   BLEZ  LD19
  D12  6532        ZALH  0x32
  D13  625E        SUBH  0x5E
  D14  5839        SACH  0x39
  D15  7F89        ZAC
  D16  5077        SACL  0x77
  D17  F900 0D23   B     LD23

LD19:
  D19  6532        ZALH  0x32
  D1A  625D        SUBH  0x5D
  D1B  FC00 0D20   BGZ   LD20
  D1D  5077        SACL  0x77
  D1E  F900 0D23   B     LD23

LD20:
  D20  5839        SACH  0x39
  D21  7E01        LACK  0x01
  D22  5077        SACL  0x77
LD23:
  D23  654F        ZALH  0x4F
  D24  FE00 0D4B   BNZ   LD4B
  D26  6588        ZALH  *
  D27  FA00 0D3A   BLZ   LD3A
  D29  6516        ZALH  0x16
  D2A  6117        ADDS  0x17
  D2B  627B        SUBH  0x7B
  D2C  637C        SUBS  0x7C
  D2D  FD00 0D54   BGEZ  LD54
  D2F  4718        IN    0x18,PA7
  D30  6516        ZALH  0x16
  D31  6117        ADDS  0x17
  D32  620A        SUBH  0x0A
  D33  630B        SUBS  0x0B
  D34  7F88        ABS
  D35  1952        SUB   0x52,9
  D36  FD00 0CC3   BGEZ  LCC3
  D38  F900 0D60   B     LD60

LD3A:
  D3A  6516        ZALH  0x16
  D3B  6117        ADDS  0x17
  D3C  627B        SUBH  0x7B
  D3D  637C        SUBS  0x7C
  D3E  FB00 0D54   BLEZ  LD54
  D40  4718        IN    0x18,PA7
  D41  6516        ZALH  0x16
  D42  6117        ADDS  0x17
  D43  620A        SUBH  0x0A
  D44  630B        SUBS  0x0B
  D45  7F88        ABS
  D46  1952        SUB   0x52,9
  D47  FD00 0CC3   BGEZ  LCC3
  D49  F900 0D60   B     LD60

LD4B:
  D4B  7F80        NOP
  D4C  7F80        NOP
  D4D  7F80        NOP
  D4E  7F80        NOP
  D4F  7F80        NOP
  D50  7F80        NOP
  D51  7F80        NOP
  D52  7F80        NOP
  D53  7F80        NOP
LD54:
  D54  7F80        NOP
  D55  7F80        NOP
  D56  7F80        NOP
  D57  7F80        NOP
  D58  7F80        NOP
  D59  7F80        NOP
  D5A  7F80        NOP
  D5B  7F80        NOP
  D5C  7F80        NOP
  D5D  7F80        NOP
  D5E  F900 0C24   B     LC24

LD60:
  D60  4506        IN    0x06,PA5
  D61  6881        LARP  1
  D62  6606        ZALS  0x06
  D63  7905        AND   0x05
  D64  FE00 0D69   BNZ   LD69
  D66  6880        LARP  0
  D67  F900 0D6B   B     LD6B

LD69:
  D69  3906        LAR   AR1,0x06
  D6A  4680        IN    *,PA6,AR0
LD6B:
  D6B  6518        ZALH  0x18
  D6C  7F88        ABS
  D6D  583A        SACH  0x3A
  D6E  4810        OUT   0x10,PA0
  D6F  4F11        OUT   0x11,PA7
  D70  441C        IN    0x1C,PA4
  D71  441D        IN    0x1D,PA4
  D72  6A14        LT    0x14
  D73  6D1D        MPY   0x1D
  D74  7F8E        PAC
  D75  6D1C        MPY   0x1C
  D76  7F90        SPAC
  D77  0F1C        ADD   0x1C,15
  D78  591A        SACH  0x1A,1
  D79  4D1A        OUT   0x1A,PA5
  D7A  650A        ZALH  0x0A
  D7B  610B        ADDS  0x0B
  D7C  00A8        ADD   *+
  D7D  580A        SACH  0x0A
  D7E  500B        SACL  0x0B
  D7F  7F80        NOP
  D80  7F80        NOP
  D81  4B77        OUT   0x77,PA3
  D82  7F80        NOP
  D83  7F80        NOP
  D84  433B        IN    0x3B,PA3
  D85  7F80        NOP
  D86  270A        LAC   0x0A,7
  D87  5810        SACH  0x10
  D88  5011        SACL  0x11
  D89  270B        LAC   0x0B,7
  D8A  5806        SACH  0x06
  D8B  7E7F        LACK  0x7F
  D8C  7906        AND   0x06
  D8D  6111        ADDS  0x11
  D8E  5011        SACL  0x11
  D8F  260B        LAC   0x0B,6
  D90  7903        AND   0x03
  D91  5014        SACL  0x14
  D92  6516        ZALH  0x16
  D93  6117        ADDS  0x17
  D94  0098        ADD   *-
  D95  5816        SACH  0x16
  D96  5017        SACL  0x17
  D97  6A32        LT    0x32
  D98  6D55        MPY   0x55
  D99  7F8E        PAC
  D9A  5932        SACH  0x32,1
  D9B  1F3A        SUB   0x3A,15
  D9C  FA00 0DA0   BLZ   LDA0
  D9E  F900 0DA2   B     LDA2

LDA0:
  DA0  653A        ZALH  0x3A
  DA1  5832        SACH  0x32
LDA2:
  DA2  7F80        NOP
  DA3  7F80        NOP
  DA4  6658        ZALS  0x58
  DA5  7977        AND   0x77
  DA6  FF00 0DAC   BZ    LDAC
  DA8  7F80        NOP
  DA9  7F80        NOP
  DAA  F900 0B30   B     LB30

LDAC:
  DAC  6659        ZALS  0x59
  DAD  793B        AND   0x3B
  DAE  FE00 0B5E   BNZ   LB5E
  DB0  654F        ZALH  0x4F
  DB1  FE00 0DD8   BNZ   LDD8
  DB3  6588        ZALH  *
  DB4  FA00 0DC7   BLZ   LDC7
  DB6  6516        ZALH  0x16
  DB7  6117        ADDS  0x17
  DB8  627B        SUBH  0x7B
  DB9  637C        SUBS  0x7C
  DBA  FD00 0DE1   BGEZ  LDE1
  DBC  4718        IN    0x18,PA7
  DBD  6516        ZALH  0x16
  DBE  6117        ADDS  0x17
  DBF  620A        SUBH  0x0A
  DC0  630B        SUBS  0x0B
  DC1  7F88        ABS
  DC2  1952        SUB   0x52,9
  DC3  FD00 0CC3   BGEZ  LCC3
  DC5  F900 0CC5   B     LCC5

LDC7:
  DC7  6516        ZALH  0x16
  DC8  6117        ADDS  0x17
  DC9  627B        SUBH  0x7B
  DCA  637C        SUBS  0x7C
  DCB  FB00 0DE1   BLEZ  LDE1
  DCD  4718        IN    0x18,PA7
  DCE  6516        ZALH  0x16
  DCF  6117        ADDS  0x17
  DD0  620A        SUBH  0x0A
  DD1  630B        SUBS  0x0B
  DD2  7F88        ABS
  DD3  1952        SUB   0x52,9
  DD4  FD00 0CC3   BGEZ  LCC3
  DD6  F900 0CC5   B     LCC5

LDD8:
  DD8  7F80        NOP
  DD9  7F80        NOP
  DDA  7F80        NOP
  DDB  7F80        NOP
  DDC  7F80        NOP
  DDD  7F80        NOP
  DDE  7F80        NOP
  DDF  7F80        NOP
  DE0  7F80        NOP
LDE1:
  DE1  7F80        NOP
  DE2  7F80        NOP
  DE3  7F80        NOP
  DE4  7F80        NOP
  DE5  7F80        NOP
  DE6  7F80        NOP
  DE7  7F80        NOP
  DE8  7F80        NOP
  DE9  7F80        NOP
  DEA  7F80        NOP
  DEB  F900 0C24   B     LC24

LDED:
  DED  4506        IN    0x06,PA5
  DEE  6881        LARP  1
  DEF  6606        ZALS  0x06
  DF0  7905        AND   0x05
  DF1  FE00 0DF6   BNZ   LDF6
  DF3  6880        LARP  0
  DF4  F900 0DF8   B     LDF8

LDF6:
  DF6  3906        LAR   AR1,0x06
  DF7  4680        IN    *,PA6,AR0
LDF8:
  DF8  7F80        NOP
  DF9  4810        OUT   0x10,PA0
  DFA  4F11        OUT   0x11,PA7
  DFB  441C        IN    0x1C,PA4
  DFC  441D        IN    0x1D,PA4
  DFD  6A14        LT    0x14
  DFE  6D1D        MPY   0x1D
  DFF  7F8E        PAC
  E00  6D1C        MPY   0x1C
  E01  7F90        SPAC
  E02  0F1C        ADD   0x1C,15
  E03  591A        SACH  0x1A,1
  E04  6A1A        LT    0x1A
  E05  6D3C        MPY   0x3C
  E06  7F8E        PAC
  E07  591A        SACH  0x1A,1
  E08  4D1A        OUT   0x1A,PA5
  E09  650A        ZALH  0x0A
  E0A  610B        ADDS  0x0B
  E0B  00A8        ADD   *+
  E0C  580A        SACH  0x0A
  E0D  500B        SACL  0x0B
  E0E  270A        LAC   0x0A,7
  E0F  5810        SACH  0x10
  E10  5011        SACL  0x11
  E11  270B        LAC   0x0B,7
  E12  5806        SACH  0x06
  E13  7E7F        LACK  0x7F
  E14  7906        AND   0x06
  E15  6111        ADDS  0x11
  E16  5011        SACL  0x11
  E17  260B        LAC   0x0B,6
  E18  7903        AND   0x03
  E19  5014        SACL  0x14
  E1A  6516        ZALH  0x16
  E1B  6117        ADDS  0x17
  E1C  0098        ADD   *-
  E1D  5816        SACH  0x16
  E1E  5017        SACL  0x17
  E1F  2A11        LAC   0x11,10
  E20  582C        SACH  0x2C
  E21  2A02        LAC   0x02,10
  E22  7802        XOR   0x02
  E23  792C        AND   0x2C
  E24  502C        SACL  0x2C
  E25  2A10        LAC   0x10,10
  E26  582B        SACH  0x2B
  E27  7A2C        OR    0x2C
  E28  502C        SACL  0x2C
  E29  662C        ZALS  0x2C
  E2A  792E        AND   0x2E
  E2B  502C        SACL  0x2C
  E2C  65A8        ZALH  *+
  E2D  7F88        ABS
  E2E  5806        SACH  0x06
  E2F  6598        ZALH  *-
  E30  7F88        ABS
  E31  6006        ADDH  0x06
  E32  5806        SACH  0x06
  E33  6A06        LT    0x06
  E34  6D7F        MPY   0x7F
  E35  7F8E        PAC
  E36  594A        SACH  0x4A,1
  E37  627E        SUBH  0x7E
  E38  FA00 0E3C   BLZ   LE3C
  E3A  F900 0E3E   B     LE3E

LE3C:
  E3C  657E        ZALH  0x7E
  E3D  584A        SACH  0x4A
LE3E:
  E3E  7F80        NOP
  E3F  7F80        NOP
  E40  7F80        NOP
  E41  7F80        NOP
  E42  7F80        NOP
  E43  7F80        NOP
  E44  7F80        NOP
  E45  F500 0E47   BV    LE47
LE47:
  E47  7F89        ZAC
  E48  507A        SACL  0x7A
  E49  654F        ZALH  0x4F
  E4A  FE00 0E4E   BNZ   LE4E
  E4C  F900 0E50   B     LE50

LE4E:
  E4E  587A        SACH  0x7A
  E4F  7F80        NOP
LE50:
  E50  6630        ZALS  0x30
  E51  0031        ADD   0x31
  E52  5031        SACL  0x31
  E53  0030        ADD   0x30
  E54  5030        SACL  0x30
  E55  4506        IN    0x06,PA5
  E56  6881        LARP  1
  E57  6606        ZALS  0x06
  E58  7905        AND   0x05
  E59  FE00 0E5E   BNZ   LE5E
  E5B  6880        LARP  0
  E5C  F900 0E60   B     LE60

LE5E:
  E5E  3906        LAR   AR1,0x06
  E5F  4680        IN    *,PA6,AR0
LE60:
  E60  6A14        LT    0x14
  E61  4810        OUT   0x10,PA0
  E62  4F11        OUT   0x11,PA7
  E63  441C        IN    0x1C,PA4
  E64  441D        IN    0x1D,PA4
  E65  6D1D        MPY   0x1D
  E66  7F8E        PAC
  E67  6D1C        MPY   0x1C
  E68  7F90        SPAC
  E69  0F1C        ADD   0x1C,15
  E6A  591A        SACH  0x1A,1
  E6B  6A1A        LT    0x1A
  E6C  6D3C        MPY   0x3C
  E6D  7F8E        PAC
  E6E  591A        SACH  0x1A,1
  E6F  482D        OUT   0x2D,PA0
  E70  4F2C        OUT   0x2C,PA7
  E71  4427        IN    0x27,PA4
  E72  4428        IN    0x28,PA4
  E73  4429        IN    0x29,PA4
  E74  442A        IN    0x2A,PA4
  E75  4D1A        OUT   0x1A,PA5
  E76  654F        ZALH  0x4F
  E77  FE00 0E7B   BNZ   LE7B
  E79  F900 0E7D   B     LE7D

LE7B:
  E7B  587A        SACH  0x7A
  E7C  7F80        NOP
LE7D:
  E7D  7F80        NOP
  E7E  6516        ZALH  0x16
  E7F  6117        ADDS  0x17
  E80  620A        SUBH  0x0A
  E81  630B        SUBS  0x0B
  E82  FC00 0E9C   BGZ   LE9C
  E84  652A        ZALH  0x2A
  E85  6254        SUBH  0x54
  E86  FA00 0E92   BLZ   LE92
  E88  7F80        NOP
  E89  7F80        NOP
  E8A  7F80        NOP
  E8B  7F80        NOP
  E8C  7F80        NOP
  E8D  7F80        NOP
  E8E  2029        LAC   0x29
  E8F  5015        SACL  0x15
  E90  F900 0EAA   B     LEAA

LE92:
  E92  6A30        LT    0x30
  E93  6D53        MPY   0x53
  E94  7F8E        PAC
  E95  7F88        ABS
  E96  0F53        ADD   0x53,15
  E97  5815        SACH  0x15
  E98  7F80        NOP
  E99  7F80        NOP
  E9A  F900 0EAA   B     LEAA

LE9C:
  E9C  7F80        NOP
  E9D  7F80        NOP
  E9E  7F80        NOP
  E9F  7F80        NOP
  EA0  7F80        NOP
  EA1  7F80        NOP
  EA2  7F80        NOP
  EA3  7F80        NOP
  EA4  7F80        NOP
  EA5  7F80        NOP
  EA6  7F89        ZAC
  EA7  1027        SUB   0x27
  EA8  5015        SACL  0x15
  EA9  7F80        NOP
LEAA:
  EAA  650A        ZALH  0x0A
  EAB  610B        ADDS  0x0B
  EAC  00A8        ADD   *+
  EAD  580C        SACH  0x0C
  EAE  500D        SACL  0x0D
  EAF  1915        SUB   0x15,9
  EB0  580A        SACH  0x0A
  EB1  500B        SACL  0x0B
  EB2  270A        LAC   0x0A,7
  EB3  5810        SACH  0x10
  EB4  5011        SACL  0x11
  EB5  270B        LAC   0x0B,7
  EB6  5806        SACH  0x06
  EB7  7E7F        LACK  0x7F
  EB8  7906        AND   0x06
  EB9  6111        ADDS  0x11
  EBA  5011        SACL  0x11
  EBB  270C        LAC   0x0C,7
  EBC  5812        SACH  0x12
  EBD  5013        SACL  0x13
  EBE  270D        LAC   0x0D,7
  EBF  5806        SACH  0x06
  EC0  7E7F        LACK  0x7F
  EC1  7906        AND   0x06
  EC2  6113        ADDS  0x13
  EC3  5013        SACL  0x13
  EC4  260B        LAC   0x0B,6
  EC5  7903        AND   0x03
  EC6  5014        SACL  0x14
  EC7  5821        SACH  0x21
  EC8  6516        ZALH  0x16
  EC9  6117        ADDS  0x17
  ECA  0098        ADD   *-
  ECB  5816        SACH  0x16
  ECC  5017        SACL  0x17
LECD:
  ECD  4506        IN    0x06,PA5
  ECE  6881        LARP  1
  ECF  6606        ZALS  0x06
  ED0  7905        AND   0x05
  ED1  FE00 0ED6   BNZ   LED6
  ED3  6880        LARP  0
  ED4  F900 0ED8   B     LED8

LED6:
  ED6  3906        LAR   AR1,0x06
  ED7  4680        IN    *,PA6,AR0
LED8:
  ED8  6A14        LT    0x14
  ED9  4810        OUT   0x10,PA0
  EDA  4F11        OUT   0x11,PA7
  EDB  441C        IN    0x1C,PA4
  EDC  441D        IN    0x1D,PA4
  EDD  4812        OUT   0x12,PA0
  EDE  4F13        OUT   0x13,PA7
  EDF  441F        IN    0x1F,PA4
  EE0  4420        IN    0x20,PA4
  EE1  6D1D        MPY   0x1D
  EE2  7F8E        PAC
  EE3  6D1C        MPY   0x1C
  EE4  7F90        SPAC
  EE5  0F1C        ADD   0x1C,15
  EE6  591B        SACH  0x1B,1
  EE7  6D20        MPY   0x20
  EE8  7F8E        PAC
  EE9  6D1F        MPY   0x1F
  EEA  7F90        SPAC
  EEB  0F1F        ADD   0x1F,15
  EEC  591E        SACH  0x1E,1
  EED  6A21        LT    0x21
  EEE  6D1B        MPY   0x1B
  EEF  7F8E        PAC
  EF0  6D1E        MPY   0x1E
  EF1  7F90        SPAC
  EF2  0F1E        ADD   0x1E,15
  EF3  591A        SACH  0x1A,1
  EF4  6A3C        LT    0x3C
  EF5  6D1A        MPY   0x1A
  EF6  7F8E        PAC
  EF7  591A        SACH  0x1A,1
  EF8  4D1A        OUT   0x1A,PA5
  EF9  650A        ZALH  0x0A
  EFA  610B        ADDS  0x0B
  EFB  00A8        ADD   *+
  EFC  580A        SACH  0x0A
  EFD  500B        SACL  0x0B
  EFE  0915        ADD   0x15,9
  EFF  580C        SACH  0x0C
  F00  500D        SACL  0x0D
  F01  270A        LAC   0x0A,7
  F02  5810        SACH  0x10
  F03  5011        SACL  0x11
  F04  270B        LAC   0x0B,7
  F05  5806        SACH  0x06
  F06  7E7F        LACK  0x7F
  F07  7906        AND   0x06
  F08  6111        ADDS  0x11
  F09  5011        SACL  0x11
  F0A  270C        LAC   0x0C,7
  F0B  5812        SACH  0x12
  F0C  5013        SACL  0x13
  F0D  270D        LAC   0x0D,7
  F0E  5806        SACH  0x06
  F0F  7E7F        LACK  0x7F
  F10  7906        AND   0x06
  F11  6113        ADDS  0x13
  F12  5013        SACL  0x13
  F13  260B        LAC   0x0B,6
  F14  7903        AND   0x03
  F15  5014        SACL  0x14
  F16  6516        ZALH  0x16
  F17  6117        ADDS  0x17
  F18  0098        ADD   *-
  F19  5816        SACH  0x16
  F1A  5017        SACL  0x17
  F1B  7F80        NOP
  F1C  654F        ZALH  0x4F
  F1D  FE00 0F21   BNZ   LF21
  F1F  F900 0F23   B     LF23

LF21:
  F21  587A        SACH  0x7A
  F22  7F80        NOP
LF23:
  F23  6521        ZALH  0x21
  F24  604A        ADDH  0x4A
  F25  5821        SACH  0x21
  F26  F500 0F2F   BV    LF2F
  F28  7F80        NOP
  F29  7F80        NOP
  F2A  7F80        NOP
  F2B  7F80        NOP
  F2C  7F80        NOP
  F2D  F900 0ECD   B     LECD

LF2F:
  F2F  657A        ZALH  0x7A
  F30  FE00 0F35   BNZ   LF35
  F32  7F80        NOP
  F33  7F80        NOP
  F34  7F8D        RET

LF35:
  F35  7F9D        POP
  F36  F900 0C24   B     LC24

