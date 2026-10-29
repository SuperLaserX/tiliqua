; Eventide h3500 DSP microcode
; key 1E10  algorithm 1E (program 1E)  DSP 1
; source H3000-Upgrade_ROM2.BIN offset 02214, 384 program words loaded at 800
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
  818  7F89        ZAC
  819  5002        SACL  0x02
L81A:
  81A  F600 081E   BIOZ  L81E
  81C  F900 081A   B     L81A

L81E:
  81E  4001        IN    0x01,PA0
  81F  6501        ZALH  0x01
  820  FD00 0823   BGEZ  L823
  822  7F80        NOP
L823:
  823  F600 0823   BIOZ  L823
L825:
  825  4501        IN    0x01,PA5
  826  6881        LARP  1
  827  6601        ZALS  0x01
  828  7903        AND   0x03
  829  FE00 082E   BNZ   L82E
  82B  6880        LARP  0
  82C  F900 0830   B     L830

L82E:
  82E  3901        LAR   AR1,0x01
  82F  4680        IN    *,PA6,AR0
L830:
  830  7F80        NOP
  831  6602        ZALS  0x02
  832  4F02        OUT   0x02,PA7
  833  6100        ADDS  0x00
  834  5002        SACL  0x02
  835  4F02        OUT   0x02,PA7
  836  6100        ADDS  0x00
  837  5002        SACL  0x02
  838  4F02        OUT   0x02,PA7
  839  6100        ADDS  0x00
  83A  5002        SACL  0x02
  83B  4F02        OUT   0x02,PA7
  83C  6100        ADDS  0x00
  83D  5002        SACL  0x02
  83E  4F02        OUT   0x02,PA7
  83F  6100        ADDS  0x00
  840  5002        SACL  0x02
  841  4F02        OUT   0x02,PA7
  842  6100        ADDS  0x00
  843  5002        SACL  0x02
  844  4F02        OUT   0x02,PA7
  845  6100        ADDS  0x00
  846  5002        SACL  0x02
  847  4F02        OUT   0x02,PA7
  848  6100        ADDS  0x00
  849  5002        SACL  0x02
  84A  4F02        OUT   0x02,PA7
  84B  6100        ADDS  0x00
  84C  5002        SACL  0x02
  84D  4F02        OUT   0x02,PA7
  84E  6100        ADDS  0x00
  84F  5002        SACL  0x02
  850  4F02        OUT   0x02,PA7
  851  6100        ADDS  0x00
  852  5002        SACL  0x02
  853  4F02        OUT   0x02,PA7
  854  6100        ADDS  0x00
  855  5002        SACL  0x02
  856  4F02        OUT   0x02,PA7
  857  6100        ADDS  0x00
  858  5002        SACL  0x02
  859  4F02        OUT   0x02,PA7
  85A  6100        ADDS  0x00
  85B  5002        SACL  0x02
  85C  4F02        OUT   0x02,PA7
  85D  6100        ADDS  0x00
  85E  5002        SACL  0x02
  85F  4F02        OUT   0x02,PA7
  860  6100        ADDS  0x00
  861  5002        SACL  0x02
  862  4F02        OUT   0x02,PA7
  863  6100        ADDS  0x00
  864  5002        SACL  0x02
  865  4F02        OUT   0x02,PA7
  866  6100        ADDS  0x00
  867  5002        SACL  0x02
  868  4F02        OUT   0x02,PA7
  869  6100        ADDS  0x00
  86A  5002        SACL  0x02
  86B  4F02        OUT   0x02,PA7
  86C  6100        ADDS  0x00
  86D  5002        SACL  0x02
  86E  4F02        OUT   0x02,PA7
  86F  6100        ADDS  0x00
  870  5002        SACL  0x02
  871  7F80        NOP
  872  7F80        NOP
  873  7F80        NOP
  874  7F80        NOP
  875  7F80        NOP
  876  2002        LAC   0x02
  877  FD00 0825   BGEZ  L825
L879:
  879  F600 087D   BIOZ  L87D
  87B  F900 0879   B     L879

L87D:
  87D  4001        IN    0x01,PA0
  87E  6501        ZALH  0x01
  87F  FA00 0882   BLZ   L882
  881  7F80        NOP
L882:
  882  F600 0882   BIOZ  L882
  884  7F80        NOP
  885  7F80        NOP
L886:
  886  4106        IN    0x06,PA1
  887  4209        IN    0x09,PA2
  888  6A23        LT    0x23
  889  6D0B        MPY   0x0B
  88A  7F8E        PAC
  88B  591D        SACH  0x1D,1
  88C  6D0C        MPY   0x0C
  88D  7F8E        PAC
  88E  591E        SACH  0x1E,1
  88F  6D0D        MPY   0x0D
  890  7F8E        PAC
  891  591F        SACH  0x1F,1
  892  6D0E        MPY   0x0E
  893  7F8E        PAC
  894  5920        SACH  0x20,1
  895  6D0F        MPY   0x0F
  896  7F8E        PAC
  897  5921        SACH  0x21,1
  898  6D10        MPY   0x10
  899  7F8E        PAC
  89A  5922        SACH  0x22,1
  89B  7F80        NOP
  89C  4417        IN    0x17,PA4
  89D  4411        IN    0x11,PA4
  89E  4418        IN    0x18,PA4
  89F  4412        IN    0x12,PA4
  8A0  4419        IN    0x19,PA4
  8A1  4413        IN    0x13,PA4
  8A2  441A        IN    0x1A,PA4
  8A3  4414        IN    0x14,PA4
  8A4  441B        IN    0x1B,PA4
  8A5  4415        IN    0x15,PA4
  8A6  441C        IN    0x1C,PA4
  8A7  4416        IN    0x16,PA4
  8A8  6A06        LT    0x06
  8A9  6D12        MPY   0x12
  8AA  7F8E        PAC
  8AB  6D18        MPY   0x18
  8AC  7F90        SPAC
  8AD  0F18        ADD   0x18,15
  8AE  590C        SACH  0x0C,1
  8AF  6A07        LT    0x07
  8B0  6D13        MPY   0x13
  8B1  7F8E        PAC
  8B2  6D19        MPY   0x19
  8B3  7F90        SPAC
  8B4  0F19        ADD   0x19,15
  8B5  590D        SACH  0x0D,1
  8B6  6A09        LT    0x09
  8B7  6D15        MPY   0x15
  8B8  7F8E        PAC
  8B9  6D1B        MPY   0x1B
  8BA  7F90        SPAC
  8BB  0F1B        ADD   0x1B,15
  8BC  590F        SACH  0x0F,1
  8BD  6A0A        LT    0x0A
  8BE  6D16        MPY   0x16
  8BF  7F8E        PAC
  8C0  6D1C        MPY   0x1C
  8C1  7F90        SPAC
  8C2  0F1C        ADD   0x1C,15
  8C3  5910        SACH  0x10,1
  8C4  4B0B        OUT   0x0B,PA3
  8C5  4B0C        OUT   0x0C,PA3
  8C6  4B1F        OUT   0x1F,PA3
  8C7  4B20        OUT   0x20,PA3
  8C8  4B21        OUT   0x21,PA3
  8C9  4B22        OUT   0x22,PA3
  8CA  6A05        LT    0x05
  8CB  6D11        MPY   0x11
  8CC  7F8E        PAC
  8CD  6D17        MPY   0x17
  8CE  7F90        SPAC
  8CF  0F17        ADD   0x17,15
  8D0  590B        SACH  0x0B,1
  8D1  4323        IN    0x23,PA3
  8D2  6A08        LT    0x08
  8D3  6D14        MPY   0x14
  8D4  7F8E        PAC
  8D5  6D1A        MPY   0x1A
  8D6  7F90        SPAC
  8D7  0F1A        ADD   0x1A,15
  8D8  590E        SACH  0x0E,1
  8D9  4107        IN    0x07,PA1
  8DA  420A        IN    0x0A,PA2
  8DB  6A23        LT    0x23
  8DC  6D0B        MPY   0x0B
  8DD  7F8E        PAC
  8DE  591D        SACH  0x1D,1
  8DF  6D0C        MPY   0x0C
  8E0  7F8E        PAC
  8E1  591E        SACH  0x1E,1
  8E2  6D0D        MPY   0x0D
  8E3  7F8E        PAC
  8E4  591F        SACH  0x1F,1
  8E5  6D0E        MPY   0x0E
  8E6  7F8E        PAC
  8E7  5920        SACH  0x20,1
  8E8  6D0F        MPY   0x0F
  8E9  7F8E        PAC
  8EA  5921        SACH  0x21,1
  8EB  6D10        MPY   0x10
  8EC  7F8E        PAC
  8ED  5922        SACH  0x22,1
  8EE  7F80        NOP
  8EF  4417        IN    0x17,PA4
  8F0  4411        IN    0x11,PA4
  8F1  4418        IN    0x18,PA4
  8F2  4412        IN    0x12,PA4
  8F3  4419        IN    0x19,PA4
  8F4  4413        IN    0x13,PA4
  8F5  441A        IN    0x1A,PA4
  8F6  4414        IN    0x14,PA4
  8F7  441B        IN    0x1B,PA4
  8F8  4415        IN    0x15,PA4
  8F9  441C        IN    0x1C,PA4
  8FA  4416        IN    0x16,PA4
  8FB  6A06        LT    0x06
  8FC  6D12        MPY   0x12
  8FD  7F8E        PAC
  8FE  6D18        MPY   0x18
  8FF  7F90        SPAC
  900  0F18        ADD   0x18,15
  901  590C        SACH  0x0C,1
  902  6A07        LT    0x07
  903  6D13        MPY   0x13
  904  7F8E        PAC
  905  6D19        MPY   0x19
  906  7F90        SPAC
  907  0F19        ADD   0x19,15
  908  590D        SACH  0x0D,1
  909  6A09        LT    0x09
  90A  6D15        MPY   0x15
  90B  7F8E        PAC
  90C  6D1B        MPY   0x1B
  90D  7F90        SPAC
  90E  0F1B        ADD   0x1B,15
  90F  590F        SACH  0x0F,1
  910  6A0A        LT    0x0A
  911  6D16        MPY   0x16
  912  7F8E        PAC
  913  6D1C        MPY   0x1C
  914  7F90        SPAC
  915  0F1C        ADD   0x1C,15
  916  5910        SACH  0x10,1
  917  4B0B        OUT   0x0B,PA3
  918  4B0C        OUT   0x0C,PA3
  919  4B1F        OUT   0x1F,PA3
  91A  4B20        OUT   0x20,PA3
  91B  4B21        OUT   0x21,PA3
  91C  4B22        OUT   0x22,PA3
  91D  6A05        LT    0x05
  91E  6D11        MPY   0x11
  91F  7F8E        PAC
  920  6D17        MPY   0x17
  921  7F90        SPAC
  922  0F17        ADD   0x17,15
  923  590B        SACH  0x0B,1
  924  4323        IN    0x23,PA3
  925  6A08        LT    0x08
  926  6D14        MPY   0x14
  927  7F8E        PAC
  928  6D1A        MPY   0x1A
  929  7F90        SPAC
  92A  0F1A        ADD   0x1A,15
  92B  590E        SACH  0x0E,1
  92C  4105        IN    0x05,PA1
  92D  4208        IN    0x08,PA2
  92E  6A23        LT    0x23
  92F  6D0B        MPY   0x0B
  930  7F8E        PAC
  931  591D        SACH  0x1D,1
  932  6D0C        MPY   0x0C
  933  7F8E        PAC
  934  591E        SACH  0x1E,1
  935  6D0D        MPY   0x0D
  936  7F8E        PAC
  937  591F        SACH  0x1F,1
  938  6D0E        MPY   0x0E
  939  7F8E        PAC
  93A  5920        SACH  0x20,1
  93B  6D0F        MPY   0x0F
  93C  7F8E        PAC
  93D  5921        SACH  0x21,1
  93E  6D10        MPY   0x10
  93F  7F8E        PAC
  940  5922        SACH  0x22,1
  941  7F80        NOP
  942  4417        IN    0x17,PA4
  943  4411        IN    0x11,PA4
  944  4418        IN    0x18,PA4
  945  4412        IN    0x12,PA4
  946  4419        IN    0x19,PA4
  947  4413        IN    0x13,PA4
  948  441A        IN    0x1A,PA4
  949  4414        IN    0x14,PA4
  94A  441B        IN    0x1B,PA4
  94B  4415        IN    0x15,PA4
  94C  441C        IN    0x1C,PA4
  94D  4416        IN    0x16,PA4
  94E  6A06        LT    0x06
  94F  6D12        MPY   0x12
  950  7F8E        PAC
  951  6D18        MPY   0x18
  952  7F90        SPAC
  953  0F18        ADD   0x18,15
  954  590C        SACH  0x0C,1
  955  6A07        LT    0x07
  956  6D13        MPY   0x13
  957  7F8E        PAC
  958  6D19        MPY   0x19
  959  7F90        SPAC
  95A  0F19        ADD   0x19,15
  95B  590D        SACH  0x0D,1
  95C  6A0A        LT    0x0A
  95D  6D16        MPY   0x16
  95E  7F8E        PAC
  95F  6D1C        MPY   0x1C
  960  7F90        SPAC
  961  0F1C        ADD   0x1C,15
  962  5910        SACH  0x10,1
  963  6A09        LT    0x09
  964  6D15        MPY   0x15
  965  7F8E        PAC
  966  6D1B        MPY   0x1B
  967  7F90        SPAC
  968  0F1B        ADD   0x1B,15
  969  590F        SACH  0x0F,1
  96A  4B0B        OUT   0x0B,PA3
  96B  4B0C        OUT   0x0C,PA3
  96C  4B1F        OUT   0x1F,PA3
  96D  4B20        OUT   0x20,PA3
  96E  4B21        OUT   0x21,PA3
  96F  4B22        OUT   0x22,PA3
  970  6A05        LT    0x05
  971  6D11        MPY   0x11
  972  7F8E        PAC
  973  6D17        MPY   0x17
  974  7F90        SPAC
  975  0F17        ADD   0x17,15
  976  590B        SACH  0x0B,1
  977  6A08        LT    0x08
  978  6D14        MPY   0x14
  979  7F8E        PAC
  97A  6D1A        MPY   0x1A
  97B  7F90        SPAC
  97C  0F1A        ADD   0x1A,15
  97D  590E        SACH  0x0E,1
  97E  F900 0886   B     L886

