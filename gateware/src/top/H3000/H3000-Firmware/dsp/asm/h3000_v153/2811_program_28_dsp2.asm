; Eventide h3000_v153 DSP microcode
; key 2811  algorithm 28 (program 28)  DSP 2
; source H3000_153_BigROM.BIN offset 09DE5, 368 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5000        SACL  0x00
  806  2900        LAC   0x00,9
  807  5003        SACL  0x03
  808  7E0C        LACK  0x0C
  809  5001        SACL  0x01
  80A  2C01        LAC   0x01,12
  80B  5004        SACL  0x04
  80C  7F80        NOP
  80D  7F80        NOP
  80E  7F80        NOP
  80F  7F80        NOP
  810  7F80        NOP
  811  7F80        NOP
  812  7F80        NOP
L813:
  813  F600 0817   BIOZ  L817
  815  F900 0813   B     L813

L817:
  817  4001        IN    0x01,PA0
  818  6501        ZALH  0x01
  819  FD00 081C   BGEZ  L81C
  81B  7F80        NOP
L81C:
  81C  F600 081C   BIOZ  L81C
  81E  7F89        ZAC
  81F  5002        SACL  0x02
  820  7F80        NOP
  821  7F80        NOP
  822  5009        SACL  0x09
  823  500A        SACL  0x0A
  824  500B        SACL  0x0B
  825  500C        SACL  0x0C
  826  500D        SACL  0x0D
  827  500E        SACL  0x0E
  828  501D        SACL  0x1D
  829  7F80        NOP
  82A  7F80        NOP
  82B  7F80        NOP
  82C  7F80        NOP
  82D  7F80        NOP
  82E  7F80        NOP
  82F  7F80        NOP
  830  7F80        NOP
  831  7F80        NOP
L832:
  832  7F80        NOP
  833  7F80        NOP
  834  7F80        NOP
  835  7F80        NOP
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
  843  7F80        NOP
  844  7F80        NOP
  845  7F80        NOP
  846  7F80        NOP
  847  6602        ZALS  0x02
  848  0000        ADD   0x00
  849  5002        SACL  0x02
  84A  6602        ZALS  0x02
  84B  FE00 0832   BNZ   L832
L84D:
  84D  F600 0851   BIOZ  L851
  84F  F900 084D   B     L84D

L851:
  851  4001        IN    0x01,PA0
  852  6501        ZALH  0x01
  853  FA00 0856   BLZ   L856
  855  7F80        NOP
L856:
  856  F600 0856   BIOZ  L856
L858:
  858  651D        ZALH  0x1D
  859  7F88        ABS
  85A  5801        SACH  0x01
  85B  6A06        LT    0x06
  85C  6D41        MPY   0x41
  85D  7F8E        PAC
  85E  5906        SACH  0x06,1
  85F  1F01        SUB   0x01,15
  860  FA00 0864   BLZ   L864
  862  F900 0866   B     L866

L864:
  864  6501        ZALH  0x01
  865  5806        SACH  0x06
L866:
  866  4C09        OUT   0x09,PA4
  867  6506        ZALH  0x06
  868  4C0A        OUT   0x0A,PA4
  869  410F        IN    0x0F,PA1
  86A  4C0B        OUT   0x0B,PA4
  86B  4210        IN    0x10,PA2
  86C  4C0C        OUT   0x0C,PA4
  86D  6240        SUBH  0x40
  86E  5807        SACH  0x07
  86F  4C0D        OUT   0x0D,PA4
  870  4001        IN    0x01,PA0
  871  4C0E        OUT   0x0E,PA4
  872  7F80        NOP
  873  4111        IN    0x11,PA1
  874  6A07        LT    0x07
  875  4C05        OUT   0x05,PA4
  876  4212        IN    0x12,PA2
  877  6D08        MPY   0x08
  878  441D        IN    0x1D,PA4
  879  4113        IN    0x13,PA1
  87A  4214        IN    0x14,PA2
  87B  7F8E        PAC
  87C  581F        SACH  0x1F
  87D  6A1D        LT    0x1D
  87E  6D42        MPY   0x42
  87F  7F8E        PAC
  880  0E0F        ADD   0x0F,14
  881  0E10        ADD   0x10,14
  882  0F11        ADD   0x11,15
  883  0F12        ADD   0x12,15
  884  0F13        ADD   0x13,15
  885  0F14        ADD   0x14,15
  886  5809        SACH  0x09
  887  7F8E        PAC
  888  0F0F        ADD   0x0F,15
  889  0F10        ADD   0x10,15
  88A  0E11        ADD   0x11,14
  88B  0E12        ADD   0x12,14
  88C  1F13        SUB   0x13,15
  88D  1F14        SUB   0x14,15
  88E  580A        SACH  0x0A
  88F  7F8E        PAC
  890  1E0F        SUB   0x0F,14
  891  0E10        ADD   0x10,14
  892  0F11        ADD   0x11,15
  893  1F12        SUB   0x12,15
  894  0F13        ADD   0x13,15
  895  1F14        SUB   0x14,15
  896  580B        SACH  0x0B
  897  7F8E        PAC
  898  1F0F        SUB   0x0F,15
  899  0F10        ADD   0x10,15
  89A  0E11        ADD   0x11,14
  89B  1E12        SUB   0x12,14
  89C  1F13        SUB   0x13,15
  89D  0F14        ADD   0x14,15
  89E  580C        SACH  0x0C
  89F  7F8E        PAC
  8A0  1F0F        SUB   0x0F,15
  8A1  0F10        ADD   0x10,15
  8A2  1F11        SUB   0x11,15
  8A3  0F12        ADD   0x12,15
  8A4  0E13        ADD   0x13,14
  8A5  1E14        SUB   0x14,14
  8A6  580D        SACH  0x0D
  8A7  4705        IN    0x05,PA7
  8A8  7F8E        PAC
  8A9  1F0F        SUB   0x0F,15
  8AA  1F10        SUB   0x10,15
  8AB  0F11        ADD   0x11,15
  8AC  0F12        ADD   0x12,15
  8AD  1E13        SUB   0x13,14
  8AE  1E14        SUB   0x14,14
  8AF  580E        SACH  0x0E
  8B0  2100        LAC   0x00,1
  8B1  7901        AND   0x01
  8B2  FF00 08BC   BZ    L8BC
  8B4  7F80        NOP
  8B5  7F80        NOP
  8B6  7F80        NOP
  8B7  7F80        NOP
  8B8  7F80        NOP
  8B9  7F80        NOP
  8BA  F900 08C7   B     L8C7

L8BC:
  8BC  651F        ZALH  0x1F
  8BD  FB00 08C4   BLEZ  L8C4
  8BF  6907        DMOV  0x07
  8C0  7F80        NOP
  8C1  7F80        NOP
  8C2  F900 08C7   B     L8C7

L8C4:
  8C4  4804        OUT   0x04,PA0
  8C5  4B07        OUT   0x07,PA3
  8C6  6907        DMOV  0x07
L8C7:
  8C7  7F80        NOP
  8C8  7F80        NOP
  8C9  4C09        OUT   0x09,PA4
  8CA  7F80        NOP
  8CB  4C0A        OUT   0x0A,PA4
  8CC  410F        IN    0x0F,PA1
  8CD  4C0B        OUT   0x0B,PA4
  8CE  4210        IN    0x10,PA2
  8CF  4C0C        OUT   0x0C,PA4
  8D0  7F80        NOP
  8D1  7F80        NOP
  8D2  4C0D        OUT   0x0D,PA4
  8D3  7F80        NOP
  8D4  7F80        NOP
  8D5  4C0E        OUT   0x0E,PA4
  8D6  7F80        NOP
  8D7  4111        IN    0x11,PA1
  8D8  7F80        NOP
  8D9  4C05        OUT   0x05,PA4
  8DA  4212        IN    0x12,PA2
  8DB  7F80        NOP
  8DC  441D        IN    0x1D,PA4
  8DD  4113        IN    0x13,PA1
  8DE  4214        IN    0x14,PA2
  8DF  7F80        NOP
  8E0  7F80        NOP
  8E1  6A1D        LT    0x1D
  8E2  6D42        MPY   0x42
  8E3  7F8E        PAC
  8E4  0E0F        ADD   0x0F,14
  8E5  0E10        ADD   0x10,14
  8E6  0F11        ADD   0x11,15
  8E7  0F12        ADD   0x12,15
  8E8  0F13        ADD   0x13,15
  8E9  0F14        ADD   0x14,15
  8EA  5809        SACH  0x09
  8EB  7F8E        PAC
  8EC  0F0F        ADD   0x0F,15
  8ED  0F10        ADD   0x10,15
  8EE  0E11        ADD   0x11,14
  8EF  0E12        ADD   0x12,14
  8F0  1F13        SUB   0x13,15
  8F1  1F14        SUB   0x14,15
  8F2  580A        SACH  0x0A
  8F3  7F8E        PAC
  8F4  1E0F        SUB   0x0F,14
  8F5  0E10        ADD   0x10,14
  8F6  0F11        ADD   0x11,15
  8F7  1F12        SUB   0x12,15
  8F8  0F13        ADD   0x13,15
  8F9  1F14        SUB   0x14,15
  8FA  580B        SACH  0x0B
  8FB  7F8E        PAC
  8FC  1F0F        SUB   0x0F,15
  8FD  0F10        ADD   0x10,15
  8FE  0E11        ADD   0x11,14
  8FF  1E12        SUB   0x12,14
  900  1F13        SUB   0x13,15
  901  0F14        ADD   0x14,15
  902  580C        SACH  0x0C
  903  7F8E        PAC
  904  1F0F        SUB   0x0F,15
  905  0F10        ADD   0x10,15
  906  1F11        SUB   0x11,15
  907  0F12        ADD   0x12,15
  908  0E13        ADD   0x13,14
  909  1E14        SUB   0x14,14
  90A  580D        SACH  0x0D
  90B  4705        IN    0x05,PA7
  90C  7F8E        PAC
  90D  1F0F        SUB   0x0F,15
  90E  1F10        SUB   0x10,15
  90F  0F11        ADD   0x11,15
  910  0F12        ADD   0x12,15
  911  1E13        SUB   0x13,14
  912  1E14        SUB   0x14,14
  913  580E        SACH  0x0E
  914  7F80        NOP
  915  7F80        NOP
  916  4501        IN    0x01,PA5
  917  6881        LARP  1
  918  6601        ZALS  0x01
  919  7903        AND   0x03
  91A  FE00 091F   BNZ   L91F
  91C  6880        LARP  0
  91D  F900 0921   B     L921

L91F:
  91F  3901        LAR   AR1,0x01
  920  4680        IN    *,PA6,AR0
L921:
  921  7F80        NOP
  922  7F80        NOP
  923  4C09        OUT   0x09,PA4
  924  7F80        NOP
  925  4C0A        OUT   0x0A,PA4
  926  410F        IN    0x0F,PA1
  927  4C0B        OUT   0x0B,PA4
  928  4210        IN    0x10,PA2
  929  4C0C        OUT   0x0C,PA4
  92A  7F80        NOP
  92B  7F80        NOP
  92C  4C0D        OUT   0x0D,PA4
  92D  7F80        NOP
  92E  7F80        NOP
  92F  4C0E        OUT   0x0E,PA4
  930  7F80        NOP
  931  4111        IN    0x11,PA1
  932  7F80        NOP
  933  4C05        OUT   0x05,PA4
  934  4212        IN    0x12,PA2
  935  7F80        NOP
  936  441D        IN    0x1D,PA4
  937  4113        IN    0x13,PA1
  938  4214        IN    0x14,PA2
  939  7F80        NOP
  93A  7F80        NOP
  93B  6A1D        LT    0x1D
  93C  6D42        MPY   0x42
  93D  7F8E        PAC
  93E  0E0F        ADD   0x0F,14
  93F  0E10        ADD   0x10,14
  940  0F11        ADD   0x11,15
  941  0F12        ADD   0x12,15
  942  0F13        ADD   0x13,15
  943  0F14        ADD   0x14,15
  944  5809        SACH  0x09
  945  7F8E        PAC
  946  0F0F        ADD   0x0F,15
  947  0F10        ADD   0x10,15
  948  0E11        ADD   0x11,14
  949  0E12        ADD   0x12,14
  94A  1F13        SUB   0x13,15
  94B  1F14        SUB   0x14,15
  94C  580A        SACH  0x0A
  94D  7F8E        PAC
  94E  1E0F        SUB   0x0F,14
  94F  0E10        ADD   0x10,14
  950  0F11        ADD   0x11,15
  951  1F12        SUB   0x12,15
  952  0F13        ADD   0x13,15
  953  1F14        SUB   0x14,15
  954  580B        SACH  0x0B
  955  7F8E        PAC
  956  1F0F        SUB   0x0F,15
  957  0F10        ADD   0x10,15
  958  0E11        ADD   0x11,14
  959  1E12        SUB   0x12,14
  95A  1F13        SUB   0x13,15
  95B  0F14        ADD   0x14,15
  95C  580C        SACH  0x0C
  95D  7F8E        PAC
  95E  1F0F        SUB   0x0F,15
  95F  0F10        ADD   0x10,15
  960  1F11        SUB   0x11,15
  961  0F12        ADD   0x12,15
  962  0E13        ADD   0x13,14
  963  1E14        SUB   0x14,14
  964  580D        SACH  0x0D
  965  4705        IN    0x05,PA7
  966  7F8E        PAC
  967  1F0F        SUB   0x0F,15
  968  1F10        SUB   0x10,15
  969  0F11        ADD   0x11,15
  96A  0F12        ADD   0x12,15
  96B  1E13        SUB   0x13,14
  96C  1E14        SUB   0x14,14
  96D  580E        SACH  0x0E
  96E  F900 0858   B     L858

