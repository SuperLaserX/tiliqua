; Eventide h3500 DSP microcode
; key 2810  algorithm 28 (program 28)  DSP 1
; source H3000-Upgrade_ROM2.BIN offset 01A52, 310 program words loaded at 800
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
  80C  5000        SACL  0x00
  80D  2800        LAC   0x00,8
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
  818  7F80        NOP
  819  7F80        NOP
  81A  7F89        ZAC
  81B  5002        SACL  0x02
L81C:
  81C  F600 0820   BIOZ  L820
  81E  F900 081C   B     L81C

L820:
  820  4001        IN    0x01,PA0
  821  6501        ZALH  0x01
  822  FD00 0825   BGEZ  L825
  824  7F80        NOP
L825:
  825  F600 0825   BIOZ  L825
L827:
  827  4501        IN    0x01,PA5
  828  6881        LARP  1
  829  6601        ZALS  0x01
  82A  7903        AND   0x03
  82B  FE00 0830   BNZ   L830
  82D  6880        LARP  0
  82E  F900 0832   B     L832

L830:
  830  3901        LAR   AR1,0x01
  831  4680        IN    *,PA6,AR0
L832:
  832  7F80        NOP
  833  6602        ZALS  0x02
  834  4F02        OUT   0x02,PA7
  835  6100        ADDS  0x00
  836  5002        SACL  0x02
  837  4F02        OUT   0x02,PA7
  838  6100        ADDS  0x00
  839  5002        SACL  0x02
  83A  4F02        OUT   0x02,PA7
  83B  6100        ADDS  0x00
  83C  5002        SACL  0x02
  83D  4F02        OUT   0x02,PA7
  83E  6100        ADDS  0x00
  83F  5002        SACL  0x02
  840  4F02        OUT   0x02,PA7
  841  6100        ADDS  0x00
  842  5002        SACL  0x02
  843  4F02        OUT   0x02,PA7
  844  6100        ADDS  0x00
  845  5002        SACL  0x02
  846  4F02        OUT   0x02,PA7
  847  6100        ADDS  0x00
  848  5002        SACL  0x02
  849  4F02        OUT   0x02,PA7
  84A  6100        ADDS  0x00
  84B  5002        SACL  0x02
  84C  4F02        OUT   0x02,PA7
  84D  6100        ADDS  0x00
  84E  5002        SACL  0x02
  84F  4F02        OUT   0x02,PA7
  850  6100        ADDS  0x00
  851  5002        SACL  0x02
  852  4F02        OUT   0x02,PA7
  853  6100        ADDS  0x00
  854  5002        SACL  0x02
  855  4F02        OUT   0x02,PA7
  856  6100        ADDS  0x00
  857  5002        SACL  0x02
  858  4F02        OUT   0x02,PA7
  859  6100        ADDS  0x00
  85A  5002        SACL  0x02
  85B  4F02        OUT   0x02,PA7
  85C  6100        ADDS  0x00
  85D  5002        SACL  0x02
  85E  4F02        OUT   0x02,PA7
  85F  6100        ADDS  0x00
  860  5002        SACL  0x02
  861  4F02        OUT   0x02,PA7
  862  6100        ADDS  0x00
  863  5002        SACL  0x02
  864  4F02        OUT   0x02,PA7
  865  6100        ADDS  0x00
  866  5002        SACL  0x02
  867  4F02        OUT   0x02,PA7
  868  6100        ADDS  0x00
  869  5002        SACL  0x02
  86A  4F02        OUT   0x02,PA7
  86B  6100        ADDS  0x00
  86C  5002        SACL  0x02
  86D  4F02        OUT   0x02,PA7
  86E  6100        ADDS  0x00
  86F  5002        SACL  0x02
  870  4F02        OUT   0x02,PA7
  871  6100        ADDS  0x00
  872  5002        SACL  0x02
  873  7F80        NOP
  874  7F80        NOP
  875  7F80        NOP
  876  7F80        NOP
  877  7F80        NOP
  878  2002        LAC   0x02
  879  FD00 0827   BGEZ  L827
L87B:
  87B  F600 087F   BIOZ  L87F
  87D  F900 087B   B     L87B

L87F:
  87F  4001        IN    0x01,PA0
  880  6501        ZALH  0x01
  881  FA00 0884   BLZ   L884
  883  7F80        NOP
L884:
  884  F600 0884   BIOZ  L884
L886:
  886  4501        IN    0x01,PA5
  887  6881        LARP  1
  888  6601        ZALS  0x01
  889  7903        AND   0x03
  88A  FE00 088F   BNZ   L88F
  88C  6880        LARP  0
  88D  F900 0891   B     L891

L88F:
  88F  3901        LAR   AR1,0x01
  890  4680        IN    *,PA6,AR0
L891:
  891  490C        OUT   0x0C,PA1
  892  6A0B        LT    0x0B
  893  4A11        OUT   0x11,PA2
  894  654A        ZALH  0x4A
  895  440A        IN    0x0A,PA4
  896  FF00 08E7   BZ    L8E7
  898  440F        IN    0x0F,PA4
  899  6D46        MPY   0x46
  89A  7F8E        PAC
  89B  4414        IN    0x14,PA4
  89C  6C0A        LTA   0x0A
  89D  6D45        MPY   0x45
  89E  4419        IN    0x19,PA4
  89F  6C0D        LTA   0x0D
  8A0  580B        SACH  0x0B
  8A1  600A        ADDH  0x0A
  8A2  4916        OUT   0x16,PA1
  8A3  4A1B        OUT   0x1B,PA2
  8A4  7F90        SPAC
  8A5  5801        SACH  0x01
  8A6  6D48        MPY   0x48
  8A7  7F8F        APAC
  8A8  6C01        LTA   0x01
  8A9  6D47        MPY   0x47
  8AA  7F8F        APAC
  8AB  7F8F        APAC
  8AC  580D        SACH  0x0D
  8AD  6D49        MPY   0x49
  8AE  7F8F        APAC
  8AF  6C10        LTA   0x10
  8B0  580C        SACH  0x0C
  8B1  6D46        MPY   0x46
  8B2  7F8E        PAC
  8B3  6C0F        LTA   0x0F
  8B4  6D45        MPY   0x45
  8B5  6C12        LTA   0x12
  8B6  5810        SACH  0x10
  8B7  600F        ADDH  0x0F
  8B8  7F90        SPAC
  8B9  5801        SACH  0x01
  8BA  6D48        MPY   0x48
  8BB  7F8F        APAC
  8BC  6C01        LTA   0x01
  8BD  6D47        MPY   0x47
  8BE  7F8F        APAC
  8BF  7F8F        APAC
  8C0  5812        SACH  0x12
  8C1  6D49        MPY   0x49
  8C2  7F8F        APAC
  8C3  6C15        LTA   0x15
  8C4  5811        SACH  0x11
  8C5  6D46        MPY   0x46
  8C6  7F8E        PAC
  8C7  6C14        LTA   0x14
  8C8  6D45        MPY   0x45
  8C9  6C17        LTA   0x17
  8CA  5815        SACH  0x15
  8CB  6014        ADDH  0x14
  8CC  7F90        SPAC
  8CD  5801        SACH  0x01
  8CE  6D48        MPY   0x48
  8CF  7F8F        APAC
  8D0  6C01        LTA   0x01
  8D1  6D47        MPY   0x47
  8D2  7F8F        APAC
  8D3  7F8F        APAC
  8D4  5817        SACH  0x17
  8D5  6D49        MPY   0x49
  8D6  7F8F        APAC
  8D7  6C1C        LTA   0x1C
  8D8  5816        SACH  0x16
  8D9  6D48        MPY   0x48
  8DA  6519        ZALH  0x19
  8DB  7F8F        APAC
  8DC  6C19        LTA   0x19
  8DD  6D47        MPY   0x47
  8DE  7F8F        APAC
  8DF  7F8F        APAC
  8E0  581C        SACH  0x1C
  8E1  6D49        MPY   0x49
  8E2  7F8F        APAC
  8E3  7F8F        APAC
  8E4  581B        SACH  0x1B
  8E5  F900 0886   B     L886

L8E7:
  8E7  440F        IN    0x0F,PA4
  8E8  6D41        MPY   0x41
  8E9  7F8E        PAC
  8EA  4414        IN    0x14,PA4
  8EB  6C0A        LTA   0x0A
  8EC  6D40        MPY   0x40
  8ED  4419        IN    0x19,PA4
  8EE  6C0D        LTA   0x0D
  8EF  580B        SACH  0x0B
  8F0  600A        ADDH  0x0A
  8F1  4916        OUT   0x16,PA1
  8F2  4A1B        OUT   0x1B,PA2
  8F3  7F90        SPAC
  8F4  5801        SACH  0x01
  8F5  6D43        MPY   0x43
  8F6  7F8F        APAC
  8F7  6C01        LTA   0x01
  8F8  6D42        MPY   0x42
  8F9  7F8F        APAC
  8FA  7F8F        APAC
  8FB  580D        SACH  0x0D
  8FC  6D44        MPY   0x44
  8FD  7F8F        APAC
  8FE  6C10        LTA   0x10
  8FF  580C        SACH  0x0C
  900  6D41        MPY   0x41
  901  7F8E        PAC
  902  6C0F        LTA   0x0F
  903  6D40        MPY   0x40
  904  6C12        LTA   0x12
  905  5810        SACH  0x10
  906  600F        ADDH  0x0F
  907  7F90        SPAC
  908  5801        SACH  0x01
  909  6D43        MPY   0x43
  90A  7F8F        APAC
  90B  6C01        LTA   0x01
  90C  6D42        MPY   0x42
  90D  7F8F        APAC
  90E  7F8F        APAC
  90F  5812        SACH  0x12
  910  6D44        MPY   0x44
  911  7F8F        APAC
  912  6C15        LTA   0x15
  913  5811        SACH  0x11
  914  6D41        MPY   0x41
  915  7F8E        PAC
  916  6C14        LTA   0x14
  917  6D40        MPY   0x40
  918  6C17        LTA   0x17
  919  5815        SACH  0x15
  91A  6014        ADDH  0x14
  91B  7F90        SPAC
  91C  5801        SACH  0x01
  91D  6D43        MPY   0x43
  91E  7F8F        APAC
  91F  6C01        LTA   0x01
  920  6D42        MPY   0x42
  921  7F8F        APAC
  922  7F8F        APAC
  923  5817        SACH  0x17
  924  6D44        MPY   0x44
  925  7F8F        APAC
  926  6C1C        LTA   0x1C
  927  5816        SACH  0x16
  928  6D43        MPY   0x43
  929  6519        ZALH  0x19
  92A  7F8F        APAC
  92B  6C19        LTA   0x19
  92C  6D42        MPY   0x42
  92D  7F8F        APAC
  92E  7F8F        APAC
  92F  581C        SACH  0x1C
  930  6D44        MPY   0x44
  931  7F8F        APAC
  932  7F8F        APAC
  933  581B        SACH  0x1B
  934  F900 0886   B     L886

