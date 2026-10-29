; Eventide h3500 DSP microcode
; key 0212  algorithm 02 (program 02)  DSP 3
; source H3000-Upgrade_ROM2.BIN offset 037C6, 199 program words loaded at 800
;
  800  7F8B        SOVM
  801  6E00        LDPK  0
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  502E        SACL  0x2E
  806  2A2E        LAC   0x2E,10
  807  5035        SACL  0x35
  808  2E2E        LAC   0x2E,14
  809  5036        SACL  0x36
  80A  282E        LAC   0x2E,8
  80B  062E        ADD   0x2E,6
  80C  5037        SACL  0x37
  80D  7E02        LACK  0x02
  80E  502F        SACL  0x2F
  80F  7E03        LACK  0x03
  810  5030        SACL  0x30
  811  7E04        LACK  0x04
  812  5031        SACL  0x31
  813  7EFF        LACK  0xFF
  814  5032        SACL  0x32
  815  2732        LAC   0x32,7
  816  7A32        OR    0x32
  817  5032        SACL  0x32
  818  6A2E        LT    0x2E
  819  8D48        MPYK  3400
  81A  7F8E        PAC
  81B  5038        SACL  0x38
  81C  8D68        MPYK  3432
  81D  7F8E        PAC
  81E  5033        SACL  0x33
  81F  8C08        MPYK  3080
  820  7F8E        PAC
  821  5034        SACL  0x34
  822  7F89        ZAC
  823  501B        SACL  0x1B
L824:
  824  700A        LARK  AR0,0x0A
L825:
  825  F400 0825   BANZ  L825
  827  002E        ADD   0x2E
  828  5000        SACL  0x00
  829  6600        ZALS  0x00
  82A  FE00 0824   BNZ   L824
L82C:
  82C  F800 08CD   CALL  L8CD
  82E  7F89        ZAC
  82F  5019        SACL  0x19
  830  F800 0900   CALL  L900
  832  F800 0856   CALL  L856
  834  FE00 083F   BNZ   L83F
  836  F800 0A65   CALL  LA65
  838  F800 0A80   CALL  LA80
  83A  6527        ZALH  0x27
  83B  FF00 084C   BZ    L84C
  83D  6632        ZALS  0x32
  83E  5019        SACL  0x19
L83F:
  83F  F800 0910   CALL  L910
  841  F800 0856   CALL  L856
  843  FF00 0848   BZ    L848
  845  6519        ZALH  0x19
  846  FF00 082C   BZ    L82C
L848:
  848  F800 0A65   CALL  LA65
  84A  F800 0A80   CALL  LA80
L84C:
  84C  F800 087A   CALL  L87A
  84E  F800 0B34   CALL  LB34
  850  F800 0A93   CALL  LA93
  852  F800 0B46   CALL  LB46
  854  F900 082C   B     L82C

L856:
  856  6623        ZALS  0x23
  857  102E        SUB   0x2E
  858  FB00 0873   BLEZ  L873
  85A  112E        SUB   0x2E,1
  85B  FB00 086F   BLEZ  L86F
  85D  122E        SUB   0x2E,2
  85E  FB00 086B   BLEZ  L86B
  860  132E        SUB   0x2E,3
  861  FB00 0867   BLEZ  L867
  863  F800 0993   CALL  L993
  865  F900 0875   B     L875

L867:
  867  F800 096D   CALL  L96D
  869  F900 0875   B     L875

L86B:
  86B  F800 094F   CALL  L94F
  86D  F900 0875   B     L875

L86F:
  86F  F800 0935   CALL  L935
  871  F900 0875   B     L875

L873:
  873  F800 0920   CALL  L920
L875:
  875  F800 0A21   CALL  LA21
  877  F800 0A48   CALL  LA48
  879  7F8D        RET

L87A:
  87A  6621        ZALS  0x21
  87B  112E        SUB   0x2E,1
  87C  102E        SUB   0x2E
  87D  5000        SACL  0x00
  87E  7E00        LACK  0x00
  87F  5016        SACL  0x16
  880  5044        SACL  0x44
  881  6634        ZALS  0x34
  882  5003        SACL  0x03
  883  6742        TBLR  0x42
  884  7E01        LACK  0x01
  885  0003        ADD   0x03
  886  5003        SACL  0x03
L887:
  887  6741        TBLR  0x41
  888  7E01        LACK  0x01
  889  0003        ADD   0x03
  88A  5003        SACL  0x03
  88B  6541        ZALH  0x41
  88C  6242        SUBH  0x42
  88D  FA00 0899   BLZ   L899
  88F  6941        DMOV  0x41
  890  6600        ZALS  0x00
  891  102E        SUB   0x2E
  892  5000        SACL  0x00
  893  7E01        LACK  0x01
  894  0016        ADD   0x16
  895  5016        SACL  0x16
  896  6603        ZALS  0x03
  897  F900 0887   B     L887

L899:
  899  6A42        LT    0x42
  89A  6D26        MPY   0x26
  89B  7F8E        PAC
  89C  5943        SACH  0x43,1
  89D  6600        ZALS  0x00
  89E  1022        SUB   0x22
  89F  5000        SACL  0x00
  8A0  6603        ZALS  0x03
  8A1  0022        ADD   0x22
  8A2  5003        SACL  0x03
  8A3  3800        LAR   AR0,0x00
  8A4  6603        ZALS  0x03
L8A5:
  8A5  6740        TBLR  0x40
  8A6  6541        ZALH  0x41
  8A7  6242        SUBH  0x42
  8A8  FA00 08BE   BLZ   L8BE
  8AA  6541        ZALH  0x41
  8AB  6240        SUBH  0x40
  8AC  FB00 08BE   BLEZ  L8BE
  8AE  6541        ZALH  0x41
  8AF  6243        SUBH  0x43
  8B0  FA00 08BE   BLZ   L8BE
  8B2  6541        ZALH  0x41
  8B3  6244        SUBH  0x44
  8B4  FA00 08BE   BLZ   L8BE
  8B6  6603        ZALS  0x03
  8B7  102E        SUB   0x2E
  8B8  7D32        TBLW  0x32
  8B9  1034        SUB   0x34
  8BA  1016        SUB   0x16
  8BB  501C        SACL  0x1C
  8BC  6541        ZALH  0x41
  8BD  5844        SACH  0x44
L8BE:
  8BE  6941        DMOV  0x41
  8BF  6940        DMOV  0x40
  8C0  7E01        LACK  0x01
  8C1  0003        ADD   0x03
  8C2  5003        SACL  0x03
  8C3  F400 08A5   BANZ  L8A5
  8C5  7F89        ZAC
  8C6  7F8D        RET

