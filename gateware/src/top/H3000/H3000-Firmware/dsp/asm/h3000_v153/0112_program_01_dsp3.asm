; Eventide h3000_v153 DSP microcode
; key 0112  algorithm 01 (program 01)  DSP 3
; source H3000_153_BigROM.BIN offset 0B193, 154 program words loaded at 800
;
  800  7F8A        ROVM
  801  7F81        DINT
  802  6E00        LDPK  0
  803  7E01        LACK  0x01
  804  5009        SACL  0x09
  805  2A09        LAC   0x09,10
  806  5006        SACL  0x06
L807:
  807  F600 080B   BIOZ  L80B
  809  F900 0807   B     L807

L80B:
  80B  4004        IN    0x04,PA0
  80C  6504        ZALH  0x04
  80D  FD00 0810   BGEZ  L810
  80F  7F80        NOP
L810:
  810  F600 0810   BIOZ  L810
  812  7F89        ZAC
  813  5005        SACL  0x05
  814  5007        SACL  0x07
  815  5008        SACL  0x08
  816  5000        SACL  0x00
  817  5001        SACL  0x01
  818  5002        SACL  0x02
  819  5003        SACL  0x03
  81A  5040        SACL  0x40
  81B  6A40        LT    0x40
  81C  7F80        NOP
  81D  7F80        NOP
  81E  7F80        NOP
  81F  7F80        NOP
L820:
  820  7F80        NOP
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
  824  0009        ADD   0x09
  825  5005        SACL  0x05
  826  4504        IN    0x04,PA5
  827  6881        LARP  1
  828  6604        ZALS  0x04
  829  7906        AND   0x06
  82A  FE00 082F   BNZ   L82F
  82C  6880        LARP  0
  82D  F900 0831   B     L831

L82F:
  82F  3904        LAR   AR1,0x04
  830  4680        IN    *,PA6,AR0
L831:
  831  7F80        NOP
  832  7F80        NOP
  833  7F80        NOP
  834  7F80        NOP
  835  6605        ZALS  0x05
  836  0009        ADD   0x09
  837  5005        SACL  0x05
  838  6605        ZALS  0x05
  839  FE00 0820   BNZ   L820
L83B:
  83B  F600 083F   BIOZ  L83F
  83D  F900 083B   B     L83B

L83F:
  83F  4004        IN    0x04,PA0
  840  6504        ZALH  0x04
  841  FD00 0844   BGEZ  L844
  843  7F80        NOP
L844:
  844  F600 0844   BIOZ  L844
L846:
  846  4504        IN    0x04,PA5
  847  6881        LARP  1
  848  6604        ZALS  0x04
  849  7906        AND   0x06
  84A  FE00 084F   BNZ   L84F
  84C  6880        LARP  0
  84D  F900 0851   B     L851

L84F:
  84F  3904        LAR   AR1,0x04
  850  4680        IN    *,PA6,AR0
L851:
  851  4F0A        OUT   0x0A,PA7
  852  4F0B        OUT   0x0B,PA7
  853  4F0C        OUT   0x0C,PA7
  854  4F0D        OUT   0x0D,PA7
  855  4F0E        OUT   0x0E,PA7
  856  4F0F        OUT   0x0F,PA7
  857  4F10        OUT   0x10,PA7
  858  4F11        OUT   0x11,PA7
  859  4F12        OUT   0x12,PA7
  85A  4F13        OUT   0x13,PA7
  85B  4F14        OUT   0x14,PA7
  85C  4F15        OUT   0x15,PA7
  85D  4F08        OUT   0x08,PA7
  85E  6608        ZALS  0x08
  85F  003C        ADD   0x3C
  860  5032        SACL  0x32
  861  003D        ADD   0x3D
  862  4F32        OUT   0x32,PA7
  863  5033        SACL  0x33
  864  003E        ADD   0x3E
  865  5034        SACL  0x34
  866  003F        ADD   0x3F
  867  4F33        OUT   0x33,PA7
  868  5035        SACL  0x35
  869  001E        ADD   0x1E
  86A  500A        SACL  0x0A
  86B  001F        ADD   0x1F
  86C  4F34        OUT   0x34,PA7
  86D  500B        SACL  0x0B
  86E  0020        ADD   0x20
  86F  500C        SACL  0x0C
  870  0021        ADD   0x21
  871  4F35        OUT   0x35,PA7
  872  500D        SACL  0x0D
  873  0022        ADD   0x22
  874  500E        SACL  0x0E
  875  0023        ADD   0x23
  876  500F        SACL  0x0F
  877  0024        ADD   0x24
  878  5010        SACL  0x10
  879  0025        ADD   0x25
  87A  5011        SACL  0x11
  87B  0026        ADD   0x26
  87C  5012        SACL  0x12
  87D  0027        ADD   0x27
  87E  5013        SACL  0x13
  87F  0028        ADD   0x28
  880  5014        SACL  0x14
  881  0029        ADD   0x29
  882  5015        SACL  0x15
  883  6608        ZALS  0x08
  884  1009        SUB   0x09
  885  5008        SACL  0x08
  886  7F80        NOP
  887  7F80        NOP
  888  6D01        MPY   0x01
  889  7F8E        PAC
  88A  7F8F        APAC
  88B  5803        SACH  0x03
  88C  4100        IN    0x00,PA1
  88D  4201        IN    0x01,PA2
  88E  4D02        OUT   0x02,PA5
  88F  4E03        OUT   0x03,PA6
  890  6A40        LT    0x40
  891  6D00        MPY   0x00
  892  7F8E        PAC
  893  7F8F        APAC
  894  5802        SACH  0x02
  895  7F80        NOP
  896  7F80        NOP
  897  7F80        NOP
  898  F900 0846   B     L846

