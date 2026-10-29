; Eventide h3000_v153 DSP microcode
; key 1E11  algorithm 1E (program 1E)  DSP 2
; source H3000_153_BigROM.BIN offset 0A537, 179 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5000        SACL  0x00
  806  2900        LAC   0x00,9
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
  815  4001        IN    0x01,PA0
  816  6501        ZALH  0x01
  817  FD00 081A   BGEZ  L81A
  819  7F80        NOP
L81A:
  81A  F600 081A   BIOZ  L81A
  81C  7F89        ZAC
  81D  5002        SACL  0x02
  81E  5004        SACL  0x04
  81F  7F80        NOP
  820  501D        SACL  0x1D
  821  501E        SACL  0x1E
  822  5005        SACL  0x05
  823  5006        SACL  0x06
  824  5007        SACL  0x07
  825  5008        SACL  0x08
  826  5009        SACL  0x09
  827  500A        SACL  0x0A
  828  500B        SACL  0x0B
  829  500C        SACL  0x0C
  82A  500D        SACL  0x0D
  82B  500E        SACL  0x0E
  82C  500F        SACL  0x0F
  82D  5010        SACL  0x10
  82E  7F80        NOP
  82F  7F80        NOP
  830  7F80        NOP
  831  7F80        NOP
  832  7F80        NOP
  833  7F80        NOP
L834:
  834  7F80        NOP
  835  7F80        NOP
  836  7F80        NOP
  837  7F80        NOP
  838  0000        ADD   0x00
  839  5002        SACL  0x02
  83A  4501        IN    0x01,PA5
  83B  6881        LARP  1
  83C  6601        ZALS  0x01
  83D  7903        AND   0x03
  83E  FE00 0843   BNZ   L843
  840  6880        LARP  0
  841  F900 0845   B     L845

L843:
  843  3901        LAR   AR1,0x01
  844  4680        IN    *,PA6,AR0
L845:
  845  7F80        NOP
  846  7F80        NOP
  847  7F80        NOP
  848  7F80        NOP
  849  6602        ZALS  0x02
  84A  0000        ADD   0x00
  84B  5002        SACL  0x02
  84C  6602        ZALS  0x02
  84D  FE00 0834   BNZ   L834
L84F:
  84F  F600 0853   BIOZ  L853
  851  F900 084F   B     L84F

L853:
  853  4001        IN    0x01,PA0
  854  6501        ZALH  0x01
  855  FA00 0858   BLZ   L858
  857  7F80        NOP
L858:
  858  F600 0858   BIOZ  L858
L85A:
  85A  4501        IN    0x01,PA5
  85B  6881        LARP  1
  85C  6601        ZALS  0x01
  85D  7903        AND   0x03
  85E  FE00 0863   BNZ   L863
  860  6880        LARP  0
  861  F900 0865   B     L865

L863:
  863  3901        LAR   AR1,0x01
  864  4680        IN    *,PA6,AR0
L865:
  865  6A04        LT    0x04
  866  6D41        MPY   0x41
  867  4C05        OUT   0x05,PA4
  868  4C06        OUT   0x06,PA4
  869  4C07        OUT   0x07,PA4
  86A  4C08        OUT   0x08,PA4
  86B  4C09        OUT   0x09,PA4
  86C  4C0A        OUT   0x0A,PA4
  86D  7F8E        PAC
  86E  1E0B        SUB   0x0B,14
  86F  0E0C        ADD   0x0C,14
  870  0F0D        ADD   0x0D,15
  871  0F0E        ADD   0x0E,15
  872  0F0F        ADD   0x0F,15
  873  0F10        ADD   0x10,15
  874  5805        SACH  0x05
  875  7F8E        PAC
  876  1F0B        SUB   0x0B,15
  877  0F0C        ADD   0x0C,15
  878  0E0D        ADD   0x0D,14
  879  0E0E        ADD   0x0E,14
  87A  1F0F        SUB   0x0F,15
  87B  1F10        SUB   0x10,15
  87C  5806        SACH  0x06
  87D  7F8E        PAC
  87E  0E0B        ADD   0x0B,14
  87F  0E0C        ADD   0x0C,14
  880  0F0D        ADD   0x0D,15
  881  1F0E        SUB   0x0E,15
  882  0F0F        ADD   0x0F,15
  883  1F10        SUB   0x10,15
  884  5807        SACH  0x07
  885  7F8E        PAC
  886  0F0B        ADD   0x0B,15
  887  0F0C        ADD   0x0C,15
  888  0E0D        ADD   0x0D,14
  889  1E0E        SUB   0x0E,14
  88A  1F0F        SUB   0x0F,15
  88B  0F10        ADD   0x10,15
  88C  5808        SACH  0x08
  88D  7F8E        PAC
  88E  0F0B        ADD   0x0B,15
  88F  0F0C        ADD   0x0C,15
  890  1F0D        SUB   0x0D,15
  891  0F0E        ADD   0x0E,15
  892  0E0F        ADD   0x0F,14
  893  1E10        SUB   0x10,14
  894  5809        SACH  0x09
  895  7F8E        PAC
  896  0F0B        ADD   0x0B,15
  897  1F0C        SUB   0x0C,15
  898  0F0D        ADD   0x0D,15
  899  0F0E        ADD   0x0E,15
  89A  1E0F        SUB   0x0F,14
  89B  1E10        SUB   0x10,14
  89C  580A        SACH  0x0A
  89D  4704        IN    0x04,PA7
  89E  6A40        LT    0x40
  89F  6D1D        MPY   0x1D
  8A0  7F8E        PAC
  8A1  590B        SACH  0x0B,1
  8A2  6D1E        MPY   0x1E
  8A3  431D        IN    0x1D,PA3
  8A4  431E        IN    0x1E,PA3
  8A5  430D        IN    0x0D,PA3
  8A6  430E        IN    0x0E,PA3
  8A7  430F        IN    0x0F,PA3
  8A8  4310        IN    0x10,PA3
  8A9  4B40        OUT   0x40,PA3
  8AA  4E1D        OUT   0x1D,PA6
  8AB  4D1E        OUT   0x1E,PA5
  8AC  7F8E        PAC
  8AD  590C        SACH  0x0C,1
  8AE  7F80        NOP
  8AF  7F80        NOP
  8B0  7F80        NOP
  8B1  F900 085A   B     L85A

