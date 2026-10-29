; Eventide h3500 DSP microcode
; key 6F10  algorithm 6F (PATCH FACTORY)  DSP 1
; source H3000-Upgrade_ROM4.BIN offset 36A0F, 200 program words loaded at 800
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
  80C  5021        SACL  0x21
  80D  2821        LAC   0x21,8
  80E  5025        SACL  0x25
  80F  2F21        LAC   0x21,15
  810  5024        SACL  0x24
  811  7F89        ZAC
  812  5020        SACL  0x20
  813  1021        SUB   0x21
  814  5822        SACH  0x22
  815  7EFF        LACK  0xFF
  816  5026        SACL  0x26
  817  2726        LAC   0x26,7
  818  7A26        OR    0x26
  819  5010        SACL  0x10
  81A  2F21        LAC   0x21,15
  81B  5032        SACL  0x32
  81C  7F89        ZAC
  81D  500F        SACL  0x0F
  81E  7F80        NOP
  81F  7F80        NOP
  820  7F80        NOP
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
  824  7F80        NOP
  825  7F80        NOP
  826  7F80        NOP
  827  F800 0890   CALL  L890
L829:
  829  F600 082D   BIOZ  L82D
  82B  F900 0829   B     L829

L82D:
  82D  4026        IN    0x26,PA0
  82E  6526        ZALH  0x26
  82F  FD00 0832   BGEZ  L832
  831  7F80        NOP
L832:
  832  F600 0832   BIOZ  L832
L834:
  834  3848        LAR   AR0,0x48
  835  6507        ZALH  0x07
  836  6A40        LT    0x40
  837  6D09        MPY   0x09
  838  6C09        LTA   0x09
  839  7F8F        APAC
  83A  5807        SACH  0x07
  83B  6581        ZALH  *,AR1
  83C  6D42        MPY   0x42
  83D  7F8F        APAC
  83E  6C40        LTA   0x40
  83F  6207        SUBH  0x07
  840  580B        SACH  0x0B
  841  6D0B        MPY   0x0B
  842  7F8E        PAC
  843  6C41        LTA   0x41
  844  6009        ADDH  0x09
  845  5809        SACH  0x09
  846  4D80        OUT   *,PA5,AR0
  847  3854        LAR   AR0,0x54
  848  3953        LAR   AR1,0x53
  849  4B81        OUT   *,PA3,AR1
  84A  4E80        OUT   *,PA6,AR0
  84B  3849        LAR   AR0,0x49
  84C  6508        ZALH  0x08
  84D  6D0A        MPY   0x0A
  84E  6C0A        LTA   0x0A
  84F  7F8F        APAC
  850  5808        SACH  0x08
  851  6588        ZALH  *
  852  6D43        MPY   0x43
  853  7F8F        APAC
  854  6C41        LTA   0x41
  855  6208        SUBH  0x08
  856  580C        SACH  0x0C
  857  6D0C        MPY   0x0C
  858  7F8E        PAC
  859  384C        LAR   AR0,0x4C
  85A  6C88        LTA   *
  85B  600A        ADDH  0x0A
  85C  580A        SACH  0x0A
  85D  6D46        MPY   0x46
  85E  7F8E        PAC
  85F  5905        SACH  0x05,1
  860  384D        LAR   AR0,0x4D
  861  4526        IN    0x26,PA5
  862  6881        LARP  1
  863  6626        ZALS  0x26
  864  7925        AND   0x25
  865  FE00 086A   BNZ   L86A
  867  6880        LARP  0
  868  F900 086C   B     L86C

L86A:
  86A  3926        LAR   AR1,0x26
  86B  4680        IN    *,PA6,AR0
L86C:
  86C  6A88        LT    *
  86D  6D47        MPY   0x47
  86E  7F8E        PAC
  86F  5906        SACH  0x06,1
  870  384E        LAR   AR0,0x4E
  871  430E        IN    0x0E,PA3
  872  430D        IN    0x0D,PA3
  873  6588        ZALH  *
  874  384F        LAR   AR0,0x4F
  875  6088        ADDH  *
  876  5801        SACH  0x01
  877  3952        LAR   AR1,0x52
  878  4700        IN    0x00,PA7
  879  6632        ZALS  0x32
  87A  6321        SUBS  0x21
  87B  5032        SACL  0x32
  87C  384A        LAR   AR0,0x4A
  87D  4F32        OUT   0x32,PA7
  87E  4C88        OUT   *,PA4
  87F  6144        ADDS  0x44
  880  5033        SACL  0x33
  881  4F33        OUT   0x33,PA7
  882  384B        LAR   AR0,0x4B
  883  4403        IN    0x03,PA4
  884  4C88        OUT   *,PA4
  885  6145        ADDS  0x45
  886  5034        SACL  0x34
  887  4F34        OUT   0x34,PA7
  888  4404        IN    0x04,PA4
  889  3850        LAR   AR0,0x50
  88A  6588        ZALH  *
  88B  3851        LAR   AR0,0x51
  88C  6088        ADDH  *
  88D  5802        SACH  0x02
  88E  F900 0834   B     L834

L890:
  890  F600 0894   BIOZ  L894
  892  F900 0890   B     L890

L894:
  894  4026        IN    0x26,PA0
  895  6526        ZALH  0x26
  896  FD00 0899   BGEZ  L899
  898  7F80        NOP
L899:
  899  F600 0899   BIOZ  L899
  89B  7F80        NOP
  89C  7F89        ZAC
  89D  5028        SACL  0x28
  89E  5029        SACL  0x29
  89F  7F80        NOP
  8A0  7F80        NOP
  8A1  7F80        NOP
  8A2  7F80        NOP
  8A3  7F80        NOP
  8A4  7F80        NOP
  8A5  7F80        NOP
  8A6  7F80        NOP
  8A7  7F80        NOP
  8A8  7F80        NOP
  8A9  7F80        NOP
  8AA  7F80        NOP
  8AB  7F80        NOP
  8AC  7F80        NOP
  8AD  7F80        NOP
  8AE  7F80        NOP
L8AF:
  8AF  4F28        OUT   0x28,PA7
  8B0  4C29        OUT   0x29,PA4
  8B1  0021        ADD   0x21
  8B2  5028        SACL  0x28
  8B3  4526        IN    0x26,PA5
  8B4  6881        LARP  1
  8B5  6626        ZALS  0x26
  8B6  7925        AND   0x25
  8B7  FE00 08BC   BNZ   L8BC
  8B9  6880        LARP  0
  8BA  F900 08BE   B     L8BE

L8BC:
  8BC  3926        LAR   AR1,0x26
  8BD  4680        IN    *,PA6,AR0
L8BE:
  8BE  4F28        OUT   0x28,PA7
  8BF  4C29        OUT   0x29,PA4
  8C0  6628        ZALS  0x28
  8C1  0021        ADD   0x21
  8C2  5028        SACL  0x28
  8C3  6628        ZALS  0x28
  8C4  FE00 08AF   BNZ   L8AF
  8C6  6E00        LDPK  0
  8C7  7F8D        RET

