; Eventide h3000_v153 DSP microcode
; key 1411  algorithm 14 (program 14)  DSP 2
; source H3000_153_BigROM.BIN offset 0F5C1, 303 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5008        SACL  0x08
  806  2908        LAC   0x08,9
  807  5003        SACL  0x03
  808  7F80        NOP
  809  7F80        NOP
  80A  7F80        NOP
  80B  7F80        NOP
  80C  7F80        NOP
  80D  7F80        NOP
  80E  7F80        NOP
  80F  7F80        NOP
  810  7F80        NOP
L811:
  811  F600 0815   BIOZ  L815
  813  F900 0811   B     L811

L815:
  815  4009        IN    0x09,PA0
  816  6509        ZALH  0x09
  817  FD00 081A   BGEZ  L81A
  819  7F80        NOP
L81A:
  81A  F600 081A   BIOZ  L81A
  81C  7F89        ZAC
  81D  5018        SACL  0x18
  81E  500A        SACL  0x0A
  81F  5004        SACL  0x04
  820  5016        SACL  0x16
  821  5005        SACL  0x05
  822  5006        SACL  0x06
  823  5007        SACL  0x07
L824:
  824  4F0A        OUT   0x0A,PA7
  825  4C18        OUT   0x18,PA4
  826  0008        ADD   0x08
  827  500A        SACL  0x0A
  828  4509        IN    0x09,PA5
  829  6881        LARP  1
  82A  6609        ZALS  0x09
  82B  7903        AND   0x03
  82C  FE00 0831   BNZ   L831
  82E  6880        LARP  0
  82F  F900 0833   B     L833

L831:
  831  3909        LAR   AR1,0x09
  832  4680        IN    *,PA6,AR0
L833:
  833  4F0A        OUT   0x0A,PA7
  834  4C18        OUT   0x18,PA4
  835  660A        ZALS  0x0A
  836  0008        ADD   0x08
  837  500A        SACL  0x0A
  838  660A        ZALS  0x0A
  839  FE00 0824   BNZ   L824
  83B  7002        LARK  AR0,0x02
L83C:
  83C  F600 0840   BIOZ  L840
  83E  F900 083C   B     L83C

L840:
  840  4009        IN    0x09,PA0
  841  6509        ZALH  0x09
  842  FA00 0845   BLZ   L845
  844  7F80        NOP
L845:
  845  F600 0845   BIOZ  L845
L847:
  847  4509        IN    0x09,PA5
  848  6881        LARP  1
  849  6609        ZALS  0x09
  84A  7903        AND   0x03
  84B  FE00 0850   BNZ   L850
  84D  6880        LARP  0
  84E  F900 0852   B     L852

L850:
  850  3909        LAR   AR1,0x09
  851  4680        IN    *,PA6,AR0
L852:
  852  4716        IN    0x16,PA7
  853  4C05        OUT   0x05,PA4
  854  4C06        OUT   0x06,PA4
  855  4C07        OUT   0x07,PA4
  856  7F80        NOP
  857  7F80        NOP
  858  440E        IN    0x0E,PA4
  859  4411        IN    0x11,PA4
  85A  440F        IN    0x0F,PA4
  85B  4412        IN    0x12,PA4
  85C  4410        IN    0x10,PA4
  85D  4413        IN    0x13,PA4
  85E  4188        IN    *,PA1
  85F  6A00        LT    0x00
  860  6D11        MPY   0x11
  861  7F8E        PAC
  862  6D0E        MPY   0x0E
  863  7F90        SPAC
  864  0F0E        ADD   0x0E,15
  865  590B        SACH  0x0B,1
  866  6A02        LT    0x02
  867  6D12        MPY   0x12
  868  7F8E        PAC
  869  6D0F        MPY   0x0F
  86A  7F90        SPAC
  86B  0F0F        ADD   0x0F,15
  86C  590C        SACH  0x0C,1
  86D  6A01        LT    0x01
  86E  6D13        MPY   0x13
  86F  7F8E        PAC
  870  6D10        MPY   0x10
  871  7F90        SPAC
  872  0F10        ADD   0x10,15
  873  590D        SACH  0x0D,1
  874  7F89        ZAC
  875  6A0B        LT    0x0B
  876  6D40        MPY   0x40
  877  7F8F        APAC
  878  6C0C        LTA   0x0C
  879  6D41        MPY   0x41
  87A  7F8F        APAC
  87B  6C0D        LTA   0x0D
  87C  6D42        MPY   0x42
  87D  7F8F        APAC
  87E  6C0B        LTA   0x0B
  87F  5814        SACH  0x14
  880  6D43        MPY   0x43
  881  7F8E        PAC
  882  6C0C        LTA   0x0C
  883  6D44        MPY   0x44
  884  7F8F        APAC
  885  6C0D        LTA   0x0D
  886  6D45        MPY   0x45
  887  7F8F        APAC
  888  6C0B        LTA   0x0B
  889  5815        SACH  0x15
  88A  6504        ZALH  0x04
  88B  6D46        MPY   0x46
  88C  7F8F        APAC
  88D  6C0C        LTA   0x0C
  88E  5805        SACH  0x05
  88F  6504        ZALH  0x04
  890  6D47        MPY   0x47
  891  7F8F        APAC
  892  6C0D        LTA   0x0D
  893  5806        SACH  0x06
  894  6504        ZALH  0x04
  895  4914        OUT   0x14,PA1
  896  4915        OUT   0x15,PA1
  897  6D48        MPY   0x48
  898  7F8F        APAC
  899  7F8F        APAC
  89A  5807        SACH  0x07
  89B  7F80        NOP
  89C  6549        ZALH  0x49
  89D  FE00 08AD   BNZ   L8AD
  89F  6516        ZALH  0x16
  8A0  5804        SACH  0x04
  8A1  F400 0847   BANZ  L847
  8A3  7002        LARK  AR0,0x02
  8A4  7F80        NOP
  8A5  7F80        NOP
  8A6  7F80        NOP
  8A7  7F80        NOP
  8A8  654A        ZALH  0x4A
  8A9  FF00 092D   BZ    L92D
  8AB  F900 0852   B     L852

L8AD:
  8AD  4704        IN    0x04,PA7
  8AE  F400 0847   BANZ  L847
  8B0  7002        LARK  AR0,0x02
  8B1  7F80        NOP
  8B2  7F80        NOP
  8B3  7F80        NOP
  8B4  7F80        NOP
  8B5  654A        ZALH  0x4A
  8B6  FF00 092D   BZ    L92D
  8B8  F900 0852   B     L852

L8BA:
  8BA  4509        IN    0x09,PA5
  8BB  6881        LARP  1
  8BC  6609        ZALS  0x09
  8BD  7903        AND   0x03
  8BE  FE00 08C3   BNZ   L8C3
  8C0  6880        LARP  0
  8C1  F900 08C5   B     L8C5

L8C3:
  8C3  3909        LAR   AR1,0x09
  8C4  4680        IN    *,PA6,AR0
L8C5:
  8C5  4716        IN    0x16,PA7
  8C6  4C05        OUT   0x05,PA4
  8C7  4C06        OUT   0x06,PA4
  8C8  4C07        OUT   0x07,PA4
  8C9  7F80        NOP
  8CA  7F80        NOP
  8CB  440E        IN    0x0E,PA4
  8CC  4411        IN    0x11,PA4
  8CD  440F        IN    0x0F,PA4
  8CE  4412        IN    0x12,PA4
  8CF  4410        IN    0x10,PA4
  8D0  4413        IN    0x13,PA4
  8D1  4188        IN    *,PA1
  8D2  6A00        LT    0x00
  8D3  6D11        MPY   0x11
  8D4  7F8E        PAC
  8D5  6D0E        MPY   0x0E
  8D6  7F90        SPAC
  8D7  0F0E        ADD   0x0E,15
  8D8  590B        SACH  0x0B,1
  8D9  6A02        LT    0x02
  8DA  6D12        MPY   0x12
  8DB  7F8E        PAC
  8DC  6D0F        MPY   0x0F
  8DD  7F90        SPAC
  8DE  0F0F        ADD   0x0F,15
  8DF  590C        SACH  0x0C,1
  8E0  6A01        LT    0x01
  8E1  6D13        MPY   0x13
  8E2  7F8E        PAC
  8E3  6D10        MPY   0x10
  8E4  7F90        SPAC
  8E5  0F10        ADD   0x10,15
  8E6  590D        SACH  0x0D,1
  8E7  7F89        ZAC
  8E8  6A0B        LT    0x0B
  8E9  6D40        MPY   0x40
  8EA  7F8F        APAC
  8EB  6C0C        LTA   0x0C
  8EC  6D41        MPY   0x41
  8ED  7F8F        APAC
  8EE  6C0D        LTA   0x0D
  8EF  6D42        MPY   0x42
  8F0  7F8F        APAC
  8F1  6C0B        LTA   0x0B
  8F2  5814        SACH  0x14
  8F3  6D43        MPY   0x43
  8F4  7F8E        PAC
  8F5  6C0C        LTA   0x0C
  8F6  6D44        MPY   0x44
  8F7  7F8F        APAC
  8F8  6C0D        LTA   0x0D
  8F9  6D45        MPY   0x45
  8FA  7F8F        APAC
  8FB  7F8F        APAC
  8FC  5815        SACH  0x15
  8FD  650B        ZALH  0x0B
  8FE  5805        SACH  0x05
  8FF  650C        ZALH  0x0C
  900  5806        SACH  0x06
  901  650D        ZALH  0x0D
  902  5807        SACH  0x07
  903  7F80        NOP
  904  7F80        NOP
  905  7F80        NOP
  906  7F80        NOP
  907  7F80        NOP
  908  4914        OUT   0x14,PA1
  909  4915        OUT   0x15,PA1
  90A  7F80        NOP
  90B  7F80        NOP
  90C  7F80        NOP
  90D  7F80        NOP
  90E  7F80        NOP
  90F  6549        ZALH  0x49
  910  FE00 0920   BNZ   L920
  912  6516        ZALH  0x16
  913  5804        SACH  0x04
  914  F400 08BA   BANZ  L8BA
  916  7002        LARK  AR0,0x02
  917  7F80        NOP
  918  7F80        NOP
  919  7F80        NOP
  91A  7F80        NOP
  91B  654A        ZALH  0x4A
  91C  FF00 092D   BZ    L92D
  91E  F900 0852   B     L852

L920:
  920  4704        IN    0x04,PA7
  921  F400 08BA   BANZ  L8BA
  923  7002        LARK  AR0,0x02
  924  7F80        NOP
  925  7F80        NOP
  926  7F80        NOP
  927  7F80        NOP
  928  654A        ZALH  0x4A
  929  FF00 092D   BZ    L92D
  92B  F900 0852   B     L852

L92D:
  92D  F900 08C5   B     L8C5

