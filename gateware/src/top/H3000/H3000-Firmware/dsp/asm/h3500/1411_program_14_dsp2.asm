; Eventide h3500 DSP microcode
; key 1411  algorithm 14 (program 14)  DSP 2
; source H3000-Upgrade_ROM2.BIN offset 03D02, 365 program words loaded at 800
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
  80C  5008        SACL  0x08
  80D  2908        LAC   0x08,9
  80E  5003        SACL  0x03
  80F  7EFF        LACK  0xFF
  810  5009        SACL  0x09
  811  2709        LAC   0x09,7
  812  7A09        OR    0x09
  813  5020        SACL  0x20
  814  7F80        NOP
  815  7F80        NOP
  816  7F80        NOP
  817  7F80        NOP
  818  6620        ZALS  0x20
  819  500A        SACL  0x0A
L81A:
  81A  F600 081E   BIOZ  L81E
  81C  F900 081A   B     L81A

L81E:
  81E  4009        IN    0x09,PA0
  81F  6509        ZALH  0x09
  820  FD00 0823   BGEZ  L823
  822  7F80        NOP
L823:
  823  F600 0823   BIOZ  L823
L825:
  825  4509        IN    0x09,PA5
  826  6881        LARP  1
  827  6609        ZALS  0x09
  828  7903        AND   0x03
  829  FE00 082E   BNZ   L82E
  82B  6880        LARP  0
  82C  F900 0830   B     L830

L82E:
  82E  3909        LAR   AR1,0x09
  82F  4680        IN    *,PA6,AR0
L830:
  830  7F80        NOP
  831  660A        ZALS  0x0A
  832  6108        ADDS  0x08
  833  500A        SACL  0x0A
  834  4F0A        OUT   0x0A,PA7
  835  6108        ADDS  0x08
  836  500A        SACL  0x0A
  837  4F0A        OUT   0x0A,PA7
  838  6108        ADDS  0x08
  839  500A        SACL  0x0A
  83A  4F0A        OUT   0x0A,PA7
  83B  6108        ADDS  0x08
  83C  500A        SACL  0x0A
  83D  4F0A        OUT   0x0A,PA7
  83E  6108        ADDS  0x08
  83F  500A        SACL  0x0A
  840  4F0A        OUT   0x0A,PA7
  841  6108        ADDS  0x08
  842  500A        SACL  0x0A
  843  4F0A        OUT   0x0A,PA7
  844  6108        ADDS  0x08
  845  500A        SACL  0x0A
  846  4F0A        OUT   0x0A,PA7
  847  6108        ADDS  0x08
  848  500A        SACL  0x0A
  849  4F0A        OUT   0x0A,PA7
  84A  6108        ADDS  0x08
  84B  500A        SACL  0x0A
  84C  4F0A        OUT   0x0A,PA7
  84D  6108        ADDS  0x08
  84E  500A        SACL  0x0A
  84F  4F0A        OUT   0x0A,PA7
  850  6108        ADDS  0x08
  851  500A        SACL  0x0A
  852  4F0A        OUT   0x0A,PA7
  853  6108        ADDS  0x08
  854  500A        SACL  0x0A
  855  4F0A        OUT   0x0A,PA7
  856  6108        ADDS  0x08
  857  500A        SACL  0x0A
  858  4F0A        OUT   0x0A,PA7
  859  6108        ADDS  0x08
  85A  500A        SACL  0x0A
  85B  4F0A        OUT   0x0A,PA7
  85C  6108        ADDS  0x08
  85D  500A        SACL  0x0A
  85E  4F0A        OUT   0x0A,PA7
  85F  6108        ADDS  0x08
  860  500A        SACL  0x0A
  861  4F0A        OUT   0x0A,PA7
  862  6108        ADDS  0x08
  863  500A        SACL  0x0A
  864  4F0A        OUT   0x0A,PA7
  865  6108        ADDS  0x08
  866  500A        SACL  0x0A
  867  4F0A        OUT   0x0A,PA7
  868  6108        ADDS  0x08
  869  500A        SACL  0x0A
  86A  4F0A        OUT   0x0A,PA7
  86B  6108        ADDS  0x08
  86C  500A        SACL  0x0A
  86D  4F0A        OUT   0x0A,PA7
  86E  6108        ADDS  0x08
  86F  500A        SACL  0x0A
  870  4F0A        OUT   0x0A,PA7
  871  7F80        NOP
  872  7F80        NOP
  873  7F80        NOP
  874  7F80        NOP
  875  7F80        NOP
  876  200A        LAC   0x0A
  877  FA00 0825   BLZ   L825
  879  7002        LARK  AR0,0x02
L87A:
  87A  F600 087E   BIOZ  L87E
  87C  F900 087A   B     L87A

L87E:
  87E  4009        IN    0x09,PA0
  87F  6509        ZALH  0x09
  880  FA00 0883   BLZ   L883
  882  7F80        NOP
L883:
  883  F600 0883   BIOZ  L883
L885:
  885  4509        IN    0x09,PA5
  886  6881        LARP  1
  887  6609        ZALS  0x09
  888  7903        AND   0x03
  889  FE00 088E   BNZ   L88E
  88B  6880        LARP  0
  88C  F900 0890   B     L890

L88E:
  88E  3909        LAR   AR1,0x09
  88F  4680        IN    *,PA6,AR0
L890:
  890  4716        IN    0x16,PA7
  891  4C05        OUT   0x05,PA4
  892  4C06        OUT   0x06,PA4
  893  4C07        OUT   0x07,PA4
  894  7F80        NOP
  895  7F80        NOP
  896  4411        IN    0x11,PA4
  897  440E        IN    0x0E,PA4
  898  4412        IN    0x12,PA4
  899  440F        IN    0x0F,PA4
  89A  4413        IN    0x13,PA4
  89B  4410        IN    0x10,PA4
  89C  4188        IN    *,PA1
  89D  6A00        LT    0x00
  89E  6D0E        MPY   0x0E
  89F  7F8E        PAC
  8A0  6D11        MPY   0x11
  8A1  7F90        SPAC
  8A2  0F11        ADD   0x11,15
  8A3  590B        SACH  0x0B,1
  8A4  6A02        LT    0x02
  8A5  6D0F        MPY   0x0F
  8A6  7F8E        PAC
  8A7  6D12        MPY   0x12
  8A8  7F90        SPAC
  8A9  0F12        ADD   0x12,15
  8AA  590C        SACH  0x0C,1
  8AB  6A01        LT    0x01
  8AC  6D10        MPY   0x10
  8AD  7F8E        PAC
  8AE  6D13        MPY   0x13
  8AF  7F90        SPAC
  8B0  0F13        ADD   0x13,15
  8B1  590D        SACH  0x0D,1
  8B2  7F89        ZAC
  8B3  6A0B        LT    0x0B
  8B4  6D40        MPY   0x40
  8B5  7F8F        APAC
  8B6  6C0C        LTA   0x0C
  8B7  6D41        MPY   0x41
  8B8  7F8F        APAC
  8B9  6C0D        LTA   0x0D
  8BA  6D42        MPY   0x42
  8BB  7F8F        APAC
  8BC  6C0B        LTA   0x0B
  8BD  5814        SACH  0x14
  8BE  6D43        MPY   0x43
  8BF  7F8E        PAC
  8C0  6C0C        LTA   0x0C
  8C1  6D44        MPY   0x44
  8C2  7F8F        APAC
  8C3  6C0D        LTA   0x0D
  8C4  6D45        MPY   0x45
  8C5  7F8F        APAC
  8C6  6C0B        LTA   0x0B
  8C7  5815        SACH  0x15
  8C8  6504        ZALH  0x04
  8C9  6D46        MPY   0x46
  8CA  7F8F        APAC
  8CB  6C0C        LTA   0x0C
  8CC  5805        SACH  0x05
  8CD  6504        ZALH  0x04
  8CE  6D47        MPY   0x47
  8CF  7F8F        APAC
  8D0  6C0D        LTA   0x0D
  8D1  5806        SACH  0x06
  8D2  6504        ZALH  0x04
  8D3  4914        OUT   0x14,PA1
  8D4  4915        OUT   0x15,PA1
  8D5  6D48        MPY   0x48
  8D6  7F8F        APAC
  8D7  7F8F        APAC
  8D8  5807        SACH  0x07
  8D9  7F80        NOP
  8DA  6549        ZALH  0x49
  8DB  FE00 08EB   BNZ   L8EB
  8DD  6516        ZALH  0x16
  8DE  5804        SACH  0x04
  8DF  F400 0885   BANZ  L885
  8E1  7002        LARK  AR0,0x02
  8E2  7F80        NOP
  8E3  7F80        NOP
  8E4  7F80        NOP
  8E5  7F80        NOP
  8E6  654A        ZALH  0x4A
  8E7  FF00 096B   BZ    L96B
  8E9  F900 0890   B     L890

L8EB:
  8EB  4704        IN    0x04,PA7
  8EC  F400 0885   BANZ  L885
  8EE  7002        LARK  AR0,0x02
  8EF  7F80        NOP
  8F0  7F80        NOP
  8F1  7F80        NOP
  8F2  7F80        NOP
  8F3  654A        ZALH  0x4A
  8F4  FF00 096B   BZ    L96B
  8F6  F900 0890   B     L890

L8F8:
  8F8  4509        IN    0x09,PA5
  8F9  6881        LARP  1
  8FA  6609        ZALS  0x09
  8FB  7903        AND   0x03
  8FC  FE00 0901   BNZ   L901
  8FE  6880        LARP  0
  8FF  F900 0903   B     L903

L901:
  901  3909        LAR   AR1,0x09
  902  4680        IN    *,PA6,AR0
L903:
  903  4716        IN    0x16,PA7
  904  4C05        OUT   0x05,PA4
  905  4C06        OUT   0x06,PA4
  906  4C07        OUT   0x07,PA4
  907  7F80        NOP
  908  7F80        NOP
  909  4411        IN    0x11,PA4
  90A  440E        IN    0x0E,PA4
  90B  4412        IN    0x12,PA4
  90C  440F        IN    0x0F,PA4
  90D  4413        IN    0x13,PA4
  90E  4410        IN    0x10,PA4
  90F  4188        IN    *,PA1
  910  6A00        LT    0x00
  911  6D0E        MPY   0x0E
  912  7F8E        PAC
  913  6D11        MPY   0x11
  914  7F90        SPAC
  915  0F11        ADD   0x11,15
  916  590B        SACH  0x0B,1
  917  6A02        LT    0x02
  918  6D0F        MPY   0x0F
  919  7F8E        PAC
  91A  6D12        MPY   0x12
  91B  7F90        SPAC
  91C  0F12        ADD   0x12,15
  91D  590C        SACH  0x0C,1
  91E  6A01        LT    0x01
  91F  6D10        MPY   0x10
  920  7F8E        PAC
  921  6D13        MPY   0x13
  922  7F90        SPAC
  923  0F13        ADD   0x13,15
  924  590D        SACH  0x0D,1
  925  7F89        ZAC
  926  6A0B        LT    0x0B
  927  6D40        MPY   0x40
  928  7F8F        APAC
  929  6C0C        LTA   0x0C
  92A  6D41        MPY   0x41
  92B  7F8F        APAC
  92C  6C0D        LTA   0x0D
  92D  6D42        MPY   0x42
  92E  7F8F        APAC
  92F  6C0B        LTA   0x0B
  930  5814        SACH  0x14
  931  6D43        MPY   0x43
  932  7F8E        PAC
  933  6C0C        LTA   0x0C
  934  6D44        MPY   0x44
  935  7F8F        APAC
  936  6C0D        LTA   0x0D
  937  6D45        MPY   0x45
  938  7F8F        APAC
  939  7F8F        APAC
  93A  5815        SACH  0x15
  93B  650B        ZALH  0x0B
  93C  5805        SACH  0x05
  93D  650C        ZALH  0x0C
  93E  5806        SACH  0x06
  93F  650D        ZALH  0x0D
  940  5807        SACH  0x07
  941  7F80        NOP
  942  7F80        NOP
  943  7F80        NOP
  944  7F80        NOP
  945  7F80        NOP
  946  4914        OUT   0x14,PA1
  947  4915        OUT   0x15,PA1
  948  7F80        NOP
  949  7F80        NOP
  94A  7F80        NOP
  94B  7F80        NOP
  94C  7F80        NOP
  94D  6549        ZALH  0x49
  94E  FE00 095E   BNZ   L95E
  950  6516        ZALH  0x16
  951  5804        SACH  0x04
  952  F400 08F8   BANZ  L8F8
  954  7002        LARK  AR0,0x02
  955  7F80        NOP
  956  7F80        NOP
  957  7F80        NOP
  958  7F80        NOP
  959  654A        ZALH  0x4A
  95A  FF00 096B   BZ    L96B
  95C  F900 0890   B     L890

L95E:
  95E  4704        IN    0x04,PA7
  95F  F400 08F8   BANZ  L8F8
  961  7002        LARK  AR0,0x02
  962  7F80        NOP
  963  7F80        NOP
  964  7F80        NOP
  965  7F80        NOP
  966  654A        ZALH  0x4A
  967  FF00 096B   BZ    L96B
  969  F900 0890   B     L890

L96B:
  96B  F900 0903   B     L903

