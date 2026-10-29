; Eventide h3500 DSP microcode
; key 7A12  algorithm 7A (mod factory|one)  DSP 3
; source H3000-Upgrade_ROM3.BIN offset 05074, 1438 program words loaded at 800
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
  80C  500A        SACL  0x0A
  80D  2A0A        LAC   0x0A,10
  80E  500C        SACL  0x0C
  80F  2F0A        LAC   0x0A,15
  810  5003        SACL  0x03
  811  7F89        ZAC
  812  5001        SACL  0x01
  813  100A        SUB   0x0A
  814  580B        SACH  0x0B
  815  7EFF        LACK  0xFF
  816  500D        SACL  0x0D
  817  270D        LAC   0x0D,7
  818  7A0D        OR    0x0D
  819  5002        SACL  0x02
  81A  7E3F        LACK  0x3F
  81B  5025        SACL  0x25
  81C  7E40        LACK  0x40
  81D  5027        SACL  0x27
  81E  6A0A        LT    0x0A
  81F  8C18        MPYK  3096
  820  7F8E        PAC
  821  5026        SACL  0x26
  822  280A        LAC   0x0A,8
  823  502B        SACL  0x2B
  824  502F        SACL  0x2F
L825:
  825  F600 0829   BIOZ  L829
  827  F900 0825   B     L825

L829:
  829  400D        IN    0x0D,PA0
  82A  650D        ZALH  0x0D
  82B  FD00 082E   BGEZ  L82E
  82D  7F80        NOP
L82E:
  82E  F600 082E   BIOZ  L82E
  830  7F80        NOP
  831  7F80        NOP
  832  7F80        NOP
  833  7F80        NOP
  834  7F80        NOP
  835  7F80        NOP
  836  7F80        NOP
  837  7F80        NOP
  838  7F80        NOP
  839  7F80        NOP
  83A  7F80        NOP
  83B  7F80        NOP
  83C  7F80        NOP
  83D  7F80        NOP
  83E  7F80        NOP
  83F  7F80        NOP
  840  7F80        NOP
  841  7F80        NOP
  842  7F80        NOP
  843  7F80        NOP
  844  7F80        NOP
  845  7F80        NOP
  846  7F80        NOP
  847  7F80        NOP
  848  7F80        NOP
  849  7F80        NOP
  84A  7F80        NOP
  84B  7F80        NOP
  84C  7F80        NOP
  84D  7F80        NOP
  84E  7F80        NOP
  84F  7F80        NOP
  850  7F80        NOP
  851  7F80        NOP
  852  7F80        NOP
  853  7F80        NOP
  854  7F80        NOP
  855  7F80        NOP
  856  7F80        NOP
  857  7F80        NOP
  858  7F80        NOP
  859  7F80        NOP
  85A  7F80        NOP
  85B  7F80        NOP
  85C  7F80        NOP
  85D  7F80        NOP
  85E  7F80        NOP
  85F  7F80        NOP
  860  7F80        NOP
  861  7F80        NOP
  862  7F80        NOP
  863  7F80        NOP
  864  7F80        NOP
  865  7F80        NOP
  866  7F80        NOP
  867  7F80        NOP
  868  7F80        NOP
  869  7F80        NOP
  86A  7F80        NOP
  86B  7F80        NOP
  86C  7F80        NOP
  86D  7F80        NOP
  86E  7F80        NOP
  86F  7F80        NOP
  870  7F80        NOP
  871  7F80        NOP
  872  7F80        NOP
  873  7F80        NOP
  874  7F80        NOP
  875  7F80        NOP
  876  7F80        NOP
  877  7F80        NOP
  878  7F80        NOP
  879  7F80        NOP
  87A  7F80        NOP
  87B  7F80        NOP
  87C  7F80        NOP
  87D  7F80        NOP
  87E  7F80        NOP
  87F  7F89        ZAC
  880  5010        SACL  0x10
L881:
  881  F600 0885   BIOZ  L885
  883  F900 0881   B     L881

L885:
  885  400D        IN    0x0D,PA0
  886  650D        ZALH  0x0D
  887  FD00 088A   BGEZ  L88A
  889  7F80        NOP
L88A:
  88A  F600 088A   BIOZ  L88A
L88C:
  88C  450D        IN    0x0D,PA5
  88D  6881        LARP  1
  88E  660D        ZALS  0x0D
  88F  790C        AND   0x0C
  890  FE00 0895   BNZ   L895
  892  6880        LARP  0
  893  F900 0897   B     L897

L895:
  895  390D        LAR   AR1,0x0D
  896  4680        IN    *,PA6,AR0
L897:
  897  7E15        LACK  0x15
  898  6110        ADDS  0x10
  899  5010        SACL  0x10
  89A  4C01        OUT   0x01,PA4
  89B  4C01        OUT   0x01,PA4
  89C  4C01        OUT   0x01,PA4
  89D  4C01        OUT   0x01,PA4
  89E  4C01        OUT   0x01,PA4
  89F  4C01        OUT   0x01,PA4
  8A0  4C01        OUT   0x01,PA4
  8A1  4C01        OUT   0x01,PA4
  8A2  4C01        OUT   0x01,PA4
  8A3  4C01        OUT   0x01,PA4
  8A4  4C01        OUT   0x01,PA4
  8A5  4C01        OUT   0x01,PA4
  8A6  4C01        OUT   0x01,PA4
  8A7  4C01        OUT   0x01,PA4
  8A8  4C01        OUT   0x01,PA4
  8A9  4C01        OUT   0x01,PA4
  8AA  4C01        OUT   0x01,PA4
  8AB  4C01        OUT   0x01,PA4
  8AC  4C01        OUT   0x01,PA4
  8AD  4C01        OUT   0x01,PA4
  8AE  4C01        OUT   0x01,PA4
  8AF  4C01        OUT   0x01,PA4
  8B0  4C01        OUT   0x01,PA4
  8B1  4C01        OUT   0x01,PA4
  8B2  4C01        OUT   0x01,PA4
  8B3  4C01        OUT   0x01,PA4
  8B4  4C01        OUT   0x01,PA4
  8B5  4C01        OUT   0x01,PA4
  8B6  4C01        OUT   0x01,PA4
  8B7  4C01        OUT   0x01,PA4
  8B8  4C01        OUT   0x01,PA4
  8B9  4C01        OUT   0x01,PA4
  8BA  4C01        OUT   0x01,PA4
  8BB  4C01        OUT   0x01,PA4
  8BC  4C01        OUT   0x01,PA4
  8BD  4C01        OUT   0x01,PA4
  8BE  4C01        OUT   0x01,PA4
  8BF  4C01        OUT   0x01,PA4
  8C0  4C01        OUT   0x01,PA4
  8C1  4C01        OUT   0x01,PA4
  8C2  4C01        OUT   0x01,PA4
  8C3  4C01        OUT   0x01,PA4
  8C4  7F80        NOP
  8C5  7F80        NOP
  8C6  7F80        NOP
  8C7  7F80        NOP
  8C8  2010        LAC   0x10
  8C9  FC00 088C   BGZ   L88C
  8CB  7F80        NOP
  8CC  7F80        NOP
  8CD  7F89        ZAC
  8CE  5010        SACL  0x10
L8CF:
  8CF  F600 08D3   BIOZ  L8D3
  8D1  F900 08CF   B     L8CF

L8D3:
  8D3  400D        IN    0x0D,PA0
  8D4  650D        ZALH  0x0D
  8D5  FD00 08D8   BGEZ  L8D8
  8D7  7F80        NOP
L8D8:
  8D8  F600 08D8   BIOZ  L8D8
L8DA:
  8DA  450D        IN    0x0D,PA5
  8DB  6881        LARP  1
  8DC  660D        ZALS  0x0D
  8DD  790C        AND   0x0C
  8DE  FE00 08E3   BNZ   L8E3
  8E0  6880        LARP  0
  8E1  F900 08E5   B     L8E5

L8E3:
  8E3  390D        LAR   AR1,0x0D
  8E4  4680        IN    *,PA6,AR0
L8E5:
  8E5  7E15        LACK  0x15
  8E6  6110        ADDS  0x10
  8E7  5010        SACL  0x10
  8E8  4C01        OUT   0x01,PA4
  8E9  4C01        OUT   0x01,PA4
  8EA  4C01        OUT   0x01,PA4
  8EB  4C01        OUT   0x01,PA4
  8EC  4C01        OUT   0x01,PA4
  8ED  4C01        OUT   0x01,PA4
  8EE  4C01        OUT   0x01,PA4
  8EF  4C01        OUT   0x01,PA4
  8F0  4C01        OUT   0x01,PA4
  8F1  4C01        OUT   0x01,PA4
  8F2  4C01        OUT   0x01,PA4
  8F3  4C01        OUT   0x01,PA4
  8F4  4C01        OUT   0x01,PA4
  8F5  4C01        OUT   0x01,PA4
  8F6  4C01        OUT   0x01,PA4
  8F7  4C01        OUT   0x01,PA4
  8F8  4C01        OUT   0x01,PA4
  8F9  4C01        OUT   0x01,PA4
  8FA  4C01        OUT   0x01,PA4
  8FB  4C01        OUT   0x01,PA4
  8FC  4C01        OUT   0x01,PA4
  8FD  4C01        OUT   0x01,PA4
  8FE  4C01        OUT   0x01,PA4
  8FF  4C01        OUT   0x01,PA4
  900  4C01        OUT   0x01,PA4
  901  4C01        OUT   0x01,PA4
  902  4C01        OUT   0x01,PA4
  903  4C01        OUT   0x01,PA4
  904  4C01        OUT   0x01,PA4
  905  4C01        OUT   0x01,PA4
  906  4C01        OUT   0x01,PA4
  907  4C01        OUT   0x01,PA4
  908  4C01        OUT   0x01,PA4
  909  4C01        OUT   0x01,PA4
  90A  4C01        OUT   0x01,PA4
  90B  4C01        OUT   0x01,PA4
  90C  4C01        OUT   0x01,PA4
  90D  4C01        OUT   0x01,PA4
  90E  4C01        OUT   0x01,PA4
  90F  4C01        OUT   0x01,PA4
  910  4C01        OUT   0x01,PA4
  911  4C01        OUT   0x01,PA4
  912  7F80        NOP
  913  7F80        NOP
  914  7F80        NOP
  915  7F80        NOP
  916  2010        LAC   0x10
  917  FC00 08DA   BGZ   L8DA
L919:
  919  F600 091D   BIOZ  L91D
  91B  F900 0919   B     L919

L91D:
  91D  400D        IN    0x0D,PA0
  91E  650D        ZALH  0x0D
  91F  FD00 0922   BGEZ  L922
  921  7F80        NOP
L922:
  922  F600 0922   BIOZ  L922
L924:
  924  450D        IN    0x0D,PA5
  925  390D        LAR   AR1,0x0D
  926  4681        IN    *,PA6,AR1
  927  6560        ZALH  0x60
  928  6A1F        LT    0x1F
  929  6D62        MPY   0x62
  92A  7F8F        APAC
  92B  7F8F        APAC
  92C  7F88        ABS
  92D  5818        SACH  0x18
  92E  6515        ZALH  0x15
  92F  6A18        LT    0x18
  930  6D16        MPY   0x16
  931  6C16        LTA   0x16
  932  7F8F        APAC
  933  5815        SACH  0x15
  934  651D        ZALH  0x1D
  935  6D61        MPY   0x61
  936  7F8F        APAC
  937  6C18        LTA   0x18
  938  6215        SUBH  0x15
  939  5817        SACH  0x17
  93A  6D17        MPY   0x17
  93B  7F8E        PAC
  93C  6C1C        LTA   0x1C
  93D  6016        ADDH  0x16
  93E  5816        SACH  0x16
  93F  6519        ZALH  0x19
  940  6D1A        MPY   0x1A
  941  6C1A        LTA   0x1A
  942  7F8F        APAC
  943  5819        SACH  0x19
  944  651E        ZALH  0x1E
  945  6D65        MPY   0x65
  946  7F8F        APAC
  947  6C1C        LTA   0x1C
  948  6219        SUBH  0x19
  949  581B        SACH  0x1B
  94A  6D1B        MPY   0x1B
  94B  7F8E        PAC
  94C  7F8F        APAC
  94D  601A        ADDH  0x1A
  94E  581A        SACH  0x1A
  94F  7F80        NOP
  950  664F        ZALS  0x4F
  951  100A        SUB   0x0A
  952  FF00 0956   BZ    L956
  954  F900 0957   B     L957

L956:
  956  4B7C        OUT   0x7C,PA3
L957:
  957  7F80        NOP
  958  657A        ZALH  0x7A
  959  6206        SUBH  0x06
  95A  FC00 0968   BGZ   L968
  95C  FA00 0978   BLZ   L978
  95E  7F80        NOP
  95F  7F80        NOP
  960  7F80        NOP
  961  7F80        NOP
  962  7F80        NOP
  963  7F80        NOP
  964  7F80        NOP
  965  7F80        NOP
  966  F900 0984   B     L984

L968:
  968  6506        ZALH  0x06
  969  6107        ADDS  0x07
  96A  087B        ADD   0x7B,8
  96B  5806        SACH  0x06
  96C  5007        SACL  0x07
  96D  627A        SUBH  0x7A
  96E  FC00 0974   BGZ   L974
  970  7F80        NOP
  971  7F80        NOP
  972  F900 0984   B     L984

L974:
  974  657A        ZALH  0x7A
  975  5806        SACH  0x06
  976  F900 0984   B     L984

L978:
  978  6506        ZALH  0x06
  979  6107        ADDS  0x07
  97A  187B        SUB   0x7B,8
  97B  5806        SACH  0x06
  97C  5007        SACL  0x07
  97D  627A        SUBH  0x7A
  97E  FA00 0982   BLZ   L982
  980  F900 0984   B     L984

L982:
  982  657A        ZALH  0x7A
  983  5806        SACH  0x06
L984:
  984  657C        ZALH  0x7C
  985  600A        ADDH  0x0A
  986  587C        SACH  0x7C
  987  3963        LAR   AR1,0x63
  988  3867        LAR   AR0,0x67
  989  4980        OUT   *,PA1,AR0
  98A  4981        OUT   *,PA1,AR1
  98B  4906        OUT   0x06,PA1
  98C  652E        ZALH  0x2E
  98D  1F79        SUB   0x79,15
  98E  FA00 0992   BLZ   L992
  990  F900 0994   B     L994

L992:
  992  6579        ZALH  0x79
  993  580F        SACH  0x0F
L994:
  994  7F80        NOP
  995  7F80        NOP
  996  7F80        NOP
  997  7F80        NOP
  998  7F80        NOP
  999  7F80        NOP
  99A  411D        IN    0x1D,PA1
  99B  7F80        NOP
  99C  411E        IN    0x1E,PA1
  99D  7F80        NOP
  99E  4120        IN    0x20,PA1
  99F  7F80        NOP
  9A0  7F80        NOP
  9A1  F900 09A3   B     L9A3

L9A3:
  9A3  6564        ZALH  0x64
  9A4  6A20        LT    0x20
  9A5  6D66        MPY   0x66
  9A6  7F8F        APAC
  9A7  7F8F        APAC
  9A8  7F88        ABS
  9A9  581C        SACH  0x1C
  9AA  6515        ZALH  0x15
  9AB  6A18        LT    0x18
  9AC  6D16        MPY   0x16
  9AD  6C16        LTA   0x16
  9AE  7F8F        APAC
  9AF  5815        SACH  0x15
  9B0  651D        ZALH  0x1D
  9B1  6D61        MPY   0x61
  9B2  7F8F        APAC
  9B3  6C18        LTA   0x18
  9B4  6215        SUBH  0x15
  9B5  5817        SACH  0x17
  9B6  6D17        MPY   0x17
  9B7  7F8E        PAC
  9B8  6C1C        LTA   0x1C
  9B9  6016        ADDH  0x16
  9BA  5816        SACH  0x16
  9BB  6519        ZALH  0x19
  9BC  6D1A        MPY   0x1A
  9BD  6C1A        LTA   0x1A
  9BE  7F8F        APAC
  9BF  5819        SACH  0x19
  9C0  651E        ZALH  0x1E
  9C1  6D65        MPY   0x65
  9C2  7F8F        APAC
  9C3  6C1C        LTA   0x1C
  9C4  6219        SUBH  0x19
  9C5  581B        SACH  0x1B
  9C6  6D1B        MPY   0x1B
  9C7  7F8E        PAC
  9C8  7F8F        APAC
  9C9  601A        ADDH  0x1A
  9CA  581A        SACH  0x1A
  9CB  664F        ZALS  0x4F
  9CC  120A        SUB   0x0A,2
  9CD  FF00 09D2   BZ    L9D2
  9CF  664F        ZALS  0x4F
  9D0  F900 09D4   B     L9D4

L9D2:
  9D2  664F        ZALS  0x4F
  9D3  4B4C        OUT   0x4C,PA3
L9D4:
  9D4  110A        SUB   0x0A,1
  9D5  FF00 09D9   BZ    L9D9
  9D7  F900 09DA   B     L9DA

L9D9:
  9D9  4B7F        OUT   0x7F,PA3
L9DA:
  9DA  7F80        NOP
  9DB  657D        ZALH  0x7D
  9DC  6208        SUBH  0x08
  9DD  FC00 09EB   BGZ   L9EB
  9DF  FA00 09FB   BLZ   L9FB
  9E1  7F80        NOP
  9E2  7F80        NOP
  9E3  7F80        NOP
  9E4  7F80        NOP
  9E5  7F80        NOP
  9E6  7F80        NOP
  9E7  7F80        NOP
  9E8  7F80        NOP
  9E9  F900 0A07   B     LA07

L9EB:
  9EB  6508        ZALH  0x08
  9EC  6109        ADDS  0x09
  9ED  087E        ADD   0x7E,8
  9EE  5808        SACH  0x08
  9EF  5009        SACL  0x09
  9F0  627D        SUBH  0x7D
  9F1  FC00 09F7   BGZ   L9F7
  9F3  7F80        NOP
  9F4  7F80        NOP
  9F5  F900 0A07   B     LA07

L9F7:
  9F7  657D        ZALH  0x7D
  9F8  5808        SACH  0x08
  9F9  F900 0A07   B     LA07

L9FB:
  9FB  6508        ZALH  0x08
  9FC  6109        ADDS  0x09
  9FD  187E        SUB   0x7E,8
  9FE  5808        SACH  0x08
  9FF  5009        SACL  0x09
  A00  627D        SUBH  0x7D
  A01  FA00 0A05   BLZ   LA05
  A03  F900 0A07   B     LA07

LA05:
  A05  657D        ZALH  0x7D
  A06  5808        SACH  0x08
LA07:
  A07  657F        ZALH  0x7F
  A08  600A        ADDH  0x0A
  A09  587F        SACH  0x7F
  A0A  3963        LAR   AR1,0x63
  A0B  3867        LAR   AR0,0x67
  A0C  4980        OUT   *,PA1,AR0
  A0D  4981        OUT   *,PA1,AR1
  A0E  4908        OUT   0x08,PA1
  A0F  654C        ZALH  0x4C
  A10  600A        ADDH  0x0A
  A11  584C        SACH  0x4C
  A12  7F80        NOP
  A13  7F80        NOP
  A14  7F80        NOP
  A15  7F80        NOP
  A16  7F80        NOP
  A17  7F80        NOP
  A18  7F80        NOP
  A19  7F80        NOP
  A1A  7F80        NOP
  A1B  411D        IN    0x1D,PA1
  A1C  7F80        NOP
  A1D  411E        IN    0x1E,PA1
  A1E  7F80        NOP
  A1F  4121        IN    0x21,PA1
  A20  7F80        NOP
  A21  7F80        NOP
  A22  F900 0A24   B     LA24

LA24:
  A24  6515        ZALH  0x15
  A25  6A18        LT    0x18
  A26  6D16        MPY   0x16
  A27  6C16        LTA   0x16
  A28  7F8F        APAC
  A29  5815        SACH  0x15
  A2A  651D        ZALH  0x1D
  A2B  6D61        MPY   0x61
  A2C  7F8F        APAC
  A2D  6C18        LTA   0x18
  A2E  6215        SUBH  0x15
  A2F  5817        SACH  0x17
  A30  6D17        MPY   0x17
  A31  7F8E        PAC
  A32  6C1C        LTA   0x1C
  A33  6016        ADDH  0x16
  A34  5816        SACH  0x16
  A35  6519        ZALH  0x19
  A36  6D1A        MPY   0x1A
  A37  6C1A        LTA   0x1A
  A38  7F8F        APAC
  A39  5819        SACH  0x19
  A3A  651E        ZALH  0x1E
  A3B  6D65        MPY   0x65
  A3C  7F8F        APAC
  A3D  6C1C        LTA   0x1C
  A3E  6219        SUBH  0x19
  A3F  581B        SACH  0x1B
  A40  6D1B        MPY   0x1B
  A41  7F8E        PAC
  A42  7F8F        APAC
  A43  601A        ADDH  0x1A
  A44  581A        SACH  0x1A
  A45  6673        ZALS  0x73
  A46  FE00 0A4A   BNZ   LA4A
  A48  F900 0AD2   B     LAD2

LA4A:
  A4A  652A        ZALH  0x2A
  A4B  620E        SUBH  0x0E
  A4C  FC00 0A8C   BGZ   LA8C
  A4E  6528        ZALH  0x28
  A4F  FF00 0A57   BZ    LA57
  A51  620A        SUBH  0x0A
  A52  FF00 0A74   BZ    LA74
  A54  620A        SUBH  0x0A
  A55  FF00 0ABB   BZ    LABB
LA57:
  A57  2F11        LAC   0x11,15
  A58  6112        ADDS  0x12
  A59  0470        ADD   0x70,4
  A5A  5911        SACH  0x11,1
  A5B  7902        AND   0x02
  A5C  5012        SACL  0x12
  A5D  6611        ZALS  0x11
  A5E  6325        SUBS  0x25
  A5F  FD00 0A63   BGEZ  LA63
  A61  F900 0AF0   B     LAF0

LA63:
  A63  6625        ZALS  0x25
  A64  5011        SACL  0x11
  A65  6126        ADDS  0x26
  A66  6171        ADDS  0x71
  A67  6723        TBLR  0x23
  A68  6523        ZALH  0x23
  A69  5804        SACH  0x04
  A6A  7E02        LACK  0x02
  A6B  5028        SACL  0x28
  A6C  7F80        NOP
  A6D  7F80        NOP
  A6E  7F80        NOP
  A6F  7F80        NOP
  A70  7F80        NOP
  A71  7F80        NOP
  A72  F900 0AFD   B     LAFD

LA74:
  A74  2F11        LAC   0x11,15
  A75  6112        ADDS  0x12
  A76  1470        SUB   0x70,4
  A77  5911        SACH  0x11,1
  A78  7902        AND   0x02
  A79  5012        SACL  0x12
  A7A  6611        ZALS  0x11
  A7B  FC00 0AF0   BGZ   LAF0
  A7D  7F89        ZAC
  A7E  5011        SACL  0x11
  A7F  6126        ADDS  0x26
  A80  6171        ADDS  0x71
  A81  6723        TBLR  0x23
  A82  6523        ZALH  0x23
  A83  5804        SACH  0x04
  A84  7E02        LACK  0x02
  A85  5028        SACL  0x28
  A86  7F80        NOP
  A87  7F80        NOP
  A88  7F80        NOP
  A89  7F80        NOP
  A8A  F900 0AFD   B     LAFD

LA8C:
  A8C  6673        ZALS  0x73
  A8D  630A        SUBS  0x0A
  A8E  FB00 0A9F   BLEZ  LA9F
  A90  6629        ZALS  0x29
  A91  FF00 0A99   BZ    LA99
  A93  7E00        LACK  0x00
  A94  5028        SACL  0x28
  A95  5029        SACL  0x29
  A96  7F80        NOP
  A97  F900 0AA8   B     LAA8

LA99:
  A99  7E01        LACK  0x01
  A9A  5028        SACL  0x28
  A9B  5029        SACL  0x29
  A9C  7F80        NOP
  A9D  F900 0AA8   B     LAA8

LA9F:
  A9F  7F89        ZAC
  AA0  5028        SACL  0x28
  AA1  5011        SACL  0x11
  AA2  5012        SACL  0x12
  AA3  7F80        NOP
  AA4  7F80        NOP
  AA5  7F80        NOP
  AA6  7F80        NOP
  AA7  7F80        NOP
LAA8:
  AA8  6502        ZALH  0x02
  AA9  580E        SACH  0x0E
  AAA  7F80        NOP
  AAB  7F80        NOP
  AAC  7F80        NOP
  AAD  7F80        NOP
  AAE  7F80        NOP
  AAF  7F80        NOP
  AB0  7F80        NOP
  AB1  7F80        NOP
  AB2  7F80        NOP
  AB3  7F80        NOP
  AB4  7F80        NOP
  AB5  7F80        NOP
  AB6  7F80        NOP
  AB7  7F80        NOP
  AB8  7F80        NOP
  AB9  F900 0AFD   B     LAFD

LABB:
  ABB  7F80        NOP
  ABC  7F80        NOP
  ABD  7F80        NOP
  ABE  7F80        NOP
  ABF  7F80        NOP
  AC0  7F80        NOP
  AC1  7F80        NOP
  AC2  7F80        NOP
  AC3  7F80        NOP
  AC4  7F80        NOP
  AC5  7F80        NOP
  AC6  7F80        NOP
  AC7  7F80        NOP
  AC8  7F80        NOP
  AC9  7F80        NOP
  ACA  7F80        NOP
  ACB  7F80        NOP
  ACC  7F80        NOP
  ACD  7F80        NOP
  ACE  7F80        NOP
  ACF  7F80        NOP
  AD0  F900 0AFD   B     LAFD

LAD2:
  AD2  6A21        LT    0x21
  AD3  6D72        MPY   0x72
  AD4  7F8E        PAC
  AD5  590D        SACH  0x0D,1
  AD6  2F11        LAC   0x11,15
  AD7  6112        ADDS  0x12
  AD8  0470        ADD   0x70,4
  AD9  040D        ADD   0x0D,4
  ADA  5911        SACH  0x11,1
  ADB  7902        AND   0x02
  ADC  5012        SACL  0x12
  ADD  6611        ZALS  0x11
  ADE  7925        AND   0x25
  ADF  6126        ADDS  0x26
  AE0  6171        ADDS  0x71
  AE1  6723        TBLR  0x23
  AE2  610A        ADDS  0x0A
  AE3  6724        TBLR  0x24
  AE4  2F23        LAC   0x23,15
  AE5  6A12        LT    0x12
  AE6  6D23        MPY   0x23
  AE7  7F90        SPAC
  AE8  6D24        MPY   0x24
  AE9  7F8F        APAC
  AEA  5904        SACH  0x04,1
  AEB  7F80        NOP
  AEC  7F80        NOP
  AED  7F80        NOP
  AEE  F900 0AFD   B     LAFD

LAF0:
  AF0  6611        ZALS  0x11
  AF1  6126        ADDS  0x26
  AF2  6171        ADDS  0x71
  AF3  6723        TBLR  0x23
  AF4  610A        ADDS  0x0A
  AF5  6724        TBLR  0x24
  AF6  2F23        LAC   0x23,15
  AF7  6A12        LT    0x12
  AF8  6D23        MPY   0x23
  AF9  7F90        SPAC
  AFA  6D24        MPY   0x24
  AFB  7F8F        APAC
  AFC  5904        SACH  0x04,1
LAFD:
  AFD  3963        LAR   AR1,0x63
  AFE  3867        LAR   AR0,0x67
  AFF  4980        OUT   *,PA1,AR0
  B00  4981        OUT   *,PA1,AR1
  B01  4904        OUT   0x04,PA1
  B02  6521        ZALH  0x21
  B03  7F88        ABS
  B04  622A        SUBH  0x2A
  B05  FA00 0B0D   BLZ   LB0D
  B07  6521        ZALH  0x21
  B08  7F88        ABS
  B09  582A        SACH  0x2A
  B0A  7F80        NOP
  B0B  F900 0B13   B     LB13

LB0D:
  B0D  580D        SACH  0x0D
  B0E  652A        ZALH  0x2A
  B0F  6A2B        LT    0x2B
  B10  6D0D        MPY   0x0D
  B11  7F8F        APAC
  B12  582A        SACH  0x2A
LB13:
  B13  1F78        SUB   0x78,15
  B14  411D        IN    0x1D,PA1
  B15  7F80        NOP
  B16  411E        IN    0x1E,PA1
  B17  7F80        NOP
  B18  4122        IN    0x22,PA1
  B19  FA00 0B1D   BLZ   LB1D
  B1B  F900 0B1F   B     LB1F

LB1D:
  B1D  6578        ZALH  0x78
  B1E  580E        SACH  0x0E
LB1F:
  B1F  6515        ZALH  0x15
  B20  6A18        LT    0x18
  B21  6D16        MPY   0x16
  B22  6C16        LTA   0x16
  B23  7F8F        APAC
  B24  5815        SACH  0x15
  B25  651D        ZALH  0x1D
  B26  6D61        MPY   0x61
  B27  7F8F        APAC
  B28  6C18        LTA   0x18
  B29  6215        SUBH  0x15
  B2A  5817        SACH  0x17
  B2B  6D17        MPY   0x17
  B2C  7F8E        PAC
  B2D  6C1C        LTA   0x1C
  B2E  6016        ADDH  0x16
  B2F  5816        SACH  0x16
  B30  6519        ZALH  0x19
  B31  6D1A        MPY   0x1A
  B32  6C1A        LTA   0x1A
  B33  7F8F        APAC
  B34  5819        SACH  0x19
  B35  651E        ZALH  0x1E
  B36  6D65        MPY   0x65
  B37  7F8F        APAC
  B38  6C1C        LTA   0x1C
  B39  6219        SUBH  0x19
  B3A  581B        SACH  0x1B
  B3B  6D1B        MPY   0x1B
  B3C  7F8E        PAC
  B3D  7F8F        APAC
  B3E  601A        ADDH  0x1A
  B3F  581A        SACH  0x1A
  B40  6677        ZALS  0x77
  B41  FE00 0B45   BNZ   LB45
  B43  F900 0BCD   B     LBCD

LB45:
  B45  652E        ZALH  0x2E
  B46  620F        SUBH  0x0F
  B47  FC00 0B87   BGZ   LB87
  B49  652C        ZALH  0x2C
  B4A  FF00 0B52   BZ    LB52
  B4C  620A        SUBH  0x0A
  B4D  FF00 0B6F   BZ    LB6F
  B4F  620A        SUBH  0x0A
  B50  FF00 0BB6   BZ    LBB6
LB52:
  B52  2F13        LAC   0x13,15
  B53  6114        ADDS  0x14
  B54  0474        ADD   0x74,4
  B55  5913        SACH  0x13,1
  B56  7902        AND   0x02
  B57  5014        SACL  0x14
  B58  6613        ZALS  0x13
  B59  6325        SUBS  0x25
  B5A  FD00 0B5E   BGEZ  LB5E
  B5C  F900 0BEB   B     LBEB

LB5E:
  B5E  6625        ZALS  0x25
  B5F  5013        SACL  0x13
  B60  6126        ADDS  0x26
  B61  6175        ADDS  0x75
  B62  6723        TBLR  0x23
  B63  6523        ZALH  0x23
  B64  5805        SACH  0x05
  B65  7E02        LACK  0x02
  B66  502C        SACL  0x2C
  B67  7F80        NOP
  B68  7F80        NOP
  B69  7F80        NOP
  B6A  7F80        NOP
  B6B  7F80        NOP
  B6C  7F80        NOP
  B6D  F900 0BF8   B     LBF8

LB6F:
  B6F  2F13        LAC   0x13,15
  B70  6114        ADDS  0x14
  B71  1474        SUB   0x74,4
  B72  5913        SACH  0x13,1
  B73  7902        AND   0x02
  B74  5014        SACL  0x14
  B75  6613        ZALS  0x13
  B76  FC00 0BEB   BGZ   LBEB
  B78  7F89        ZAC
  B79  5013        SACL  0x13
  B7A  6126        ADDS  0x26
  B7B  6175        ADDS  0x75
  B7C  6723        TBLR  0x23
  B7D  6523        ZALH  0x23
  B7E  5805        SACH  0x05
  B7F  7E02        LACK  0x02
  B80  502C        SACL  0x2C
  B81  7F80        NOP
  B82  7F80        NOP
  B83  7F80        NOP
  B84  7F80        NOP
  B85  F900 0BF8   B     LBF8

LB87:
  B87  6677        ZALS  0x77
  B88  630A        SUBS  0x0A
  B89  FB00 0B9A   BLEZ  LB9A
  B8B  662D        ZALS  0x2D
  B8C  FF00 0B94   BZ    LB94
  B8E  7E00        LACK  0x00
  B8F  502C        SACL  0x2C
  B90  502D        SACL  0x2D
  B91  7F80        NOP
  B92  F900 0BA3   B     LBA3

LB94:
  B94  7E01        LACK  0x01
  B95  502C        SACL  0x2C
  B96  502D        SACL  0x2D
  B97  7F80        NOP
  B98  F900 0BA3   B     LBA3

LB9A:
  B9A  7F89        ZAC
  B9B  502C        SACL  0x2C
  B9C  5013        SACL  0x13
  B9D  5014        SACL  0x14
  B9E  7F80        NOP
  B9F  7F80        NOP
  BA0  7F80        NOP
  BA1  7F80        NOP
  BA2  7F80        NOP
LBA3:
  BA3  6502        ZALH  0x02
  BA4  580F        SACH  0x0F
  BA5  7F80        NOP
  BA6  7F80        NOP
  BA7  7F80        NOP
  BA8  7F80        NOP
  BA9  7F80        NOP
  BAA  7F80        NOP
  BAB  7F80        NOP
  BAC  7F80        NOP
  BAD  7F80        NOP
  BAE  7F80        NOP
  BAF  7F80        NOP
  BB0  7F80        NOP
  BB1  7F80        NOP
  BB2  7F80        NOP
  BB3  7F80        NOP
  BB4  F900 0BF8   B     LBF8

LBB6:
  BB6  7F80        NOP
  BB7  7F80        NOP
  BB8  7F80        NOP
  BB9  7F80        NOP
  BBA  7F80        NOP
  BBB  7F80        NOP
  BBC  7F80        NOP
  BBD  7F80        NOP
  BBE  7F80        NOP
  BBF  7F80        NOP
  BC0  7F80        NOP
  BC1  7F80        NOP
  BC2  7F80        NOP
  BC3  7F80        NOP
  BC4  7F80        NOP
  BC5  7F80        NOP
  BC6  7F80        NOP
  BC7  7F80        NOP
  BC8  7F80        NOP
  BC9  7F80        NOP
  BCA  7F80        NOP
  BCB  F900 0BF8   B     LBF8

LBCD:
  BCD  6A22        LT    0x22
  BCE  6D76        MPY   0x76
  BCF  7F8E        PAC
  BD0  590D        SACH  0x0D,1
  BD1  2F13        LAC   0x13,15
  BD2  6114        ADDS  0x14
  BD3  0474        ADD   0x74,4
  BD4  040D        ADD   0x0D,4
  BD5  5913        SACH  0x13,1
  BD6  7902        AND   0x02
  BD7  5014        SACL  0x14
  BD8  6613        ZALS  0x13
  BD9  7925        AND   0x25
  BDA  6126        ADDS  0x26
  BDB  6175        ADDS  0x75
  BDC  6723        TBLR  0x23
  BDD  610A        ADDS  0x0A
  BDE  6724        TBLR  0x24
  BDF  2F23        LAC   0x23,15
  BE0  6A14        LT    0x14
  BE1  6D23        MPY   0x23
  BE2  7F90        SPAC
  BE3  6D24        MPY   0x24
  BE4  7F8F        APAC
  BE5  5905        SACH  0x05,1
  BE6  7F80        NOP
  BE7  7F80        NOP
  BE8  7F80        NOP
  BE9  F900 0BF8   B     LBF8

LBEB:
  BEB  6613        ZALS  0x13
  BEC  6126        ADDS  0x26
  BED  6175        ADDS  0x75
  BEE  6723        TBLR  0x23
  BEF  610A        ADDS  0x0A
  BF0  6724        TBLR  0x24
  BF1  2F23        LAC   0x23,15
  BF2  6A14        LT    0x14
  BF3  6D23        MPY   0x23
  BF4  7F90        SPAC
  BF5  6D24        MPY   0x24
  BF6  7F8F        APAC
  BF7  5905        SACH  0x05,1
LBF8:
  BF8  3963        LAR   AR1,0x63
  BF9  3867        LAR   AR0,0x67
  BFA  4980        OUT   *,PA1,AR0
  BFB  4981        OUT   *,PA1,AR1
  BFC  4905        OUT   0x05,PA1
  BFD  6522        ZALH  0x22
  BFE  7F88        ABS
  BFF  622E        SUBH  0x2E
  C00  FA00 0C08   BLZ   LC08
  C02  6522        ZALH  0x22
  C03  7F88        ABS
  C04  582E        SACH  0x2E
  C05  7F80        NOP
  C06  F900 0C0E   B     LC0E

LC08:
  C08  580D        SACH  0x0D
  C09  652E        ZALH  0x2E
  C0A  6A2F        LT    0x2F
  C0B  6D0D        MPY   0x0D
  C0C  7F8F        APAC
  C0D  582E        SACH  0x2E
LC0E:
  C0E  7F80        NOP
  C0F  411D        IN    0x1D,PA1
  C10  7F80        NOP
  C11  411E        IN    0x1E,PA1
  C12  7F80        NOP
  C13  411F        IN    0x1F,PA1
  C14  7F80        NOP
  C15  7F80        NOP
  C16  F900 0924   B     L924

  C18  0000        ADD   0x00
  C19  004F        ADD   0x4F
  C1A  013B        ADD   0x3B,1
  C1B  02C1        ADD   *,2,AR1
  C1C  04DF        ADD   *-,4
  C1D  078F        ADD   *,7
  C1E  0AC9        ADD   *,10
  C1F  0E87        ADD   *,14,AR1
  C20  12BF        SUB   *+-,2
  C21  1766        SUB   0x66,7
  C22  1C71        SUB   0x71,12
  C23  21D4        LAC   *-,1,AR0
  C24  2782        LAC   *,7,AR0
  C25  2D6C        LAC   0x6C,13
  C26  3383        .word 0x3383
  C27  39BA        LAR   AR1,*+-
  C28  3FFF        .word 0x3FFF
  C29  4645        IN    0x45,PA6
  C2A  4C7C        OUT   0x7C,PA4
  C2B  5293        SACL  *-,AR1
  C2C  587D        SACH  0x7D
  C2D  5E2B        SACH  0x2B,6
  C2E  638E        SUBS  *
  C2F  6899        MAR   *-
  C30  6D40        MPY   0x40
  C31  7178        LARK  AR1,0x78
  C32  7536        .word 0x7536
  C33  7870        XOR   0x70
  C34  7B20        LST   0x20
  C35  7D3E        TBLW  0x3E
  C36  7EC4        LACK  0xC4
  C37  7FB0        .word 0x7FB0
  C38  7FFF        .word 0x7FFF
  C39  7FB0        .word 0x7FB0
  C3A  7EC4        LACK  0xC4
  C3B  7D3E        TBLW  0x3E
  C3C  7B20        LST   0x20
  C3D  7870        XOR   0x70
  C3E  7536        .word 0x7536
  C3F  7178        LARK  AR1,0x78
  C40  6D40        MPY   0x40
  C41  6899        MAR   *-
  C42  638E        SUBS  *
  C43  5E2B        SACH  0x2B,6
  C44  587D        SACH  0x7D
  C45  5293        SACL  *-,AR1
  C46  4C7C        OUT   0x7C,PA4
  C47  4645        IN    0x45,PA6
  C48  4000        IN    0x00,PA0
  C49  39BA        LAR   AR1,*+-
  C4A  3383        .word 0x3383
  C4B  2D6C        LAC   0x6C,13
  C4C  2782        LAC   *,7,AR0
  C4D  21D4        LAC   *-,1,AR0
  C4E  1C71        SUB   0x71,12
  C4F  1766        SUB   0x66,7
  C50  12BF        SUB   *+-,2
  C51  0E87        ADD   *,14,AR1
  C52  0AC9        ADD   *,10
  C53  078F        ADD   *,7
  C54  04DF        ADD   *-,4
  C55  02C1        ADD   *,2,AR1
  C56  013B        ADD   0x3B,1
  C57  004F        ADD   0x4F
  C58  0000        ADD   0x00
  C59  0000        ADD   0x00
  C5A  0000        ADD   0x00
  C5B  0000        ADD   0x00
  C5C  0000        ADD   0x00
  C5D  0000        ADD   0x00
  C5E  0000        ADD   0x00
  C5F  0000        ADD   0x00
  C60  0000        ADD   0x00
  C61  0000        ADD   0x00
  C62  0000        ADD   0x00
  C63  0000        ADD   0x00
  C64  0000        ADD   0x00
  C65  0000        ADD   0x00
  C66  0000        ADD   0x00
  C67  0000        ADD   0x00
  C68  0000        ADD   0x00
  C69  0000        ADD   0x00
  C6A  0000        ADD   0x00
  C6B  0000        ADD   0x00
  C6C  0000        ADD   0x00
  C6D  0000        ADD   0x00
  C6E  0000        ADD   0x00
  C6F  0000        ADD   0x00
  C70  0000        ADD   0x00
  C71  0000        ADD   0x00
  C72  0000        ADD   0x00
  C73  0000        ADD   0x00
  C74  0000        ADD   0x00
  C75  0000        ADD   0x00
  C76  0000        ADD   0x00
  C77  0000        ADD   0x00
  C78  0000        ADD   0x00
  C79  7FFF        .word 0x7FFF
  C7A  7FFF        .word 0x7FFF
  C7B  7FFF        .word 0x7FFF
  C7C  7FFF        .word 0x7FFF
  C7D  7FFF        .word 0x7FFF
  C7E  7FFF        .word 0x7FFF
  C7F  7FFF        .word 0x7FFF
  C80  7FFF        .word 0x7FFF
  C81  7FFF        .word 0x7FFF
  C82  7FFF        .word 0x7FFF
  C83  7FFF        .word 0x7FFF
  C84  7FFF        .word 0x7FFF
  C85  7FFF        .word 0x7FFF
  C86  7FFF        .word 0x7FFF
  C87  7FFF        .word 0x7FFF
  C88  7FFF        .word 0x7FFF
  C89  7FFF        .word 0x7FFF
  C8A  7FFF        .word 0x7FFF
  C8B  7FFF        .word 0x7FFF
  C8C  7FFF        .word 0x7FFF
  C8D  7FFF        .word 0x7FFF
  C8E  7FFF        .word 0x7FFF
  C8F  7FFF        .word 0x7FFF
  C90  7FFF        .word 0x7FFF
  C91  7FFF        .word 0x7FFF
  C92  7FFF        .word 0x7FFF
  C93  7FFF        .word 0x7FFF
  C94  7FFF        .word 0x7FFF
  C95  7FFF        .word 0x7FFF
  C96  7FFF        .word 0x7FFF
  C97  7FFF        .word 0x7FFF
  C98  7FFF        .word 0x7FFF
  C99  0000        ADD   0x00
  C9A  0000        ADD   0x00
  C9B  0208        ADD   0x08,2
  C9C  0410        ADD   0x10,4
  C9D  0618        ADD   0x18,6
  C9E  0820        ADD   0x20,8
  C9F  0A29        ADD   0x29,10
  CA0  0C31        ADD   0x31,12
  CA1  0E39        ADD   0x39,14
  CA2  1041        SUB   0x41
  CA3  1249        SUB   0x49,2
  CA4  1451        SUB   0x51,4
  CA5  1659        SUB   0x59,6
  CA6  1861        SUB   0x61,8
  CA7  1A69        SUB   0x69,10
  CA8  1C72        SUB   0x72,12
  CA9  1E7A        SUB   0x7A,14
  CAA  2082        LAC   *,0,AR0
  CAB  228A        LAC   *,2
  CAC  2492        LAC   *-,4,AR0
  CAD  269A        LAC   *-,6
  CAE  28A2        LAC   *+,8,AR0
  CAF  2AAA        LAC   *+,10
  CB0  2CB2        LAC   *+-,12,AR0
  CB1  2EBB        LAC   *+-,14
  CB2  30C3        SAR   AR0,*,AR1
  CB3  32CB        .word 0x32CB
  CB4  34D3        .word 0x34D3
  CB5  36DB        .word 0x36DB
  CB6  38E3        LAR   AR0,*+,AR1
  CB7  3AEB        .word 0x3AEB
  CB8  3CF3        .word 0x3CF3
  CB9  3EFB        .word 0x3EFB
  CBA  4104        IN    0x04,PA1
  CBB  430C        IN    0x0C,PA3
  CBC  4514        IN    0x14,PA5
  CBD  471C        IN    0x1C,PA7
  CBE  4924        OUT   0x24,PA1
  CBF  4B2C        OUT   0x2C,PA3
  CC0  4D34        OUT   0x34,PA5
  CC1  4F3C        OUT   0x3C,PA7
  CC2  5144        SACL  0x44
  CC3  534D        SACL  0x4D
  CC4  5555        SACL  0x55
  CC5  575D        SACL  0x5D
  CC6  5965        SACH  0x65,1
  CC7  5B6D        SACH  0x6D,3
  CC8  5D75        SACH  0x75,5
  CC9  5F7D        SACH  0x7D,7
  CCA  6185        ADDS  *,AR1
  CCB  638D        SUBS  *
  CCC  6596        ZALH  *-,AR0
  CCD  679E        TBLR  *-
  CCE  69A6        DMOV  *+,AR0
  CCF  6BAE        LTD   *+
  CD0  6DB6        MPY   *+-,AR0
  CD1  6FBE        LDP   *+-
  CD2  71C6        LARK  AR1,0xC6
  CD3  73CE        .word 0x73CE
  CD4  75D6        .word 0x75D6
  CD5  77DF        .word 0x77DF
  CD6  79E7        AND   *+,AR1
  CD7  7BEF        LST   *+
  CD8  7DF7        TBLW  *+-,AR1
  CD9  7FFF        .word 0x7FFF
  CDA  0000        ADD   0x00
  CDB  0000        ADD   0x00
  CDC  0400        ADD   0x00,4
  CDD  0800        ADD   0x00,8
  CDE  0C00        ADD   0x00,12
  CDF  1000        SUB   0x00
  CE0  1400        SUB   0x00,4
  CE1  1800        SUB   0x00,8
  CE2  1C00        SUB   0x00,12
  CE3  2000        LAC   0x00
  CE4  2400        LAC   0x00,4
  CE5  2800        LAC   0x00,8
  CE6  2C00        LAC   0x00,12
  CE7  3000        SAR   AR0,0x00
  CE8  3400        .word 0x3400
  CE9  3800        LAR   AR0,0x00
  CEA  3C00        .word 0x3C00
  CEB  4000        IN    0x00,PA0
  CEC  43FF        IN    *+-,PA3
  CED  47FF        IN    *+-,PA7
  CEE  4BFF        OUT   *+-,PA3
  CEF  4FFF        OUT   *+-,PA7
  CF0  53FF        SACL  *+-
  CF1  57FF        SACL  *+-
  CF2  5BFF        SACH  *+-,3
  CF3  5FFF        SACH  *+-,7
  CF4  63FF        SUBS  *+-
  CF5  67FF        TBLR  *+-
  CF6  6BFF        LTD   *+-
  CF7  6FFF        LDP   *+-
  CF8  73FF        .word 0x73FF
  CF9  77FF        .word 0x77FF
  CFA  7BFF        LST   *+-
  CFB  7FFF        .word 0x7FFF
  CFC  7BFF        LST   *+-
  CFD  77FF        .word 0x77FF
  CFE  73FF        .word 0x73FF
  CFF  6FFF        LDP   *+-
  D00  6BFF        LTD   *+-
  D01  67FF        TBLR  *+-
  D02  63FF        SUBS  *+-
  D03  5FFF        SACH  *+-,7
  D04  5BFF        SACH  *+-,3
  D05  57FF        SACL  *+-
  D06  53FF        SACL  *+-
  D07  4FFF        OUT   *+-,PA7
  D08  4BFF        OUT   *+-,PA3
  D09  47FF        IN    *+-,PA7
  D0A  43FF        IN    *+-,PA3
  D0B  4000        IN    0x00,PA0
  D0C  3C00        .word 0x3C00
  D0D  3800        LAR   AR0,0x00
  D0E  3400        .word 0x3400
  D0F  3000        SAR   AR0,0x00
  D10  2C00        LAC   0x00,12
  D11  2800        LAC   0x00,8
  D12  2400        LAC   0x00,4
  D13  2000        LAC   0x00
  D14  1C00        SUB   0x00,12
  D15  1800        SUB   0x00,8
  D16  1400        SUB   0x00,4
  D17  1000        SUB   0x00
  D18  0C00        ADD   0x00,12
  D19  0800        ADD   0x00,8
  D1A  0400        ADD   0x00,4
  D1B  0000        ADD   0x00
  D1C  0000        ADD   0x00
  D1D  0008        ADD   0x08
  D1E  0021        ADD   0x21
  D1F  004A        ADD   0x4A
  D20  0084        ADD   *,0,AR0
  D21  00CE        ADD   *
  D22  0129        ADD   0x29,1
  D23  0195        ADD   *-,1,AR1
  D24  0210        ADD   0x10,2
  D25  029D        ADD   *-,2
  D26  033A        ADD   0x3A,3
  D27  03E7        ADD   *+,3,AR1
  D28  04A5        ADD   *+,4,AR1
  D29  0573        ADD   0x73,5
  D2A  0652        ADD   0x52,6
  D2B  0742        ADD   0x42,7
  D2C  0841        ADD   0x41,8
  D2D  0952        ADD   0x52,9
  D2E  0A73        ADD   0x73,10
  D2F  0BA4        ADD   *+,11,AR0
  D30  0CE6        ADD   *+,12,AR0
  D31  0E39        ADD   0x39,14
  D32  0F9C        ADD   *-,15
  D33  110F        SUB   0x0F,1
  D34  1293        SUB   *-,2,AR1
  D35  1428        SUB   0x28,4
  D36  15CD        SUB   *,5
  D37  1782        SUB   *,7,AR0
  D38  1948        SUB   0x48,9
  D39  1B1F        SUB   0x1F,11
  D3A  1D06        SUB   0x06,13
  D3B  1EFE        SUB   *+-,14
  D3C  2106        LAC   0x06,1
  D3D  231E        LAC   0x1E,3
  D3E  2548        LAC   0x48,5
  D3F  2781        LAC   *,7,AR1
  D40  29CB        LAC   *,9
  D41  2C26        LAC   0x26,12
  D42  2E91        LAC   *-,14,AR1
  D43  310D        SAR   AR1,0x0D
  D44  3399        .word 0x3399
  D45  3636        .word 0x3636
  D46  38E3        LAR   AR0,*+,AR1
  D47  3BA1        .word 0x3BA1
  D48  3E6F        .word 0x3E6F
  D49  414E        IN    0x4E,PA1
  D4A  443D        IN    0x3D,PA4
  D4B  473D        IN    0x3D,PA7
  D4C  4A4D        OUT   0x4D,PA2
  D4D  4D6E        OUT   0x6E,PA5
  D4E  509F        SACL  *-
  D4F  53E1        SACL  *+,AR1
  D50  5734        SACL  0x34
  D51  5A96        SACH  *-,2,AR0
  D52  5E0A        SACH  0x0A,6
  D53  618E        ADDS  *
  D54  6522        ZALH  0x22
  D55  68C7        MAR   *,AR1
  D56  6C7C        LTA   0x7C
  D57  7042        LARK  AR0,0x42
  D58  7419        .word 0x7419
  D59  7800        XOR   0x00
  D5A  7BF7        LST   *+-
  D5B  7FFF        .word 0x7FFF
  D5C  0000        ADD   0x00
  D5D  0000        ADD   0x00
  D5E  0020        ADD   0x20
  D5F  0080        ADD   *,0,AR0
  D60  0120        ADD   0x20,1
  D61  0200        ADD   0x00,2
  D62  0320        ADD   0x20,3
  D63  0480        ADD   *,4,AR0
  D64  0620        ADD   0x20,6
  D65  0800        ADD   0x00,8
  D66  0A20        ADD   0x20,10
  D67  0C80        ADD   *,12,AR0
  D68  0F20        ADD   0x20,15
  D69  1200        SUB   0x00,2
  D6A  1520        SUB   0x20,5
  D6B  1880        SUB   *,8,AR0
  D6C  1C20        SUB   0x20,12
  D6D  2000        LAC   0x00
  D6E  2420        LAC   0x20,4
  D6F  2880        LAC   *,8,AR0
  D70  2D20        LAC   0x20,13
  D71  3200        .word 0x3200
  D72  3720        .word 0x3720
  D73  3C80        .word 0x3C80
  D74  421F        IN    0x1F,PA2
  D75  47FF        IN    *+-,PA7
  D76  4E1F        OUT   0x1F,PA6
  D77  547F        SACL  0x7F
  D78  5B1F        SACH  0x1F,3
  D79  61FF        ADDS  *+-
  D7A  691F        DMOV  0x1F
  D7B  707F        LARK  AR0,0x7F
  D7C  781F        XOR   0x1F
  D7D  7FFF        .word 0x7FFF
  D7E  781F        XOR   0x1F
  D7F  707F        LARK  AR0,0x7F
  D80  691F        DMOV  0x1F
  D81  61FF        ADDS  *+-
  D82  5B1F        SACH  0x1F,3
  D83  547F        SACL  0x7F
  D84  4E1F        OUT   0x1F,PA6
  D85  47FF        IN    *+-,PA7
  D86  421F        IN    0x1F,PA2
  D87  3C80        .word 0x3C80
  D88  3720        .word 0x3720
  D89  3200        .word 0x3200
  D8A  2D20        LAC   0x20,13
  D8B  2880        LAC   *,8,AR0
  D8C  2420        LAC   0x20,4
  D8D  2000        LAC   0x00
  D8E  1C20        SUB   0x20,12
  D8F  1880        SUB   *,8,AR0
  D90  1520        SUB   0x20,5
  D91  1200        SUB   0x00,2
  D92  0F20        ADD   0x20,15
  D93  0C80        ADD   *,12,AR0
  D94  0A20        ADD   0x20,10
  D95  0800        ADD   0x00,8
  D96  0620        ADD   0x20,6
  D97  0480        ADD   *,4,AR0
  D98  0320        ADD   0x20,3
  D99  0200        ADD   0x00,2
  D9A  0120        ADD   0x20,1
  D9B  0080        ADD   *,0,AR0
  D9C  0020        ADD   0x20
  D9D  0000        ADD   0x00
