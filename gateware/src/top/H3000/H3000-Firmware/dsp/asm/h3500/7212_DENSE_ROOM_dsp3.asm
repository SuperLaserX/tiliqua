; Eventide h3500 DSP microcode
; key 7212  algorithm 72 (DENSE ROOM)  DSP 3
; source H3000-Upgrade_ROM4.BIN offset 02953, 174 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5000        SACL  0x00
  806  2A00        LAC   0x00,10
  807  5004        SACL  0x04
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
  817  4002        IN    0x02,PA0
  818  6502        ZALH  0x02
  819  FD00 081C   BGEZ  L81C
  81B  7F80        NOP
L81C:
  81C  F600 081C   BIOZ  L81C
  81E  7F89        ZAC
  81F  5003        SACL  0x03
  820  7F80        NOP
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
  824  7F80        NOP
  825  7F80        NOP
  826  7F80        NOP
  827  7F80        NOP
  828  7F80        NOP
  829  7F80        NOP
  82A  5010        SACL  0x10
  82B  5011        SACL  0x11
  82C  5012        SACL  0x12
  82D  5013        SACL  0x13
  82E  5014        SACL  0x14
  82F  5015        SACL  0x15
  830  7F80        NOP
  831  7F80        NOP
L832:
  832  7F80        NOP
  833  7F80        NOP
  834  7F80        NOP
  835  7F80        NOP
  836  0000        ADD   0x00
  837  5003        SACL  0x03
  838  4502        IN    0x02,PA5
  839  6881        LARP  1
  83A  6602        ZALS  0x02
  83B  7904        AND   0x04
  83C  FE00 0841   BNZ   L841
  83E  6880        LARP  0
  83F  F900 0843   B     L843

L841:
  841  3902        LAR   AR1,0x02
  842  4680        IN    *,PA6,AR0
L843:
  843  7F80        NOP
  844  7F80        NOP
  845  7F80        NOP
  846  7F80        NOP
  847  6603        ZALS  0x03
  848  0000        ADD   0x00
  849  5003        SACL  0x03
  84A  6603        ZALS  0x03
  84B  FE00 0832   BNZ   L832
L84D:
  84D  F600 0851   BIOZ  L851
  84F  F900 084D   B     L84D

L851:
  851  4002        IN    0x02,PA0
  852  6502        ZALH  0x02
  853  FA00 0856   BLZ   L856
  855  7F80        NOP
L856:
  856  F600 0856   BIOZ  L856
L858:
  858  4502        IN    0x02,PA5
  859  6881        LARP  1
  85A  6602        ZALS  0x02
  85B  7904        AND   0x04
  85C  FE00 0861   BNZ   L861
  85E  6880        LARP  0
  85F  F900 0863   B     L863

L861:
  861  3902        LAR   AR1,0x02
  862  4680        IN    *,PA6,AR0
L863:
  863  4F05        OUT   0x05,PA7
  864  651C        ZALH  0x1C
  865  6A55        LT    0x55
  866  4F06        OUT   0x06,PA7
  867  6D17        MPY   0x17
  868  7F8F        APAC
  869  7F8F        APAC
  86A  5816        SACH  0x16
  86B  4F07        OUT   0x07,PA7
  86C  6517        ZALH  0x17
  86D  6D16        MPY   0x16
  86E  7F90        SPAC
  86F  7F90        SPAC
  870  4F08        OUT   0x08,PA7
  871  6A56        LT    0x56
  872  6D19        MPY   0x19
  873  7F8F        APAC
  874  7F8F        APAC
  875  4F09        OUT   0x09,PA7
  876  5818        SACH  0x18
  877  6519        ZALH  0x19
  878  6D18        MPY   0x18
  879  7F90        SPAC
  87A  4F0A        OUT   0x0A,PA7
  87B  7F90        SPAC
  87C  6A57        LT    0x57
  87D  6D1B        MPY   0x1B
  87E  7F8F        APAC
  87F  4F0B        OUT   0x0B,PA7
  880  7F8F        APAC
  881  581A        SACH  0x1A
  882  2F1B        LAC   0x1B,15
  883  6D1A        MPY   0x1A
  884  4F0F        OUT   0x0F,PA7
  885  441C        IN    0x1C,PA4
  886  4C16        OUT   0x16,PA4
  887  4F0C        OUT   0x0C,PA7
  888  4417        IN    0x17,PA4
  889  4C18        OUT   0x18,PA4
  88A  4F0D        OUT   0x0D,PA7
  88B  4419        IN    0x19,PA4
  88C  4C1A        OUT   0x1A,PA4
  88D  4F0E        OUT   0x0E,PA7
  88E  441B        IN    0x1B,PA4
  88F  7F90        SPAC
  890  0F1D        ADD   0x1D,15
  891  581D        SACH  0x1D
  892  6605        ZALS  0x05
  893  6300        SUBS  0x00
  894  5005        SACL  0x05
  895  614B        ADDS  0x4B
  896  5006        SACL  0x06
  897  614C        ADDS  0x4C
  898  5007        SACL  0x07
  899  614D        ADDS  0x4D
  89A  5008        SACL  0x08
  89B  614E        ADDS  0x4E
  89C  5009        SACL  0x09
  89D  614F        ADDS  0x4F
  89E  500A        SACL  0x0A
  89F  6150        ADDS  0x50
  8A0  500B        SACL  0x0B
  8A1  6151        ADDS  0x51
  8A2  500F        SACL  0x0F
  8A3  6152        ADDS  0x52
  8A4  500C        SACL  0x0C
  8A5  6153        ADDS  0x53
  8A6  500D        SACL  0x0D
  8A7  6154        ADDS  0x54
  8A8  500E        SACL  0x0E
  8A9  4A1D        OUT   0x1D,PA2
  8AA  7F80        NOP
  8AB  7F80        NOP
  8AC  F900 0858   B     L858

