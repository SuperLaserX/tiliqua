; Eventide h3500 DSP microcode
; key 6F11  algorithm 6F (PATCH FACTORY)  DSP 2
; source H3000-Upgrade_ROM4.BIN offset 36BA9, 1410 program words loaded at 800
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
  80C  5001        SACL  0x01
  80D  5010        SACL  0x10
  80E  2901        LAC   0x01,9
  80F  5005        SACL  0x05
  810  2F01        LAC   0x01,15
  811  5004        SACL  0x04
  812  7F89        ZAC
  813  5000        SACL  0x00
  814  1001        SUB   0x01
  815  5802        SACH  0x02
  816  7E0D        LACK  0x0D
  817  5028        SACL  0x28
  818  7E11        LACK  0x11
  819  5029        SACL  0x29
  81A  7EFF        LACK  0xFF
  81B  5006        SACL  0x06
  81C  2706        LAC   0x06,7
  81D  7A06        OR    0x06
  81E  5003        SACL  0x03
  81F  7EFF        LACK  0xFF
  820  5006        SACL  0x06
  821  2206        LAC   0x06,2
  822  5022        SACL  0x22
  823  6A01        LT    0x01
  824  8946        MPYK  2374
  825  7F8E        PAC
  826  5023        SACL  0x23
  827  F800 0D46   CALL  LD46
L829:
  829  F600 082D   BIOZ  L82D
  82B  F900 0829   B     L829

L82D:
  82D  4006        IN    0x06,PA0
  82E  6506        ZALH  0x06
  82F  FD00 0832   BGEZ  L832
  831  7F80        NOP
L832:
  832  F600 0832   BIOZ  L832
L834:
  834  6610        ZALS  0x10
  835  6301        SUBS  0x01
  836  5010        SACL  0x10
  837  6112        ADDS  0x12
  838  502A        SACL  0x2A
  839  0035        ADD   0x35
  83A  502B        SACL  0x2B
  83B  2A13        LAC   0x13,10
  83C  5806        SACH  0x06
  83D  2006        LAC   0x06
  83E  7922        AND   0x22
  83F  0023        ADD   0x23
  840  701B        LARK  AR0,0x1B
  841  67A8        TBLR  *+
  842  0001        ADD   0x01
  843  67A8        TBLR  *+
  844  0001        ADD   0x01
  845  67A8        TBLR  *+
  846  0001        ADD   0x01
  847  67A8        TBLR  *+
  848  6A27        LT    0x27
  849  4F2A        OUT   0x2A,PA7
  84A  443A        IN    0x3A,PA4
  84B  443B        IN    0x3B,PA4
  84C  4F2B        OUT   0x2B,PA7
  84D  443C        IN    0x3C,PA4
  84E  443D        IN    0x3D,PA4
  84F  6613        ZALS  0x13
  850  0140        ADD   0x40,1
  851  5013        SACL  0x13
  852  5814        SACH  0x14
  853  6012        ADDH  0x12
  854  5812        SACH  0x12
  855  6D3A        MPY   0x3A
  856  6628        ZALS  0x28
  857  0029        ADD   0x29
  858  5029        SACL  0x29
  859  0028        ADD   0x28
  85A  5028        SACL  0x28
  85B  7F80        NOP
  85C  7F80        NOP
  85D  7F80        NOP
  85E  7F8E        PAC
  85F  6D3C        MPY   0x3C
  860  7F90        SPAC
  861  0F3C        ADD   0x3C,15
  862  4324        IN    0x24,PA3
  863  4B26        OUT   0x26,PA3
  864  4B28        OUT   0x28,PA3
  865  4A10        OUT   0x10,PA2
  866  4F10        OUT   0x10,PA7
  867  4C24        OUT   0x24,PA4
  868  5936        SACH  0x36,1
  869  6D3B        MPY   0x3B
  86A  7F8E        PAC
  86B  6D3D        MPY   0x3D
  86C  7F90        SPAC
  86D  0F3D        ADD   0x3D,15
  86E  5937        SACH  0x37,1
  86F  6514        ZALH  0x14
  870  FA00 088E   BLZ   L88E
  872  FC00 0881   BGZ   L881
  874  7F89        ZAC
  875  6A39        LT    0x39
  876  6D1E        MPY   0x1E
  877  6B38        LTD   0x38
  878  6D1D        MPY   0x1D
  879  6B37        LTD   0x37
  87A  6D1C        MPY   0x1C
  87B  6B36        LTD   0x36
  87C  6D1B        MPY   0x1B
  87D  7F8F        APAC
  87E  5926        SACH  0x26,1
  87F  F900 089D   B     L89D

L881:
  881  7F89        ZAC
  882  6A39        LT    0x39
  883  6D1E        MPY   0x1E
  884  6C38        LTA   0x38
  885  6D1D        MPY   0x1D
  886  6C37        LTA   0x37
  887  6D1C        MPY   0x1C
  888  6C36        LTA   0x36
  889  6D1B        MPY   0x1B
  88A  7F8F        APAC
  88B  5926        SACH  0x26,1
  88C  F900 089D   B     L89D

L88E:
  88E  7F89        ZAC
  88F  6A39        LT    0x39
  890  6D1E        MPY   0x1E
  891  6B38        LTD   0x38
  892  6D1D        MPY   0x1D
  893  6B37        LTD   0x37
  894  6D1C        MPY   0x1C
  895  6B36        LTD   0x36
  896  6D1B        MPY   0x1B
  897  7F8F        APAC
  898  5926        SACH  0x26,1
  899  6938        DMOV  0x38
  89A  6937        DMOV  0x37
  89B  F900 089D   B     L89D

L89D:
  89D  6527        ZALH  0x27
  89E  6042        ADDH  0x42
  89F  5827        SACH  0x27
  8A0  F500 08A4   BV    L8A4
  8A2  F900 0834   B     L834

L8A4:
  8A4  7F80        NOP
  8A5  7F80        NOP
L8A6:
  8A6  6610        ZALS  0x10
  8A7  6301        SUBS  0x01
  8A8  5010        SACL  0x10
  8A9  6112        ADDS  0x12
  8AA  502A        SACL  0x2A
  8AB  2A13        LAC   0x13,10
  8AC  5806        SACH  0x06
  8AD  2006        LAC   0x06
  8AE  7922        AND   0x22
  8AF  0023        ADD   0x23
  8B0  701B        LARK  AR0,0x1B
  8B1  67A8        TBLR  *+
  8B2  0001        ADD   0x01
  8B3  67A8        TBLR  *+
  8B4  0001        ADD   0x01
  8B5  67A8        TBLR  *+
  8B6  0001        ADD   0x01
  8B7  67A8        TBLR  *+
  8B8  6613        ZALS  0x13
  8B9  0140        ADD   0x40,1
  8BA  5013        SACL  0x13
  8BB  5814        SACH  0x14
  8BC  6012        ADDH  0x12
  8BD  5812        SACH  0x12
  8BE  7F80        NOP
  8BF  4F2A        OUT   0x2A,PA7
  8C0  4436        IN    0x36,PA4
  8C1  4437        IN    0x37,PA4
  8C2  6514        ZALH  0x14
  8C3  FA00 08F7   BLZ   L8F7
  8C5  FC00 08DF   BGZ   L8DF
  8C7  7F89        ZAC
  8C8  6A39        LT    0x39
  8C9  6D1E        MPY   0x1E
  8CA  6B38        LTD   0x38
  8CB  6D1D        MPY   0x1D
  8CC  6B37        LTD   0x37
  8CD  6D1C        MPY   0x1C
  8CE  6B36        LTD   0x36
  8CF  6D1B        MPY   0x1B
  8D0  7F8F        APAC
  8D1  5925        SACH  0x25,1
  8D2  6628        ZALS  0x28
  8D3  0029        ADD   0x29
  8D4  5029        SACL  0x29
  8D5  0028        ADD   0x28
  8D6  5028        SACL  0x28
  8D7  4324        IN    0x24,PA3
  8D8  4B26        OUT   0x26,PA3
  8D9  4B28        OUT   0x28,PA3
  8DA  4A10        OUT   0x10,PA2
  8DB  4F10        OUT   0x10,PA7
  8DC  4C24        OUT   0x24,PA4
  8DD  F900 0911   B     L911

L8DF:
  8DF  7F89        ZAC
  8E0  6A39        LT    0x39
  8E1  6D1E        MPY   0x1E
  8E2  6C38        LTA   0x38
  8E3  6D1D        MPY   0x1D
  8E4  6C37        LTA   0x37
  8E5  6D1C        MPY   0x1C
  8E6  6C36        LTA   0x36
  8E7  6D1B        MPY   0x1B
  8E8  7F8F        APAC
  8E9  5925        SACH  0x25,1
  8EA  6628        ZALS  0x28
  8EB  0029        ADD   0x29
  8EC  5029        SACL  0x29
  8ED  0028        ADD   0x28
  8EE  5028        SACL  0x28
  8EF  4324        IN    0x24,PA3
  8F0  4B26        OUT   0x26,PA3
  8F1  4B28        OUT   0x28,PA3
  8F2  4A10        OUT   0x10,PA2
  8F3  4F10        OUT   0x10,PA7
  8F4  4C24        OUT   0x24,PA4
  8F5  F900 0911   B     L911

L8F7:
  8F7  7F89        ZAC
  8F8  6A39        LT    0x39
  8F9  6D1E        MPY   0x1E
  8FA  6B38        LTD   0x38
  8FB  6D1D        MPY   0x1D
  8FC  6B37        LTD   0x37
  8FD  6D1C        MPY   0x1C
  8FE  6B36        LTD   0x36
  8FF  6D1B        MPY   0x1B
  900  7F8F        APAC
  901  5925        SACH  0x25,1
  902  6938        DMOV  0x38
  903  6937        DMOV  0x37
  904  6628        ZALS  0x28
  905  0029        ADD   0x29
  906  5029        SACL  0x29
  907  0028        ADD   0x28
  908  5028        SACL  0x28
  909  4324        IN    0x24,PA3
  90A  4B26        OUT   0x26,PA3
  90B  4B28        OUT   0x28,PA3
  90C  4A10        OUT   0x10,PA2
  90D  4F10        OUT   0x10,PA7
  90E  4C24        OUT   0x24,PA4
  90F  F900 0911   B     L911

L911:
  911  6925        DMOV  0x25
  912  4506        IN    0x06,PA5
  913  6881        LARP  1
  914  6606        ZALS  0x06
  915  7905        AND   0x05
  916  FE00 091B   BNZ   L91B
  918  6880        LARP  0
  919  F900 091D   B     L91D

L91B:
  91B  3906        LAR   AR1,0x06
  91C  4680        IN    *,PA6,AR0
L91D:
  91D  4135        IN    0x35,PA1
  91E  6612        ZALS  0x12
  91F  6341        SUBS  0x41
  920  FC00 092F   BGZ   L92F
  922  6535        ZALH  0x35
  923  7F88        ABS
  924  5806        SACH  0x06
  925  7F89        ZAC
  926  6206        SUBH  0x06
  927  5835        SACH  0x35
  928  7F89        ZAC
  929  5827        SACH  0x27
  92A  6612        ZALS  0x12
  92B  1035        SUB   0x35
  92C  5012        SACL  0x12
  92D  F900 0834   B     L834

L92F:
  92F  6335        SUBS  0x35
  930  FA00 093C   BLZ   L93C
  932  6535        ZALH  0x35
  933  7F88        ABS
  934  5835        SACH  0x35
  935  7F89        ZAC
  936  5827        SACH  0x27
  937  6612        ZALS  0x12
  938  1035        SUB   0x35
  939  5012        SACL  0x12
  93A  F900 0834   B     L834

L93C:
  93C  7F80        NOP
  93D  7F80        NOP
  93E  7F80        NOP
  93F  7F80        NOP
  940  7F80        NOP
  941  7F80        NOP
  942  7F80        NOP
  943  7F80        NOP
  944  F900 08A6   B     L8A6

  946  7FFF        .word 0x7FFF
  947  0000        ADD   0x00
  948  0000        ADD   0x00
  949  0000        ADD   0x00
  94A  7F7F        .word 0x7F7F
  94B  0080        ADD   *,0,AR0
  94C  0000        ADD   0x00
  94D  0000        ADD   0x00
  94E  7EFF        LACK  0xFF
  94F  0100        ADD   0x00,1
  950  0000        ADD   0x00
  951  0000        ADD   0x00
  952  7E7F        LACK  0x7F
  953  0180        ADD   *,1,AR0
  954  0000        ADD   0x00
  955  0000        ADD   0x00
  956  7DFF        TBLW  *+-
  957  0200        ADD   0x00,2
  958  0000        ADD   0x00
  959  0000        ADD   0x00
  95A  7D7F        TBLW  0x7F
  95B  0280        ADD   *,2,AR0
  95C  0000        ADD   0x00
  95D  0000        ADD   0x00
  95E  7CFF        SST   *+-
  95F  0300        ADD   0x00,3
  960  0000        ADD   0x00
  961  0000        ADD   0x00
  962  7C7F        SST   0xFF
  963  0380        ADD   *,3,AR0
  964  0000        ADD   0x00
  965  0000        ADD   0x00
  966  7BFF        LST   *+-
  967  0400        ADD   0x00,4
  968  0000        ADD   0x00
  969  0000        ADD   0x00
  96A  7B7F        LST   0x7F
  96B  0480        ADD   *,4,AR0
  96C  0000        ADD   0x00
  96D  0000        ADD   0x00
  96E  7AFF        OR    *+-
  96F  0500        ADD   0x00,5
  970  0000        ADD   0x00
  971  0000        ADD   0x00
  972  7A7F        OR    0x7F
  973  0580        ADD   *,5,AR0
  974  0000        ADD   0x00
  975  0000        ADD   0x00
  976  79FF        AND   *+-
  977  0600        ADD   0x00,6
  978  0000        ADD   0x00
  979  0000        ADD   0x00
  97A  797F        AND   0x7F
  97B  0680        ADD   *,6,AR0
  97C  0000        ADD   0x00
  97D  0000        ADD   0x00
  97E  78FF        XOR   *+-
  97F  0700        ADD   0x00,7
  980  0000        ADD   0x00
  981  0000        ADD   0x00
  982  787F        XOR   0x7F
  983  0780        ADD   *,7,AR0
  984  0000        ADD   0x00
  985  0000        ADD   0x00
  986  77FF        .word 0x77FF
  987  0800        ADD   0x00,8
  988  0000        ADD   0x00
  989  0000        ADD   0x00
  98A  777F        .word 0x777F
  98B  0880        ADD   *,8,AR0
  98C  0000        ADD   0x00
  98D  0000        ADD   0x00
  98E  76FF        .word 0x76FF
  98F  0900        ADD   0x00,9
  990  0000        ADD   0x00
  991  0000        ADD   0x00
  992  767F        .word 0x767F
  993  0980        ADD   *,9,AR0
  994  0000        ADD   0x00
  995  0000        ADD   0x00
  996  75FF        .word 0x75FF
  997  0A00        ADD   0x00,10
  998  0000        ADD   0x00
  999  0000        ADD   0x00
  99A  757F        .word 0x757F
  99B  0A80        ADD   *,10,AR0
  99C  0000        ADD   0x00
  99D  0000        ADD   0x00
  99E  74FF        .word 0x74FF
  99F  0B00        ADD   0x00,11
  9A0  0000        ADD   0x00
  9A1  0000        ADD   0x00
  9A2  747F        .word 0x747F
  9A3  0B80        ADD   *,11,AR0
  9A4  0000        ADD   0x00
  9A5  0000        ADD   0x00
  9A6  73FF        .word 0x73FF
  9A7  0C00        ADD   0x00,12
  9A8  0000        ADD   0x00
  9A9  0000        ADD   0x00
  9AA  737F        .word 0x737F
  9AB  0C80        ADD   *,12,AR0
  9AC  0000        ADD   0x00
  9AD  0000        ADD   0x00
  9AE  72FF        .word 0x72FF
  9AF  0D00        ADD   0x00,13
  9B0  0000        ADD   0x00
  9B1  0000        ADD   0x00
  9B2  727F        .word 0x727F
  9B3  0D80        ADD   *,13,AR0
  9B4  0000        ADD   0x00
  9B5  0000        ADD   0x00
  9B6  71FF        LARK  AR1,0xFF
  9B7  0E00        ADD   0x00,14
  9B8  0000        ADD   0x00
  9B9  0000        ADD   0x00
  9BA  717F        LARK  AR1,0x7F
  9BB  0E80        ADD   *,14,AR0
  9BC  0000        ADD   0x00
  9BD  0000        ADD   0x00
  9BE  70FF        LARK  AR0,0xFF
  9BF  0F00        ADD   0x00,15
  9C0  0000        ADD   0x00
  9C1  0000        ADD   0x00
  9C2  707F        LARK  AR0,0x7F
  9C3  0F80        ADD   *,15,AR0
  9C4  0000        ADD   0x00
  9C5  0000        ADD   0x00
  9C6  6FFF        LDP   *+-
  9C7  1000        SUB   0x00
  9C8  0000        ADD   0x00
  9C9  0000        ADD   0x00
  9CA  6F7F        LDP   0x7F
  9CB  1080        SUB   *,0,AR0
  9CC  0000        ADD   0x00
  9CD  0000        ADD   0x00
  9CE  6EFF        .word 0x6EFF
  9CF  1100        SUB   0x00,1
  9D0  0000        ADD   0x00
  9D1  0000        ADD   0x00
  9D2  6E7F        .word 0x6E7F
  9D3  1180        SUB   *,1,AR0
  9D4  0000        ADD   0x00
  9D5  0000        ADD   0x00
  9D6  6DFF        MPY   *+-
  9D7  1200        SUB   0x00,2
  9D8  0000        ADD   0x00
  9D9  0000        ADD   0x00
  9DA  6D7F        MPY   0x7F
  9DB  1280        SUB   *,2,AR0
  9DC  0000        ADD   0x00
  9DD  0000        ADD   0x00
  9DE  6CFF        LTA   *+-
  9DF  1300        SUB   0x00,3
  9E0  0000        ADD   0x00
  9E1  0000        ADD   0x00
  9E2  6C7F        LTA   0x7F
  9E3  1380        SUB   *,3,AR0
  9E4  0000        ADD   0x00
  9E5  0000        ADD   0x00
  9E6  6BFF        LTD   *+-
  9E7  1400        SUB   0x00,4
  9E8  0000        ADD   0x00
  9E9  0000        ADD   0x00
  9EA  6B7F        LTD   0x7F
  9EB  1480        SUB   *,4,AR0
  9EC  0000        ADD   0x00
  9ED  0000        ADD   0x00
  9EE  6AFF        LT    *+-
  9EF  1500        SUB   0x00,5
  9F0  0000        ADD   0x00
  9F1  0000        ADD   0x00
  9F2  6A7F        LT    0x7F
  9F3  1580        SUB   *,5,AR0
  9F4  0000        ADD   0x00
  9F5  0000        ADD   0x00
  9F6  69FF        DMOV  *+-
  9F7  1600        SUB   0x00,6
  9F8  0000        ADD   0x00
  9F9  0000        ADD   0x00
  9FA  697F        DMOV  0x7F
  9FB  1680        SUB   *,6,AR0
  9FC  0000        ADD   0x00
  9FD  0000        ADD   0x00
  9FE  68FF        MAR   *+-
  9FF  1700        SUB   0x00,7
  A00  0000        ADD   0x00
  A01  0000        ADD   0x00
  A02  687F        MAR   0x7F
  A03  1780        SUB   *,7,AR0
  A04  0000        ADD   0x00
  A05  0000        ADD   0x00
  A06  67FF        TBLR  *+-
  A07  1800        SUB   0x00,8
  A08  0000        ADD   0x00
  A09  0000        ADD   0x00
  A0A  677F        TBLR  0x7F
  A0B  1880        SUB   *,8,AR0
  A0C  0000        ADD   0x00
  A0D  0000        ADD   0x00
  A0E  66FF        ZALS  *+-
  A0F  1900        SUB   0x00,9
  A10  0000        ADD   0x00
  A11  0000        ADD   0x00
  A12  667F        ZALS  0x7F
  A13  1980        SUB   *,9,AR0
  A14  0000        ADD   0x00
  A15  0000        ADD   0x00
  A16  65FF        ZALH  *+-
  A17  1A00        SUB   0x00,10
  A18  0000        ADD   0x00
  A19  0000        ADD   0x00
  A1A  657F        ZALH  0x7F
  A1B  1A80        SUB   *,10,AR0
  A1C  0000        ADD   0x00
  A1D  0000        ADD   0x00
  A1E  64FF        SUBC  *+-
  A1F  1B00        SUB   0x00,11
  A20  0000        ADD   0x00
  A21  0000        ADD   0x00
  A22  647F        SUBC  0x7F
  A23  1B80        SUB   *,11,AR0
  A24  0000        ADD   0x00
  A25  0000        ADD   0x00
  A26  63FF        SUBS  *+-
  A27  1C00        SUB   0x00,12
  A28  0000        ADD   0x00
  A29  0000        ADD   0x00
  A2A  637F        SUBS  0x7F
  A2B  1C80        SUB   *,12,AR0
  A2C  0000        ADD   0x00
  A2D  0000        ADD   0x00
  A2E  62FF        SUBH  *+-
  A2F  1D00        SUB   0x00,13
  A30  0000        ADD   0x00
  A31  0000        ADD   0x00
  A32  627F        SUBH  0x7F
  A33  1D80        SUB   *,13,AR0
  A34  0000        ADD   0x00
  A35  0000        ADD   0x00
  A36  61FF        ADDS  *+-
  A37  1E00        SUB   0x00,14
  A38  0000        ADD   0x00
  A39  0000        ADD   0x00
  A3A  617F        ADDS  0x7F
  A3B  1E80        SUB   *,14,AR0
  A3C  0000        ADD   0x00
  A3D  0000        ADD   0x00
  A3E  60FF        ADDH  *+-
  A3F  1F00        SUB   0x00,15
  A40  0000        ADD   0x00
  A41  0000        ADD   0x00
  A42  607F        ADDH  0x7F
  A43  1F80        SUB   *,15,AR0
  A44  0000        ADD   0x00
  A45  0000        ADD   0x00
  A46  5FFF        SACH  *+-,7
  A47  2000        LAC   0x00
  A48  0000        ADD   0x00
  A49  0000        ADD   0x00
  A4A  5F7F        SACH  0x7F,7
  A4B  2080        LAC   *,0,AR0
  A4C  0000        ADD   0x00
  A4D  0000        ADD   0x00
  A4E  5EFF        SACH  *+-,6
  A4F  2100        LAC   0x00,1
  A50  0000        ADD   0x00
  A51  0000        ADD   0x00
  A52  5E7F        SACH  0x7F,6
  A53  2180        LAC   *,1,AR0
  A54  0000        ADD   0x00
  A55  0000        ADD   0x00
  A56  5DFF        SACH  *+-,5
  A57  2200        LAC   0x00,2
  A58  0000        ADD   0x00
  A59  0000        ADD   0x00
  A5A  5D7F        SACH  0x7F,5
  A5B  2280        LAC   *,2,AR0
  A5C  0000        ADD   0x00
  A5D  0000        ADD   0x00
  A5E  5CFF        SACH  *+-,4
  A5F  2300        LAC   0x00,3
  A60  0000        ADD   0x00
  A61  0000        ADD   0x00
  A62  5C7F        SACH  0x7F,4
  A63  2380        LAC   *,3,AR0
  A64  0000        ADD   0x00
  A65  0000        ADD   0x00
  A66  5BFF        SACH  *+-,3
  A67  2400        LAC   0x00,4
  A68  0000        ADD   0x00
  A69  0000        ADD   0x00
  A6A  5B7F        SACH  0x7F,3
  A6B  2480        LAC   *,4,AR0
  A6C  0000        ADD   0x00
  A6D  0000        ADD   0x00
  A6E  5AFF        SACH  *+-,2
  A6F  2500        LAC   0x00,5
  A70  0000        ADD   0x00
  A71  0000        ADD   0x00
  A72  5A7F        SACH  0x7F,2
  A73  2580        LAC   *,5,AR0
  A74  0000        ADD   0x00
  A75  0000        ADD   0x00
  A76  59FF        SACH  *+-,1
  A77  2600        LAC   0x00,6
  A78  0000        ADD   0x00
  A79  0000        ADD   0x00
  A7A  597F        SACH  0x7F,1
  A7B  2680        LAC   *,6,AR0
  A7C  0000        ADD   0x00
  A7D  0000        ADD   0x00
  A7E  58FF        SACH  *+-
  A7F  2700        LAC   0x00,7
  A80  0000        ADD   0x00
  A81  0000        ADD   0x00
  A82  587F        SACH  0x7F
  A83  2780        LAC   *,7,AR0
  A84  0000        ADD   0x00
  A85  0000        ADD   0x00
  A86  57FF        SACL  *+-
  A87  2800        LAC   0x00,8
  A88  0000        ADD   0x00
  A89  0000        ADD   0x00
  A8A  577F        SACL  0x7F
  A8B  2880        LAC   *,8,AR0
  A8C  0000        ADD   0x00
  A8D  0000        ADD   0x00
  A8E  56FF        SACL  *+-
  A8F  2900        LAC   0x00,9
  A90  0000        ADD   0x00
  A91  0000        ADD   0x00
  A92  567F        SACL  0x7F
  A93  2980        LAC   *,9,AR0
  A94  0000        ADD   0x00
  A95  0000        ADD   0x00
  A96  55FF        SACL  *+-
  A97  2A00        LAC   0x00,10
  A98  0000        ADD   0x00
  A99  0000        ADD   0x00
  A9A  557F        SACL  0x7F
  A9B  2A80        LAC   *,10,AR0
  A9C  0000        ADD   0x00
  A9D  0000        ADD   0x00
  A9E  54FF        SACL  *+-
  A9F  2B00        LAC   0x00,11
  AA0  0000        ADD   0x00
  AA1  0000        ADD   0x00
  AA2  547F        SACL  0x7F
  AA3  2B80        LAC   *,11,AR0
  AA4  0000        ADD   0x00
  AA5  0000        ADD   0x00
  AA6  53FF        SACL  *+-
  AA7  2C00        LAC   0x00,12
  AA8  0000        ADD   0x00
  AA9  0000        ADD   0x00
  AAA  537F        SACL  0x7F
  AAB  2C80        LAC   *,12,AR0
  AAC  0000        ADD   0x00
  AAD  0000        ADD   0x00
  AAE  52FF        SACL  *+-
  AAF  2D00        LAC   0x00,13
  AB0  0000        ADD   0x00
  AB1  0000        ADD   0x00
  AB2  527F        SACL  0x7F
  AB3  2D80        LAC   *,13,AR0
  AB4  0000        ADD   0x00
  AB5  0000        ADD   0x00
  AB6  51FF        SACL  *+-
  AB7  2E00        LAC   0x00,14
  AB8  0000        ADD   0x00
  AB9  0000        ADD   0x00
  ABA  517F        SACL  0x7F
  ABB  2E80        LAC   *,14,AR0
  ABC  0000        ADD   0x00
  ABD  0000        ADD   0x00
  ABE  50FF        SACL  *+-
  ABF  2F00        LAC   0x00,15
  AC0  0000        ADD   0x00
  AC1  0000        ADD   0x00
  AC2  507F        SACL  0x7F
  AC3  2F80        LAC   *,15,AR0
  AC4  0000        ADD   0x00
  AC5  0000        ADD   0x00
  AC6  4FFF        OUT   *+-,PA7
  AC7  3000        SAR   AR0,0x00
  AC8  0000        ADD   0x00
  AC9  0000        ADD   0x00
  ACA  4F7F        OUT   0x7F,PA7
  ACB  3080        SAR   AR0,*,AR0
  ACC  0000        ADD   0x00
  ACD  0000        ADD   0x00
  ACE  4EFF        OUT   *+-,PA6
  ACF  3100        SAR   AR1,0x00
  AD0  0000        ADD   0x00
  AD1  0000        ADD   0x00
  AD2  4E7F        OUT   0x7F,PA6
  AD3  3180        SAR   AR1,*,AR0
  AD4  0000        ADD   0x00
  AD5  0000        ADD   0x00
  AD6  4DFF        OUT   *+-,PA5
  AD7  3200        .word 0x3200
  AD8  0000        ADD   0x00
  AD9  0000        ADD   0x00
  ADA  4D7F        OUT   0x7F,PA5
  ADB  3280        .word 0x3280
  ADC  0000        ADD   0x00
  ADD  0000        ADD   0x00
  ADE  4CFF        OUT   *+-,PA4
  ADF  3300        .word 0x3300
  AE0  0000        ADD   0x00
  AE1  0000        ADD   0x00
  AE2  4C7F        OUT   0x7F,PA4
  AE3  3380        .word 0x3380
  AE4  0000        ADD   0x00
  AE5  0000        ADD   0x00
  AE6  4BFF        OUT   *+-,PA3
  AE7  3400        .word 0x3400
  AE8  0000        ADD   0x00
  AE9  0000        ADD   0x00
  AEA  4B7F        OUT   0x7F,PA3
  AEB  3480        .word 0x3480
  AEC  0000        ADD   0x00
  AED  0000        ADD   0x00
  AEE  4AFF        OUT   *+-,PA2
  AEF  3500        .word 0x3500
  AF0  0000        ADD   0x00
  AF1  0000        ADD   0x00
  AF2  4A7F        OUT   0x7F,PA2
  AF3  3580        .word 0x3580
  AF4  0000        ADD   0x00
  AF5  0000        ADD   0x00
  AF6  49FF        OUT   *+-,PA1
  AF7  3600        .word 0x3600
  AF8  0000        ADD   0x00
  AF9  0000        ADD   0x00
  AFA  497F        OUT   0x7F,PA1
  AFB  3680        .word 0x3680
  AFC  0000        ADD   0x00
  AFD  0000        ADD   0x00
  AFE  48FF        OUT   *+-,PA0
  AFF  3700        .word 0x3700
  B00  0000        ADD   0x00
  B01  0000        ADD   0x00
  B02  487F        OUT   0x7F,PA0
  B03  3780        .word 0x3780
  B04  0000        ADD   0x00
  B05  0000        ADD   0x00
  B06  47FF        IN    *+-,PA7
  B07  3800        LAR   AR0,0x00
  B08  0000        ADD   0x00
  B09  0000        ADD   0x00
  B0A  477F        IN    0x7F,PA7
  B0B  3880        LAR   AR0,*,AR0
  B0C  0000        ADD   0x00
  B0D  0000        ADD   0x00
  B0E  46FF        IN    *+-,PA6
  B0F  3900        LAR   AR1,0x00
  B10  0000        ADD   0x00
  B11  0000        ADD   0x00
  B12  467F        IN    0x7F,PA6
  B13  3980        LAR   AR1,*,AR0
  B14  0000        ADD   0x00
  B15  0000        ADD   0x00
  B16  45FF        IN    *+-,PA5
  B17  3A00        .word 0x3A00
  B18  0000        ADD   0x00
  B19  0000        ADD   0x00
  B1A  457F        IN    0x7F,PA5
  B1B  3A80        .word 0x3A80
  B1C  0000        ADD   0x00
  B1D  0000        ADD   0x00
  B1E  44FF        IN    *+-,PA4
  B1F  3B00        .word 0x3B00
  B20  0000        ADD   0x00
  B21  0000        ADD   0x00
  B22  447F        IN    0x7F,PA4
  B23  3B80        .word 0x3B80
  B24  0000        ADD   0x00
  B25  0000        ADD   0x00
  B26  43FF        IN    *+-,PA3
  B27  3C00        .word 0x3C00
  B28  0000        ADD   0x00
  B29  0000        ADD   0x00
  B2A  437F        IN    0x7F,PA3
  B2B  3C80        .word 0x3C80
  B2C  0000        ADD   0x00
  B2D  0000        ADD   0x00
  B2E  42FF        IN    *+-,PA2
  B2F  3D00        .word 0x3D00
  B30  0000        ADD   0x00
  B31  0000        ADD   0x00
  B32  427F        IN    0x7F,PA2
  B33  3D80        .word 0x3D80
  B34  0000        ADD   0x00
  B35  0000        ADD   0x00
  B36  41FF        IN    *+-,PA1
  B37  3E00        .word 0x3E00
  B38  0000        ADD   0x00
  B39  0000        ADD   0x00
  B3A  417F        IN    0x7F,PA1
  B3B  3E80        .word 0x3E80
  B3C  0000        ADD   0x00
  B3D  0000        ADD   0x00
  B3E  40FF        IN    *+-,PA0
  B3F  3F00        .word 0x3F00
  B40  0000        ADD   0x00
  B41  0000        ADD   0x00
  B42  407F        IN    0x7F,PA0
  B43  3F80        .word 0x3F80
  B44  0000        ADD   0x00
  B45  0000        ADD   0x00
  B46  4000        IN    0x00,PA0
  B47  4000        IN    0x00,PA0
  B48  0000        ADD   0x00
  B49  0000        ADD   0x00
  B4A  3F80        .word 0x3F80
  B4B  407F        IN    0x7F,PA0
  B4C  0000        ADD   0x00
  B4D  0000        ADD   0x00
  B4E  3F00        .word 0x3F00
  B4F  40FF        IN    *+-,PA0
  B50  0000        ADD   0x00
  B51  0000        ADD   0x00
  B52  3E80        .word 0x3E80
  B53  417F        IN    0x7F,PA1
  B54  0000        ADD   0x00
  B55  0000        ADD   0x00
  B56  3E00        .word 0x3E00
  B57  41FF        IN    *+-,PA1
  B58  0000        ADD   0x00
  B59  0000        ADD   0x00
  B5A  3D80        .word 0x3D80
  B5B  427F        IN    0x7F,PA2
  B5C  0000        ADD   0x00
  B5D  0000        ADD   0x00
  B5E  3D00        .word 0x3D00
  B5F  42FF        IN    *+-,PA2
  B60  0000        ADD   0x00
  B61  0000        ADD   0x00
  B62  3C80        .word 0x3C80
  B63  437F        IN    0x7F,PA3
  B64  0000        ADD   0x00
  B65  0000        ADD   0x00
  B66  3C00        .word 0x3C00
  B67  43FF        IN    *+-,PA3
  B68  0000        ADD   0x00
  B69  0000        ADD   0x00
  B6A  3B80        .word 0x3B80
  B6B  447F        IN    0x7F,PA4
  B6C  0000        ADD   0x00
  B6D  0000        ADD   0x00
  B6E  3B00        .word 0x3B00
  B6F  44FF        IN    *+-,PA4
  B70  0000        ADD   0x00
  B71  0000        ADD   0x00
  B72  3A80        .word 0x3A80
  B73  457F        IN    0x7F,PA5
  B74  0000        ADD   0x00
  B75  0000        ADD   0x00
  B76  3A00        .word 0x3A00
  B77  45FF        IN    *+-,PA5
  B78  0000        ADD   0x00
  B79  0000        ADD   0x00
  B7A  3980        LAR   AR1,*,AR0
  B7B  467F        IN    0x7F,PA6
  B7C  0000        ADD   0x00
  B7D  0000        ADD   0x00
  B7E  3900        LAR   AR1,0x00
  B7F  46FF        IN    *+-,PA6
  B80  0000        ADD   0x00
  B81  0000        ADD   0x00
  B82  3880        LAR   AR0,*,AR0
  B83  477F        IN    0x7F,PA7
  B84  0000        ADD   0x00
  B85  0000        ADD   0x00
  B86  3800        LAR   AR0,0x00
  B87  47FF        IN    *+-,PA7
  B88  0000        ADD   0x00
  B89  0000        ADD   0x00
  B8A  3780        .word 0x3780
  B8B  487F        OUT   0x7F,PA0
  B8C  0000        ADD   0x00
  B8D  0000        ADD   0x00
  B8E  3700        .word 0x3700
  B8F  48FF        OUT   *+-,PA0
  B90  0000        ADD   0x00
  B91  0000        ADD   0x00
  B92  3680        .word 0x3680
  B93  497F        OUT   0x7F,PA1
  B94  0000        ADD   0x00
  B95  0000        ADD   0x00
  B96  3600        .word 0x3600
  B97  49FF        OUT   *+-,PA1
  B98  0000        ADD   0x00
  B99  0000        ADD   0x00
  B9A  3580        .word 0x3580
  B9B  4A7F        OUT   0x7F,PA2
  B9C  0000        ADD   0x00
  B9D  0000        ADD   0x00
  B9E  3500        .word 0x3500
  B9F  4AFF        OUT   *+-,PA2
  BA0  0000        ADD   0x00
  BA1  0000        ADD   0x00
  BA2  3480        .word 0x3480
  BA3  4B7F        OUT   0x7F,PA3
  BA4  0000        ADD   0x00
  BA5  0000        ADD   0x00
  BA6  3400        .word 0x3400
  BA7  4BFF        OUT   *+-,PA3
  BA8  0000        ADD   0x00
  BA9  0000        ADD   0x00
  BAA  3380        .word 0x3380
  BAB  4C7F        OUT   0x7F,PA4
  BAC  0000        ADD   0x00
  BAD  0000        ADD   0x00
  BAE  3300        .word 0x3300
  BAF  4CFF        OUT   *+-,PA4
  BB0  0000        ADD   0x00
  BB1  0000        ADD   0x00
  BB2  3280        .word 0x3280
  BB3  4D7F        OUT   0x7F,PA5
  BB4  0000        ADD   0x00
  BB5  0000        ADD   0x00
  BB6  3200        .word 0x3200
  BB7  4DFF        OUT   *+-,PA5
  BB8  0000        ADD   0x00
  BB9  0000        ADD   0x00
  BBA  3180        SAR   AR1,*,AR0
  BBB  4E7F        OUT   0x7F,PA6
  BBC  0000        ADD   0x00
  BBD  0000        ADD   0x00
  BBE  3100        SAR   AR1,0x00
  BBF  4EFF        OUT   *+-,PA6
  BC0  0000        ADD   0x00
  BC1  0000        ADD   0x00
  BC2  3080        SAR   AR0,*,AR0
  BC3  4F7F        OUT   0x7F,PA7
  BC4  0000        ADD   0x00
  BC5  0000        ADD   0x00
  BC6  3000        SAR   AR0,0x00
  BC7  4FFF        OUT   *+-,PA7
  BC8  0000        ADD   0x00
  BC9  0000        ADD   0x00
  BCA  2F80        LAC   *,15,AR0
  BCB  507F        SACL  0x7F
  BCC  0000        ADD   0x00
  BCD  0000        ADD   0x00
  BCE  2F00        LAC   0x00,15
  BCF  50FF        SACL  *+-
  BD0  0000        ADD   0x00
  BD1  0000        ADD   0x00
  BD2  2E80        LAC   *,14,AR0
  BD3  517F        SACL  0x7F
  BD4  0000        ADD   0x00
  BD5  0000        ADD   0x00
  BD6  2E00        LAC   0x00,14
  BD7  51FF        SACL  *+-
  BD8  0000        ADD   0x00
  BD9  0000        ADD   0x00
  BDA  2D80        LAC   *,13,AR0
  BDB  527F        SACL  0x7F
  BDC  0000        ADD   0x00
  BDD  0000        ADD   0x00
  BDE  2D00        LAC   0x00,13
  BDF  52FF        SACL  *+-
  BE0  0000        ADD   0x00
  BE1  0000        ADD   0x00
  BE2  2C80        LAC   *,12,AR0
  BE3  537F        SACL  0x7F
  BE4  0000        ADD   0x00
  BE5  0000        ADD   0x00
  BE6  2C00        LAC   0x00,12
  BE7  53FF        SACL  *+-
  BE8  0000        ADD   0x00
  BE9  0000        ADD   0x00
  BEA  2B80        LAC   *,11,AR0
  BEB  547F        SACL  0x7F
  BEC  0000        ADD   0x00
  BED  0000        ADD   0x00
  BEE  2B00        LAC   0x00,11
  BEF  54FF        SACL  *+-
  BF0  0000        ADD   0x00
  BF1  0000        ADD   0x00
  BF2  2A80        LAC   *,10,AR0
  BF3  557F        SACL  0x7F
  BF4  0000        ADD   0x00
  BF5  0000        ADD   0x00
  BF6  2A00        LAC   0x00,10
  BF7  55FF        SACL  *+-
  BF8  0000        ADD   0x00
  BF9  0000        ADD   0x00
  BFA  2980        LAC   *,9,AR0
  BFB  567F        SACL  0x7F
  BFC  0000        ADD   0x00
  BFD  0000        ADD   0x00
  BFE  2900        LAC   0x00,9
  BFF  56FF        SACL  *+-
  C00  0000        ADD   0x00
  C01  0000        ADD   0x00
  C02  2880        LAC   *,8,AR0
  C03  577F        SACL  0x7F
  C04  0000        ADD   0x00
  C05  0000        ADD   0x00
  C06  2800        LAC   0x00,8
  C07  57FF        SACL  *+-
  C08  0000        ADD   0x00
  C09  0000        ADD   0x00
  C0A  2780        LAC   *,7,AR0
  C0B  587F        SACH  0x7F
  C0C  0000        ADD   0x00
  C0D  0000        ADD   0x00
  C0E  2700        LAC   0x00,7
  C0F  58FF        SACH  *+-
  C10  0000        ADD   0x00
  C11  0000        ADD   0x00
  C12  2680        LAC   *,6,AR0
  C13  597F        SACH  0x7F,1
  C14  0000        ADD   0x00
  C15  0000        ADD   0x00
  C16  2600        LAC   0x00,6
  C17  59FF        SACH  *+-,1
  C18  0000        ADD   0x00
  C19  0000        ADD   0x00
  C1A  2580        LAC   *,5,AR0
  C1B  5A7F        SACH  0x7F,2
  C1C  0000        ADD   0x00
  C1D  0000        ADD   0x00
  C1E  2500        LAC   0x00,5
  C1F  5AFF        SACH  *+-,2
  C20  0000        ADD   0x00
  C21  0000        ADD   0x00
  C22  2480        LAC   *,4,AR0
  C23  5B7F        SACH  0x7F,3
  C24  0000        ADD   0x00
  C25  0000        ADD   0x00
  C26  2400        LAC   0x00,4
  C27  5BFF        SACH  *+-,3
  C28  0000        ADD   0x00
  C29  0000        ADD   0x00
  C2A  2380        LAC   *,3,AR0
  C2B  5C7F        SACH  0x7F,4
  C2C  0000        ADD   0x00
  C2D  0000        ADD   0x00
  C2E  2300        LAC   0x00,3
  C2F  5CFF        SACH  *+-,4
  C30  0000        ADD   0x00
  C31  0000        ADD   0x00
  C32  2280        LAC   *,2,AR0
  C33  5D7F        SACH  0x7F,5
  C34  0000        ADD   0x00
  C35  0000        ADD   0x00
  C36  2200        LAC   0x00,2
  C37  5DFF        SACH  *+-,5
  C38  0000        ADD   0x00
  C39  0000        ADD   0x00
  C3A  2180        LAC   *,1,AR0
  C3B  5E7F        SACH  0x7F,6
  C3C  0000        ADD   0x00
  C3D  0000        ADD   0x00
  C3E  2100        LAC   0x00,1
  C3F  5EFF        SACH  *+-,6
  C40  0000        ADD   0x00
  C41  0000        ADD   0x00
  C42  2080        LAC   *,0,AR0
  C43  5F7F        SACH  0x7F,7
  C44  0000        ADD   0x00
  C45  0000        ADD   0x00
  C46  2000        LAC   0x00
  C47  5FFF        SACH  *+-,7
  C48  0000        ADD   0x00
  C49  0000        ADD   0x00
  C4A  1F80        SUB   *,15,AR0
  C4B  607F        ADDH  0x7F
  C4C  0000        ADD   0x00
  C4D  0000        ADD   0x00
  C4E  1F00        SUB   0x00,15
  C4F  60FF        ADDH  *+-
  C50  0000        ADD   0x00
  C51  0000        ADD   0x00
  C52  1E80        SUB   *,14,AR0
  C53  617F        ADDS  0x7F
  C54  0000        ADD   0x00
  C55  0000        ADD   0x00
  C56  1E00        SUB   0x00,14
  C57  61FF        ADDS  *+-
  C58  0000        ADD   0x00
  C59  0000        ADD   0x00
  C5A  1D80        SUB   *,13,AR0
  C5B  627F        SUBH  0x7F
  C5C  0000        ADD   0x00
  C5D  0000        ADD   0x00
  C5E  1D00        SUB   0x00,13
  C5F  62FF        SUBH  *+-
  C60  0000        ADD   0x00
  C61  0000        ADD   0x00
  C62  1C80        SUB   *,12,AR0
  C63  637F        SUBS  0x7F
  C64  0000        ADD   0x00
  C65  0000        ADD   0x00
  C66  1C00        SUB   0x00,12
  C67  63FF        SUBS  *+-
  C68  0000        ADD   0x00
  C69  0000        ADD   0x00
  C6A  1B80        SUB   *,11,AR0
  C6B  647F        SUBC  0x7F
  C6C  0000        ADD   0x00
  C6D  0000        ADD   0x00
  C6E  1B00        SUB   0x00,11
  C6F  64FF        SUBC  *+-
  C70  0000        ADD   0x00
  C71  0000        ADD   0x00
  C72  1A80        SUB   *,10,AR0
  C73  657F        ZALH  0x7F
  C74  0000        ADD   0x00
  C75  0000        ADD   0x00
  C76  1A00        SUB   0x00,10
  C77  65FF        ZALH  *+-
  C78  0000        ADD   0x00
  C79  0000        ADD   0x00
  C7A  1980        SUB   *,9,AR0
  C7B  667F        ZALS  0x7F
  C7C  0000        ADD   0x00
  C7D  0000        ADD   0x00
  C7E  1900        SUB   0x00,9
  C7F  66FF        ZALS  *+-
  C80  0000        ADD   0x00
  C81  0000        ADD   0x00
  C82  1880        SUB   *,8,AR0
  C83  677F        TBLR  0x7F
  C84  0000        ADD   0x00
  C85  0000        ADD   0x00
  C86  1800        SUB   0x00,8
  C87  67FF        TBLR  *+-
  C88  0000        ADD   0x00
  C89  0000        ADD   0x00
  C8A  1780        SUB   *,7,AR0
  C8B  687F        MAR   0x7F
  C8C  0000        ADD   0x00
  C8D  0000        ADD   0x00
  C8E  1700        SUB   0x00,7
  C8F  68FF        MAR   *+-
  C90  0000        ADD   0x00
  C91  0000        ADD   0x00
  C92  1680        SUB   *,6,AR0
  C93  697F        DMOV  0x7F
  C94  0000        ADD   0x00
  C95  0000        ADD   0x00
  C96  1600        SUB   0x00,6
  C97  69FF        DMOV  *+-
  C98  0000        ADD   0x00
  C99  0000        ADD   0x00
  C9A  1580        SUB   *,5,AR0
  C9B  6A7F        LT    0x7F
  C9C  0000        ADD   0x00
  C9D  0000        ADD   0x00
  C9E  1500        SUB   0x00,5
  C9F  6AFF        LT    *+-
  CA0  0000        ADD   0x00
  CA1  0000        ADD   0x00
  CA2  1480        SUB   *,4,AR0
  CA3  6B7F        LTD   0x7F
  CA4  0000        ADD   0x00
  CA5  0000        ADD   0x00
  CA6  1400        SUB   0x00,4
  CA7  6BFF        LTD   *+-
  CA8  0000        ADD   0x00
  CA9  0000        ADD   0x00
  CAA  1380        SUB   *,3,AR0
  CAB  6C7F        LTA   0x7F
  CAC  0000        ADD   0x00
  CAD  0000        ADD   0x00
  CAE  1300        SUB   0x00,3
  CAF  6CFF        LTA   *+-
  CB0  0000        ADD   0x00
  CB1  0000        ADD   0x00
  CB2  1280        SUB   *,2,AR0
  CB3  6D7F        MPY   0x7F
  CB4  0000        ADD   0x00
  CB5  0000        ADD   0x00
  CB6  1200        SUB   0x00,2
  CB7  6DFF        MPY   *+-
  CB8  0000        ADD   0x00
  CB9  0000        ADD   0x00
  CBA  1180        SUB   *,1,AR0
  CBB  6E7F        .word 0x6E7F
  CBC  0000        ADD   0x00
  CBD  0000        ADD   0x00
  CBE  1100        SUB   0x00,1
  CBF  6EFF        .word 0x6EFF
  CC0  0000        ADD   0x00
  CC1  0000        ADD   0x00
  CC2  1080        SUB   *,0,AR0
  CC3  6F7F        LDP   0x7F
  CC4  0000        ADD   0x00
  CC5  0000        ADD   0x00
  CC6  1000        SUB   0x00
  CC7  6FFF        LDP   *+-
  CC8  0000        ADD   0x00
  CC9  0000        ADD   0x00
  CCA  0F80        ADD   *,15,AR0
  CCB  707F        LARK  AR0,0x7F
  CCC  0000        ADD   0x00
  CCD  0000        ADD   0x00
  CCE  0F00        ADD   0x00,15
  CCF  70FF        LARK  AR0,0xFF
  CD0  0000        ADD   0x00
  CD1  0000        ADD   0x00
  CD2  0E80        ADD   *,14,AR0
  CD3  717F        LARK  AR1,0x7F
  CD4  0000        ADD   0x00
  CD5  0000        ADD   0x00
  CD6  0E00        ADD   0x00,14
  CD7  71FF        LARK  AR1,0xFF
  CD8  0000        ADD   0x00
  CD9  0000        ADD   0x00
  CDA  0D80        ADD   *,13,AR0
  CDB  727F        .word 0x727F
  CDC  0000        ADD   0x00
  CDD  0000        ADD   0x00
  CDE  0D00        ADD   0x00,13
  CDF  72FF        .word 0x72FF
  CE0  0000        ADD   0x00
  CE1  0000        ADD   0x00
  CE2  0C80        ADD   *,12,AR0
  CE3  737F        .word 0x737F
  CE4  0000        ADD   0x00
  CE5  0000        ADD   0x00
  CE6  0C00        ADD   0x00,12
  CE7  73FF        .word 0x73FF
  CE8  0000        ADD   0x00
  CE9  0000        ADD   0x00
  CEA  0B80        ADD   *,11,AR0
  CEB  747F        .word 0x747F
  CEC  0000        ADD   0x00
  CED  0000        ADD   0x00
  CEE  0B00        ADD   0x00,11
  CEF  74FF        .word 0x74FF
  CF0  0000        ADD   0x00
  CF1  0000        ADD   0x00
  CF2  0A80        ADD   *,10,AR0
  CF3  757F        .word 0x757F
  CF4  0000        ADD   0x00
  CF5  0000        ADD   0x00
  CF6  0A00        ADD   0x00,10
  CF7  75FF        .word 0x75FF
  CF8  0000        ADD   0x00
  CF9  0000        ADD   0x00
  CFA  0980        ADD   *,9,AR0
  CFB  767F        .word 0x767F
  CFC  0000        ADD   0x00
  CFD  0000        ADD   0x00
  CFE  0900        ADD   0x00,9
  CFF  76FF        .word 0x76FF
  D00  0000        ADD   0x00
  D01  0000        ADD   0x00
  D02  0880        ADD   *,8,AR0
  D03  777F        .word 0x777F
  D04  0000        ADD   0x00
  D05  0000        ADD   0x00
  D06  0800        ADD   0x00,8
  D07  77FF        .word 0x77FF
  D08  0000        ADD   0x00
  D09  0000        ADD   0x00
  D0A  0780        ADD   *,7,AR0
  D0B  787F        XOR   0x7F
  D0C  0000        ADD   0x00
  D0D  0000        ADD   0x00
  D0E  0700        ADD   0x00,7
  D0F  78FF        XOR   *+-
  D10  0000        ADD   0x00
  D11  0000        ADD   0x00
  D12  0680        ADD   *,6,AR0
  D13  797F        AND   0x7F
  D14  0000        ADD   0x00
  D15  0000        ADD   0x00
  D16  0600        ADD   0x00,6
  D17  79FF        AND   *+-
  D18  0000        ADD   0x00
  D19  0000        ADD   0x00
  D1A  0580        ADD   *,5,AR0
  D1B  7A7F        OR    0x7F
  D1C  0000        ADD   0x00
  D1D  0000        ADD   0x00
  D1E  0500        ADD   0x00,5
  D1F  7AFF        OR    *+-
  D20  0000        ADD   0x00
  D21  0000        ADD   0x00
  D22  0480        ADD   *,4,AR0
  D23  7B7F        LST   0x7F
  D24  0000        ADD   0x00
  D25  0000        ADD   0x00
  D26  0400        ADD   0x00,4
  D27  7BFF        LST   *+-
  D28  0000        ADD   0x00
  D29  0000        ADD   0x00
  D2A  0380        ADD   *,3,AR0
  D2B  7C7F        SST   0xFF
  D2C  0000        ADD   0x00
  D2D  0000        ADD   0x00
  D2E  0300        ADD   0x00,3
  D2F  7CFF        SST   *+-
  D30  0000        ADD   0x00
  D31  0000        ADD   0x00
  D32  0280        ADD   *,2,AR0
  D33  7D7F        TBLW  0x7F
  D34  0000        ADD   0x00
  D35  0000        ADD   0x00
  D36  0200        ADD   0x00,2
  D37  7DFF        TBLW  *+-
  D38  0000        ADD   0x00
  D39  0000        ADD   0x00
  D3A  0180        ADD   *,1,AR0
  D3B  7E7F        LACK  0x7F
  D3C  0000        ADD   0x00
  D3D  0000        ADD   0x00
  D3E  0100        ADD   0x00,1
  D3F  7EFF        LACK  0xFF
  D40  0000        ADD   0x00
  D41  0000        ADD   0x00
  D42  0080        ADD   *,0,AR0
  D43  7F7F        .word 0x7F7F
  D44  0000        ADD   0x00
  D45  0000        ADD   0x00
LD46:
  D46  F600 0D4A   BIOZ  LD4A
  D48  F900 0D46   B     LD46

LD4A:
  D4A  4006        IN    0x06,PA0
  D4B  6506        ZALH  0x06
  D4C  FD00 0D4F   BGEZ  LD4F
  D4E  7F80        NOP
LD4F:
  D4F  F600 0D4F   BIOZ  LD4F
  D51  7F80        NOP
  D52  7F89        ZAC
  D53  5008        SACL  0x08
  D54  5009        SACL  0x09
  D55  7F80        NOP
  D56  7F80        NOP
  D57  7F80        NOP
  D58  7F80        NOP
  D59  7F80        NOP
  D5A  7F80        NOP
  D5B  7F80        NOP
  D5C  7F80        NOP
  D5D  7F80        NOP
  D5E  7F80        NOP
  D5F  7F80        NOP
  D60  7F80        NOP
  D61  7F80        NOP
  D62  7F80        NOP
  D63  7F80        NOP
  D64  7F80        NOP
LD65:
  D65  7F80        NOP
  D66  7F80        NOP
  D67  7F80        NOP
  D68  7F80        NOP
  D69  0001        ADD   0x01
  D6A  5008        SACL  0x08
  D6B  4506        IN    0x06,PA5
  D6C  6881        LARP  1
  D6D  6606        ZALS  0x06
  D6E  7905        AND   0x05
  D6F  FE00 0D74   BNZ   LD74
  D71  6880        LARP  0
  D72  F900 0D76   B     LD76

LD74:
  D74  3906        LAR   AR1,0x06
  D75  4680        IN    *,PA6,AR0
LD76:
  D76  7F80        NOP
  D77  7F80        NOP
  D78  7F80        NOP
  D79  7F80        NOP
  D7A  6608        ZALS  0x08
  D7B  0001        ADD   0x01
  D7C  5008        SACL  0x08
  D7D  6608        ZALS  0x08
  D7E  FE00 0D65   BNZ   LD65
  D80  6E00        LDPK  0
  D81  7F8D        RET

