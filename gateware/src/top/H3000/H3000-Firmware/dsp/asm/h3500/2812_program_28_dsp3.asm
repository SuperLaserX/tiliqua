; Eventide h3500 DSP microcode
; key 2812  algorithm 28 (program 28)  DSP 3
; source H3000-Upgrade_ROM2.BIN offset 02028, 241 program words loaded at 800
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
  80D  2A00        LAC   0x00,10
  80E  5004        SACL  0x04
  80F  7F89        ZAC
  810  5020        SACL  0x20
  811  7F80        NOP
  812  7F80        NOP
  813  7F80        NOP
  814  7F80        NOP
  815  7F80        NOP
  816  7F80        NOP
  817  7F80        NOP
  818  7F80        NOP
  819  7F80        NOP
  81A  7F89        ZAC
  81B  5003        SACL  0x03
L81C:
  81C  F600 0820   BIOZ  L820
  81E  F900 081C   B     L81C

L820:
  820  4002        IN    0x02,PA0
  821  6502        ZALH  0x02
  822  FD00 0825   BGEZ  L825
  824  7F80        NOP
L825:
  825  F600 0825   BIOZ  L825
L827:
  827  4502        IN    0x02,PA5
  828  6881        LARP  1
  829  6602        ZALS  0x02
  82A  7904        AND   0x04
  82B  FE00 0830   BNZ   L830
  82D  6880        LARP  0
  82E  F900 0832   B     L832

L830:
  830  3902        LAR   AR1,0x02
  831  4680        IN    *,PA6,AR0
L832:
  832  7E15        LACK  0x15
  833  6103        ADDS  0x03
  834  5003        SACL  0x03
  835  4C20        OUT   0x20,PA4
  836  4C20        OUT   0x20,PA4
  837  4C20        OUT   0x20,PA4
  838  4C20        OUT   0x20,PA4
  839  4C20        OUT   0x20,PA4
  83A  4C20        OUT   0x20,PA4
  83B  4C20        OUT   0x20,PA4
  83C  4C20        OUT   0x20,PA4
  83D  4C20        OUT   0x20,PA4
  83E  4C20        OUT   0x20,PA4
  83F  4C20        OUT   0x20,PA4
  840  4C20        OUT   0x20,PA4
  841  4C20        OUT   0x20,PA4
  842  4C20        OUT   0x20,PA4
  843  4C20        OUT   0x20,PA4
  844  4C20        OUT   0x20,PA4
  845  4C20        OUT   0x20,PA4
  846  4C20        OUT   0x20,PA4
  847  4C20        OUT   0x20,PA4
  848  4C20        OUT   0x20,PA4
  849  4C20        OUT   0x20,PA4
  84A  4C20        OUT   0x20,PA4
  84B  4C20        OUT   0x20,PA4
  84C  4C20        OUT   0x20,PA4
  84D  4C20        OUT   0x20,PA4
  84E  4C20        OUT   0x20,PA4
  84F  4C20        OUT   0x20,PA4
  850  4C20        OUT   0x20,PA4
  851  4C20        OUT   0x20,PA4
  852  4C20        OUT   0x20,PA4
  853  4C20        OUT   0x20,PA4
  854  4C20        OUT   0x20,PA4
  855  4C20        OUT   0x20,PA4
  856  4C20        OUT   0x20,PA4
  857  4C20        OUT   0x20,PA4
  858  4C20        OUT   0x20,PA4
  859  4C20        OUT   0x20,PA4
  85A  4C20        OUT   0x20,PA4
  85B  4C20        OUT   0x20,PA4
  85C  4C20        OUT   0x20,PA4
  85D  4C20        OUT   0x20,PA4
  85E  4C20        OUT   0x20,PA4
  85F  7F80        NOP
  860  7F80        NOP
  861  7F80        NOP
  862  7F80        NOP
  863  2003        LAC   0x03
  864  FC00 0827   BGZ   L827
L866:
  866  F600 086A   BIOZ  L86A
  868  F900 0866   B     L866

L86A:
  86A  4002        IN    0x02,PA0
  86B  6502        ZALH  0x02
  86C  FA00 086F   BLZ   L86F
  86E  7F80        NOP
L86F:
  86F  F600 086F   BIOZ  L86F
L871:
  871  4502        IN    0x02,PA5
  872  6881        LARP  1
  873  6602        ZALS  0x02
  874  7904        AND   0x04
  875  FE00 087A   BNZ   L87A
  877  6880        LARP  0
  878  F900 087C   B     L87C

L87A:
  87A  3902        LAR   AR1,0x02
  87B  4680        IN    *,PA6,AR0
L87C:
  87C  650D        ZALH  0x0D
  87D  4F05        OUT   0x05,PA7
  87E  0F17        ADD   0x17,15
  87F  4F06        OUT   0x06,PA7
  880  4417        IN    0x17,PA4
  881  4F07        OUT   0x07,PA7
  882  5819        SACH  0x19
  883  6512        ZALH  0x12
  884  4F08        OUT   0x08,PA7
  885  0F17        ADD   0x17,15
  886  581A        SACH  0x1A
  887  4F09        OUT   0x09,PA7
  888  6605        ZALS  0x05
  889  1000        SUB   0x00
  88A  4F0A        OUT   0x0A,PA7
  88B  440D        IN    0x0D,PA4
  88C  5005        SACL  0x05
  88D  614B        ADDS  0x4B
  88E  4F0B        OUT   0x0B,PA7
  88F  4412        IN    0x12,PA4
  890  4F0C        OUT   0x0C,PA7
  891  5006        SACL  0x06
  892  490F        OUT   0x0F,PA1
  893  4A14        OUT   0x14,PA2
  894  614C        ADDS  0x4C
  895  5007        SACL  0x07
  896  614D        ADDS  0x4D
  897  5008        SACL  0x08
  898  614E        ADDS  0x4E
  899  5009        SACL  0x09
  89A  614F        ADDS  0x4F
  89B  500A        SACL  0x0A
  89C  6150        ADDS  0x50
  89D  500B        SACL  0x0B
  89E  6151        ADDS  0x51
  89F  500C        SACL  0x0C
  8A0  4E19        OUT   0x19,PA6
  8A1  4D1A        OUT   0x1A,PA5
  8A2  654A        ZALH  0x4A
  8A3  FF00 08CB   BZ    L8CB
  8A5  6A0E        LT    0x0E
  8A6  6D46        MPY   0x46
  8A7  7F8E        PAC
  8A8  6C0D        LTA   0x0D
  8A9  6D45        MPY   0x45
  8AA  6C10        LTA   0x10
  8AB  580E        SACH  0x0E
  8AC  600D        ADDH  0x0D
  8AD  7F90        SPAC
  8AE  5802        SACH  0x02
  8AF  6D48        MPY   0x48
  8B0  7F8F        APAC
  8B1  6C02        LTA   0x02
  8B2  6D47        MPY   0x47
  8B3  7F8F        APAC
  8B4  7F8F        APAC
  8B5  5810        SACH  0x10
  8B6  6D49        MPY   0x49
  8B7  7F8F        APAC
  8B8  6C15        LTA   0x15
  8B9  580F        SACH  0x0F
  8BA  6D48        MPY   0x48
  8BB  6512        ZALH  0x12
  8BC  7F8F        APAC
  8BD  6C12        LTA   0x12
  8BE  6D47        MPY   0x47
  8BF  7F8F        APAC
  8C0  7F8F        APAC
  8C1  5815        SACH  0x15
  8C2  6D49        MPY   0x49
  8C3  7F8F        APAC
  8C4  7F8F        APAC
  8C5  5814        SACH  0x14
  8C6  7F80        NOP
  8C7  7F80        NOP
  8C8  7F80        NOP
  8C9  F900 0871   B     L871

L8CB:
  8CB  6A0E        LT    0x0E
  8CC  6D41        MPY   0x41
  8CD  7F8E        PAC
  8CE  6C0D        LTA   0x0D
  8CF  6D40        MPY   0x40
  8D0  6C10        LTA   0x10
  8D1  580E        SACH  0x0E
  8D2  600D        ADDH  0x0D
  8D3  7F90        SPAC
  8D4  5802        SACH  0x02
  8D5  6D43        MPY   0x43
  8D6  7F8F        APAC
  8D7  6C02        LTA   0x02
  8D8  6D42        MPY   0x42
  8D9  7F8F        APAC
  8DA  7F8F        APAC
  8DB  5810        SACH  0x10
  8DC  6D44        MPY   0x44
  8DD  7F8F        APAC
  8DE  6C15        LTA   0x15
  8DF  580F        SACH  0x0F
  8E0  6D43        MPY   0x43
  8E1  6512        ZALH  0x12
  8E2  7F8F        APAC
  8E3  6C12        LTA   0x12
  8E4  6D42        MPY   0x42
  8E5  7F8F        APAC
  8E6  7F8F        APAC
  8E7  5815        SACH  0x15
  8E8  6D44        MPY   0x44
  8E9  7F8F        APAC
  8EA  7F8F        APAC
  8EB  5814        SACH  0x14
  8EC  7F80        NOP
  8ED  7F80        NOP
  8EE  7F80        NOP
  8EF  F900 0871   B     L871

