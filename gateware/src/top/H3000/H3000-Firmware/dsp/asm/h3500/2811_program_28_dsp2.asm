; Eventide h3500 DSP microcode
; key 2811  algorithm 28 (program 28)  DSP 2
; source H3000-Upgrade_ROM2.BIN offset 01CC8, 427 program words loaded at 800
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
  80D  2900        LAC   0x00,9
  80E  5003        SACL  0x03
  80F  7E0C        LACK  0x0C
  810  5001        SACL  0x01
  811  2C01        LAC   0x01,12
  812  5004        SACL  0x04
  813  7EFF        LACK  0xFF
  814  5001        SACL  0x01
  815  2701        LAC   0x01,7
  816  7A01        OR    0x01
  817  5015        SACL  0x15
  818  7F80        NOP
  819  7F80        NOP
  81A  6615        ZALS  0x15
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
  834  6100        ADDS  0x00
  835  5002        SACL  0x02
  836  4F02        OUT   0x02,PA7
  837  6100        ADDS  0x00
  838  5002        SACL  0x02
  839  4F02        OUT   0x02,PA7
  83A  6100        ADDS  0x00
  83B  5002        SACL  0x02
  83C  4F02        OUT   0x02,PA7
  83D  6100        ADDS  0x00
  83E  5002        SACL  0x02
  83F  4F02        OUT   0x02,PA7
  840  6100        ADDS  0x00
  841  5002        SACL  0x02
  842  4F02        OUT   0x02,PA7
  843  6100        ADDS  0x00
  844  5002        SACL  0x02
  845  4F02        OUT   0x02,PA7
  846  6100        ADDS  0x00
  847  5002        SACL  0x02
  848  4F02        OUT   0x02,PA7
  849  6100        ADDS  0x00
  84A  5002        SACL  0x02
  84B  4F02        OUT   0x02,PA7
  84C  6100        ADDS  0x00
  84D  5002        SACL  0x02
  84E  4F02        OUT   0x02,PA7
  84F  6100        ADDS  0x00
  850  5002        SACL  0x02
  851  4F02        OUT   0x02,PA7
  852  6100        ADDS  0x00
  853  5002        SACL  0x02
  854  4F02        OUT   0x02,PA7
  855  6100        ADDS  0x00
  856  5002        SACL  0x02
  857  4F02        OUT   0x02,PA7
  858  6100        ADDS  0x00
  859  5002        SACL  0x02
  85A  4F02        OUT   0x02,PA7
  85B  6100        ADDS  0x00
  85C  5002        SACL  0x02
  85D  4F02        OUT   0x02,PA7
  85E  6100        ADDS  0x00
  85F  5002        SACL  0x02
  860  4F02        OUT   0x02,PA7
  861  6100        ADDS  0x00
  862  5002        SACL  0x02
  863  4F02        OUT   0x02,PA7
  864  6100        ADDS  0x00
  865  5002        SACL  0x02
  866  4F02        OUT   0x02,PA7
  867  6100        ADDS  0x00
  868  5002        SACL  0x02
  869  4F02        OUT   0x02,PA7
  86A  6100        ADDS  0x00
  86B  5002        SACL  0x02
  86C  4F02        OUT   0x02,PA7
  86D  6100        ADDS  0x00
  86E  5002        SACL  0x02
  86F  4F02        OUT   0x02,PA7
  870  6100        ADDS  0x00
  871  5002        SACL  0x02
  872  4F02        OUT   0x02,PA7
  873  7F80        NOP
  874  7F80        NOP
  875  7F80        NOP
  876  7F80        NOP
  877  7F80        NOP
  878  2002        LAC   0x02
  879  FA00 0827   BLZ   L827
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
  886  6501        ZALH  0x01
  887  5806        SACH  0x06
L888:
  888  6A19        LT    0x19
  889  6D98        MPY   *-
  88A  7F8E        PAC
  88B  6C14        LTA   0x14
  88C  6DA8        MPY   *+
  88D  7F8F        APAC
  88E  5819        SACH  0x19
  88F  6014        ADDH  0x14
  890  7F90        SPAC
  891  581B        SACH  0x1B
  892  4C09        OUT   0x09,PA4
  893  6A1D        LT    0x1D
  894  4C0A        OUT   0x0A,PA4
  895  410F        IN    0x0F,PA1
  896  4C0B        OUT   0x0B,PA4
  897  4210        IN    0x10,PA2
  898  4C0C        OUT   0x0C,PA4
  899  6D4D        MPY   0x4D
  89A  7F8E        PAC
  89B  4C0D        OUT   0x0D,PA4
  89C  4001        IN    0x01,PA0
  89D  4C0E        OUT   0x0E,PA4
  89E  0E0F        ADD   0x0F,14
  89F  4111        IN    0x11,PA1
  8A0  0E10        ADD   0x10,14
  8A1  4C05        OUT   0x05,PA4
  8A2  4212        IN    0x12,PA2
  8A3  0F11        ADD   0x11,15
  8A4  441D        IN    0x1D,PA4
  8A5  4113        IN    0x13,PA1
  8A6  4214        IN    0x14,PA2
  8A7  0F1A        ADD   0x1A,15
  8A8  0F13        ADD   0x13,15
  8A9  0F1B        ADD   0x1B,15
  8AA  5809        SACH  0x09
  8AB  1F0F        SUB   0x0F,15
  8AC  621A        SUBH  0x1A
  8AD  621B        SUBH  0x1B
  8AE  580B        SACH  0x0B
  8AF  7F8E        PAC
  8B0  0F0F        ADD   0x0F,15
  8B1  0F10        ADD   0x10,15
  8B2  0E11        ADD   0x11,14
  8B3  0E1A        ADD   0x1A,14
  8B4  1F13        SUB   0x13,15
  8B5  1F1B        SUB   0x1B,15
  8B6  580A        SACH  0x0A
  8B7  620F        SUBH  0x0F
  8B8  1F1A        SUB   0x1A,15
  8B9  601B        ADDH  0x1B
  8BA  580C        SACH  0x0C
  8BB  7F8E        PAC
  8BC  1F0F        SUB   0x0F,15
  8BD  0F10        ADD   0x10,15
  8BE  1F11        SUB   0x11,15
  8BF  0F1A        ADD   0x1A,15
  8C0  0E13        ADD   0x13,14
  8C1  1E1B        SUB   0x1B,14
  8C2  580D        SACH  0x0D
  8C3  6210        SUBH  0x10
  8C4  6011        ADDH  0x11
  8C5  1F13        SUB   0x13,15
  8C6  580E        SACH  0x0E
  8C7  6A18        LT    0x18
  8C8  6D98        MPY   *-
  8C9  7F8E        PAC
  8CA  6C12        LTA   0x12
  8CB  6DA8        MPY   *+
  8CC  7F8F        APAC
  8CD  5818        SACH  0x18
  8CE  6012        ADDH  0x12
  8CF  7F90        SPAC
  8D0  581A        SACH  0x1A
  8D1  6A19        LT    0x19
  8D2  6D98        MPY   *-
  8D3  4705        IN    0x05,PA7
  8D4  7F8E        PAC
  8D5  6C14        LTA   0x14
  8D6  6DA8        MPY   *+
  8D7  7F8F        APAC
  8D8  5819        SACH  0x19
  8D9  6014        ADDH  0x14
  8DA  7F90        SPAC
  8DB  581B        SACH  0x1B
  8DC  2100        LAC   0x00,1
  8DD  7901        AND   0x01
  8DE  FF00 08E8   BZ    L8E8
  8E0  7F80        NOP
  8E1  7F80        NOP
  8E2  7F80        NOP
  8E3  7F80        NOP
  8E4  7F80        NOP
  8E5  7F80        NOP
  8E6  F900 08F3   B     L8F3

L8E8:
  8E8  651F        ZALH  0x1F
  8E9  FB00 08F0   BLEZ  L8F0
  8EB  6907        DMOV  0x07
  8EC  7F80        NOP
  8ED  7F80        NOP
  8EE  F900 08F3   B     L8F3

L8F0:
  8F0  4804        OUT   0x04,PA0
  8F1  4B07        OUT   0x07,PA3
  8F2  6907        DMOV  0x07
L8F3:
  8F3  6506        ZALH  0x06
  8F4  624B        SUBH  0x4B
  8F5  4C09        OUT   0x09,PA4
  8F6  5807        SACH  0x07
  8F7  4C0A        OUT   0x0A,PA4
  8F8  410F        IN    0x0F,PA1
  8F9  4C0B        OUT   0x0B,PA4
  8FA  4210        IN    0x10,PA2
  8FB  4C0C        OUT   0x0C,PA4
  8FC  6A07        LT    0x07
  8FD  6D08        MPY   0x08
  8FE  4C0D        OUT   0x0D,PA4
  8FF  7F8E        PAC
  900  581F        SACH  0x1F
  901  4C0E        OUT   0x0E,PA4
  902  6A1D        LT    0x1D
  903  4111        IN    0x11,PA1
  904  6D4D        MPY   0x4D
  905  4C05        OUT   0x05,PA4
  906  4212        IN    0x12,PA2
  907  7F8E        PAC
  908  441D        IN    0x1D,PA4
  909  4113        IN    0x13,PA1
  90A  4214        IN    0x14,PA2
  90B  0E0F        ADD   0x0F,14
  90C  0E10        ADD   0x10,14
  90D  0F11        ADD   0x11,15
  90E  0F1A        ADD   0x1A,15
  90F  0F13        ADD   0x13,15
  910  0F1B        ADD   0x1B,15
  911  5809        SACH  0x09
  912  1F0F        SUB   0x0F,15
  913  621A        SUBH  0x1A
  914  621B        SUBH  0x1B
  915  580B        SACH  0x0B
  916  7F8E        PAC
  917  0F0F        ADD   0x0F,15
  918  0F10        ADD   0x10,15
  919  0E11        ADD   0x11,14
  91A  0E1A        ADD   0x1A,14
  91B  1F13        SUB   0x13,15
  91C  1F1B        SUB   0x1B,15
  91D  580A        SACH  0x0A
  91E  620F        SUBH  0x0F
  91F  1F1A        SUB   0x1A,15
  920  601B        ADDH  0x1B
  921  580C        SACH  0x0C
  922  7F8E        PAC
  923  1F0F        SUB   0x0F,15
  924  0F10        ADD   0x10,15
  925  1F11        SUB   0x11,15
  926  0F1A        ADD   0x1A,15
  927  0E13        ADD   0x13,14
  928  1E1B        SUB   0x1B,14
  929  580D        SACH  0x0D
  92A  6210        SUBH  0x10
  92B  6011        ADDH  0x11
  92C  1F13        SUB   0x13,15
  92D  580E        SACH  0x0E
  92E  6A18        LT    0x18
  92F  6D98        MPY   *-
  930  7F8E        PAC
  931  6C12        LTA   0x12
  932  6DA8        MPY   *+
  933  6C19        LTA   0x19
  934  5818        SACH  0x18
  935  6012        ADDH  0x12
  936  7F90        SPAC
  937  4705        IN    0x05,PA7
  938  581A        SACH  0x1A
  939  6D98        MPY   *-
  93A  7F8E        PAC
  93B  6C14        LTA   0x14
  93C  6DA8        MPY   *+
  93D  7F8F        APAC
  93E  5819        SACH  0x19
  93F  6014        ADDH  0x14
  940  7F90        SPAC
  941  581B        SACH  0x1B
  942  4501        IN    0x01,PA5
  943  6881        LARP  1
  944  6601        ZALS  0x01
  945  7903        AND   0x03
  946  FE00 094B   BNZ   L94B
  948  6880        LARP  0
  949  F900 094D   B     L94D

L94B:
  94B  3901        LAR   AR1,0x01
  94C  4680        IN    *,PA6,AR0
L94D:
  94D  651D        ZALH  0x1D
  94E  7F88        ABS
  94F  4C09        OUT   0x09,PA4
  950  5801        SACH  0x01
  951  4C0A        OUT   0x0A,PA4
  952  410F        IN    0x0F,PA1
  953  4C0B        OUT   0x0B,PA4
  954  4210        IN    0x10,PA2
  955  4C0C        OUT   0x0C,PA4
  956  6A1D        LT    0x1D
  957  6D4D        MPY   0x4D
  958  4C0D        OUT   0x0D,PA4
  959  7F8E        PAC
  95A  0E0F        ADD   0x0F,14
  95B  4C0E        OUT   0x0E,PA4
  95C  0E10        ADD   0x10,14
  95D  4111        IN    0x11,PA1
  95E  0F11        ADD   0x11,15
  95F  4C05        OUT   0x05,PA4
  960  4212        IN    0x12,PA2
  961  0F1A        ADD   0x1A,15
  962  441D        IN    0x1D,PA4
  963  4113        IN    0x13,PA1
  964  4214        IN    0x14,PA2
  965  0F13        ADD   0x13,15
  966  0F1B        ADD   0x1B,15
  967  5809        SACH  0x09
  968  1F0F        SUB   0x0F,15
  969  621A        SUBH  0x1A
  96A  621B        SUBH  0x1B
  96B  580B        SACH  0x0B
  96C  7F8E        PAC
  96D  0F0F        ADD   0x0F,15
  96E  0F10        ADD   0x10,15
  96F  0E11        ADD   0x11,14
  970  0E1A        ADD   0x1A,14
  971  1F13        SUB   0x13,15
  972  1F1B        SUB   0x1B,15
  973  580A        SACH  0x0A
  974  620F        SUBH  0x0F
  975  1F1A        SUB   0x1A,15
  976  601B        ADDH  0x1B
  977  580C        SACH  0x0C
  978  7F8E        PAC
  979  1F0F        SUB   0x0F,15
  97A  0F10        ADD   0x10,15
  97B  1F11        SUB   0x11,15
  97C  0F1A        ADD   0x1A,15
  97D  0E13        ADD   0x13,14
  97E  1E1B        SUB   0x1B,14
  97F  580D        SACH  0x0D
  980  6210        SUBH  0x10
  981  6011        ADDH  0x11
  982  1F13        SUB   0x13,15
  983  580E        SACH  0x0E
  984  6A18        LT    0x18
  985  6D98        MPY   *-
  986  7F8E        PAC
  987  6C12        LTA   0x12
  988  6DA8        MPY   *+
  989  7F8F        APAC
  98A  5818        SACH  0x18
  98B  6012        ADDH  0x12
  98C  7F90        SPAC
  98D  581A        SACH  0x1A
  98E  654A        ZALH  0x4A
  98F  FF00 099E   BZ    L99E
  991  4705        IN    0x05,PA7
  992  7F80        NOP
  993  7F80        NOP
  994  7046        LARK  AR0,0x46
  995  6A01        LT    0x01
  996  6D4C        MPY   0x4C
  997  7F8E        PAC
  998  5906        SACH  0x06,1
  999  1F01        SUB   0x01,15
  99A  FA00 0886   BLZ   L886
  99C  F900 0888   B     L888

L99E:
  99E  4705        IN    0x05,PA7
  99F  7F80        NOP
  9A0  7F80        NOP
  9A1  7041        LARK  AR0,0x41
  9A2  6A01        LT    0x01
  9A3  6D4C        MPY   0x4C
  9A4  7F8E        PAC
  9A5  5906        SACH  0x06,1
  9A6  1F01        SUB   0x01,15
  9A7  FA00 0886   BLZ   L886
  9A9  F900 0888   B     L888

