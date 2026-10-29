; Eventide h3500 DSP microcode
; key 7510  algorithm 75 (BAND DELAY)  DSP 1
; source H3000-Upgrade_ROM4.BIN offset 0B729, 218 program words loaded at 800
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
  80C  5065        SACL  0x65
  80D  2865        LAC   0x65,8
  80E  5069        SACL  0x69
  80F  2F65        LAC   0x65,15
  810  5068        SACL  0x68
  811  7F89        ZAC
  812  5064        SACL  0x64
  813  1065        SUB   0x65
  814  5866        SACH  0x66
  815  7EFF        LACK  0xFF
  816  506A        SACL  0x6A
  817  276A        LAC   0x6A,7
  818  7A6A        OR    0x6A
  819  5067        SACL  0x67
  81A  F800 087B   CALL  L87B
  81C  6881        LARP  1
L81D:
  81D  F600 0821   BIOZ  L821
  81F  F900 081D   B     L81D

L821:
  821  406A        IN    0x6A,PA0
  822  656A        ZALH  0x6A
  823  FD00 0826   BGEZ  L826
  825  7F80        NOP
L826:
  826  F600 0826   BIOZ  L826
L828:
  828  456A        IN    0x6A,PA5
  829  396A        LAR   AR1,0x6A
  82A  4681        IN    *,PA6,AR1
  82B  665A        ZALS  0x5A
  82C  1065        SUB   0x65
  82D  505A        SACL  0x5A
  82E  4F5A        OUT   0x5A,PA7
  82F  4C5C        OUT   0x5C,PA4
  830  665A        ZALS  0x5A
  831  0005        ADD   0x05
  832  5050        SACL  0x50
  833  4F50        OUT   0x50,PA7
  834  665A        ZALS  0x5A
  835  000B        ADD   0x0B
  836  5051        SACL  0x51
  837  4F51        OUT   0x51,PA7
  838  665A        ZALS  0x5A
  839  0011        ADD   0x11
  83A  5052        SACL  0x52
  83B  4F52        OUT   0x52,PA7
  83C  665A        ZALS  0x5A
  83D  0017        ADD   0x17
  83E  5053        SACL  0x53
  83F  4F53        OUT   0x53,PA7
  840  665A        ZALS  0x5A
  841  001D        ADD   0x1D
  842  5054        SACL  0x54
  843  4F54        OUT   0x54,PA7
  844  665A        ZALS  0x5A
  845  0023        ADD   0x23
  846  5055        SACL  0x55
  847  4F55        OUT   0x55,PA7
  848  665A        ZALS  0x5A
  849  0029        ADD   0x29
  84A  5056        SACL  0x56
  84B  4F56        OUT   0x56,PA7
  84C  665A        ZALS  0x5A
  84D  002F        ADD   0x2F
  84E  5057        SACL  0x57
  84F  4F57        OUT   0x57,PA7
  850  665A        ZALS  0x5A
  851  0031        ADD   0x31
  852  5058        SACL  0x58
  853  2E5B        LAC   0x5B,14
  854  6A59        LT    0x59
  855  6D32        MPY   0x32
  856  7F8F        APAC
  857  6C61        LTA   0x61
  858  4D61        OUT   0x61,PA5
  859  4E62        OUT   0x62,PA6
  85A  415D        IN    0x5D,PA1
  85B  415F        IN    0x5F,PA1
  85C  415E        IN    0x5E,PA1
  85D  4160        IN    0x60,PA1
  85E  6D33        MPY   0x33
  85F  6C62        LTA   0x62
  860  6D33        MPY   0x33
  861  4F58        OUT   0x58,PA7
  862  7F8F        APAC
  863  585C        SACH  0x5C
  864  4459        IN    0x59,PA4
  865  655D        ZALH  0x5D
  866  605F        ADDH  0x5F
  867  5861        SACH  0x61
  868  6061        ADDH  0x61
  869  6061        ADDH  0x61
  86A  6061        ADDH  0x61
  86B  6061        ADDH  0x61
  86C  6061        ADDH  0x61
  86D  5861        SACH  0x61
  86E  655E        ZALH  0x5E
  86F  6060        ADDH  0x60
  870  5862        SACH  0x62
  871  6062        ADDH  0x62
  872  6062        ADDH  0x62
  873  6062        ADDH  0x62
  874  6062        ADDH  0x62
  875  475B        IN    0x5B,PA7
  876  6062        ADDH  0x62
  877  7F80        NOP
  878  5862        SACH  0x62
  879  F900 0828   B     L828

L87B:
  87B  7F89        ZAC
  87C  506B        SACL  0x6B
L87D:
  87D  F600 0881   BIOZ  L881
  87F  F900 087D   B     L87D

L881:
  881  406A        IN    0x6A,PA0
  882  656A        ZALH  0x6A
  883  FD00 0886   BGEZ  L886
  885  7F80        NOP
L886:
  886  F600 0886   BIOZ  L886
L888:
  888  456A        IN    0x6A,PA5
  889  396A        LAR   AR1,0x6A
  88A  4681        IN    *,PA6,AR1
  88B  7F80        NOP
  88C  7F80        NOP
  88D  7F80        NOP
  88E  7F80        NOP
  88F  7F80        NOP
  890  7F80        NOP
  891  666B        ZALS  0x6B
  892  4F6B        OUT   0x6B,PA7
  893  6165        ADDS  0x65
  894  506B        SACL  0x6B
  895  4F6B        OUT   0x6B,PA7
  896  6165        ADDS  0x65
  897  506B        SACL  0x6B
  898  4F6B        OUT   0x6B,PA7
  899  6165        ADDS  0x65
  89A  506B        SACL  0x6B
  89B  4F6B        OUT   0x6B,PA7
  89C  6165        ADDS  0x65
  89D  506B        SACL  0x6B
  89E  4F6B        OUT   0x6B,PA7
  89F  6165        ADDS  0x65
  8A0  506B        SACL  0x6B
  8A1  4F6B        OUT   0x6B,PA7
  8A2  6165        ADDS  0x65
  8A3  506B        SACL  0x6B
  8A4  4F6B        OUT   0x6B,PA7
  8A5  6165        ADDS  0x65
  8A6  506B        SACL  0x6B
  8A7  4F6B        OUT   0x6B,PA7
  8A8  6165        ADDS  0x65
  8A9  506B        SACL  0x6B
  8AA  4F6B        OUT   0x6B,PA7
  8AB  6165        ADDS  0x65
  8AC  506B        SACL  0x6B
  8AD  4F6B        OUT   0x6B,PA7
  8AE  6165        ADDS  0x65
  8AF  506B        SACL  0x6B
  8B0  4F6B        OUT   0x6B,PA7
  8B1  6165        ADDS  0x65
  8B2  506B        SACL  0x6B
  8B3  4F6B        OUT   0x6B,PA7
  8B4  6165        ADDS  0x65
  8B5  506B        SACL  0x6B
  8B6  4F6B        OUT   0x6B,PA7
  8B7  6165        ADDS  0x65
  8B8  506B        SACL  0x6B
  8B9  4F6B        OUT   0x6B,PA7
  8BA  6165        ADDS  0x65
  8BB  506B        SACL  0x6B
  8BC  4F6B        OUT   0x6B,PA7
  8BD  6165        ADDS  0x65
  8BE  506B        SACL  0x6B
  8BF  4F6B        OUT   0x6B,PA7
  8C0  6165        ADDS  0x65
  8C1  506B        SACL  0x6B
  8C2  4F6B        OUT   0x6B,PA7
  8C3  6165        ADDS  0x65
  8C4  506B        SACL  0x6B
  8C5  4F6B        OUT   0x6B,PA7
  8C6  6165        ADDS  0x65
  8C7  506B        SACL  0x6B
  8C8  4F6B        OUT   0x6B,PA7
  8C9  6165        ADDS  0x65
  8CA  506B        SACL  0x6B
  8CB  4F6B        OUT   0x6B,PA7
  8CC  6165        ADDS  0x65
  8CD  506B        SACL  0x6B
  8CE  4F6B        OUT   0x6B,PA7
  8CF  6165        ADDS  0x65
  8D0  506B        SACL  0x6B
  8D1  7F80        NOP
  8D2  7F80        NOP
  8D3  7F80        NOP
  8D4  7F80        NOP
  8D5  7F80        NOP
  8D6  206B        LAC   0x6B
  8D7  FD00 0888   BGEZ  L888
  8D9  7F8D        RET

