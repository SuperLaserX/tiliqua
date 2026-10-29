; Eventide h3500 DSP microcode
; key 7710  algorithm 77 (PHASER)  DSP 1
; source H3000-Upgrade_ROM4.BIN offset 39D89, 172 program words loaded at 800
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
  80C  5006        SACL  0x06
  80D  2806        LAC   0x06,8
  80E  500A        SACL  0x0A
  80F  2F06        LAC   0x06,15
  810  5005        SACL  0x05
  811  7F89        ZAC
  812  5009        SACL  0x09
  813  1006        SUB   0x06
  814  5807        SACH  0x07
  815  7EFF        LACK  0xFF
  816  5003        SACL  0x03
  817  2703        LAC   0x03,7
  818  7A03        OR    0x03
  819  5008        SACL  0x08
  81A  7F80        NOP
  81B  7F80        NOP
  81C  7F80        NOP
  81D  7F80        NOP
  81E  7F80        NOP
  81F  7F80        NOP
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
  834  7F80        NOP
  835  7F80        NOP
  836  7F80        NOP
  837  7F80        NOP
  838  7F80        NOP
  839  7F80        NOP
  83A  7F80        NOP
  83B  7F80        NOP
  83C  7F80        NOP
  83D  2F08        LAC   0x08,15
  83E  581F        SACH  0x1F
  83F  7F8B        SOVM
L840:
  840  F600 0840   BIOZ  L840
  842  4003        IN    0x03,PA0
  843  6503        ZALH  0x03
  844  FD00 0847   BGEZ  L847
  846  7F80        NOP
L847:
  847  F600 084B   BIOZ  L84B
  849  F900 0847   B     L847

L84B:
  84B  7F80        NOP
L84C:
  84C  4750        IN    0x50,PA7
  84D  6A50        LT    0x50
  84E  6D5B        MPY   0x5B
  84F  7F8E        PAC
  850  6C1F        LTA   0x1F
  851  4352        IN    0x52,PA3
  852  6D52        MPY   0x52
  853  7F8F        APAC
  854  7F8F        APAC
  855  5810        SACH  0x10
  856  7F80        NOP
  857  7F89        ZAC
  858  6211        SUBH  0x11
  859  6910        DMOV  0x10
  85A  6A78        LT    0x78
  85B  6D10        MPY   0x10
  85C  7F8F        APAC
  85D  7F8F        APAC
  85E  6D12        MPY   0x12
  85F  7F8F        APAC
  860  7F8F        APAC
  861  5812        SACH  0x12
  862  7F89        ZAC
  863  6213        SUBH  0x13
  864  6912        DMOV  0x12
  865  6A78        LT    0x78
  866  6D12        MPY   0x12
  867  7F8F        APAC
  868  7F8F        APAC
  869  6D14        MPY   0x14
  86A  7F8F        APAC
  86B  7F8F        APAC
  86C  5814        SACH  0x14
  86D  7F89        ZAC
  86E  6215        SUBH  0x15
  86F  6914        DMOV  0x14
  870  6A78        LT    0x78
  871  6D14        MPY   0x14
  872  7F8F        APAC
  873  7F8F        APAC
  874  6D16        MPY   0x16
  875  7F8F        APAC
  876  7F8F        APAC
  877  5816        SACH  0x16
  878  7F89        ZAC
  879  6217        SUBH  0x17
  87A  6916        DMOV  0x16
  87B  6A78        LT    0x78
  87C  6D16        MPY   0x16
  87D  7F8F        APAC
  87E  7F8F        APAC
  87F  6D18        MPY   0x18
  880  7F8F        APAC
  881  7F8F        APAC
  882  5818        SACH  0x18
  883  7F89        ZAC
  884  6219        SUBH  0x19
  885  6918        DMOV  0x18
  886  6A79        LT    0x79
  887  6D18        MPY   0x18
  888  7F8F        APAC
  889  7F8F        APAC
  88A  6D1A        MPY   0x1A
  88B  7F8F        APAC
  88C  7F8F        APAC
  88D  581A        SACH  0x1A
  88E  7F89        ZAC
  88F  621B        SUBH  0x1B
  890  691A        DMOV  0x1A
  891  6A79        LT    0x79
  892  6D1A        MPY   0x1A
  893  7F8F        APAC
  894  7F8F        APAC
  895  6D1C        MPY   0x1C
  896  7F8F        APAC
  897  7F8F        APAC
  898  581C        SACH  0x1C
  899  4A1C        OUT   0x1C,PA2
  89A  7F80        NOP
  89B  7F80        NOP
  89C  7F80        NOP
  89D  4503        IN    0x03,PA5
  89E  3903        LAR   AR1,0x03
  89F  4681        IN    *,PA6,AR1
  8A0  7F80        NOP
  8A1  7F80        NOP
  8A2  7F80        NOP
  8A3  7F80        NOP
  8A4  7F80        NOP
  8A5  4178        IN    0x78,PA1
  8A6  4179        IN    0x79,PA1
  8A7  417A        IN    0x7A,PA1
  8A8  7F80        NOP
  8A9  7F80        NOP
  8AA  F900 084C   B     L84C

