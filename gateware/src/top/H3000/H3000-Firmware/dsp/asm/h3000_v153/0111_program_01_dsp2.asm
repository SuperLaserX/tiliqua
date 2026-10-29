; Eventide h3000_v153 DSP microcode
; key 0111  algorithm 01 (program 01)  DSP 2
; source H3000_153_BigROM.BIN offset 0B043, 163 program words loaded at 800
;
  800  7F8B        SOVM
  801  7F81        DINT
  802  6E00        LDPK  0
  803  7E01        LACK  0x01
  804  5000        SACL  0x00
  805  2900        LAC   0x00,9
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
  813  5004        SACL  0x04
  814  7F80        NOP
  815  7F80        NOP
  816  5008        SACL  0x08
  817  501E        SACL  0x1E
  818  500E        SACL  0x0E
  819  500F        SACL  0x0F
  81A  5010        SACL  0x10
  81B  5011        SACL  0x11
  81C  500A        SACL  0x0A
  81D  500B        SACL  0x0B
  81E  500C        SACL  0x0C
  81F  500D        SACL  0x0D
L820:
  820  7F80        NOP
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
  824  0000        ADD   0x00
  825  5004        SACL  0x04
  826  4503        IN    0x03,PA5
  827  6881        LARP  1
  828  6603        ZALS  0x03
  829  7905        AND   0x05
  82A  FE00 082F   BNZ   L82F
  82C  6880        LARP  0
  82D  F900 0831   B     L831

L82F:
  82F  3903        LAR   AR1,0x03
  830  4680        IN    *,PA6,AR0
L831:
  831  7F80        NOP
  832  7F80        NOP
  833  7F80        NOP
  834  7F80        NOP
  835  6604        ZALS  0x04
  836  0000        ADD   0x00
  837  5004        SACL  0x04
  838  6604        ZALS  0x04
  839  FE00 0820   BNZ   L820
L83B:
  83B  F600 083F   BIOZ  L83F
  83D  F900 083B   B     L83B

L83F:
  83F  4003        IN    0x03,PA0
  840  6503        ZALH  0x03
  841  FD00 0844   BGEZ  L844
  843  7F80        NOP
L844:
  844  F600 0844   BIOZ  L844
L846:
  846  4503        IN    0x03,PA5
  847  6881        LARP  1
  848  6603        ZALS  0x03
  849  7905        AND   0x05
  84A  FE00 084F   BNZ   L84F
  84C  6880        LARP  0
  84D  F900 0851   B     L851

L84F:
  84F  3903        LAR   AR1,0x03
  850  4680        IN    *,PA6,AR0
L851:
  851  7F80        NOP
  852  4706        IN    0x06,PA7
  853  6508        ZALH  0x08
  854  6A0E        LT    0x0E
  855  6D12        MPY   0x12
  856  7F8F        APAC
  857  6C08        LTA   0x08
  858  580A        SACH  0x0A
  859  6D16        MPY   0x16
  85A  7F8E        PAC
  85B  6C0E        LTA   0x0E
  85C  6D1A        MPY   0x1A
  85D  7F8F        APAC
  85E  7F8F        APAC
  85F  5803        SACH  0x03
  860  6503        ZALH  0x03
  861  6A0F        LT    0x0F
  862  6D13        MPY   0x13
  863  7F8F        APAC
  864  6C03        LTA   0x03
  865  580B        SACH  0x0B
  866  6D17        MPY   0x17
  867  7F8E        PAC
  868  6C0F        LTA   0x0F
  869  6D1B        MPY   0x1B
  86A  7F8F        APAC
  86B  7F8F        APAC
  86C  5804        SACH  0x04
  86D  4C0A        OUT   0x0A,PA4
  86E  6A06        LT    0x06
  86F  6D40        MPY   0x40
  870  440E        IN    0x0E,PA4
  871  4C0B        OUT   0x0B,PA4
  872  7F8E        PAC
  873  6C07        LTA   0x07
  874  440F        IN    0x0F,PA4
  875  4C0C        OUT   0x0C,PA4
  876  6D41        MPY   0x41
  877  7F8F        APAC
  878  4410        IN    0x10,PA4
  879  4C0D        OUT   0x0D,PA4
  87A  7F8F        APAC
  87B  5820        SACH  0x20
  87C  4411        IN    0x11,PA4
  87D  4C1E        OUT   0x1E,PA4
  87E  6504        ZALH  0x04
  87F  6A10        LT    0x10
  880  6D14        MPY   0x14
  881  7F8F        APAC
  882  6C04        LTA   0x04
  883  580C        SACH  0x0C
  884  6D18        MPY   0x18
  885  7F8E        PAC
  886  6C10        LTA   0x10
  887  6D1C        MPY   0x1C
  888  7F8F        APAC
  889  7F8F        APAC
  88A  5803        SACH  0x03
  88B  6503        ZALH  0x03
  88C  6A11        LT    0x11
  88D  6D15        MPY   0x15
  88E  7F8F        APAC
  88F  6C03        LTA   0x03
  890  580D        SACH  0x0D
  891  6D19        MPY   0x19
  892  7F8E        PAC
  893  6C11        LTA   0x11
  894  6D1D        MPY   0x1D
  895  7F8F        APAC
  896  7F8F        APAC
  897  581E        SACH  0x1E
  898  4707        IN    0x07,PA7
  899  6520        ZALH  0x20
  89A  6A1F        LT    0x1F
  89B  6D42        MPY   0x42
  89C  7F8F        APAC
  89D  7F8F        APAC
  89E  431F        IN    0x1F,PA3
  89F  5808        SACH  0x08
  8A0  7F80        NOP
  8A1  F900 0846   B     L846

