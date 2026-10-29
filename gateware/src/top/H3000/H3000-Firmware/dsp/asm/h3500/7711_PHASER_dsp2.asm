; Eventide h3500 DSP microcode
; key 7711  algorithm 77 (PHASER)  DSP 2
; source H3000-Upgrade_ROM4.BIN offset 39EEB, 171 program words loaded at 800
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
  80D  2906        LAC   0x06,9
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
  83D  6508        ZALH  0x08
  83E  581E        SACH  0x1E
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
  84D  4210        IN    0x10,PA2
  84E  7F89        ZAC
  84F  6211        SUBH  0x11
  850  6910        DMOV  0x10
  851  6A7A        LT    0x7A
  852  6D10        MPY   0x10
  853  7F8F        APAC
  854  7F8F        APAC
  855  6D12        MPY   0x12
  856  7F8F        APAC
  857  7F8F        APAC
  858  5812        SACH  0x12
  859  7F89        ZAC
  85A  6213        SUBH  0x13
  85B  6912        DMOV  0x12
  85C  6A7A        LT    0x7A
  85D  6D12        MPY   0x12
  85E  7F8F        APAC
  85F  7F8F        APAC
  860  6D14        MPY   0x14
  861  7F8F        APAC
  862  7F8F        APAC
  863  5814        SACH  0x14
  864  7F89        ZAC
  865  6215        SUBH  0x15
  866  6914        DMOV  0x14
  867  6A79        LT    0x79
  868  6D14        MPY   0x14
  869  7F8F        APAC
  86A  7F8F        APAC
  86B  6D16        MPY   0x16
  86C  7F8F        APAC
  86D  7F8F        APAC
  86E  5816        SACH  0x16
  86F  7F89        ZAC
  870  6217        SUBH  0x17
  871  6916        DMOV  0x16
  872  6A79        LT    0x79
  873  6D16        MPY   0x16
  874  7F8F        APAC
  875  7F8F        APAC
  876  6D18        MPY   0x18
  877  7F8F        APAC
  878  7F8F        APAC
  879  5818        SACH  0x18
  87A  7F89        ZAC
  87B  6219        SUBH  0x19
  87C  6918        DMOV  0x18
  87D  6A7A        LT    0x7A
  87E  6D18        MPY   0x18
  87F  7F8F        APAC
  880  7F8F        APAC
  881  6D1A        MPY   0x1A
  882  7F8F        APAC
  883  7F8F        APAC
  884  581A        SACH  0x1A
  885  7F89        ZAC
  886  621B        SUBH  0x1B
  887  691A        DMOV  0x1A
  888  6A7A        LT    0x7A
  889  6D1A        MPY   0x1A
  88A  7F8F        APAC
  88B  7F8F        APAC
  88C  6D1C        MPY   0x1C
  88D  7F8F        APAC
  88E  7F8F        APAC
  88F  581C        SACH  0x1C
  890  6A1E        LT    0x1E
  891  6551        ZALH  0x51
  892  6D14        MPY   0x14
  893  7F8F        APAC
  894  5802        SACH  0x02
  895  4E02        OUT   0x02,PA6
  896  6551        ZALH  0x51
  897  6D1C        MPY   0x1C
  898  7F8F        APAC
  899  5802        SACH  0x02
  89A  4D02        OUT   0x02,PA5
  89B  7F80        NOP
  89C  4503        IN    0x03,PA5
  89D  3903        LAR   AR1,0x03
  89E  4681        IN    *,PA6,AR1
  89F  4B1C        OUT   0x1C,PA3
  8A0  2008        LAC   0x08
  8A1  101E        SUB   0x1E
  8A2  505A        SACL  0x5A
  8A3  6A50        LT    0x50
  8A4  6D5A        MPY   0x5A
  8A5  4179        IN    0x79,PA1
  8A6  417A        IN    0x7A,PA1
  8A7  7F8E        PAC
  8A8  5851        SACH  0x51
  8A9  F900 084C   B     L84C

