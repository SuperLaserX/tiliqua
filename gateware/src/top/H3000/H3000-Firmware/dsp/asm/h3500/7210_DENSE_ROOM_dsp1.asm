; Eventide h3500 DSP microcode
; key 7210  algorithm 72 (DENSE ROOM)  DSP 1
; source H3000-Upgrade_ROM4.BIN offset 02679, 175 program words loaded at 800
;
  800  6E00        LDPK  0
  801  7F8B        SOVM
  802  7F81        DINT
  803  6880        LARP  0
  804  7E01        LACK  0x01
  805  5000        SACL  0x00
  806  2800        LAC   0x00,8
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
  811  7F80        NOP
  812  7F80        NOP
L813:
  813  F600 0817   BIOZ  L817
  815  F900 0813   B     L813

L817:
  817  4001        IN    0x01,PA0
  818  6501        ZALH  0x01
  819  FD00 081C   BGEZ  L81C
  81B  7F80        NOP
L81C:
  81C  F600 081C   BIOZ  L81C
  81E  7F89        ZAC
  81F  5007        SACL  0x07
  820  5002        SACL  0x02
  821  7F80        NOP
  822  500B        SACL  0x0B
  823  500C        SACL  0x0C
  824  500E        SACL  0x0E
  825  500F        SACL  0x0F
  826  5011        SACL  0x11
  827  5012        SACL  0x12
  828  5014        SACL  0x14
  829  5015        SACL  0x15
  82A  5017        SACL  0x17
  82B  5018        SACL  0x18
  82C  501A        SACL  0x1A
  82D  501B        SACL  0x1B
  82E  7F80        NOP
  82F  7F80        NOP
  830  7F80        NOP
  831  7F80        NOP
L832:
  832  4F02        OUT   0x02,PA7
  833  4C07        OUT   0x07,PA4
  834  0000        ADD   0x00
  835  5002        SACL  0x02
  836  4501        IN    0x01,PA5
  837  6881        LARP  1
  838  6601        ZALS  0x01
  839  7903        AND   0x03
  83A  FE00 083F   BNZ   L83F
  83C  6880        LARP  0
  83D  F900 0841   B     L841

L83F:
  83F  3901        LAR   AR1,0x01
  840  4680        IN    *,PA6,AR0
L841:
  841  4F02        OUT   0x02,PA7
  842  4C07        OUT   0x07,PA4
  843  6602        ZALS  0x02
  844  0000        ADD   0x00
  845  5002        SACL  0x02
  846  6602        ZALS  0x02
  847  FE00 0832   BNZ   L832
L849:
  849  F600 084D   BIOZ  L84D
  84B  F900 0849   B     L849

L84D:
  84D  4001        IN    0x01,PA0
  84E  6501        ZALH  0x01
  84F  FA00 0852   BLZ   L852
  851  7F80        NOP
L852:
  852  F600 0852   BIOZ  L852
L854:
  854  4501        IN    0x01,PA5
  855  6881        LARP  1
  856  6601        ZALS  0x01
  857  7903        AND   0x03
  858  FE00 085D   BNZ   L85D
  85A  6880        LARP  0
  85B  F900 085F   B     L85F

L85D:
  85D  3901        LAR   AR1,0x01
  85E  4680        IN    *,PA6,AR0
L85F:
  85F  7F89        ZAC
  860  6A18        LT    0x18
  861  6D40        MPY   0x40
  862  6C16        LTA   0x16
  863  6D41        MPY   0x41
  864  6C1B        LTA   0x1B
  865  440A        IN    0x0A,PA4
  866  5918        SACH  0x18,1
  867  7F89        ZAC
  868  6D40        MPY   0x40
  869  6C19        LTA   0x19
  86A  440D        IN    0x0D,PA4
  86B  6D41        MPY   0x41
  86C  7F8F        APAC
  86D  591B        SACH  0x1B,1
  86E  7F89        ZAC
  86F  4410        IN    0x10,PA4
  870  6A09        LT    0x09
  871  6D43        MPY   0x43
  872  6C0A        LTA   0x0A
  873  6D44        MPY   0x44
  874  4413        IN    0x13,PA4
  875  6C0D        LTA   0x0D
  876  6D45        MPY   0x45
  877  6C10        LTA   0x10
  878  6D46        MPY   0x46
  879  4416        IN    0x16,PA4
  87A  6C13        LTA   0x13
  87B  6D47        MPY   0x47
  87C  6C16        LTA   0x16
  87D  6D48        MPY   0x48
  87E  4419        IN    0x19,PA4
  87F  4C08        OUT   0x08,PA4
  880  6C19        LTA   0x19
  881  6D49        MPY   0x49
  882  4428        IN    0x28,PA4
  883  6C28        LTA   0x28
  884  6D42        MPY   0x42
  885  7F8F        APAC
  886  581C        SACH  0x1C
  887  501D        SACL  0x1D
  888  601C        ADDH  0x1C
  889  611D        ADDS  0x1D
  88A  581C        SACH  0x1C
  88B  7F89        ZAC
  88C  6A09        LT    0x09
  88D  6D4B        MPY   0x4B
  88E  6C28        LTA   0x28
  88F  6D4A        MPY   0x4A
  890  6C0A        LTA   0x0A
  891  6D4C        MPY   0x4C
  892  6C0D        LTA   0x0D
  893  6D4D        MPY   0x4D
  894  6C10        LTA   0x10
  895  6D4E        MPY   0x4E
  896  6C13        LTA   0x13
  897  6D4F        MPY   0x4F
  898  6C16        LTA   0x16
  899  6D50        MPY   0x50
  89A  6C19        LTA   0x19
  89B  6D51        MPY   0x51
  89C  7F8F        APAC
  89D  581E        SACH  0x1E
  89E  501F        SACL  0x1F
  89F  601E        ADDH  0x1E
  8A0  611F        ADDS  0x1F
  8A1  581E        SACH  0x1E
  8A2  7F80        NOP
  8A3  7F80        NOP
  8A4  7F80        NOP
  8A5  4708        IN    0x08,PA7
  8A6  4E1C        OUT   0x1C,PA6
  8A7  4D1E        OUT   0x1E,PA5
  8A8  4918        OUT   0x18,PA1
  8A9  491B        OUT   0x1B,PA1
  8AA  7F80        NOP
  8AB  4209        IN    0x09,PA2
  8AC  7F80        NOP
  8AD  F900 0854   B     L854

