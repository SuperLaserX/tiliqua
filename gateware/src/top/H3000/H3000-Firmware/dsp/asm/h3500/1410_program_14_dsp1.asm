; Eventide h3500 DSP microcode
; key 1410  algorithm 14 (program 14)  DSP 1
; source H3000-Upgrade_ROM2.BIN offset 03A5A, 335 program words loaded at 800
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
  80D  2808        LAC   0x08,8
  80E  5003        SACL  0x03
  80F  7F80        NOP
  810  7F80        NOP
  811  7F80        NOP
  812  7F80        NOP
  813  7F80        NOP
  814  7F80        NOP
  815  7F80        NOP
  816  7F80        NOP
  817  7F80        NOP
  818  7F89        ZAC
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
  832  4F0A        OUT   0x0A,PA7
  833  6108        ADDS  0x08
  834  500A        SACL  0x0A
  835  4F0A        OUT   0x0A,PA7
  836  6108        ADDS  0x08
  837  500A        SACL  0x0A
  838  4F0A        OUT   0x0A,PA7
  839  6108        ADDS  0x08
  83A  500A        SACL  0x0A
  83B  4F0A        OUT   0x0A,PA7
  83C  6108        ADDS  0x08
  83D  500A        SACL  0x0A
  83E  4F0A        OUT   0x0A,PA7
  83F  6108        ADDS  0x08
  840  500A        SACL  0x0A
  841  4F0A        OUT   0x0A,PA7
  842  6108        ADDS  0x08
  843  500A        SACL  0x0A
  844  4F0A        OUT   0x0A,PA7
  845  6108        ADDS  0x08
  846  500A        SACL  0x0A
  847  4F0A        OUT   0x0A,PA7
  848  6108        ADDS  0x08
  849  500A        SACL  0x0A
  84A  4F0A        OUT   0x0A,PA7
  84B  6108        ADDS  0x08
  84C  500A        SACL  0x0A
  84D  4F0A        OUT   0x0A,PA7
  84E  6108        ADDS  0x08
  84F  500A        SACL  0x0A
  850  4F0A        OUT   0x0A,PA7
  851  6108        ADDS  0x08
  852  500A        SACL  0x0A
  853  4F0A        OUT   0x0A,PA7
  854  6108        ADDS  0x08
  855  500A        SACL  0x0A
  856  4F0A        OUT   0x0A,PA7
  857  6108        ADDS  0x08
  858  500A        SACL  0x0A
  859  4F0A        OUT   0x0A,PA7
  85A  6108        ADDS  0x08
  85B  500A        SACL  0x0A
  85C  4F0A        OUT   0x0A,PA7
  85D  6108        ADDS  0x08
  85E  500A        SACL  0x0A
  85F  4F0A        OUT   0x0A,PA7
  860  6108        ADDS  0x08
  861  500A        SACL  0x0A
  862  4F0A        OUT   0x0A,PA7
  863  6108        ADDS  0x08
  864  500A        SACL  0x0A
  865  4F0A        OUT   0x0A,PA7
  866  6108        ADDS  0x08
  867  500A        SACL  0x0A
  868  4F0A        OUT   0x0A,PA7
  869  6108        ADDS  0x08
  86A  500A        SACL  0x0A
  86B  4F0A        OUT   0x0A,PA7
  86C  6108        ADDS  0x08
  86D  500A        SACL  0x0A
  86E  4F0A        OUT   0x0A,PA7
  86F  6108        ADDS  0x08
  870  500A        SACL  0x0A
  871  7F80        NOP
  872  7F80        NOP
  873  7F80        NOP
  874  7F80        NOP
  875  7F80        NOP
  876  200A        LAC   0x0A
  877  FD00 0825   BGEZ  L825
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
  890  7F80        NOP
  891  7F80        NOP
  892  6A00        LT    0x00
  893  6D0E        MPY   0x0E
  894  7F8E        PAC
  895  6D11        MPY   0x11
  896  7F90        SPAC
  897  0F11        ADD   0x11,15
  898  590B        SACH  0x0B,1
  899  6A02        LT    0x02
  89A  6D0F        MPY   0x0F
  89B  7F8E        PAC
  89C  6D12        MPY   0x12
  89D  7F90        SPAC
  89E  0F12        ADD   0x12,15
  89F  590C        SACH  0x0C,1
  8A0  6A01        LT    0x01
  8A1  6D10        MPY   0x10
  8A2  7F8E        PAC
  8A3  6D13        MPY   0x13
  8A4  7F90        SPAC
  8A5  0F13        ADD   0x13,15
  8A6  590D        SACH  0x0D,1
  8A7  6514        ZALH  0x14
  8A8  4C05        OUT   0x05,PA4
  8A9  4C06        OUT   0x06,PA4
  8AA  4C07        OUT   0x07,PA4
  8AB  6A0B        LT    0x0B
  8AC  6D40        MPY   0x40
  8AD  4411        IN    0x11,PA4
  8AE  440E        IN    0x0E,PA4
  8AF  4412        IN    0x12,PA4
  8B0  440F        IN    0x0F,PA4
  8B1  4413        IN    0x13,PA4
  8B2  4410        IN    0x10,PA4
  8B3  4188        IN    *,PA1
  8B4  7F8F        APAC
  8B5  6C0C        LTA   0x0C
  8B6  6D41        MPY   0x41
  8B7  7F8F        APAC
  8B8  6C0D        LTA   0x0D
  8B9  6D42        MPY   0x42
  8BA  7F8F        APAC
  8BB  6C0B        LTA   0x0B
  8BC  581B        SACH  0x1B
  8BD  6515        ZALH  0x15
  8BE  6D43        MPY   0x43
  8BF  7F8F        APAC
  8C0  6C0C        LTA   0x0C
  8C1  6D44        MPY   0x44
  8C2  7F8F        APAC
  8C3  6C0D        LTA   0x0D
  8C4  6D45        MPY   0x45
  8C5  7F8F        APAC
  8C6  6C0B        LTA   0x0B
  8C7  581C        SACH  0x1C
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
  8D3  6D48        MPY   0x48
  8D4  7F8F        APAC
  8D5  4114        IN    0x14,PA1
  8D6  4115        IN    0x15,PA1
  8D7  4E1B        OUT   0x1B,PA6
  8D8  4D1C        OUT   0x1C,PA5
  8D9  4704        IN    0x04,PA7
  8DA  7F8F        APAC
  8DB  5807        SACH  0x07
  8DC  7F80        NOP
  8DD  F400 0885   BANZ  L885
  8DF  7002        LARK  AR0,0x02
  8E0  7F80        NOP
  8E1  7F80        NOP
  8E2  7F80        NOP
  8E3  7F80        NOP
  8E4  654A        ZALH  0x4A
  8E5  FF00 094D   BZ    L94D
  8E7  F900 0890   B     L890

L8E9:
  8E9  4509        IN    0x09,PA5
  8EA  6881        LARP  1
  8EB  6609        ZALS  0x09
  8EC  7903        AND   0x03
  8ED  FE00 08F2   BNZ   L8F2
  8EF  6880        LARP  0
  8F0  F900 08F4   B     L8F4

L8F2:
  8F2  3909        LAR   AR1,0x09
  8F3  4680        IN    *,PA6,AR0
L8F4:
  8F4  7F80        NOP
  8F5  7F80        NOP
  8F6  6A00        LT    0x00
  8F7  6D0E        MPY   0x0E
  8F8  7F8E        PAC
  8F9  6D11        MPY   0x11
  8FA  7F90        SPAC
  8FB  0F11        ADD   0x11,15
  8FC  590B        SACH  0x0B,1
  8FD  6A02        LT    0x02
  8FE  6D0F        MPY   0x0F
  8FF  7F8E        PAC
  900  6D12        MPY   0x12
  901  7F90        SPAC
  902  0F12        ADD   0x12,15
  903  590C        SACH  0x0C,1
  904  6A01        LT    0x01
  905  6D10        MPY   0x10
  906  7F8E        PAC
  907  6D13        MPY   0x13
  908  7F90        SPAC
  909  0F13        ADD   0x13,15
  90A  590D        SACH  0x0D,1
  90B  6514        ZALH  0x14
  90C  4C05        OUT   0x05,PA4
  90D  4C06        OUT   0x06,PA4
  90E  4C07        OUT   0x07,PA4
  90F  6A0B        LT    0x0B
  910  6D40        MPY   0x40
  911  4411        IN    0x11,PA4
  912  440E        IN    0x0E,PA4
  913  4412        IN    0x12,PA4
  914  440F        IN    0x0F,PA4
  915  4413        IN    0x13,PA4
  916  4410        IN    0x10,PA4
  917  4188        IN    *,PA1
  918  7F8F        APAC
  919  6C0C        LTA   0x0C
  91A  6D41        MPY   0x41
  91B  7F8F        APAC
  91C  6C0D        LTA   0x0D
  91D  6D42        MPY   0x42
  91E  7F8F        APAC
  91F  6C0B        LTA   0x0B
  920  581B        SACH  0x1B
  921  6515        ZALH  0x15
  922  6D43        MPY   0x43
  923  7F8F        APAC
  924  6C0C        LTA   0x0C
  925  6D44        MPY   0x44
  926  7F8F        APAC
  927  6C0D        LTA   0x0D
  928  6D45        MPY   0x45
  929  7F8F        APAC
  92A  6C0B        LTA   0x0B
  92B  581C        SACH  0x1C
  92C  650B        ZALH  0x0B
  92D  5805        SACH  0x05
  92E  650C        ZALH  0x0C
  92F  5806        SACH  0x06
  930  650D        ZALH  0x0D
  931  5807        SACH  0x07
  932  7F80        NOP
  933  7F80        NOP
  934  7F80        NOP
  935  7F80        NOP
  936  7F80        NOP
  937  7F80        NOP
  938  7F80        NOP
  939  4114        IN    0x14,PA1
  93A  4115        IN    0x15,PA1
  93B  4E1B        OUT   0x1B,PA6
  93C  4D1C        OUT   0x1C,PA5
  93D  4704        IN    0x04,PA7
  93E  7F80        NOP
  93F  7F80        NOP
  940  7F80        NOP
  941  F400 08E9   BANZ  L8E9
  943  7002        LARK  AR0,0x02
  944  7F80        NOP
  945  7F80        NOP
  946  7F80        NOP
  947  7F80        NOP
  948  654A        ZALH  0x4A
  949  FF00 094D   BZ    L94D
  94B  F900 0890   B     L890

L94D:
  94D  F900 08F4   B     L8F4

