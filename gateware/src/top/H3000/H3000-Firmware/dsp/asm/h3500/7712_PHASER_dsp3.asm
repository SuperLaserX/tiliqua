; Eventide h3500 DSP microcode
; key 7712  algorithm 77 (PHASER)  DSP 3
; source H3000-Upgrade_ROM4.BIN offset 3A04B, 283 program words loaded at 800
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
  80D  2A06        LAC   0x06,10
  80E  500B        SACL  0x0B
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
  81A  2F08        LAC   0x08,15
  81B  580A        SACH  0x0A
  81C  2F08        LAC   0x08,15
  81D  5818        SACH  0x18
  81E  581F        SACH  0x1F
  81F  6508        ZALH  0x08
  820  581E        SACH  0x1E
  821  582B        SACH  0x2B
  822  7E64        LACK  0x64
  823  5028        SACL  0x28
  824  2006        LAC   0x06
  825  5023        SACL  0x23
  826  2009        LAC   0x09
  827  502D        SACL  0x2D
  828  5035        SACL  0x35
  829  2E08        LAC   0x08,14
  82A  5830        SACH  0x30
  82B  5931        SACH  0x31,1
  82C  5932        SACH  0x32,1
  82D  2808        LAC   0x08,8
  82E  5C33        SACH  0x33,4
  82F  582E        SACH  0x2E
  830  582F        SACH  0x2F
  831  6A06        LT    0x06
  832  8915        MPYK  2325
  833  7F8E        PAC
  834  676E        TBLR  0x6E
  835  0006        ADD   0x06
  836  676F        TBLR  0x6F
  837  0006        ADD   0x06
  838  6770        TBLR  0x70
  839  0006        ADD   0x06
  83A  6771        TBLR  0x71
  83B  0006        ADD   0x06
  83C  6772        TBLR  0x72
  83D  0006        ADD   0x06
  83E  6773        TBLR  0x73
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
  84C  4718        IN    0x18,PA7
L84D:
  84D  7F8A        ROVM
  84E  6514        ZALH  0x14
  84F  6115        ADDS  0x15
  850  0828        ADD   0x28,8
  851  5814        SACH  0x14
  852  5015        SACL  0x15
  853  7F88        ABS
  854  5816        SACH  0x16
  855  7F8B        SOVM
  856  6518        ZALH  0x18
  857  7F88        ABS
  858  5819        SACH  0x19
  859  621A        SUBH  0x1A
  85A  FA00 0868   BLZ   L868
  85C  6919        DMOV  0x19
  85D  2009        LAC   0x09
  85E  501B        SACL  0x1B
  85F  7F80        NOP
  860  7F80        NOP
  861  7F80        NOP
  862  7F80        NOP
  863  7F80        NOP
  864  7F80        NOP
  865  7F80        NOP
  866  F900 087D   B     L87D

L868:
  868  202C        LAC   0x2C
  869  FE00 0874   BNZ   L874
  86B  651A        ZALH  0x1A
  86C  611B        ADDS  0x1B
  86D  132B        SUB   0x2B,3
  86E  581A        SACH  0x1A
  86F  501B        SACL  0x1B
  870  7F80        NOP
  871  7F80        NOP
  872  F900 087D   B     L87D

L874:
  874  6A1A        LT    0x1A
  875  6D2B        MPY   0x2B
  876  7F8E        PAC
  877  5803        SACH  0x03
  878  651A        ZALH  0x1A
  879  611B        ADDS  0x1B
  87A  1403        SUB   0x03,4
  87B  581A        SACH  0x1A
  87C  501B        SACL  0x1B
L87D:
  87D  2035        LAC   0x35
  87E  FF00 08A3   BZ    L8A3
  880  1106        SUB   0x06,1
  881  FF00 0899   BZ    L899
  883  FA00 088F   BLZ   L88F
  885  6530        ZALH  0x30
  886  581C        SACH  0x1C
  887  501D        SACL  0x1D
  888  651A        ZALH  0x1A
  889  611B        ADDS  0x1B
  88A  6233        SUBH  0x33
  88B  FB00 08C1   BLEZ  L8C1
  88D  F900 08C8   B     L8C8

L88F:
  88F  651C        ZALH  0x1C
  890  611D        ADDS  0x1D
  891  062E        ADD   0x2E,6
  892  581C        SACH  0x1C
  893  501D        SACL  0x1D
  894  6208        SUBH  0x08
  895  FD00 08B9   BGEZ  L8B9
  897  F900 08C8   B     L8C8

L899:
  899  651C        ZALH  0x1C
  89A  611D        ADDS  0x1D
  89B  162F        SUB   0x2F,6
  89C  581C        SACH  0x1C
  89D  501D        SACL  0x1D
  89E  6230        SUBH  0x30
  89F  FB00 08BD   BLEZ  L8BD
  8A1  F900 08C6   B     L8C6

L8A3:
  8A3  651C        ZALH  0x1C
  8A4  611D        ADDS  0x1D
  8A5  1631        SUB   0x31,6
  8A6  FA00 08AA   BLZ   L8AA
  8A8  F900 08AC   B     L8AC

L8AA:
  8AA  2009        LAC   0x09
  8AB  7F80        NOP
L8AC:
  8AC  581C        SACH  0x1C
  8AD  501D        SACL  0x1D
  8AE  651A        ZALH  0x1A
  8AF  611B        ADDS  0x1B
  8B0  6232        SUBH  0x32
  8B1  FD00 08B5   BGEZ  L8B5
  8B3  F900 08C9   B     L8C9

L8B5:
  8B5  7E01        LACK  0x01
  8B6  5035        SACL  0x35
  8B7  F900 08CB   B     L8CB

L8B9:
  8B9  7E02        LACK  0x02
  8BA  5035        SACL  0x35
  8BB  F900 08CA   B     L8CA

L8BD:
  8BD  7E03        LACK  0x03
  8BE  5035        SACL  0x35
  8BF  F900 08C8   B     L8C8

L8C1:
  8C1  7E00        LACK  0x00
  8C2  5035        SACL  0x35
  8C3  F900 08CA   B     L8CA

  8C5  7F80        NOP
L8C6:
  8C6  7F80        NOP
  8C7  7F80        NOP
L8C8:
  8C8  7F80        NOP
L8C9:
  8C9  7F80        NOP
L8CA:
  8CA  7F80        NOP
L8CB:
  8CB  2023        LAC   0x23
  8CC  FF00 08D8   BZ    L8D8
  8CE  1006        SUB   0x06
  8CF  FF00 08E2   BZ    L8E2
  8D1  397E        LAR   AR1,0x7E
  8D2  6588        ZALH  *
  8D3  6A1C        LT    0x1C
  8D4  6D1C        MPY   0x1C
  8D5  7F90        SPAC
  8D6  F900 08E9   B     L8E9

L8D8:
  8D8  397E        LAR   AR1,0x7E
  8D9  6516        ZALH  0x16
  8DA  0808        ADD   0x08,8
  8DB  5816        SACH  0x16
  8DC  6588        ZALH  *
  8DD  6A16        LT    0x16
  8DE  6D16        MPY   0x16
  8DF  7F90        SPAC
  8E0  F900 08E9   B     L8E9

L8E2:
  8E2  397E        LAR   AR1,0x7E
  8E3  6588        ZALH  *
  8E4  6A1A        LT    0x1A
  8E5  6D1A        MPY   0x1A
  8E6  7F90        SPAC
  8E7  F900 08E9   B     L8E9

L8E9:
  8E9  5903        SACH  0x03,1
  8EA  6A03        LT    0x03
  8EB  7F80        NOP
  8EC  656E        ZALH  0x6E
  8ED  6D71        MPY   0x71
  8EE  7F8F        APAC
  8EF  7F8F        APAC
  8F0  5878        SACH  0x78
  8F1  656F        ZALH  0x6F
  8F2  6D72        MPY   0x72
  8F3  7F8F        APAC
  8F4  7F8F        APAC
  8F5  5879        SACH  0x79
  8F6  6570        ZALH  0x70
  8F7  6D73        MPY   0x73
  8F8  7F8F        APAC
  8F9  7F8F        APAC
  8FA  587A        SACH  0x7A
  8FB  207D        LAC   0x7D
  8FC  FC00 0905   BGZ   L905
  8FE  4503        IN    0x03,PA5
  8FF  3903        LAR   AR1,0x03
  900  4681        IN    *,PA6,AR1
  901  7F80        NOP
  902  7F80        NOP
  903  F900 090C   B     L90C

L905:
  905  4503        IN    0x03,PA5
  906  3903        LAR   AR1,0x03
  907  4681        IN    *,PA6,AR1
  908  7E01        LACK  0x01
  909  5035        SACL  0x35
  90A  2009        LAC   0x09
  90B  507D        SACL  0x7D
L90C:
  90C  4978        OUT   0x78,PA1
  90D  4979        OUT   0x79,PA1
  90E  497A        OUT   0x7A,PA1
  90F  4718        IN    0x18,PA7
  910  202D        LAC   0x2D
  911  FF00 084C   BZ    L84C
  913  F900 084D   B     L84D

  915  5B88        SACH  *,3
  916  263F        LAC   0x3F,6
  917  0F02        ADD   0x02,15
  918  1652        SUB   0x52,6
  919  5090        SACL  *-,AR0
  91A  63C4        SUBS  *,AR0
