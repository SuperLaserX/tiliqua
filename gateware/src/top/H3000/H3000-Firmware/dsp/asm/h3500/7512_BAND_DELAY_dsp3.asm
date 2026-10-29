; Eventide h3500 DSP microcode
; key 7512  algorithm 75 (BAND DELAY)  DSP 3
; source H3000-Upgrade_ROM4.BIN offset 0BABF, 210 program words loaded at 800
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
  80D  2A65        LAC   0x65,10
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
  81A  F800 0888   CALL  L888
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
  82B  6551        ZALH  0x51
  82C  6D50        MPY   0x50
  82D  6C50        LTA   0x50
  82E  7F8F        APAC
  82F  5851        SACH  0x51
  830  6553        ZALH  0x53
  831  6D1A        MPY   0x1A
  832  7F8F        APAC
  833  6C19        LTA   0x19
  834  6251        SUBH  0x51
  835  5852        SACH  0x52
  836  6D52        MPY   0x52
  837  7F8E        PAC
  838  6C1F        LTA   0x1F
  839  6050        ADDH  0x50
  83A  5850        SACH  0x50
  83B  6555        ZALH  0x55
  83C  6D54        MPY   0x54
  83D  6C54        LTA   0x54
  83E  7F8F        APAC
  83F  5855        SACH  0x55
  840  6557        ZALH  0x57
  841  6D20        MPY   0x20
  842  7F8F        APAC
  843  6C1F        LTA   0x1F
  844  6255        SUBH  0x55
  845  5856        SACH  0x56
  846  6D56        MPY   0x56
  847  7F8E        PAC
  848  6C25        LTA   0x25
  849  6054        ADDH  0x54
  84A  5854        SACH  0x54
  84B  6559        ZALH  0x59
  84C  4453        IN    0x53,PA4
  84D  6D58        MPY   0x58
  84E  6C58        LTA   0x58
  84F  7F8F        APAC
  850  4457        IN    0x57,PA4
  851  5859        SACH  0x59
  852  655B        ZALH  0x5B
  853  6D26        MPY   0x26
  854  445B        IN    0x5B,PA4
  855  7F8F        APAC
  856  6C25        LTA   0x25
  857  6259        SUBH  0x59
  858  445F        IN    0x5F,PA4
  859  585A        SACH  0x5A
  85A  6D5A        MPY   0x5A
  85B  7F8E        PAC
  85C  6C2B        LTA   0x2B
  85D  4960        OUT   0x60,PA1
  85E  6058        ADDH  0x58
  85F  5858        SACH  0x58
  860  655D        ZALH  0x5D
  861  6D5C        MPY   0x5C
  862  6C5C        LTA   0x5C
  863  7F8F        APAC
  864  4961        OUT   0x61,PA1
  865  585D        SACH  0x5D
  866  655F        ZALH  0x5F
  867  6D2C        MPY   0x2C
  868  7F8F        APAC
  869  6C2B        LTA   0x2B
  86A  625D        SUBH  0x5D
  86B  585E        SACH  0x5E
  86C  6D5E        MPY   0x5E
  86D  7F8E        PAC
  86E  6C1B        LTA   0x1B
  86F  605C        ADDH  0x5C
  870  585C        SACH  0x5C
  871  7F89        ZAC
  872  6D50        MPY   0x50
  873  6C21        LTA   0x21
  874  6D54        MPY   0x54
  875  6C27        LTA   0x27
  876  6D58        MPY   0x58
  877  6C2D        LTA   0x2D
  878  6D5C        MPY   0x5C
  879  6C1C        LTA   0x1C
  87A  5860        SACH  0x60
  87B  7F89        ZAC
  87C  6D50        MPY   0x50
  87D  6C22        LTA   0x22
  87E  6D54        MPY   0x54
  87F  6C28        LTA   0x28
  880  6D58        MPY   0x58
  881  6C2E        LTA   0x2E
  882  6D5C        MPY   0x5C
  883  6C19        LTA   0x19
  884  5861        SACH  0x61
  885  7F80        NOP
  886  F900 0828   B     L828

L888:
  888  7F89        ZAC
  889  506B        SACL  0x6B
L88A:
  88A  F600 088E   BIOZ  L88E
  88C  F900 088A   B     L88A

L88E:
  88E  406A        IN    0x6A,PA0
  88F  656A        ZALH  0x6A
  890  FD00 0893   BGEZ  L893
  892  7F80        NOP
L893:
  893  F600 0893   BIOZ  L893
L895:
  895  456A        IN    0x6A,PA5
  896  396A        LAR   AR1,0x6A
  897  4681        IN    *,PA6,AR1
  898  7F80        NOP
  899  7F80        NOP
  89A  7F80        NOP
  89B  7F80        NOP
  89C  7F80        NOP
  89D  7E15        LACK  0x15
  89E  616B        ADDS  0x6B
  89F  506B        SACL  0x6B
  8A0  4C64        OUT   0x64,PA4
  8A1  4C64        OUT   0x64,PA4
  8A2  4C64        OUT   0x64,PA4
  8A3  4C64        OUT   0x64,PA4
  8A4  4C64        OUT   0x64,PA4
  8A5  4C64        OUT   0x64,PA4
  8A6  4C64        OUT   0x64,PA4
  8A7  4C64        OUT   0x64,PA4
  8A8  4C64        OUT   0x64,PA4
  8A9  4C64        OUT   0x64,PA4
  8AA  4C64        OUT   0x64,PA4
  8AB  4C64        OUT   0x64,PA4
  8AC  4C64        OUT   0x64,PA4
  8AD  4C64        OUT   0x64,PA4
  8AE  4C64        OUT   0x64,PA4
  8AF  4C64        OUT   0x64,PA4
  8B0  4C64        OUT   0x64,PA4
  8B1  4C64        OUT   0x64,PA4
  8B2  4C64        OUT   0x64,PA4
  8B3  4C64        OUT   0x64,PA4
  8B4  4C64        OUT   0x64,PA4
  8B5  4C64        OUT   0x64,PA4
  8B6  4C64        OUT   0x64,PA4
  8B7  4C64        OUT   0x64,PA4
  8B8  4C64        OUT   0x64,PA4
  8B9  4C64        OUT   0x64,PA4
  8BA  4C64        OUT   0x64,PA4
  8BB  4C64        OUT   0x64,PA4
  8BC  4C64        OUT   0x64,PA4
  8BD  4C64        OUT   0x64,PA4
  8BE  4C64        OUT   0x64,PA4
  8BF  4C64        OUT   0x64,PA4
  8C0  4C64        OUT   0x64,PA4
  8C1  4C64        OUT   0x64,PA4
  8C2  4C64        OUT   0x64,PA4
  8C3  4C64        OUT   0x64,PA4
  8C4  4C64        OUT   0x64,PA4
  8C5  4C64        OUT   0x64,PA4
  8C6  4C64        OUT   0x64,PA4
  8C7  4C64        OUT   0x64,PA4
  8C8  4C64        OUT   0x64,PA4
  8C9  4C64        OUT   0x64,PA4
  8CA  7F80        NOP
  8CB  7F80        NOP
  8CC  7F80        NOP
  8CD  7F80        NOP
  8CE  206B        LAC   0x6B
  8CF  FC00 0895   BGZ   L895
  8D1  7F8D        RET

