; Eventide h3000_v153 DSP microcode
; key 1410  algorithm 14 (program 14)  DSP 1
; source H3000_153_BigROM.BIN offset 0BD2F, 277 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5008        SACL  0x08
  806  2808        LAC   0x08,8
  807  5003        SACL  0x03
  808  7F80        NOP
  809  7F80        NOP
  80A  7F80        NOP
  80B  7F80        NOP
  80C  7F80        NOP
  80D  7F80        NOP
  80E  7F80        NOP
  80F  7F80        NOP
  810  7F80        NOP
L811:
  811  F600 0815   BIOZ  L815
  813  F900 0811   B     L811

L815:
  815  4009        IN    0x09,PA0
  816  6509        ZALH  0x09
  817  FD00 081A   BGEZ  L81A
  819  7F80        NOP
L81A:
  81A  F600 081A   BIOZ  L81A
  81C  7F89        ZAC
  81D  500A        SACL  0x0A
  81E  5004        SACL  0x04
  81F  7F80        NOP
  820  5005        SACL  0x05
  821  5006        SACL  0x06
  822  5007        SACL  0x07
  823  7F80        NOP
L824:
  824  7F80        NOP
  825  7F80        NOP
  826  7F80        NOP
  827  7F80        NOP
  828  0008        ADD   0x08
  829  500A        SACL  0x0A
  82A  4509        IN    0x09,PA5
  82B  6881        LARP  1
  82C  6609        ZALS  0x09
  82D  7903        AND   0x03
  82E  FE00 0833   BNZ   L833
  830  6880        LARP  0
  831  F900 0835   B     L835

L833:
  833  3909        LAR   AR1,0x09
  834  4680        IN    *,PA6,AR0
L835:
  835  7F80        NOP
  836  7F80        NOP
  837  7F80        NOP
  838  7F80        NOP
  839  660A        ZALS  0x0A
  83A  0008        ADD   0x08
  83B  500A        SACL  0x0A
  83C  660A        ZALS  0x0A
  83D  FE00 0824   BNZ   L824
  83F  7002        LARK  AR0,0x02
L840:
  840  F600 0844   BIOZ  L844
  842  F900 0840   B     L840

L844:
  844  4009        IN    0x09,PA0
  845  6509        ZALH  0x09
  846  FA00 0849   BLZ   L849
  848  7F80        NOP
L849:
  849  F600 0849   BIOZ  L849
L84B:
  84B  4509        IN    0x09,PA5
  84C  6881        LARP  1
  84D  6609        ZALS  0x09
  84E  7903        AND   0x03
  84F  FE00 0854   BNZ   L854
  851  6880        LARP  0
  852  F900 0856   B     L856

L854:
  854  3909        LAR   AR1,0x09
  855  4680        IN    *,PA6,AR0
L856:
  856  7F80        NOP
  857  7F80        NOP
  858  6A00        LT    0x00
  859  6D11        MPY   0x11
  85A  7F8E        PAC
  85B  6D0E        MPY   0x0E
  85C  7F90        SPAC
  85D  0F0E        ADD   0x0E,15
  85E  590B        SACH  0x0B,1
  85F  6A02        LT    0x02
  860  6D12        MPY   0x12
  861  7F8E        PAC
  862  6D0F        MPY   0x0F
  863  7F90        SPAC
  864  0F0F        ADD   0x0F,15
  865  590C        SACH  0x0C,1
  866  6A01        LT    0x01
  867  6D13        MPY   0x13
  868  7F8E        PAC
  869  6D10        MPY   0x10
  86A  7F90        SPAC
  86B  0F10        ADD   0x10,15
  86C  590D        SACH  0x0D,1
  86D  6514        ZALH  0x14
  86E  4C05        OUT   0x05,PA4
  86F  4C06        OUT   0x06,PA4
  870  4C07        OUT   0x07,PA4
  871  6A0B        LT    0x0B
  872  6D40        MPY   0x40
  873  440E        IN    0x0E,PA4
  874  4411        IN    0x11,PA4
  875  440F        IN    0x0F,PA4
  876  4412        IN    0x12,PA4
  877  4410        IN    0x10,PA4
  878  4413        IN    0x13,PA4
  879  4188        IN    *,PA1
  87A  7F8F        APAC
  87B  6C0C        LTA   0x0C
  87C  6D41        MPY   0x41
  87D  7F8F        APAC
  87E  6C0D        LTA   0x0D
  87F  6D42        MPY   0x42
  880  7F8F        APAC
  881  6C0B        LTA   0x0B
  882  581B        SACH  0x1B
  883  6515        ZALH  0x15
  884  6D43        MPY   0x43
  885  7F8F        APAC
  886  6C0C        LTA   0x0C
  887  6D44        MPY   0x44
  888  7F8F        APAC
  889  6C0D        LTA   0x0D
  88A  6D45        MPY   0x45
  88B  7F8F        APAC
  88C  6C0B        LTA   0x0B
  88D  581C        SACH  0x1C
  88E  6504        ZALH  0x04
  88F  6D46        MPY   0x46
  890  7F8F        APAC
  891  6C0C        LTA   0x0C
  892  5805        SACH  0x05
  893  6504        ZALH  0x04
  894  6D47        MPY   0x47
  895  7F8F        APAC
  896  6C0D        LTA   0x0D
  897  5806        SACH  0x06
  898  6504        ZALH  0x04
  899  6D48        MPY   0x48
  89A  7F8F        APAC
  89B  4114        IN    0x14,PA1
  89C  4115        IN    0x15,PA1
  89D  4E1B        OUT   0x1B,PA6
  89E  4D1C        OUT   0x1C,PA5
  89F  4704        IN    0x04,PA7
  8A0  7F8F        APAC
  8A1  5807        SACH  0x07
  8A2  7F80        NOP
  8A3  F400 084B   BANZ  L84B
  8A5  7002        LARK  AR0,0x02
  8A6  7F80        NOP
  8A7  7F80        NOP
  8A8  7F80        NOP
  8A9  7F80        NOP
  8AA  654A        ZALH  0x4A
  8AB  FF00 0913   BZ    L913
  8AD  F900 0856   B     L856

L8AF:
  8AF  4509        IN    0x09,PA5
  8B0  6881        LARP  1
  8B1  6609        ZALS  0x09
  8B2  7903        AND   0x03
  8B3  FE00 08B8   BNZ   L8B8
  8B5  6880        LARP  0
  8B6  F900 08BA   B     L8BA

L8B8:
  8B8  3909        LAR   AR1,0x09
  8B9  4680        IN    *,PA6,AR0
L8BA:
  8BA  7F80        NOP
  8BB  7F80        NOP
  8BC  6A00        LT    0x00
  8BD  6D11        MPY   0x11
  8BE  7F8E        PAC
  8BF  6D0E        MPY   0x0E
  8C0  7F90        SPAC
  8C1  0F0E        ADD   0x0E,15
  8C2  590B        SACH  0x0B,1
  8C3  6A02        LT    0x02
  8C4  6D12        MPY   0x12
  8C5  7F8E        PAC
  8C6  6D0F        MPY   0x0F
  8C7  7F90        SPAC
  8C8  0F0F        ADD   0x0F,15
  8C9  590C        SACH  0x0C,1
  8CA  6A01        LT    0x01
  8CB  6D13        MPY   0x13
  8CC  7F8E        PAC
  8CD  6D10        MPY   0x10
  8CE  7F90        SPAC
  8CF  0F10        ADD   0x10,15
  8D0  590D        SACH  0x0D,1
  8D1  6514        ZALH  0x14
  8D2  4C05        OUT   0x05,PA4
  8D3  4C06        OUT   0x06,PA4
  8D4  4C07        OUT   0x07,PA4
  8D5  6A0B        LT    0x0B
  8D6  6D40        MPY   0x40
  8D7  440E        IN    0x0E,PA4
  8D8  4411        IN    0x11,PA4
  8D9  440F        IN    0x0F,PA4
  8DA  4412        IN    0x12,PA4
  8DB  4410        IN    0x10,PA4
  8DC  4413        IN    0x13,PA4
  8DD  4188        IN    *,PA1
  8DE  7F8F        APAC
  8DF  6C0C        LTA   0x0C
  8E0  6D41        MPY   0x41
  8E1  7F8F        APAC
  8E2  6C0D        LTA   0x0D
  8E3  6D42        MPY   0x42
  8E4  7F8F        APAC
  8E5  6C0B        LTA   0x0B
  8E6  581B        SACH  0x1B
  8E7  6515        ZALH  0x15
  8E8  6D43        MPY   0x43
  8E9  7F8F        APAC
  8EA  6C0C        LTA   0x0C
  8EB  6D44        MPY   0x44
  8EC  7F8F        APAC
  8ED  6C0D        LTA   0x0D
  8EE  6D45        MPY   0x45
  8EF  7F8F        APAC
  8F0  6C0B        LTA   0x0B
  8F1  581C        SACH  0x1C
  8F2  650B        ZALH  0x0B
  8F3  5805        SACH  0x05
  8F4  650C        ZALH  0x0C
  8F5  5806        SACH  0x06
  8F6  650D        ZALH  0x0D
  8F7  5807        SACH  0x07
  8F8  7F80        NOP
  8F9  7F80        NOP
  8FA  7F80        NOP
  8FB  7F80        NOP
  8FC  7F80        NOP
  8FD  7F80        NOP
  8FE  7F80        NOP
  8FF  4114        IN    0x14,PA1
  900  4115        IN    0x15,PA1
  901  4E1B        OUT   0x1B,PA6
  902  4D1C        OUT   0x1C,PA5
  903  4704        IN    0x04,PA7
  904  7F80        NOP
  905  7F80        NOP
  906  7F80        NOP
  907  F400 08AF   BANZ  L8AF
  909  7002        LARK  AR0,0x02
  90A  7F80        NOP
  90B  7F80        NOP
  90C  7F80        NOP
  90D  7F80        NOP
  90E  654A        ZALH  0x4A
  90F  FF00 0913   BZ    L913
  911  F900 0856   B     L856

L913:
  913  F900 08BA   B     L8BA

