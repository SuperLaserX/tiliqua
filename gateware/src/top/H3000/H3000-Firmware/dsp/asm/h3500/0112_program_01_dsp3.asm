; Eventide h3500 DSP microcode
; key 0112  algorithm 01 (program 01)  DSP 3
; source H3000-Upgrade_ROM2.BIN offset 02E70, 193 program words loaded at 800
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
  80C  5009        SACL  0x09
  80D  2A09        LAC   0x09,10
  80E  5006        SACL  0x06
  80F  7F89        ZAC
  810  5019        SACL  0x19
  811  7F80        NOP
  812  7F80        NOP
  813  7F80        NOP
  814  7F89        ZAC
  815  5005        SACL  0x05
L816:
  816  F600 081A   BIOZ  L81A
  818  F900 0816   B     L816

L81A:
  81A  4004        IN    0x04,PA0
  81B  6504        ZALH  0x04
  81C  FD00 081F   BGEZ  L81F
  81E  7F80        NOP
L81F:
  81F  F600 081F   BIOZ  L81F
L821:
  821  4504        IN    0x04,PA5
  822  6881        LARP  1
  823  6604        ZALS  0x04
  824  7906        AND   0x06
  825  FE00 082A   BNZ   L82A
  827  6880        LARP  0
  828  F900 082C   B     L82C

L82A:
  82A  3904        LAR   AR1,0x04
  82B  4680        IN    *,PA6,AR0
L82C:
  82C  7E15        LACK  0x15
  82D  6105        ADDS  0x05
  82E  5005        SACL  0x05
  82F  4C19        OUT   0x19,PA4
  830  4C19        OUT   0x19,PA4
  831  4C19        OUT   0x19,PA4
  832  4C19        OUT   0x19,PA4
  833  4C19        OUT   0x19,PA4
  834  4C19        OUT   0x19,PA4
  835  4C19        OUT   0x19,PA4
  836  4C19        OUT   0x19,PA4
  837  4C19        OUT   0x19,PA4
  838  4C19        OUT   0x19,PA4
  839  4C19        OUT   0x19,PA4
  83A  4C19        OUT   0x19,PA4
  83B  4C19        OUT   0x19,PA4
  83C  4C19        OUT   0x19,PA4
  83D  4C19        OUT   0x19,PA4
  83E  4C19        OUT   0x19,PA4
  83F  4C19        OUT   0x19,PA4
  840  4C19        OUT   0x19,PA4
  841  4C19        OUT   0x19,PA4
  842  4C19        OUT   0x19,PA4
  843  4C19        OUT   0x19,PA4
  844  4C19        OUT   0x19,PA4
  845  4C19        OUT   0x19,PA4
  846  4C19        OUT   0x19,PA4
  847  4C19        OUT   0x19,PA4
  848  4C19        OUT   0x19,PA4
  849  4C19        OUT   0x19,PA4
  84A  4C19        OUT   0x19,PA4
  84B  4C19        OUT   0x19,PA4
  84C  4C19        OUT   0x19,PA4
  84D  4C19        OUT   0x19,PA4
  84E  4C19        OUT   0x19,PA4
  84F  4C19        OUT   0x19,PA4
  850  4C19        OUT   0x19,PA4
  851  4C19        OUT   0x19,PA4
  852  4C19        OUT   0x19,PA4
  853  4C19        OUT   0x19,PA4
  854  4C19        OUT   0x19,PA4
  855  4C19        OUT   0x19,PA4
  856  4C19        OUT   0x19,PA4
  857  4C19        OUT   0x19,PA4
  858  4C19        OUT   0x19,PA4
  859  7F80        NOP
  85A  7F80        NOP
  85B  7F80        NOP
  85C  7F80        NOP
  85D  2005        LAC   0x05
  85E  FC00 0821   BGZ   L821
  860  7F80        NOP
  861  6A40        LT    0x40
L862:
  862  F600 0866   BIOZ  L866
  864  F900 0862   B     L862

L866:
  866  4004        IN    0x04,PA0
  867  6504        ZALH  0x04
  868  FD00 086B   BGEZ  L86B
  86A  7F80        NOP
L86B:
  86B  F600 086B   BIOZ  L86B
L86D:
  86D  4504        IN    0x04,PA5
  86E  6881        LARP  1
  86F  6604        ZALS  0x04
  870  7906        AND   0x06
  871  FE00 0876   BNZ   L876
  873  6880        LARP  0
  874  F900 0878   B     L878

L876:
  876  3904        LAR   AR1,0x04
  877  4680        IN    *,PA6,AR0
L878:
  878  4F0A        OUT   0x0A,PA7
  879  4F0B        OUT   0x0B,PA7
  87A  4F0C        OUT   0x0C,PA7
  87B  4F0D        OUT   0x0D,PA7
  87C  4F0E        OUT   0x0E,PA7
  87D  4F0F        OUT   0x0F,PA7
  87E  4F10        OUT   0x10,PA7
  87F  4F11        OUT   0x11,PA7
  880  4F12        OUT   0x12,PA7
  881  4F13        OUT   0x13,PA7
  882  4F14        OUT   0x14,PA7
  883  4F15        OUT   0x15,PA7
  884  4F08        OUT   0x08,PA7
  885  6608        ZALS  0x08
  886  003C        ADD   0x3C
  887  5032        SACL  0x32
  888  003D        ADD   0x3D
  889  4F32        OUT   0x32,PA7
  88A  5033        SACL  0x33
  88B  003E        ADD   0x3E
  88C  5034        SACL  0x34
  88D  003F        ADD   0x3F
  88E  4F33        OUT   0x33,PA7
  88F  5035        SACL  0x35
  890  001E        ADD   0x1E
  891  500A        SACL  0x0A
  892  001F        ADD   0x1F
  893  4F34        OUT   0x34,PA7
  894  500B        SACL  0x0B
  895  0020        ADD   0x20
  896  500C        SACL  0x0C
  897  0021        ADD   0x21
  898  4F35        OUT   0x35,PA7
  899  500D        SACL  0x0D
  89A  0022        ADD   0x22
  89B  500E        SACL  0x0E
  89C  0023        ADD   0x23
  89D  500F        SACL  0x0F
  89E  0024        ADD   0x24
  89F  5010        SACL  0x10
  8A0  0025        ADD   0x25
  8A1  5011        SACL  0x11
  8A2  0026        ADD   0x26
  8A3  5012        SACL  0x12
  8A4  0027        ADD   0x27
  8A5  5013        SACL  0x13
  8A6  0028        ADD   0x28
  8A7  5014        SACL  0x14
  8A8  0029        ADD   0x29
  8A9  5015        SACL  0x15
  8AA  6608        ZALS  0x08
  8AB  1009        SUB   0x09
  8AC  5008        SACL  0x08
  8AD  7F80        NOP
  8AE  7F80        NOP
  8AF  6D01        MPY   0x01
  8B0  7F8E        PAC
  8B1  7F8F        APAC
  8B2  5803        SACH  0x03
  8B3  4100        IN    0x00,PA1
  8B4  4201        IN    0x01,PA2
  8B5  4D02        OUT   0x02,PA5
  8B6  4E03        OUT   0x03,PA6
  8B7  6A40        LT    0x40
  8B8  6D00        MPY   0x00
  8B9  7F8E        PAC
  8BA  7F8F        APAC
  8BB  5802        SACH  0x02
  8BC  7F80        NOP
  8BD  7F80        NOP
  8BE  7F80        NOP
  8BF  F900 086D   B     L86D

