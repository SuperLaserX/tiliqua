; Eventide h3000_v153 DSP microcode
; key 1E10  algorithm 1E (program 1E)  DSP 1
; source H3000_153_BigROM.BIN offset 0A289, 338 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5000        SACL  0x00
  806  2800        LAC   0x00,8
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
  815  4001        IN    0x01,PA0
  816  6501        ZALH  0x01
  817  FD00 081A   BGEZ  L81A
  819  7F80        NOP
L81A:
  81A  F600 081A   BIOZ  L81A
  81C  7F89        ZAC
  81D  5024        SACL  0x24
  81E  5002        SACL  0x02
  81F  7F80        NOP
  820  500B        SACL  0x0B
  821  500C        SACL  0x0C
  822  500D        SACL  0x0D
  823  500E        SACL  0x0E
  824  500F        SACL  0x0F
  825  5010        SACL  0x10
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
L834:
  834  4F02        OUT   0x02,PA7
  835  4C24        OUT   0x24,PA4
  836  0000        ADD   0x00
  837  5002        SACL  0x02
  838  4501        IN    0x01,PA5
  839  6881        LARP  1
  83A  6601        ZALS  0x01
  83B  7903        AND   0x03
  83C  FE00 0841   BNZ   L841
  83E  6880        LARP  0
  83F  F900 0843   B     L843

L841:
  841  3901        LAR   AR1,0x01
  842  4680        IN    *,PA6,AR0
L843:
  843  4F02        OUT   0x02,PA7
  844  4C24        OUT   0x24,PA4
  845  6602        ZALS  0x02
  846  0000        ADD   0x00
  847  5002        SACL  0x02
  848  6602        ZALS  0x02
  849  FE00 0834   BNZ   L834
L84B:
  84B  F600 084F   BIOZ  L84F
  84D  F900 084B   B     L84B

L84F:
  84F  4001        IN    0x01,PA0
  850  6501        ZALH  0x01
  851  FA00 0854   BLZ   L854
  853  7F80        NOP
L854:
  854  F600 0854   BIOZ  L854
  856  7F80        NOP
  857  7F80        NOP
L858:
  858  4106        IN    0x06,PA1
  859  4209        IN    0x09,PA2
  85A  6A23        LT    0x23
  85B  6D0B        MPY   0x0B
  85C  7F8E        PAC
  85D  591D        SACH  0x1D,1
  85E  6D0C        MPY   0x0C
  85F  7F8E        PAC
  860  591E        SACH  0x1E,1
  861  6D0D        MPY   0x0D
  862  7F8E        PAC
  863  591F        SACH  0x1F,1
  864  6D0E        MPY   0x0E
  865  7F8E        PAC
  866  5920        SACH  0x20,1
  867  6D0F        MPY   0x0F
  868  7F8E        PAC
  869  5921        SACH  0x21,1
  86A  6D10        MPY   0x10
  86B  7F8E        PAC
  86C  5922        SACH  0x22,1
  86D  7F80        NOP
  86E  4411        IN    0x11,PA4
  86F  4417        IN    0x17,PA4
  870  4412        IN    0x12,PA4
  871  4418        IN    0x18,PA4
  872  4413        IN    0x13,PA4
  873  4419        IN    0x19,PA4
  874  4414        IN    0x14,PA4
  875  441A        IN    0x1A,PA4
  876  4415        IN    0x15,PA4
  877  441B        IN    0x1B,PA4
  878  4416        IN    0x16,PA4
  879  441C        IN    0x1C,PA4
  87A  6A06        LT    0x06
  87B  6D18        MPY   0x18
  87C  7F8E        PAC
  87D  6D12        MPY   0x12
  87E  7F90        SPAC
  87F  0F12        ADD   0x12,15
  880  590C        SACH  0x0C,1
  881  6A07        LT    0x07
  882  6D19        MPY   0x19
  883  7F8E        PAC
  884  6D13        MPY   0x13
  885  7F90        SPAC
  886  0F13        ADD   0x13,15
  887  590D        SACH  0x0D,1
  888  6A09        LT    0x09
  889  6D1B        MPY   0x1B
  88A  7F8E        PAC
  88B  6D15        MPY   0x15
  88C  7F90        SPAC
  88D  0F15        ADD   0x15,15
  88E  590F        SACH  0x0F,1
  88F  6A0A        LT    0x0A
  890  6D1C        MPY   0x1C
  891  7F8E        PAC
  892  6D16        MPY   0x16
  893  7F90        SPAC
  894  0F16        ADD   0x16,15
  895  5910        SACH  0x10,1
  896  4B0B        OUT   0x0B,PA3
  897  4B0C        OUT   0x0C,PA3
  898  4B1F        OUT   0x1F,PA3
  899  4B20        OUT   0x20,PA3
  89A  4B21        OUT   0x21,PA3
  89B  4B22        OUT   0x22,PA3
  89C  6A05        LT    0x05
  89D  6D17        MPY   0x17
  89E  7F8E        PAC
  89F  6D11        MPY   0x11
  8A0  7F90        SPAC
  8A1  0F11        ADD   0x11,15
  8A2  590B        SACH  0x0B,1
  8A3  4323        IN    0x23,PA3
  8A4  6A08        LT    0x08
  8A5  6D1A        MPY   0x1A
  8A6  7F8E        PAC
  8A7  6D14        MPY   0x14
  8A8  7F90        SPAC
  8A9  0F14        ADD   0x14,15
  8AA  590E        SACH  0x0E,1
  8AB  4107        IN    0x07,PA1
  8AC  420A        IN    0x0A,PA2
  8AD  6A23        LT    0x23
  8AE  6D0B        MPY   0x0B
  8AF  7F8E        PAC
  8B0  591D        SACH  0x1D,1
  8B1  6D0C        MPY   0x0C
  8B2  7F8E        PAC
  8B3  591E        SACH  0x1E,1
  8B4  6D0D        MPY   0x0D
  8B5  7F8E        PAC
  8B6  591F        SACH  0x1F,1
  8B7  6D0E        MPY   0x0E
  8B8  7F8E        PAC
  8B9  5920        SACH  0x20,1
  8BA  6D0F        MPY   0x0F
  8BB  7F8E        PAC
  8BC  5921        SACH  0x21,1
  8BD  6D10        MPY   0x10
  8BE  7F8E        PAC
  8BF  5922        SACH  0x22,1
  8C0  7F80        NOP
  8C1  4411        IN    0x11,PA4
  8C2  4417        IN    0x17,PA4
  8C3  4412        IN    0x12,PA4
  8C4  4418        IN    0x18,PA4
  8C5  4413        IN    0x13,PA4
  8C6  4419        IN    0x19,PA4
  8C7  4414        IN    0x14,PA4
  8C8  441A        IN    0x1A,PA4
  8C9  4415        IN    0x15,PA4
  8CA  441B        IN    0x1B,PA4
  8CB  4416        IN    0x16,PA4
  8CC  441C        IN    0x1C,PA4
  8CD  6A06        LT    0x06
  8CE  6D18        MPY   0x18
  8CF  7F8E        PAC
  8D0  6D12        MPY   0x12
  8D1  7F90        SPAC
  8D2  0F12        ADD   0x12,15
  8D3  590C        SACH  0x0C,1
  8D4  6A07        LT    0x07
  8D5  6D19        MPY   0x19
  8D6  7F8E        PAC
  8D7  6D13        MPY   0x13
  8D8  7F90        SPAC
  8D9  0F13        ADD   0x13,15
  8DA  590D        SACH  0x0D,1
  8DB  6A09        LT    0x09
  8DC  6D1B        MPY   0x1B
  8DD  7F8E        PAC
  8DE  6D15        MPY   0x15
  8DF  7F90        SPAC
  8E0  0F15        ADD   0x15,15
  8E1  590F        SACH  0x0F,1
  8E2  6A0A        LT    0x0A
  8E3  6D1C        MPY   0x1C
  8E4  7F8E        PAC
  8E5  6D16        MPY   0x16
  8E6  7F90        SPAC
  8E7  0F16        ADD   0x16,15
  8E8  5910        SACH  0x10,1
  8E9  4B0B        OUT   0x0B,PA3
  8EA  4B0C        OUT   0x0C,PA3
  8EB  4B1F        OUT   0x1F,PA3
  8EC  4B20        OUT   0x20,PA3
  8ED  4B21        OUT   0x21,PA3
  8EE  4B22        OUT   0x22,PA3
  8EF  6A05        LT    0x05
  8F0  6D17        MPY   0x17
  8F1  7F8E        PAC
  8F2  6D11        MPY   0x11
  8F3  7F90        SPAC
  8F4  0F11        ADD   0x11,15
  8F5  590B        SACH  0x0B,1
  8F6  4323        IN    0x23,PA3
  8F7  6A08        LT    0x08
  8F8  6D1A        MPY   0x1A
  8F9  7F8E        PAC
  8FA  6D14        MPY   0x14
  8FB  7F90        SPAC
  8FC  0F14        ADD   0x14,15
  8FD  590E        SACH  0x0E,1
  8FE  4105        IN    0x05,PA1
  8FF  4208        IN    0x08,PA2
  900  6A23        LT    0x23
  901  6D0B        MPY   0x0B
  902  7F8E        PAC
  903  591D        SACH  0x1D,1
  904  6D0C        MPY   0x0C
  905  7F8E        PAC
  906  591E        SACH  0x1E,1
  907  6D0D        MPY   0x0D
  908  7F8E        PAC
  909  591F        SACH  0x1F,1
  90A  6D0E        MPY   0x0E
  90B  7F8E        PAC
  90C  5920        SACH  0x20,1
  90D  6D0F        MPY   0x0F
  90E  7F8E        PAC
  90F  5921        SACH  0x21,1
  910  6D10        MPY   0x10
  911  7F8E        PAC
  912  5922        SACH  0x22,1
  913  7F80        NOP
  914  4411        IN    0x11,PA4
  915  4417        IN    0x17,PA4
  916  4412        IN    0x12,PA4
  917  4418        IN    0x18,PA4
  918  4413        IN    0x13,PA4
  919  4419        IN    0x19,PA4
  91A  4414        IN    0x14,PA4
  91B  441A        IN    0x1A,PA4
  91C  4415        IN    0x15,PA4
  91D  441B        IN    0x1B,PA4
  91E  4416        IN    0x16,PA4
  91F  441C        IN    0x1C,PA4
  920  6A06        LT    0x06
  921  6D18        MPY   0x18
  922  7F8E        PAC
  923  6D12        MPY   0x12
  924  7F90        SPAC
  925  0F12        ADD   0x12,15
  926  590C        SACH  0x0C,1
  927  6A07        LT    0x07
  928  6D19        MPY   0x19
  929  7F8E        PAC
  92A  6D13        MPY   0x13
  92B  7F90        SPAC
  92C  0F13        ADD   0x13,15
  92D  590D        SACH  0x0D,1
  92E  6A0A        LT    0x0A
  92F  6D1C        MPY   0x1C
  930  7F8E        PAC
  931  6D16        MPY   0x16
  932  7F90        SPAC
  933  0F16        ADD   0x16,15
  934  5910        SACH  0x10,1
  935  6A09        LT    0x09
  936  6D1B        MPY   0x1B
  937  7F8E        PAC
  938  6D15        MPY   0x15
  939  7F90        SPAC
  93A  0F15        ADD   0x15,15
  93B  590F        SACH  0x0F,1
  93C  4B0B        OUT   0x0B,PA3
  93D  4B0C        OUT   0x0C,PA3
  93E  4B1F        OUT   0x1F,PA3
  93F  4B20        OUT   0x20,PA3
  940  4B21        OUT   0x21,PA3
  941  4B22        OUT   0x22,PA3
  942  6A05        LT    0x05
  943  6D17        MPY   0x17
  944  7F8E        PAC
  945  6D11        MPY   0x11
  946  7F90        SPAC
  947  0F11        ADD   0x11,15
  948  590B        SACH  0x0B,1
  949  6A08        LT    0x08
  94A  6D1A        MPY   0x1A
  94B  7F8E        PAC
  94C  6D14        MPY   0x14
  94D  7F90        SPAC
  94E  0F14        ADD   0x14,15
  94F  590E        SACH  0x0E,1
  950  F900 0858   B     L858

