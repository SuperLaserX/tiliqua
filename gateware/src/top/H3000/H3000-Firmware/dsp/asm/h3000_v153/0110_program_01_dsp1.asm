; Eventide h3000_v153 DSP microcode
; key 0110  algorithm 01 (program 01)  DSP 1
; source H3000_153_BigROM.BIN offset 0AF01, 156 program words loaded at 800
;
  800  7F8B        SOVM
  801  7F81        DINT
  802  6E00        LDPK  0
  803  7E01        LACK  0x01
  804  5000        SACL  0x00
  805  2800        LAC   0x00,8
  806  5005        SACL  0x05
L807:
  807  F600 080B   BIOZ  L80B
  809  F900 0807   B     L807

L80B:
  80B  4003        IN    0x03,PA0
  80C  6503        ZALH  0x03
  80D  FD00 0810   BGEZ  L810
  80F  7F80        NOP
L810:
  810  F600 0810   BIOZ  L810
  812  7F89        ZAC
  813  5007        SACL  0x07
  814  5004        SACL  0x04
  815  7F80        NOP
  816  7F80        NOP
  817  7F80        NOP
  818  7F80        NOP
  819  7F80        NOP
  81A  7F80        NOP
  81B  7F80        NOP
  81C  7F80        NOP
  81D  7F80        NOP
  81E  7F80        NOP
  81F  7F80        NOP
L820:
  820  4F04        OUT   0x04,PA7
  821  4C07        OUT   0x07,PA4
  822  0000        ADD   0x00
  823  5004        SACL  0x04
  824  4503        IN    0x03,PA5
  825  6881        LARP  1
  826  6603        ZALS  0x03
  827  7905        AND   0x05
  828  FE00 082D   BNZ   L82D
  82A  6880        LARP  0
  82B  F900 082F   B     L82F

L82D:
  82D  3903        LAR   AR1,0x03
  82E  4680        IN    *,PA6,AR0
L82F:
  82F  4F04        OUT   0x04,PA7
  830  4C07        OUT   0x07,PA4
  831  6604        ZALS  0x04
  832  0000        ADD   0x00
  833  5004        SACL  0x04
  834  6604        ZALS  0x04
  835  FE00 0820   BNZ   L820
L837:
  837  F600 083B   BIOZ  L83B
  839  F900 0837   B     L837

L83B:
  83B  4003        IN    0x03,PA0
  83C  6503        ZALH  0x03
  83D  FD00 0840   BGEZ  L840
  83F  7F80        NOP
L840:
  840  F600 0840   BIOZ  L840
L842:
  842  4503        IN    0x03,PA5
  843  6881        LARP  1
  844  6603        ZALS  0x03
  845  7905        AND   0x05
  846  FE00 084B   BNZ   L84B
  848  6880        LARP  0
  849  F900 084D   B     L84D

L84B:
  84B  3903        LAR   AR1,0x03
  84C  4680        IN    *,PA6,AR0
L84D:
  84D  7F89        ZAC
  84E  6A1E        LT    0x1E
  84F  6D0A        MPY   0x0A
  850  440A        IN    0x0A,PA4
  851  440B        IN    0x0B,PA4
  852  440C        IN    0x0C,PA4
  853  440D        IN    0x0D,PA4
  854  440E        IN    0x0E,PA4
  855  440F        IN    0x0F,PA4
  856  4410        IN    0x10,PA4
  857  4411        IN    0x11,PA4
  858  4412        IN    0x12,PA4
  859  4413        IN    0x13,PA4
  85A  4414        IN    0x14,PA4
  85B  4415        IN    0x15,PA4
  85C  6C0B        LTA   0x0B
  85D  6D1F        MPY   0x1F
  85E  6C0C        LTA   0x0C
  85F  6D20        MPY   0x20
  860  6C0D        LTA   0x0D
  861  6D21        MPY   0x21
  862  6C0E        LTA   0x0E
  863  6D22        MPY   0x22
  864  6C0F        LTA   0x0F
  865  6D23        MPY   0x23
  866  6C10        LTA   0x10
  867  6D24        MPY   0x24
  868  6C11        LTA   0x11
  869  6D25        MPY   0x25
  86A  6C12        LTA   0x12
  86B  6D26        MPY   0x26
  86C  6C13        LTA   0x13
  86D  6D27        MPY   0x27
  86E  6C14        LTA   0x14
  86F  6D28        MPY   0x28
  870  6C15        LTA   0x15
  871  6D29        MPY   0x29
  872  6C0A        LTA   0x0A
  873  5846        SACH  0x46
  874  5003        SACL  0x03
  875  6046        ADDH  0x46
  876  6103        ADDS  0x03
  877  5846        SACH  0x46
  878  7F89        ZAC
  879  6D32        MPY   0x32
  87A  6C0B        LTA   0x0B
  87B  6D33        MPY   0x33
  87C  6C0C        LTA   0x0C
  87D  6D34        MPY   0x34
  87E  6C0D        LTA   0x0D
  87F  6D35        MPY   0x35
  880  6C0E        LTA   0x0E
  881  6D36        MPY   0x36
  882  6C0F        LTA   0x0F
  883  6D37        MPY   0x37
  884  6C10        LTA   0x10
  885  6D38        MPY   0x38
  886  6C11        LTA   0x11
  887  6D39        MPY   0x39
  888  6C12        LTA   0x12
  889  6D3A        MPY   0x3A
  88A  6C13        LTA   0x13
  88B  6D3B        MPY   0x3B
  88C  6C14        LTA   0x14
  88D  6D3C        MPY   0x3C
  88E  6C15        LTA   0x15
  88F  6D3D        MPY   0x3D
  890  7F8F        APAC
  891  5847        SACH  0x47
  892  5003        SACL  0x03
  893  6047        ADDH  0x47
  894  6103        ADDS  0x03
  895  5847        SACH  0x47
  896  4B88        OUT   *,PA3
  897  4946        OUT   0x46,PA1
  898  4A47        OUT   0x47,PA2
  899  3840        LAR   AR0,0x40
  89A  F900 0842   B     L842

