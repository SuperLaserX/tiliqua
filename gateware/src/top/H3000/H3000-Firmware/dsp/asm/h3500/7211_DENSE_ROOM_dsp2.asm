; Eventide h3500 DSP microcode
; key 7211  algorithm 72 (DENSE ROOM)  DSP 2
; source H3000-Upgrade_ROM4.BIN offset 027E1, 180 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5000        SACL  0x00
  806  2900        LAC   0x00,9
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
  858  4501        IN    0x01,PA5
  859  6881        LARP  1
  85A  6601        ZALS  0x01
  85B  7903        AND   0x03
  85C  FE00 0861   BNZ   L861
  85E  6880        LARP  0
  85F  F900 0863   B     L863

L861:
  861  3901        LAR   AR1,0x01
  862  4680        IN    *,PA6,AR0
L863:
  863  6A1F        LT    0x1F
  864  6D4D        MPY   0x4D
  865  4C09        OUT   0x09,PA4
  866  7F8E        PAC
  867  0E0F        ADD   0x0F,14
  868  4422        IN    0x22,PA4
  869  4C0A        OUT   0x0A,PA4
  86A  0E10        ADD   0x10,14
  86B  0F11        ADD   0x11,15
  86C  4424        IN    0x24,PA4
  86D  4C0B        OUT   0x0B,PA4
  86E  0F12        ADD   0x12,15
  86F  0F13        ADD   0x13,15
  870  4426        IN    0x26,PA4
  871  4C0C        OUT   0x0C,PA4
  872  0F14        ADD   0x14,15
  873  5809        SACH  0x09
  874  4428        IN    0x28,PA4
  875  4C0D        OUT   0x0D,PA4
  876  1F0F        SUB   0x0F,15
  877  6212        SUBH  0x12
  878  6214        SUBH  0x14
  879  580B        SACH  0x0B
  87A  4C0E        OUT   0x0E,PA4
  87B  7F8E        PAC
  87C  0F0F        ADD   0x0F,15
  87D  0F10        ADD   0x10,15
  87E  0E11        ADD   0x11,14
  87F  0E12        ADD   0x12,14
  880  1F13        SUB   0x13,15
  881  1F14        SUB   0x14,15
  882  580A        SACH  0x0A
  883  620F        SUBH  0x0F
  884  1F12        SUB   0x12,15
  885  6014        ADDH  0x14
  886  580C        SACH  0x0C
  887  7F8E        PAC
  888  1F0F        SUB   0x0F,15
  889  0F10        ADD   0x10,15
  88A  1F11        SUB   0x11,15
  88B  0F12        ADD   0x12,15
  88C  0E13        ADD   0x13,14
  88D  1E14        SUB   0x14,14
  88E  580D        SACH  0x0D
  88F  6210        SUBH  0x10
  890  6011        ADDH  0x11
  891  1F13        SUB   0x13,15
  892  580E        SACH  0x0E
  893  7F89        ZAC
  894  6A0F        LT    0x0F
  895  6D40        MPY   0x40
  896  6C22        LTA   0x22
  897  6D41        MPY   0x41
  898  6C10        LTA   0x10
  899  590F        SACH  0x0F,1
  89A  7F89        ZAC
  89B  6D40        MPY   0x40
  89C  6C24        LTA   0x24
  89D  6D41        MPY   0x41
  89E  6C11        LTA   0x11
  89F  5910        SACH  0x10,1
  8A0  7F89        ZAC
  8A1  6D40        MPY   0x40
  8A2  6C26        LTA   0x26
  8A3  6D41        MPY   0x41
  8A4  6C12        LTA   0x12
  8A5  5911        SACH  0x11,1
  8A6  7F89        ZAC
  8A7  6D40        MPY   0x40
  8A8  6C28        LTA   0x28
  8A9  6D41        MPY   0x41
  8AA  7F8F        APAC
  8AB  5912        SACH  0x12,1
  8AC  7F80        NOP
  8AD  7F80        NOP
  8AE  4113        IN    0x13,PA1
  8AF  4114        IN    0x14,PA1
  8B0  421F        IN    0x1F,PA2
  8B1  7F80        NOP
  8B2  F900 0858   B     L858

