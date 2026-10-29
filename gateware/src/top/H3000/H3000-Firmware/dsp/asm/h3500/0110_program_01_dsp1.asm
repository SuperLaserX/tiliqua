; Eventide h3500 DSP microcode
; key 0110  algorithm 01 (program 01)  DSP 1
; source H3000-Upgrade_ROM2.BIN offset 02AE6, 220 program words loaded at 800
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
  80C  5000        SACL  0x00
  80D  2800        LAC   0x00,8
  80E  5005        SACL  0x05
  80F  7F80        NOP
  810  7F80        NOP
  811  7F80        NOP
  812  7F80        NOP
  813  7F80        NOP
  814  7F89        ZAC
  815  5004        SACL  0x04
L816:
  816  F600 081A   BIOZ  L81A
  818  F900 0816   B     L816

L81A:
  81A  4003        IN    0x03,PA0
  81B  6503        ZALH  0x03
  81C  FD00 081F   BGEZ  L81F
  81E  7F80        NOP
L81F:
  81F  F600 081F   BIOZ  L81F
L821:
  821  4503        IN    0x03,PA5
  822  6881        LARP  1
  823  6603        ZALS  0x03
  824  7905        AND   0x05
  825  FE00 082A   BNZ   L82A
  827  6880        LARP  0
  828  F900 082C   B     L82C

L82A:
  82A  3903        LAR   AR1,0x03
  82B  4680        IN    *,PA6,AR0
L82C:
  82C  7F80        NOP
  82D  6604        ZALS  0x04
  82E  4F04        OUT   0x04,PA7
  82F  6100        ADDS  0x00
  830  5004        SACL  0x04
  831  4F04        OUT   0x04,PA7
  832  6100        ADDS  0x00
  833  5004        SACL  0x04
  834  4F04        OUT   0x04,PA7
  835  6100        ADDS  0x00
  836  5004        SACL  0x04
  837  4F04        OUT   0x04,PA7
  838  6100        ADDS  0x00
  839  5004        SACL  0x04
  83A  4F04        OUT   0x04,PA7
  83B  6100        ADDS  0x00
  83C  5004        SACL  0x04
  83D  4F04        OUT   0x04,PA7
  83E  6100        ADDS  0x00
  83F  5004        SACL  0x04
  840  4F04        OUT   0x04,PA7
  841  6100        ADDS  0x00
  842  5004        SACL  0x04
  843  4F04        OUT   0x04,PA7
  844  6100        ADDS  0x00
  845  5004        SACL  0x04
  846  4F04        OUT   0x04,PA7
  847  6100        ADDS  0x00
  848  5004        SACL  0x04
  849  4F04        OUT   0x04,PA7
  84A  6100        ADDS  0x00
  84B  5004        SACL  0x04
  84C  4F04        OUT   0x04,PA7
  84D  6100        ADDS  0x00
  84E  5004        SACL  0x04
  84F  4F04        OUT   0x04,PA7
  850  6100        ADDS  0x00
  851  5004        SACL  0x04
  852  4F04        OUT   0x04,PA7
  853  6100        ADDS  0x00
  854  5004        SACL  0x04
  855  4F04        OUT   0x04,PA7
  856  6100        ADDS  0x00
  857  5004        SACL  0x04
  858  4F04        OUT   0x04,PA7
  859  6100        ADDS  0x00
  85A  5004        SACL  0x04
  85B  4F04        OUT   0x04,PA7
  85C  6100        ADDS  0x00
  85D  5004        SACL  0x04
  85E  4F04        OUT   0x04,PA7
  85F  6100        ADDS  0x00
  860  5004        SACL  0x04
  861  4F04        OUT   0x04,PA7
  862  6100        ADDS  0x00
  863  5004        SACL  0x04
  864  4F04        OUT   0x04,PA7
  865  6100        ADDS  0x00
  866  5004        SACL  0x04
  867  4F04        OUT   0x04,PA7
  868  6100        ADDS  0x00
  869  5004        SACL  0x04
  86A  4F04        OUT   0x04,PA7
  86B  6100        ADDS  0x00
  86C  5004        SACL  0x04
  86D  7F80        NOP
  86E  7F80        NOP
  86F  7F80        NOP
  870  7F80        NOP
  871  7F80        NOP
  872  2004        LAC   0x04
  873  FD00 0821   BGEZ  L821
  875  7F80        NOP
  876  3840        LAR   AR0,0x40
L877:
  877  F600 087B   BIOZ  L87B
  879  F900 0877   B     L877

L87B:
  87B  4003        IN    0x03,PA0
  87C  6503        ZALH  0x03
  87D  FD00 0880   BGEZ  L880
  87F  7F80        NOP
L880:
  880  F600 0880   BIOZ  L880
L882:
  882  4503        IN    0x03,PA5
  883  6881        LARP  1
  884  6603        ZALS  0x03
  885  7905        AND   0x05
  886  FE00 088B   BNZ   L88B
  888  6880        LARP  0
  889  F900 088D   B     L88D

L88B:
  88B  3903        LAR   AR1,0x03
  88C  4680        IN    *,PA6,AR0
L88D:
  88D  7F89        ZAC
  88E  6A1E        LT    0x1E
  88F  6D0A        MPY   0x0A
  890  440A        IN    0x0A,PA4
  891  440B        IN    0x0B,PA4
  892  440C        IN    0x0C,PA4
  893  440D        IN    0x0D,PA4
  894  440E        IN    0x0E,PA4
  895  440F        IN    0x0F,PA4
  896  4410        IN    0x10,PA4
  897  4411        IN    0x11,PA4
  898  4412        IN    0x12,PA4
  899  4413        IN    0x13,PA4
  89A  4414        IN    0x14,PA4
  89B  4415        IN    0x15,PA4
  89C  6C0B        LTA   0x0B
  89D  6D1F        MPY   0x1F
  89E  6C0C        LTA   0x0C
  89F  6D20        MPY   0x20
  8A0  6C0D        LTA   0x0D
  8A1  6D21        MPY   0x21
  8A2  6C0E        LTA   0x0E
  8A3  6D22        MPY   0x22
  8A4  6C0F        LTA   0x0F
  8A5  6D23        MPY   0x23
  8A6  6C10        LTA   0x10
  8A7  6D24        MPY   0x24
  8A8  6C11        LTA   0x11
  8A9  6D25        MPY   0x25
  8AA  6C12        LTA   0x12
  8AB  6D26        MPY   0x26
  8AC  6C13        LTA   0x13
  8AD  6D27        MPY   0x27
  8AE  6C14        LTA   0x14
  8AF  6D28        MPY   0x28
  8B0  6C15        LTA   0x15
  8B1  6D29        MPY   0x29
  8B2  6C0A        LTA   0x0A
  8B3  5846        SACH  0x46
  8B4  5003        SACL  0x03
  8B5  6046        ADDH  0x46
  8B6  6103        ADDS  0x03
  8B7  5846        SACH  0x46
  8B8  7F89        ZAC
  8B9  6D32        MPY   0x32
  8BA  6C0B        LTA   0x0B
  8BB  6D33        MPY   0x33
  8BC  6C0C        LTA   0x0C
  8BD  6D34        MPY   0x34
  8BE  6C0D        LTA   0x0D
  8BF  6D35        MPY   0x35
  8C0  6C0E        LTA   0x0E
  8C1  6D36        MPY   0x36
  8C2  6C0F        LTA   0x0F
  8C3  6D37        MPY   0x37
  8C4  6C10        LTA   0x10
  8C5  6D38        MPY   0x38
  8C6  6C11        LTA   0x11
  8C7  6D39        MPY   0x39
  8C8  6C12        LTA   0x12
  8C9  6D3A        MPY   0x3A
  8CA  6C13        LTA   0x13
  8CB  6D3B        MPY   0x3B
  8CC  6C14        LTA   0x14
  8CD  6D3C        MPY   0x3C
  8CE  6C15        LTA   0x15
  8CF  6D3D        MPY   0x3D
  8D0  7F8F        APAC
  8D1  5847        SACH  0x47
  8D2  5003        SACL  0x03
  8D3  6047        ADDH  0x47
  8D4  6103        ADDS  0x03
  8D5  5847        SACH  0x47
  8D6  4B88        OUT   *,PA3
  8D7  4946        OUT   0x46,PA1
  8D8  4A47        OUT   0x47,PA2
  8D9  3840        LAR   AR0,0x40
  8DA  F900 0882   B     L882

