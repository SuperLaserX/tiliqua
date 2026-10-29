; Eventide h3500 DSP microcode
; key 7A14  algorithm 7A (mod factory|one)  DSP 5
; source H3000-Upgrade_ROM3.BIN offset 0C793, 1336 program words loaded at 800
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
  80C  5006        SACL  0x06
  80D  2C06        LAC   0x06,12
  80E  5009        SACL  0x09
  80F  7F80        NOP
  810  7F80        NOP
  811  7F89        ZAC
  812  5001        SACL  0x01
  813  7F80        NOP
  814  7F80        NOP
  815  7EFF        LACK  0xFF
  816  500A        SACL  0x0A
L817:
  817  270A        LAC   0x0A,7
  818  7A0A        OR    0x0A
  819  5002        SACL  0x02
  81A  6A06        LT    0x06
  81B  8B36        MPYK  2870
  81C  7F8E        PAC
  81D  5025        SACL  0x25
  81E  8C37        MPYK  3127
  81F  7F8E        PAC
  820  5026        SACL  0x26
  821  7F80        NOP
  822  7F80        NOP
  823  7F80        NOP
  824  7F80        NOP
L825:
  825  F600 0829   BIOZ  L829
  827  F900 0825   B     L825

L829:
  829  400A        IN    0x0A,PA0
  82A  650A        ZALH  0x0A
  82B  FD00 082E   BGEZ  L82E
  82D  7F80        NOP
L82E:
  82E  F600 082E   BIOZ  L82E
  830  2C06        LAC   0x06,12
  831  500A        SACL  0x0A
  832  7E00        LACK  0x00
  833  500B        SACL  0x0B
  834  7E10        LACK  0x10
  835  500C        SACL  0x0C
  836  7E02        LACK  0x02
  837  500D        SACL  0x0D
  838  7E03        LACK  0x03
  839  5009        SACL  0x09
  83A  7F80        NOP
  83B  480C        OUT   0x0C,PA0
  83C  7F80        NOP
  83D  4F01        OUT   0x01,PA7
  83E  4C09        OUT   0x09,PA4
  83F  7F80        NOP
  840  480B        OUT   0x0B,PA0
  841  7F80        NOP
  842  4F01        OUT   0x01,PA7
  843  4C0D        OUT   0x0D,PA4
  844  7F80        NOP
  845  480A        OUT   0x0A,PA0
  846  7F80        NOP
  847  4F01        OUT   0x01,PA7
  848  4C06        OUT   0x06,PA4
  849  7F80        NOP
  84A  480C        OUT   0x0C,PA0
  84B  4F01        OUT   0x01,PA7
  84C  440C        IN    0x0C,PA4
  84D  480B        OUT   0x0B,PA0
  84E  4F01        OUT   0x01,PA7
  84F  440B        IN    0x0B,PA4
  850  480A        OUT   0x0A,PA0
  851  4F01        OUT   0x01,PA7
  852  440A        IN    0x0A,PA4
  853  7E03        LACK  0x03
  854  630C        SUBS  0x0C
  855  FE00 0868   BNZ   L868
  857  7E3F        LACK  0x3F
  858  502B        SACL  0x2B
  859  7E20        LACK  0x20
  85A  502A        SACL  0x2A
  85B  7F89        ZAC
  85C  5028        SACL  0x28
  85D  5029        SACL  0x29
  85E  7E02        LACK  0x02
  85F  7F80        NOP
  860  7F80        NOP
  861  7F80        NOP
  862  7F80        NOP
  863  7F80        NOP
  864  7F80        NOP
  865  7F80        NOP
  866  F900 088F   B     L88F

L868:
  868  7E02        LACK  0x02
  869  630B        SUBS  0x0B
  86A  FE00 0879   BNZ   L879
  86C  7E0F        LACK  0x0F
  86D  502B        SACL  0x2B
  86E  7E08        LACK  0x08
  86F  502A        SACL  0x2A
  870  7F89        ZAC
  871  5028        SACL  0x28
  872  5029        SACL  0x29
  873  7E01        LACK  0x01
  874  7F80        NOP
  875  7F80        NOP
  876  7F80        NOP
  877  F900 088F   B     L88F

L879:
  879  7E01        LACK  0x01
  87A  630A        SUBS  0x0A
  87B  FE00 0886   BNZ   L886
  87D  2D06        LAC   0x06,13
  87E  5028        SACL  0x28
  87F  0F06        ADD   0x06,15
  880  5029        SACL  0x29
  881  7F89        ZAC
  882  502B        SACL  0x2B
  883  502A        SACL  0x2A
  884  F900 088F   B     L88F

L886:
  886  7EFF        LACK  0xFF
  887  7F80        NOP
  888  7F80        NOP
  889  7F80        NOP
  88A  7F80        NOP
  88B  7F80        NOP
  88C  7F80        NOP
  88D  7F80        NOP
  88E  7F80        NOP
L88F:
  88F  500A        SACL  0x0A
  890  4A0A        OUT   0x0A,PA2
  891  4801        OUT   0x01,PA0
  892  6602        ZALS  0x02
  893  500B        SACL  0x0B
L894:
  894  F600 0898   BIOZ  L898
  896  F900 0894   B     L894

L898:
  898  400A        IN    0x0A,PA0
  899  650A        ZALH  0x0A
  89A  FD00 089D   BGEZ  L89D
  89C  7F80        NOP
L89D:
  89D  F600 089D   BIOZ  L89D
L89F:
  89F  450A        IN    0x0A,PA5
  8A0  6881        LARP  1
  8A1  660A        ZALS  0x0A
  8A2  7909        AND   0x09
  8A3  FE00 08A8   BNZ   L8A8
  8A5  6880        LARP  0
  8A6  F900 08AA   B     L8AA

L8A8:
  8A8  390A        LAR   AR1,0x0A
  8A9  4680        IN    *,PA6,AR0
L8AA:
  8AA  7F80        NOP
  8AB  660B        ZALS  0x0B
  8AC  6106        ADDS  0x06
  8AD  500B        SACL  0x0B
  8AE  4F0B        OUT   0x0B,PA7
  8AF  6106        ADDS  0x06
  8B0  500B        SACL  0x0B
  8B1  4F0B        OUT   0x0B,PA7
  8B2  6106        ADDS  0x06
  8B3  500B        SACL  0x0B
  8B4  4F0B        OUT   0x0B,PA7
  8B5  6106        ADDS  0x06
  8B6  500B        SACL  0x0B
  8B7  4F0B        OUT   0x0B,PA7
  8B8  6106        ADDS  0x06
  8B9  500B        SACL  0x0B
  8BA  4F0B        OUT   0x0B,PA7
  8BB  6106        ADDS  0x06
  8BC  500B        SACL  0x0B
  8BD  4F0B        OUT   0x0B,PA7
  8BE  6106        ADDS  0x06
  8BF  500B        SACL  0x0B
  8C0  4F0B        OUT   0x0B,PA7
  8C1  6106        ADDS  0x06
  8C2  500B        SACL  0x0B
  8C3  4F0B        OUT   0x0B,PA7
  8C4  6106        ADDS  0x06
  8C5  500B        SACL  0x0B
  8C6  4F0B        OUT   0x0B,PA7
  8C7  6106        ADDS  0x06
  8C8  500B        SACL  0x0B
  8C9  4F0B        OUT   0x0B,PA7
  8CA  6106        ADDS  0x06
  8CB  500B        SACL  0x0B
  8CC  4F0B        OUT   0x0B,PA7
  8CD  6106        ADDS  0x06
  8CE  500B        SACL  0x0B
  8CF  4F0B        OUT   0x0B,PA7
  8D0  6106        ADDS  0x06
  8D1  500B        SACL  0x0B
  8D2  4F0B        OUT   0x0B,PA7
  8D3  6106        ADDS  0x06
  8D4  500B        SACL  0x0B
  8D5  4F0B        OUT   0x0B,PA7
  8D6  6106        ADDS  0x06
  8D7  500B        SACL  0x0B
  8D8  4F0B        OUT   0x0B,PA7
  8D9  6106        ADDS  0x06
  8DA  500B        SACL  0x0B
  8DB  4F0B        OUT   0x0B,PA7
  8DC  6106        ADDS  0x06
  8DD  500B        SACL  0x0B
  8DE  4F0B        OUT   0x0B,PA7
  8DF  6106        ADDS  0x06
  8E0  500B        SACL  0x0B
  8E1  4F0B        OUT   0x0B,PA7
  8E2  6106        ADDS  0x06
  8E3  500B        SACL  0x0B
  8E4  4F0B        OUT   0x0B,PA7
  8E5  6106        ADDS  0x06
  8E6  500B        SACL  0x0B
  8E7  4F0B        OUT   0x0B,PA7
  8E8  6106        ADDS  0x06
  8E9  500B        SACL  0x0B
  8EA  4F0B        OUT   0x0B,PA7
  8EB  7F80        NOP
  8EC  7F80        NOP
  8ED  7F80        NOP
  8EE  7F80        NOP
  8EF  7F80        NOP
  8F0  200B        LAC   0x0B
  8F1  FA00 089F   BLZ   L89F
  8F3  482A        OUT   0x2A,PA0
  8F4  6602        ZALS  0x02
  8F5  500B        SACL  0x0B
L8F6:
  8F6  F600 08FA   BIOZ  L8FA
  8F8  F900 08F6   B     L8F6

L8FA:
  8FA  400A        IN    0x0A,PA0
  8FB  650A        ZALH  0x0A
  8FC  FD00 08FF   BGEZ  L8FF
  8FE  7F80        NOP
L8FF:
  8FF  F600 08FF   BIOZ  L8FF
L901:
  901  450A        IN    0x0A,PA5
  902  6881        LARP  1
  903  660A        ZALS  0x0A
  904  7909        AND   0x09
  905  FE00 090A   BNZ   L90A
  907  6880        LARP  0
  908  F900 090C   B     L90C

L90A:
  90A  390A        LAR   AR1,0x0A
  90B  4680        IN    *,PA6,AR0
L90C:
  90C  7F80        NOP
  90D  660B        ZALS  0x0B
  90E  6106        ADDS  0x06
  90F  500B        SACL  0x0B
  910  4F0B        OUT   0x0B,PA7
  911  6106        ADDS  0x06
  912  500B        SACL  0x0B
  913  4F0B        OUT   0x0B,PA7
  914  6106        ADDS  0x06
  915  500B        SACL  0x0B
  916  4F0B        OUT   0x0B,PA7
  917  6106        ADDS  0x06
  918  500B        SACL  0x0B
  919  4F0B        OUT   0x0B,PA7
  91A  6106        ADDS  0x06
  91B  500B        SACL  0x0B
  91C  4F0B        OUT   0x0B,PA7
  91D  6106        ADDS  0x06
  91E  500B        SACL  0x0B
  91F  4F0B        OUT   0x0B,PA7
  920  6106        ADDS  0x06
  921  500B        SACL  0x0B
  922  4F0B        OUT   0x0B,PA7
  923  6106        ADDS  0x06
  924  500B        SACL  0x0B
  925  4F0B        OUT   0x0B,PA7
  926  6106        ADDS  0x06
  927  500B        SACL  0x0B
  928  4F0B        OUT   0x0B,PA7
  929  6106        ADDS  0x06
  92A  500B        SACL  0x0B
  92B  4F0B        OUT   0x0B,PA7
  92C  6106        ADDS  0x06
  92D  500B        SACL  0x0B
  92E  4F0B        OUT   0x0B,PA7
  92F  6106        ADDS  0x06
  930  500B        SACL  0x0B
  931  4F0B        OUT   0x0B,PA7
  932  6106        ADDS  0x06
  933  500B        SACL  0x0B
  934  4F0B        OUT   0x0B,PA7
  935  6106        ADDS  0x06
  936  500B        SACL  0x0B
  937  4F0B        OUT   0x0B,PA7
  938  6106        ADDS  0x06
  939  500B        SACL  0x0B
  93A  4F0B        OUT   0x0B,PA7
  93B  6106        ADDS  0x06
  93C  500B        SACL  0x0B
  93D  4F0B        OUT   0x0B,PA7
  93E  6106        ADDS  0x06
  93F  500B        SACL  0x0B
  940  4F0B        OUT   0x0B,PA7
  941  6106        ADDS  0x06
  942  500B        SACL  0x0B
  943  4F0B        OUT   0x0B,PA7
  944  6106        ADDS  0x06
  945  500B        SACL  0x0B
  946  4F0B        OUT   0x0B,PA7
  947  6106        ADDS  0x06
  948  500B        SACL  0x0B
  949  4F0B        OUT   0x0B,PA7
  94A  6106        ADDS  0x06
  94B  500B        SACL  0x0B
  94C  4F0B        OUT   0x0B,PA7
  94D  7F80        NOP
  94E  7F80        NOP
  94F  7F80        NOP
  950  7F80        NOP
  951  7F80        NOP
  952  200B        LAC   0x0B
  953  FA00 0901   BLZ   L901
  955  2C06        LAC   0x06,12
  956  500B        SACL  0x0B
  957  480B        OUT   0x0B,PA0
  958  6602        ZALS  0x02
  959  500B        SACL  0x0B
L95A:
  95A  F600 095E   BIOZ  L95E
  95C  F900 095A   B     L95A

L95E:
  95E  400A        IN    0x0A,PA0
  95F  650A        ZALH  0x0A
  960  FD00 0963   BGEZ  L963
  962  7F80        NOP
L963:
  963  F600 0963   BIOZ  L963
L965:
  965  450A        IN    0x0A,PA5
  966  6881        LARP  1
  967  660A        ZALS  0x0A
  968  7909        AND   0x09
  969  FE00 096E   BNZ   L96E
  96B  6880        LARP  0
  96C  F900 0970   B     L970

L96E:
  96E  390A        LAR   AR1,0x0A
  96F  4680        IN    *,PA6,AR0
L970:
  970  7F80        NOP
  971  660B        ZALS  0x0B
  972  6106        ADDS  0x06
  973  500B        SACL  0x0B
  974  4F0B        OUT   0x0B,PA7
  975  6106        ADDS  0x06
  976  500B        SACL  0x0B
  977  4F0B        OUT   0x0B,PA7
  978  6106        ADDS  0x06
  979  500B        SACL  0x0B
  97A  4F0B        OUT   0x0B,PA7
  97B  6106        ADDS  0x06
  97C  500B        SACL  0x0B
  97D  4F0B        OUT   0x0B,PA7
  97E  6106        ADDS  0x06
  97F  500B        SACL  0x0B
  980  4F0B        OUT   0x0B,PA7
  981  6106        ADDS  0x06
  982  500B        SACL  0x0B
  983  4F0B        OUT   0x0B,PA7
  984  6106        ADDS  0x06
  985  500B        SACL  0x0B
  986  4F0B        OUT   0x0B,PA7
  987  6106        ADDS  0x06
  988  500B        SACL  0x0B
  989  4F0B        OUT   0x0B,PA7
  98A  6106        ADDS  0x06
  98B  500B        SACL  0x0B
  98C  4F0B        OUT   0x0B,PA7
  98D  6106        ADDS  0x06
  98E  500B        SACL  0x0B
  98F  4F0B        OUT   0x0B,PA7
  990  6106        ADDS  0x06
  991  500B        SACL  0x0B
  992  4F0B        OUT   0x0B,PA7
  993  6106        ADDS  0x06
  994  500B        SACL  0x0B
  995  4F0B        OUT   0x0B,PA7
  996  6106        ADDS  0x06
  997  500B        SACL  0x0B
  998  4F0B        OUT   0x0B,PA7
  999  6106        ADDS  0x06
  99A  500B        SACL  0x0B
  99B  4F0B        OUT   0x0B,PA7
  99C  6106        ADDS  0x06
  99D  500B        SACL  0x0B
  99E  4F0B        OUT   0x0B,PA7
  99F  6106        ADDS  0x06
  9A0  500B        SACL  0x0B
  9A1  4F0B        OUT   0x0B,PA7
  9A2  6106        ADDS  0x06
  9A3  500B        SACL  0x0B
  9A4  4F0B        OUT   0x0B,PA7
  9A5  6106        ADDS  0x06
  9A6  500B        SACL  0x0B
  9A7  4F0B        OUT   0x0B,PA7
  9A8  6106        ADDS  0x06
  9A9  500B        SACL  0x0B
  9AA  4F0B        OUT   0x0B,PA7
  9AB  6106        ADDS  0x06
  9AC  500B        SACL  0x0B
  9AD  4F0B        OUT   0x0B,PA7
  9AE  6106        ADDS  0x06
  9AF  500B        SACL  0x0B
  9B0  4F0B        OUT   0x0B,PA7
  9B1  7F80        NOP
  9B2  7F80        NOP
  9B3  7F80        NOP
  9B4  7F80        NOP
  9B5  7F80        NOP
  9B6  200B        LAC   0x0B
  9B7  FA00 0965   BLZ   L965
  9B9  7F89        ZAC
  9BA  500B        SACL  0x0B
L9BB:
  9BB  F600 09BF   BIOZ  L9BF
  9BD  F900 09BB   B     L9BB

L9BF:
  9BF  400A        IN    0x0A,PA0
  9C0  650A        ZALH  0x0A
  9C1  FD00 09C4   BGEZ  L9C4
  9C3  7F80        NOP
L9C4:
  9C4  F600 09C4   BIOZ  L9C4
L9C6:
  9C6  450A        IN    0x0A,PA5
  9C7  390A        LAR   AR1,0x0A
  9C8  4681        IN    *,PA6,AR1
  9C9  7F80        NOP
  9CA  7F80        NOP
  9CB  6527        ZALH  0x27
  9CC  610E        ADDS  0x0E
  9CD  1206        SUB   0x06,2
  9CE  5827        SACH  0x27
  9CF  500E        SACL  0x0E
  9D0  6128        ADDS  0x28
  9D1  500D        SACL  0x0D
  9D2  662B        ZALS  0x2B
  9D3  7927        AND   0x27
  9D4  5027        SACL  0x27
  9D5  2658        LAC   0x58,6
  9D6  000B        ADD   0x0B
  9D7  7F88        ABS
  9D8  6027        ADDH  0x27
  9D9  610E        ADDS  0x0E
  9DA  6128        ADDS  0x28
  9DB  580B        SACH  0x0B
  9DC  500A        SACL  0x0A
  9DD  662B        ZALS  0x2B
  9DE  790B        AND   0x0B
  9DF  4827        OUT   0x27,PA0
  9E0  7180        LARK  AR1,0x80
  9E1  4F0D        OUT   0x0D,PA7
  9E2  4CA8        OUT   *+,PA4
  9E3  4409        IN    0x09,PA4
  9E4  4CA8        OUT   *+,PA4
  9E5  4409        IN    0x09,PA4
  9E6  4CA8        OUT   *+,PA4
  9E7  4409        IN    0x09,PA4
  9E8  4CA8        OUT   *+,PA4
  9E9  500B        SACL  0x0B
  9EA  480B        OUT   0x0B,PA0
  9EB  4F0A        OUT   0x0A,PA7
  9EC  440A        IN    0x0A,PA4
  9ED  440B        IN    0x0B,PA4
  9EE  440C        IN    0x0C,PA4
  9EF  440D        IN    0x0D,PA4
  9F0  4409        IN    0x09,PA4
  9F1  6A22        LT    0x22
  9F2  2F0D        LAC   0x0D,15
  9F3  6D0D        MPY   0x0D
  9F4  7F90        SPAC
  9F5  6D09        MPY   0x09
  9F6  6C07        LTA   0x07
  9F7  5909        SACH  0x09,1
  9F8  4916        OUT   0x16,PA1
  9F9  491C        OUT   0x1C,PA1
  9FA  4924        OUT   0x24,PA1
  9FB  6D09        MPY   0x09
  9FC  7F90        SPAC
  9FD  6D16        MPY   0x16
  9FE  6C22        LTA   0x22
  9FF  5913        SACH  0x13,1
  A00  7F80        NOP
  A01  7F80        NOP
  A02  7F80        NOP
  A03  7F80        NOP
  A04  4110        IN    0x10,PA1
  A05  7F80        NOP
  A06  4118        IN    0x18,PA1
  A07  7F80        NOP
  A08  4120        IN    0x20,PA1
  A09  2F0C        LAC   0x0C,15
  A0A  6D0C        MPY   0x0C
  A0B  7F90        SPAC
  A0C  6D0D        MPY   0x0D
  A0D  6C07        LTA   0x07
  A0E  5909        SACH  0x09,1
  A0F  6D09        MPY   0x09
  A10  7F90        SPAC
  A11  6D13        MPY   0x13
  A12  6C22        LTA   0x22
  A13  5914        SACH  0x14,1
  A14  7F80        NOP
  A15  7F80        NOP
  A16  2F0B        LAC   0x0B,15
  A17  6D0B        MPY   0x0B
  A18  7F90        SPAC
  A19  6D0C        MPY   0x0C
  A1A  6C07        LTA   0x07
  A1B  5909        SACH  0x09,1
  A1C  6D09        MPY   0x09
  A1D  7F90        SPAC
  A1E  6D14        MPY   0x14
  A1F  6C22        LTA   0x22
  A20  5915        SACH  0x15,1
  A21  2F0A        LAC   0x0A,15
  A22  6D0A        MPY   0x0A
  A23  7F90        SPAC
  A24  6D0B        MPY   0x0B
  A25  6C07        LTA   0x07
  A26  5909        SACH  0x09,1
  A27  6D09        MPY   0x09
  A28  7F90        SPAC
  A29  6D15        MPY   0x15
  A2A  6C22        LTA   0x22
  A2B  5916        SACH  0x16,1
  A2C  6521        ZALH  0x21
  A2D  7F88        ABS
  A2E  6205        SUBH  0x05
  A2F  FD00 0A3B   BGEZ  LA3B
  A31  580A        SACH  0x0A
  A32  6505        ZALH  0x05
  A33  6123        ADDS  0x23
  A34  6A6D        LT    0x6D
  A35  6D0A        MPY   0x0A
  A36  7F8F        APAC
  A37  5805        SACH  0x05
  A38  5023        SACL  0x23
  A39  F900 0A45   B     LA45

LA3B:
  A3B  580A        SACH  0x0A
  A3C  6505        ZALH  0x05
  A3D  6123        ADDS  0x23
  A3E  6A6C        LT    0x6C
  A3F  6D0A        MPY   0x0A
  A40  7F8F        APAC
  A41  5805        SACH  0x05
  A42  5023        SACL  0x23
  A43  7F80        NOP
  A44  7F80        NOP
LA45:
  A45  2805        LAC   0x05,8
  A46  590A        SACH  0x0A,1
  A47  7902        AND   0x02
  A48  500B        SACL  0x0B
  A49  660A        ZALS  0x0A
  A4A  6125        ADDS  0x25
  A4B  670C        TBLR  0x0C
  A4C  6106        ADDS  0x06
  A4D  670D        TBLR  0x0D
  A4E  2F0C        LAC   0x0C,15
  A4F  6A0B        LT    0x0B
  A50  6D0C        MPY   0x0C
  A51  7F90        SPAC
  A52  6D0D        MPY   0x0D
  A53  7F8F        APAC
  A54  590A        SACH  0x0A,1
  A55  650A        ZALH  0x0A
  A56  626E        SUBH  0x6E
  A57  FC00 0A5E   BGZ   LA5E
  A59  7F80        NOP
  A5A  7F89        ZAC
  A5B  580B        SACH  0x0B
  A5C  F900 0A63   B     LA63

LA5E:
  A5E  580A        SACH  0x0A
  A5F  6A0A        LT    0x0A
  A60  6D6F        MPY   0x6F
  A61  7F8E        PAC
  A62  590B        SACH  0x0B,1
LA63:
  A63  280B        LAC   0x0B,8
  A64  0802        ADD   0x02,8
  A65  4913        OUT   0x13,PA1
  A66  491D        OUT   0x1D,PA1
  A67  4905        OUT   0x05,PA1
  A68  7F88        ABS
  A69  590A        SACH  0x0A,1
  A6A  7902        AND   0x02
  A6B  500B        SACL  0x0B
  A6C  660A        ZALS  0x0A
  A6D  6126        ADDS  0x26
  A6E  670C        TBLR  0x0C
  A6F  4111        IN    0x11,PA1
  A70  7F80        NOP
  A71  4119        IN    0x19,PA1
  A72  7F80        NOP
  A73  4121        IN    0x21,PA1
  A74  6106        ADDS  0x06
  A75  670D        TBLR  0x0D
  A76  2F0C        LAC   0x0C,15
  A77  6A0B        LT    0x0B
  A78  6D0C        MPY   0x0C
  A79  7F90        SPAC
  A7A  6D0D        MPY   0x0D
  A7B  7F8F        APAC
  A7C  5924        SACH  0x24,1
  A7D  7F80        NOP
  A7E  7F80        NOP
  A7F  7F80        NOP
  A80  6A20        LT    0x20
  A81  6D5D        MPY   0x5D
  A82  7F8E        PAC
  A83  590A        SACH  0x0A,1
  A84  7902        AND   0x02
  A85  5022        SACL  0x22
  A86  6627        ZALS  0x27
  A87  002A        ADD   0x2A
  A88  792B        AND   0x2B
  A89  500C        SACL  0x0C
  A8A  6527        ZALH  0x27
  A8B  610E        ADDS  0x0E
  A8C  6129        ADDS  0x29
  A8D  500D        SACL  0x0D
  A8E  265C        LAC   0x5C,6
  A8F  000A        ADD   0x0A
  A90  7F88        ABS
  A91  6027        ADDH  0x27
  A92  610E        ADDS  0x0E
  A93  6129        ADDS  0x29
  A94  580B        SACH  0x0B
  A95  500A        SACL  0x0A
  A96  660B        ZALS  0x0B
  A97  002A        ADD   0x2A
  A98  792B        AND   0x2B
  A99  500B        SACL  0x0B
  A9A  480C        OUT   0x0C,PA0
  A9B  7184        LARK  AR1,0x84
  A9C  4F0D        OUT   0x0D,PA7
  A9D  4CA8        OUT   *+,PA4
  A9E  4409        IN    0x09,PA4
  A9F  4CA8        OUT   *+,PA4
  AA0  4409        IN    0x09,PA4
  AA1  4CA8        OUT   *+,PA4
  AA2  4409        IN    0x09,PA4
  AA3  4CA8        OUT   *+,PA4
  AA4  7F80        NOP
  AA5  480B        OUT   0x0B,PA0
  AA6  4F0A        OUT   0x0A,PA7
  AA7  440A        IN    0x0A,PA4
  AA8  440B        IN    0x0B,PA4
  AA9  440C        IN    0x0C,PA4
  AAA  440D        IN    0x0D,PA4
  AAB  4409        IN    0x09,PA4
  AAC  6A22        LT    0x22
  AAD  2F0D        LAC   0x0D,15
  AAE  6D0D        MPY   0x0D
  AAF  7F90        SPAC
  AB0  6D09        MPY   0x09
  AB1  6C08        LTA   0x08
  AB2  5909        SACH  0x09,1
  AB3  4914        OUT   0x14,PA1
  AB4  491E        OUT   0x1E,PA1
  AB5  6D09        MPY   0x09
  AB6  7F90        SPAC
  AB7  6D1E        MPY   0x1E
  AB8  6C22        LTA   0x22
  AB9  591B        SACH  0x1B,1
  ABA  2F0C        LAC   0x0C,15
  ABB  6D0C        MPY   0x0C
  ABC  7F90        SPAC
  ABD  6D0D        MPY   0x0D
  ABE  6C08        LTA   0x08
  ABF  5909        SACH  0x09,1
  AC0  4112        IN    0x12,PA1
  AC1  7F80        NOP
  AC2  411A        IN    0x1A,PA1
  AC3  718C        LARK  AR1,0x8C
  AC4  4188        IN    *,PA1
  AC5  6D09        MPY   0x09
  AC6  7F90        SPAC
  AC7  6D1B        MPY   0x1B
  AC8  7F8F        APAC
  AC9  591C        SACH  0x1C,1
  ACA  655B        ZALH  0x5B
  ACB  6A48        LT    0x48
  ACC  718C        LARK  AR1,0x8C
  ACD  6D88        MPY   *
  ACE  7F8F        APAC
  ACF  6C22        LTA   0x22
  AD0  7F88        ABS
  AD1  5807        SACH  0x07
  AD2  7F80        NOP
  AD3  664B        ZALS  0x4B
  AD4  1206        SUB   0x06,2
  AD5  FF00 0ADA   BZ    LADA
  AD7  664B        ZALS  0x4B
  AD8  F900 0ADC   B     LADC

LADA:
  ADA  664B        ZALS  0x4B
  ADB  4B4A        OUT   0x4A,PA3
LADC:
  ADC  654A        ZALH  0x4A
  ADD  6006        ADDH  0x06
  ADE  584A        SACH  0x4A
  ADF  2F0B        LAC   0x0B,15
  AE0  6D0B        MPY   0x0B
  AE1  7F90        SPAC
  AE2  6D0C        MPY   0x0C
  AE3  6C08        LTA   0x08
  AE4  5909        SACH  0x09,1
  AE5  6D09        MPY   0x09
  AE6  7F90        SPAC
  AE7  6D1C        MPY   0x1C
  AE8  6C22        LTA   0x22
  AE9  591D        SACH  0x1D,1
  AEA  2F0A        LAC   0x0A,15
  AEB  6D0A        MPY   0x0A
  AEC  7F90        SPAC
  AED  6D0B        MPY   0x0B
  AEE  6C08        LTA   0x08
  AEF  5909        SACH  0x09,1
  AF0  6D09        MPY   0x09
  AF1  7F90        SPAC
  AF2  6D1D        MPY   0x1D
  AF3  6C22        LTA   0x22
  AF4  591E        SACH  0x1E,1
  AF5  7184        LARK  AR1,0x84
  AF6  6A5E        LT    0x5E
  AF7  651A        ZALH  0x1A
  AF8  6D1E        MPY   0x1E
  AF9  7F8F        APAC
  AFA  7F8F        APAC
  AFB  58A8        SACH  *+
  AFC  6519        ZALH  0x19
  AFD  6D1D        MPY   0x1D
  AFE  7F8F        APAC
  AFF  7F8F        APAC
  B00  58A8        SACH  *+
  B01  6518        ZALH  0x18
  B02  6D1C        MPY   0x1C
  B03  7F8F        APAC
  B04  7F8F        APAC
  B05  58A8        SACH  *+
  B06  6517        ZALH  0x17
  B07  6D1B        MPY   0x1B
  B08  7F8F        APAC
  B09  7F8F        APAC
  B0A  58A8        SACH  *+
  B0B  7180        LARK  AR1,0x80
  B0C  6A5A        LT    0x5A
  B0D  6512        ZALH  0x12
  B0E  6D16        MPY   0x16
  B0F  7F8F        APAC
  B10  7F8F        APAC
  B11  58A8        SACH  *+
LB12:
  B12  6511        ZALH  0x11
  B13  6D15        MPY   0x15
  B14  7F8F        APAC
  B15  7F8F        APAC
  B16  58A8        SACH  *+
  B17  6510        ZALH  0x10
  B18  4915        OUT   0x15,PA1
  B19  491B        OUT   0x1B,PA1
  B1A  6D14        MPY   0x14
  B1B  7F8F        APAC
  B1C  7F8F        APAC
  B1D  58A8        SACH  *+
  B1E  650F        ZALH  0x0F
  B1F  6D13        MPY   0x13
  B20  7F8F        APAC
  B21  6C49        LTA   0x49
  B22  58A8        SACH  *+
  B23  718D        LARK  AR1,0x8D
  B24  655F        ZALH  0x5F
  B25  410F        IN    0x0F,PA1
  B26  6D88        MPY   *
  B27  4117        IN    0x17,PA1
  B28  7F8F        APAC
  B29  411F        IN    0x1F,PA1
  B2A  7F8F        APAC
  B2B  7F88        ABS
  B2C  5808        SACH  0x08
  B2D  6A1F        LT    0x1F
  B2E  6D59        MPY   0x59
  B2F  7F8E        PAC
  B30  590B        SACH  0x0B,1
  B31  4188        IN    *,PA1
  B32  7902        AND   0x02
  B33  5022        SACL  0x22
  B34  F900 09C6   B     L9C6

  B36  8000        MPYK  0
  B37  C000        .word 0xC000
  B38  C800        .word 0xC800
  B39  CCAE        .word 0xCCAE
  B3A  D000        .word 0xD000
  B3B  D293        .word 0xD293
  B3C  D4AE        .word 0xD4AE
  B3D  D675        .word 0xD675
  B3E  D800        .word 0xD800
  B3F  D95C        .word 0xD95C
  B40  DA93        .word 0xDA93
  B41  DBAD        .word 0xDBAD
  B42  DCAE        .word 0xDCAE
  B43  DD9B        .word 0xDD9B
  B44  DE75        .word 0xDE75
  B45  DF41        .word 0xDF41
  B46  E000        .word 0xE000
  B47  E0B3        .word 0xE0B3
  B48  E15C        .word 0xE15C
  B49  E1FC        .word 0xE1FC
  B4A  E293        .word 0xE293
  B4B  E323        .word 0xE323
  B4C  E3AD        .word 0xE3AD
  B4D  E430        .word 0xE430
  B4E  E4AE        .word 0xE4AE
  B4F  E527        .word 0xE527
  B50  E59B        .word 0xE59B
  B51  E60A        .word 0xE60A
  B52  E675        .word 0xE675
  B53  E6DD        .word 0xE6DD
  B54  E741        .word 0xE741
  B55  E7A2        .word 0xE7A2
  B56  E800        .word 0xE800
  B57  E85B        .word 0xE85B
  B58  E8B3        .word 0xE8B3
  B59  E909        .word 0xE909
  B5A  E95C        .word 0xE95C
  B5B  E9AD        .word 0xE9AD
  B5C  E9FC        .word 0xE9FC
  B5D  EA49        .word 0xEA49
  B5E  EA93        .word 0xEA93
  B5F  EADC        .word 0xEADC
  B60  EB23        .word 0xEB23
  B61  EB69        .word 0xEB69
  B62  EBAD        .word 0xEBAD
  B63  EBEF        .word 0xEBEF
  B64  EC30        .word 0xEC30
  B65  EC70        .word 0xEC70
  B66  ECAE        .word 0xECAE
  B67  ECEB        .word 0xECEB
  B68  ED27        .word 0xED27
  B69  ED61        .word 0xED61
  B6A  ED9B        .word 0xED9B
  B6B  EDD3        .word 0xEDD3
  B6C  EE0A        .word 0xEE0A
  B6D  EE40        .word 0xEE40
  B6E  EE75        .word 0xEE75
  B6F  EEAA        .word 0xEEAA
  B70  EEDD        .word 0xEEDD
  B71  EF10        .word 0xEF10
  B72  EF41        .word 0xEF41
  B73  EF72        .word 0xEF72
  B74  EFA2        .word 0xEFA2
  B75  EFD1        .word 0xEFD1
  B76  F000        .word 0xF000
  B77  F02E        .word 0xF02E
  B78  F05B        .word 0xF05B
  B79  F087        .word 0xF087
  B7A  F0B3        .word 0xF0B3
  B7B  F0DE        .word 0xF0DE
  B7C  F109        .word 0xF109
  B7D  F133        .word 0xF133
  B7E  F15C        .word 0xF15C
  B7F  F185        .word 0xF185
  B80  F1AD        .word 0xF1AD
  B81  F1D5        .word 0xF1D5
  B82  F1FC        .word 0xF1FC
  B83  F222        .word 0xF222
  B84  F249        .word 0xF249
  B85  F26E        .word 0xF26E
  B86  F293        .word 0xF293
  B87  F2B8        .word 0xF2B8
  B88  F2DC        .word 0xF2DC
  B89  F300        .word 0xF300
  B8A  F323        .word 0xF323
  B8B  F346        .word 0xF346
  B8C  F369        .word 0xF369
  B8D  F38B        .word 0xF38B
  B8E  F3AD        .word 0xF3AD
  B8F  F3CE        .word 0xF3CE
  B90  F3EF        .word 0xF3EF
  B91  F410        .word 0xF410
  B92  F430        .word 0xF430
  B93  F450        .word 0xF450
  B94  F470        .word 0xF470
  B95  F48F        .word 0xF48F
  B96  F4AE        .word 0xF4AE
  B97  F4CD        .word 0xF4CD
  B98  F4EB        .word 0xF4EB
  B99  F509        .word 0xF509
  B9A  F527        .word 0xF527
  B9B  F544        .word 0xF544
  B9C  F561        .word 0xF561
  B9D  F57E        .word 0xF57E
  B9E  F59B        .word 0xF59B
  B9F  F5B7        .word 0xF5B7
  BA0  F5D3        .word 0xF5D3
  BA1  F5EF        .word 0xF5EF
  BA2  F60A        .word 0xF60A
  BA3  F625        .word 0xF625
  BA4  F640        .word 0xF640
  BA5  F65B        .word 0xF65B
  BA6  F675        .word 0xF675
  BA7  F690        .word 0xF690
  BA8  F6AA        .word 0xF6AA
  BA9  F6C4        .word 0xF6C4
  BAA  F6DD        .word 0xF6DD
  BAB  F6F7        .word 0xF6F7
  BAC  F710        .word 0xF710
  BAD  F729        .word 0xF729
  BAE  F741        .word 0xF741
  BAF  F75A        .word 0xF75A
  BB0  F772        .word 0xF772
  BB1  F78A        .word 0xF78A
  BB2  F7A2        .word 0xF7A2
  BB3  F7BA        .word 0xF7BA
  BB4  F7D1        .word 0xF7D1
  BB5  F7E9        .word 0xF7E9
  BB6  F800 F817   CALL  L817
  BB8  F82E        .word 0xF82E
  BB9  F844        .word 0xF844
  BBA  F85B        .word 0xF85B
  BBB  F871        .word 0xF871
  BBC  F887        .word 0xF887
  BBD  F89D        .word 0xF89D
  BBE  F8B3        .word 0xF8B3
  BBF  F8C9        .word 0xF8C9
  BC0  F8DE        .word 0xF8DE
  BC1  F8F4        .word 0xF8F4
  BC2  F909        .word 0xF909
  BC3  F91E        .word 0xF91E
  BC4  F933        .word 0xF933
  BC5  F947        .word 0xF947
  BC6  F95C        .word 0xF95C
  BC7  F970        .word 0xF970
  BC8  F985        .word 0xF985
  BC9  F999        .word 0xF999
  BCA  F9AD        .word 0xF9AD
  BCB  F9C1        .word 0xF9C1
  BCC  F9D5        .word 0xF9D5
  BCD  F9E8        .word 0xF9E8
  BCE  F9FC        .word 0xF9FC
  BCF  FA0F        .word 0xFA0F
  BD0  FA22        .word 0xFA22
  BD1  FA36        .word 0xFA36
  BD2  FA49        .word 0xFA49
  BD3  FA5B        .word 0xFA5B
  BD4  FA6E        .word 0xFA6E
  BD5  FA81        .word 0xFA81
  BD6  FA93        .word 0xFA93
  BD7  FAA6        .word 0xFAA6
  BD8  FAB8        .word 0xFAB8
  BD9  FACA        .word 0xFACA
  BDA  FADC        .word 0xFADC
  BDB  FAEE        .word 0xFAEE
  BDC  FB00 FB12   BLEZ  LB12
  BDE  FB23        .word 0xFB23
  BDF  FB35        .word 0xFB35
  BE0  FB46        .word 0xFB46
  BE1  FB58        .word 0xFB58
  BE2  FB69        .word 0xFB69
  BE3  FB7A        .word 0xFB7A
  BE4  FB8B        .word 0xFB8B
  BE5  FB9C        .word 0xFB9C
  BE6  FBAD        .word 0xFBAD
  BE7  FBBE        .word 0xFBBE
  BE8  FBCE        .word 0xFBCE
  BE9  FBDF        .word 0xFBDF
  BEA  FBEF        .word 0xFBEF
  BEB  FC00 FC10   BGZ   LC10
  BED  FC20        .word 0xFC20
  BEE  FC30        .word 0xFC30
  BEF  FC40        .word 0xFC40
  BF0  FC50        .word 0xFC50
  BF1  FC60        .word 0xFC60
  BF2  FC70        .word 0xFC70
  BF3  FC7F        .word 0xFC7F
  BF4  FC8F        .word 0xFC8F
  BF5  FC9F        .word 0xFC9F
  BF6  FCAE        .word 0xFCAE
  BF7  FCBD        .word 0xFCBD
  BF8  FCCD        .word 0xFCCD
  BF9  FCDC        .word 0xFCDC
  BFA  FCEB        .word 0xFCEB
  BFB  FCFA        .word 0xFCFA
  BFC  FD09        .word 0xFD09
  BFD  FD18        .word 0xFD18
  BFE  FD27        .word 0xFD27
  BFF  FD35        .word 0xFD35
  C00  FD44        .word 0xFD44
  C01  FD53        .word 0xFD53
  C02  FD61        .word 0xFD61
  C03  FD70        .word 0xFD70
  C04  FD7E        .word 0xFD7E
  C05  FD8C        .word 0xFD8C
  C06  FD9B        .word 0xFD9B
  C07  FDA9        .word 0xFDA9
  C08  FDB7        .word 0xFDB7
  C09  FDC5        .word 0xFDC5
  C0A  FDD3        .word 0xFDD3
  C0B  FDE1        .word 0xFDE1
  C0C  FDEF        .word 0xFDEF
  C0D  FDFC        .word 0xFDFC
  C0E  FE0A        .word 0xFE0A
  C0F  FE18        .word 0xFE18
LC10:
  C10  FE25        .word 0xFE25
  C11  FE33        .word 0xFE33
  C12  FE40        .word 0xFE40
  C13  FE4E        .word 0xFE4E
  C14  FE5B        .word 0xFE5B
  C15  FE68        .word 0xFE68
  C16  FE75        .word 0xFE75
  C17  FE83        .word 0xFE83
  C18  FE90        .word 0xFE90
  C19  FE9D        .word 0xFE9D
  C1A  FEAA        .word 0xFEAA
  C1B  FEB7        .word 0xFEB7
  C1C  FEC4        .word 0xFEC4
  C1D  FED0        .word 0xFED0
  C1E  FEDD        .word 0xFEDD
  C1F  FEEA        .word 0xFEEA
  C20  FEF7        .word 0xFEF7
  C21  FF03        .word 0xFF03
  C22  FF10        .word 0xFF10
  C23  FF1C        .word 0xFF1C
  C24  FF29        .word 0xFF29
  C25  FF35        .word 0xFF35
  C26  FF41        .word 0xFF41
  C27  FF4E        .word 0xFF4E
  C28  FF5A        .word 0xFF5A
  C29  FF66        .word 0xFF66
  C2A  FF72        .word 0xFF72
  C2B  FF7E        .word 0xFF7E
  C2C  FF8A        .word 0xFF8A
  C2D  FF96        .word 0xFF96
  C2E  FFA2        .word 0xFFA2
  C2F  FFAE        .word 0xFFAE
  C30  FFBA        .word 0xFFBA
  C31  FFC6        .word 0xFFC6
  C32  FFD1        .word 0xFFD1
  C33  FFDD        .word 0xFFDD
  C34  FFE9        .word 0xFFE9
  C35  FFF4        .word 0xFFF4
  C36  0000        ADD   0x00
  C37  0000        ADD   0x00
  C38  0001        ADD   0x01
  C39  0001        ADD   0x01
  C3A  0001        ADD   0x01
  C3B  0001        ADD   0x01
  C3C  0001        ADD   0x01
  C3D  0001        ADD   0x01
  C3E  0001        ADD   0x01
  C3F  0001        ADD   0x01
  C40  0001        ADD   0x01
  C41  0001        ADD   0x01
  C42  0001        ADD   0x01
  C43  0001        ADD   0x01
  C44  0001        ADD   0x01
  C45  0001        ADD   0x01
  C46  0001        ADD   0x01
  C47  0001        ADD   0x01
  C48  0001        ADD   0x01
  C49  0001        ADD   0x01
  C4A  0001        ADD   0x01
  C4B  0001        ADD   0x01
  C4C  0001        ADD   0x01
  C4D  0001        ADD   0x01
  C4E  0001        ADD   0x01
  C4F  0001        ADD   0x01
  C50  0001        ADD   0x01
  C51  0002        ADD   0x02
  C52  0002        ADD   0x02
  C53  0002        ADD   0x02
  C54  0002        ADD   0x02
  C55  0002        ADD   0x02
  C56  0002        ADD   0x02
  C57  0002        ADD   0x02
  C58  0002        ADD   0x02
  C59  0002        ADD   0x02
  C5A  0002        ADD   0x02
  C5B  0002        ADD   0x02
  C5C  0002        ADD   0x02
  C5D  0003        ADD   0x03
  C5E  0003        ADD   0x03
  C5F  0003        ADD   0x03
  C60  0003        ADD   0x03
  C61  0003        ADD   0x03
  C62  0003        ADD   0x03
  C63  0003        ADD   0x03
  C64  0004        ADD   0x04
  C65  0004        ADD   0x04
  C66  0004        ADD   0x04
  C67  0004        ADD   0x04
  C68  0004        ADD   0x04
  C69  0004        ADD   0x04
  C6A  0005        ADD   0x05
  C6B  0005        ADD   0x05
  C6C  0005        ADD   0x05
  C6D  0005        ADD   0x05
  C6E  0005        ADD   0x05
  C6F  0006        ADD   0x06
  C70  0006        ADD   0x06
  C71  0006        ADD   0x06
  C72  0006        ADD   0x06
  C73  0007        ADD   0x07
  C74  0007        ADD   0x07
  C75  0007        ADD   0x07
  C76  0008        ADD   0x08
  C77  0008        ADD   0x08
  C78  0008        ADD   0x08
  C79  0009        ADD   0x09
  C7A  0009        ADD   0x09
  C7B  000A        ADD   0x0A
  C7C  000A        ADD   0x0A
  C7D  000A        ADD   0x0A
  C7E  000B        ADD   0x0B
  C7F  000B        ADD   0x0B
  C80  000C        ADD   0x0C
  C81  000C        ADD   0x0C
  C82  000D        ADD   0x0D
  C83  000D        ADD   0x0D
  C84  000E        ADD   0x0E
  C85  000F        ADD   0x0F
  C86  000F        ADD   0x0F
  C87  0010        ADD   0x10
  C88  0011        ADD   0x11
  C89  0011        ADD   0x11
  C8A  0012        ADD   0x12
  C8B  0013        ADD   0x13
  C8C  0014        ADD   0x14
  C8D  0015        ADD   0x15
  C8E  0016        ADD   0x16
  C8F  0017        ADD   0x17
  C90  0018        ADD   0x18
  C91  0019        ADD   0x19
  C92  001A        ADD   0x1A
  C93  001B        ADD   0x1B
  C94  001C        ADD   0x1C
  C95  001D        ADD   0x1D
  C96  001F        ADD   0x1F
  C97  0020        ADD   0x20
  C98  0021        ADD   0x21
  C99  0023        ADD   0x23
  C9A  0024        ADD   0x24
  C9B  0026        ADD   0x26
  C9C  0028        ADD   0x28
  C9D  0029        ADD   0x29
  C9E  002B        ADD   0x2B
  C9F  002D        ADD   0x2D
  CA0  002F        ADD   0x2F
  CA1  0031        ADD   0x31
  CA2  0034        ADD   0x34
  CA3  0036        ADD   0x36
  CA4  0038        ADD   0x38
  CA5  003B        ADD   0x3B
  CA6  003D        ADD   0x3D
  CA7  0040        ADD   0x40
  CA8  0043        ADD   0x43
  CA9  0046        ADD   0x46
  CAA  0049        ADD   0x49
  CAB  004C        ADD   0x4C
  CAC  004F        ADD   0x4F
  CAD  0053        ADD   0x53
  CAE  0057        ADD   0x57
  CAF  005B        ADD   0x5B
  CB0  005F        ADD   0x5F
  CB1  0063        ADD   0x63
  CB2  0067        ADD   0x67
  CB3  006C        ADD   0x6C
  CB4  0070        ADD   0x70
  CB5  0075        ADD   0x75
  CB6  007B        ADD   0x7B
  CB7  0080        ADD   *,0,AR0
  CB8  0086        ADD   *,0,AR0
  CB9  008C        ADD   *
  CBA  0092        ADD   *-,0,AR0
  CBB  0098        ADD   *-
  CBC  009F        ADD   *-
  CBD  00A6        ADD   *+,0,AR0
  CBE  00AD        ADD   *+
  CBF  00B5        ADD   *+-,0,AR1
  CC0  00BD        ADD   *+-
  CC1  00C5        ADD   *,0,AR1
  CC2  00CE        ADD   *
  CC3  00D7        ADD   *-,0,AR1
  CC4  00E1        ADD   *+,0,AR1
  CC5  00EB        ADD   *+
  CC6  00F5        ADD   *+-,0,AR1
  CC7  0100        ADD   0x00,1
  CC8  010B        ADD   0x0B,1
  CC9  0117        ADD   0x17,1
  CCA  0124        ADD   0x24,1
  CCB  0130        ADD   0x30,1
  CCC  013E        ADD   0x3E,1
  CCD  014C        ADD   0x4C,1
  CCE  015B        ADD   0x5B,1
  CCF  016A        ADD   0x6A,1
  CD0  017A        ADD   0x7A,1
  CD1  018B        ADD   *,1
  CD2  019C        ADD   *-,1
  CD3  01AF        ADD   *+,1
  CD4  01C2        ADD   *,1,AR0
  CD5  01D5        ADD   *-,1,AR1
  CD6  01EA        ADD   *+,1
  CD7  0200        ADD   0x00,2
  CD8  0217        ADD   0x17,2
  CD9  022E        ADD   0x2E,2
  CDA  0247        ADD   0x47,2
  CDB  0261        ADD   0x61,2
  CDC  027C        ADD   0x7C,2
  CDD  0298        ADD   *-,2
  CDE  02B5        ADD   *+-,2,AR1
  CDF  02D4        ADD   *-,2,AR0
  CE0  02F4        ADD   *+-,2,AR0
  CE1  0316        ADD   0x16,3
  CE2  0339        ADD   0x39,3
  CE3  035D        ADD   0x5D,3
  CE4  0383        ADD   *,3,AR1
  CE5  03AB        ADD   *+,3
  CE6  03D5        ADD   *-,3,AR1
  CE7  0400        ADD   0x00,4
  CE8  042D        ADD   0x2D,4
  CE9  045D        ADD   0x5D,4
  CEA  048E        ADD   *,4
  CEB  04C2        ADD   *,4,AR0
  CEC  04F8        ADD   *+-,4
  CED  0530        ADD   0x30,5
  CEE  056B        ADD   0x6B,5
  CEF  05A8        ADD   *+,5
  CF0  05E8        ADD   *+,5
  CF1  062B        ADD   0x2B,6
  CF2  0671        ADD   0x71,6
  CF3  06BA        ADD   *+-,6
  CF4  0706        ADD   0x06,7
  CF5  0756        ADD   0x56,7
  CF6  07A9        ADD   *+,7
  CF7  0800        ADD   0x00,8
  CF8  085B        ADD   0x5B,8
  CF9  08B9        ADD   *+-,8
  CFA  091C        ADD   0x1C,9
  CFB  0983        ADD   *,9,AR1
  CFC  09EF        ADD   *+,9
  CFD  0A60        ADD   0x60,10
  CFE  0AD5        ADD   *-,10,AR1
  CFF  0B50        ADD   0x50,11
  D00  0BD0        ADD   *-,11,AR0
  D01  0C56        ADD   0x56,12
  D02  0CE2        ADD   *+,12,AR0
  D03  0D74        ADD   0x74,13
  D04  0E0D        ADD   0x0D,14
  D05  0EAC        ADD   *+,14
  D06  0F52        ADD   0x52,15
  D07  1000        SUB   0x00
  D08  10B5        SUB   *+-,0,AR1
  D09  1173        SUB   0x73,1
  D0A  1238        SUB   0x38,2
  D0B  1307        SUB   0x07,3
  D0C  13DE        SUB   *-,3
  D0D  14C0        SUB   *,4,AR0
  D0E  15AB        SUB   *+,5
  D0F  16A0        SUB   *+,6,AR0
  D10  17A1        SUB   *+,7,AR1
  D11  18AD        SUB   *+,8
  D12  19C4        SUB   *,9,AR0
  D13  1AE8        SUB   *+,10
  D14  1C19        SUB   0x19,12
  D15  1D58        SUB   0x58,13
  D16  1EA4        SUB   *+,14,AR0
  D17  2000        LAC   0x00
  D18  216A        LAC   0x6A,1
  D19  22E5        LAC   *+,2,AR1
  D1A  2471        LAC   0x71,4
  D1B  260E        LAC   0x0E,6
  D1C  27BD        LAC   *+-,7
  D1D  297F        LAC   0x7F,9
  D1E  2B56        LAC   0x56,11
  D1F  2D41        LAC   0x41,13
  D20  2F42        LAC   0x42,15
  D21  3159        SAR   AR1,0x59
  D22  3389        .word 0x3389
  D23  35D1        .word 0x35D1
  D24  3833        LAR   AR0,0x33
  D25  3AB0        .word 0x3AB0
  D26  3D49        .word 0x3D49
  D27  4000        IN    0x00,PA0
  D28  42D5        IN    *-,PA2,AR1
  D29  45CA        IN    *,PA5
  D2A  48E1        OUT   *+,PA0,AR1
  D2B  4C1B        OUT   0x1B,PA4
  D2C  4F7A        OUT   0x7A,PA7
  D2D  52FF        SACL  *+-
  D2E  56AB        SACL  *+
  D2F  5A82        SACH  *,2,AR0
  D30  5E84        SACH  *,6,AR0
  D31  62B3        SUBH  *+-,AR1
  D32  6711        TBLR  0x11
  D33  6BA2        LTD   *+,AR0
  D34  7066        LARK  AR0,0x66
  D35  755F        .word 0x755F
  D36  7A92        OR    *-,AR0
  D37  7FFF        .word 0x7FFF
