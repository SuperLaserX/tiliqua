; Eventide h3500 DSP microcode
; key 0111  algorithm 01 (program 01)  DSP 2
; source H3000-Upgrade_ROM2.BIN offset 02CA8, 223 program words loaded at 800
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
  80D  2900        LAC   0x00,9
  80E  5005        SACL  0x05
  80F  7EFF        LACK  0xFF
  810  5003        SACL  0x03
  811  2703        LAC   0x03,7
  812  7A03        OR    0x03
  813  5009        SACL  0x09
  814  6609        ZALS  0x09
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
  82E  6100        ADDS  0x00
  82F  5004        SACL  0x04
  830  4F04        OUT   0x04,PA7
  831  6100        ADDS  0x00
  832  5004        SACL  0x04
  833  4F04        OUT   0x04,PA7
  834  6100        ADDS  0x00
  835  5004        SACL  0x04
  836  4F04        OUT   0x04,PA7
  837  6100        ADDS  0x00
  838  5004        SACL  0x04
  839  4F04        OUT   0x04,PA7
  83A  6100        ADDS  0x00
  83B  5004        SACL  0x04
  83C  4F04        OUT   0x04,PA7
  83D  6100        ADDS  0x00
  83E  5004        SACL  0x04
  83F  4F04        OUT   0x04,PA7
  840  6100        ADDS  0x00
  841  5004        SACL  0x04
  842  4F04        OUT   0x04,PA7
  843  6100        ADDS  0x00
  844  5004        SACL  0x04
  845  4F04        OUT   0x04,PA7
  846  6100        ADDS  0x00
  847  5004        SACL  0x04
  848  4F04        OUT   0x04,PA7
  849  6100        ADDS  0x00
  84A  5004        SACL  0x04
  84B  4F04        OUT   0x04,PA7
  84C  6100        ADDS  0x00
  84D  5004        SACL  0x04
  84E  4F04        OUT   0x04,PA7
  84F  6100        ADDS  0x00
  850  5004        SACL  0x04
  851  4F04        OUT   0x04,PA7
  852  6100        ADDS  0x00
  853  5004        SACL  0x04
  854  4F04        OUT   0x04,PA7
  855  6100        ADDS  0x00
  856  5004        SACL  0x04
  857  4F04        OUT   0x04,PA7
  858  6100        ADDS  0x00
  859  5004        SACL  0x04
  85A  4F04        OUT   0x04,PA7
  85B  6100        ADDS  0x00
  85C  5004        SACL  0x04
  85D  4F04        OUT   0x04,PA7
  85E  6100        ADDS  0x00
  85F  5004        SACL  0x04
  860  4F04        OUT   0x04,PA7
  861  6100        ADDS  0x00
  862  5004        SACL  0x04
  863  4F04        OUT   0x04,PA7
  864  6100        ADDS  0x00
  865  5004        SACL  0x04
  866  4F04        OUT   0x04,PA7
  867  6100        ADDS  0x00
  868  5004        SACL  0x04
  869  4F04        OUT   0x04,PA7
  86A  6100        ADDS  0x00
  86B  5004        SACL  0x04
  86C  4F04        OUT   0x04,PA7
  86D  7F80        NOP
  86E  7F80        NOP
  86F  7F80        NOP
  870  7F80        NOP
  871  7F80        NOP
  872  2004        LAC   0x04
  873  FA00 0821   BLZ   L821
  875  7F80        NOP
  876  7F80        NOP
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
  88D  7F80        NOP
  88E  4706        IN    0x06,PA7
  88F  6508        ZALH  0x08
  890  6A0E        LT    0x0E
  891  6D12        MPY   0x12
  892  7F8F        APAC
  893  6C08        LTA   0x08
  894  580A        SACH  0x0A
  895  6D16        MPY   0x16
  896  7F8E        PAC
  897  6C0E        LTA   0x0E
  898  6D1A        MPY   0x1A
  899  7F8F        APAC
  89A  7F8F        APAC
  89B  5803        SACH  0x03
  89C  6503        ZALH  0x03
  89D  6A0F        LT    0x0F
  89E  6D13        MPY   0x13
  89F  7F8F        APAC
  8A0  6C03        LTA   0x03
  8A1  580B        SACH  0x0B
  8A2  6D17        MPY   0x17
  8A3  7F8E        PAC
  8A4  6C0F        LTA   0x0F
  8A5  6D1B        MPY   0x1B
  8A6  7F8F        APAC
  8A7  7F8F        APAC
  8A8  5804        SACH  0x04
  8A9  4C0A        OUT   0x0A,PA4
  8AA  6A06        LT    0x06
  8AB  6D40        MPY   0x40
  8AC  440E        IN    0x0E,PA4
  8AD  4C0B        OUT   0x0B,PA4
  8AE  7F8E        PAC
  8AF  6C07        LTA   0x07
  8B0  440F        IN    0x0F,PA4
  8B1  4C0C        OUT   0x0C,PA4
  8B2  6D41        MPY   0x41
  8B3  7F8F        APAC
  8B4  4410        IN    0x10,PA4
  8B5  4C0D        OUT   0x0D,PA4
  8B6  7F8F        APAC
  8B7  5820        SACH  0x20
  8B8  4411        IN    0x11,PA4
  8B9  4C1E        OUT   0x1E,PA4
  8BA  6504        ZALH  0x04
  8BB  6A10        LT    0x10
  8BC  6D14        MPY   0x14
  8BD  7F8F        APAC
  8BE  6C04        LTA   0x04
  8BF  580C        SACH  0x0C
  8C0  6D18        MPY   0x18
  8C1  7F8E        PAC
  8C2  6C10        LTA   0x10
  8C3  6D1C        MPY   0x1C
  8C4  7F8F        APAC
  8C5  7F8F        APAC
  8C6  5803        SACH  0x03
  8C7  6503        ZALH  0x03
  8C8  6A11        LT    0x11
  8C9  6D15        MPY   0x15
  8CA  7F8F        APAC
  8CB  6C03        LTA   0x03
  8CC  580D        SACH  0x0D
  8CD  6D19        MPY   0x19
  8CE  7F8E        PAC
  8CF  6C11        LTA   0x11
  8D0  6D1D        MPY   0x1D
  8D1  7F8F        APAC
  8D2  7F8F        APAC
  8D3  581E        SACH  0x1E
  8D4  4707        IN    0x07,PA7
  8D5  6520        ZALH  0x20
  8D6  6A1F        LT    0x1F
  8D7  6D42        MPY   0x42
  8D8  7F8F        APAC
  8D9  7F8F        APAC
  8DA  431F        IN    0x1F,PA3
  8DB  5808        SACH  0x08
  8DC  7F80        NOP
  8DD  F900 0882   B     L882

