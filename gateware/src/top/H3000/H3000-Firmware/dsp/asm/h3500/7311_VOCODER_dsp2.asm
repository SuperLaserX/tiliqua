; Eventide h3500 DSP microcode
; key 7311  algorithm 73 (VOCODER)  DSP 2
; source H3000-Upgrade_ROM4.BIN offset 3D3D2, 460 program words loaded at 800
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
  80C  5001        SACL  0x01
  80D  2901        LAC   0x01,9
  80E  5005        SACL  0x05
  80F  2F01        LAC   0x01,15
  810  5004        SACL  0x04
  811  7F89        ZAC
  812  5000        SACL  0x00
  813  1001        SUB   0x01
  814  5802        SACH  0x02
  815  7EFF        LACK  0xFF
  816  5006        SACL  0x06
  817  2706        LAC   0x06,7
  818  7A06        OR    0x06
  819  5003        SACL  0x03
  81A  6A01        LT    0x01
  81B  89C3        MPYK  2499
  81C  7F8E        PAC
  81D  6723        TBLR  0x23
  81E  0001        ADD   0x01
  81F  6724        TBLR  0x24
  820  0001        ADD   0x01
  821  6725        TBLR  0x25
  822  0001        ADD   0x01
  823  6726        TBLR  0x26
  824  0001        ADD   0x01
  825  6727        TBLR  0x27
  826  0001        ADD   0x01
  827  6728        TBLR  0x28
  828  0001        ADD   0x01
  829  6729        TBLR  0x29
  82A  0001        ADD   0x01
  82B  672A        TBLR  0x2A
  82C  0001        ADD   0x01
  82D  672B        TBLR  0x2B
  82E  89CC        MPYK  2508
  82F  7F8E        PAC
  830  5031        SACL  0x31
  831  7EFF        LACK  0xFF
  832  5006        SACL  0x06
  833  2206        LAC   0x06,2
  834  7A06        OR    0x06
  835  5033        SACL  0x33
  836  6603        ZALS  0x03
  837  5007        SACL  0x07
L838:
  838  F600 083C   BIOZ  L83C
  83A  F900 0838   B     L838

L83C:
  83C  4006        IN    0x06,PA0
  83D  6506        ZALH  0x06
  83E  FD00 0841   BGEZ  L841
  840  7F80        NOP
L841:
  841  F600 0841   BIOZ  L841
L843:
  843  4506        IN    0x06,PA5
  844  6881        LARP  1
  845  6606        ZALS  0x06
  846  7905        AND   0x05
  847  FE00 084C   BNZ   L84C
  849  6880        LARP  0
  84A  F900 084E   B     L84E

L84C:
  84C  3906        LAR   AR1,0x06
  84D  4680        IN    *,PA6,AR0
L84E:
  84E  7F80        NOP
  84F  6607        ZALS  0x07
  850  6101        ADDS  0x01
  851  5007        SACL  0x07
  852  4F07        OUT   0x07,PA7
  853  6101        ADDS  0x01
  854  5007        SACL  0x07
  855  4F07        OUT   0x07,PA7
  856  6101        ADDS  0x01
  857  5007        SACL  0x07
  858  4F07        OUT   0x07,PA7
  859  6101        ADDS  0x01
  85A  5007        SACL  0x07
  85B  4F07        OUT   0x07,PA7
  85C  6101        ADDS  0x01
  85D  5007        SACL  0x07
  85E  4F07        OUT   0x07,PA7
  85F  6101        ADDS  0x01
  860  5007        SACL  0x07
  861  4F07        OUT   0x07,PA7
  862  6101        ADDS  0x01
  863  5007        SACL  0x07
  864  4F07        OUT   0x07,PA7
  865  6101        ADDS  0x01
  866  5007        SACL  0x07
  867  4F07        OUT   0x07,PA7
  868  6101        ADDS  0x01
  869  5007        SACL  0x07
  86A  4F07        OUT   0x07,PA7
  86B  6101        ADDS  0x01
  86C  5007        SACL  0x07
  86D  4F07        OUT   0x07,PA7
  86E  6101        ADDS  0x01
  86F  5007        SACL  0x07
  870  4F07        OUT   0x07,PA7
  871  6101        ADDS  0x01
  872  5007        SACL  0x07
  873  4F07        OUT   0x07,PA7
  874  6101        ADDS  0x01
  875  5007        SACL  0x07
  876  4F07        OUT   0x07,PA7
  877  6101        ADDS  0x01
  878  5007        SACL  0x07
  879  4F07        OUT   0x07,PA7
  87A  6101        ADDS  0x01
  87B  5007        SACL  0x07
  87C  4F07        OUT   0x07,PA7
  87D  6101        ADDS  0x01
  87E  5007        SACL  0x07
  87F  4F07        OUT   0x07,PA7
  880  6101        ADDS  0x01
  881  5007        SACL  0x07
  882  4F07        OUT   0x07,PA7
  883  6101        ADDS  0x01
  884  5007        SACL  0x07
  885  4F07        OUT   0x07,PA7
  886  6101        ADDS  0x01
  887  5007        SACL  0x07
  888  4F07        OUT   0x07,PA7
  889  6101        ADDS  0x01
  88A  5007        SACL  0x07
  88B  4F07        OUT   0x07,PA7
  88C  6101        ADDS  0x01
  88D  5007        SACL  0x07
  88E  4F07        OUT   0x07,PA7
  88F  7F80        NOP
  890  7F80        NOP
  891  7F80        NOP
  892  7F80        NOP
  893  7F80        NOP
  894  2007        LAC   0x07
  895  FA00 0843   BLZ   L843
L897:
  897  F600 089B   BIOZ  L89B
  899  F900 0897   B     L897

L89B:
  89B  4006        IN    0x06,PA0
  89C  6506        ZALH  0x06
  89D  FD00 08A0   BGEZ  L8A0
  89F  7F80        NOP
L8A0:
  8A0  F600 08A0   BIOZ  L8A0
L8A2:
  8A2  7F80        NOP
  8A3  7F80        NOP
  8A4  7F80        NOP
  8A5  7F80        NOP
  8A6  7F80        NOP
  8A7  2F10        LAC   0x10,15
  8A8  6A16        LT    0x16
  8A9  6D24        MPY   0x24
  8AA  7F8F        APAC
  8AB  6B15        LTD   0x15
  8AC  6D23        MPY   0x23
  8AD  7F8F        APAC
  8AE  7F8F        APAC
  8AF  5815        SACH  0x15
  8B0  490D        OUT   0x0D,PA1
  8B1  4711        IN    0x11,PA7
  8B2  412C        IN    0x2C,PA1
  8B3  4143        IN    0x43,PA1
  8B4  4144        IN    0x44,PA1
  8B5  4145        IN    0x45,PA1
  8B6  4F13        OUT   0x13,PA7
  8B7  4C0C        OUT   0x0C,PA4
  8B8  4913        OUT   0x13,PA1
  8B9  4D36        OUT   0x36,PA5
  8BA  4E37        OUT   0x37,PA6
  8BB  6632        ZALS  0x32
  8BC  6101        ADDS  0x01
  8BD  7933        AND   0x33
  8BE  5032        SACL  0x32
  8BF  0031        ADD   0x31
  8C0  7D12        TBLW  0x12
  8C1  6632        ZALS  0x32
  8C2  1044        SUB   0x44
  8C3  7933        AND   0x33
  8C4  0031        ADD   0x31
  8C5  6734        TBLR  0x34
  8C6  6632        ZALS  0x32
  8C7  1144        SUB   0x44,1
  8C8  7933        AND   0x33
  8C9  0031        ADD   0x31
  8CA  6735        TBLR  0x35
  8CB  7F89        ZAC
  8CC  6A12        LT    0x12
  8CD  6D45        MPY   0x45
  8CE  6C35        LTA   0x35
  8CF  6D45        MPY   0x45
  8D0  7F90        SPAC
  8D1  5806        SACH  0x06
  8D2  6034        ADDH  0x34
  8D3  5836        SACH  0x36
  8D4  6534        ZALH  0x34
  8D5  6206        SUBH  0x06
  8D6  5837        SACH  0x37
  8D7  2F11        LAC   0x11,15
  8D8  6A1B        LT    0x1B
  8D9  6D24        MPY   0x24
  8DA  7F8F        APAC
  8DB  6B1A        LTD   0x1A
  8DC  6D23        MPY   0x23
  8DD  7F8F        APAC
  8DE  6C20        LTA   0x20
  8DF  581A        SACH  0x1A
  8E0  2F2C        LAC   0x2C,15
  8E1  6D24        MPY   0x24
  8E2  7F8F        APAC
  8E3  6B1F        LTD   0x1F
  8E4  6D23        MPY   0x23
  8E5  7F8F        APAC
  8E6  6C20        LTA   0x20
  8E7  581E        SACH  0x1E
  8E8  7F89        ZAC
  8E9  6D29        MPY   0x29
  8EA  7F8F        APAC
  8EB  6C1F        LTA   0x1F
  8EC  6D28        MPY   0x28
  8ED  7F8F        APAC
  8EE  6B1E        LTD   0x1E
  8EF  6D27        MPY   0x27
  8F0  7F8F        APAC
  8F1  4710        IN    0x10,PA7
  8F2  7F8F        APAC
  8F3  5812        SACH  0x12
  8F4  652F        ZALH  0x2F
  8F5  FF00 0906   BZ    L906
  8F7  6201        SUBH  0x01
  8F8  582F        SACH  0x2F
  8F9  7F80        NOP
  8FA  7F80        NOP
  8FB  7F80        NOP
  8FC  7F80        NOP
  8FD  7F80        NOP
  8FE  7F80        NOP
  8FF  7F80        NOP
  900  7F80        NOP
  901  7F80        NOP
  902  7F80        NOP
  903  7F80        NOP
  904  F900 0915   B     L915

L906:
  906  6A30        LT    0x30
  907  6D2E        MPY   0x2E
  908  7F8E        PAC
  909  6D2D        MPY   0x2D
  90A  7F90        SPAC
  90B  0F2D        ADD   0x2D,15
  90C  590C        SACH  0x0C,1
  90D  6630        ZALS  0x30
  90E  0143        ADD   0x43,1
  90F  592F        SACH  0x2F,1
  910  7903        AND   0x03
  911  5030        SACL  0x30
  912  6613        ZALS  0x13
  913  6101        ADDS  0x01
  914  5013        SACL  0x13
L915:
  915  7F80        NOP
  916  7F80        NOP
  917  4711        IN    0x11,PA7
  918  4D36        OUT   0x36,PA5
  919  4E37        OUT   0x37,PA6
  91A  6632        ZALS  0x32
  91B  6101        ADDS  0x01
  91C  7933        AND   0x33
  91D  5032        SACL  0x32
  91E  0031        ADD   0x31
  91F  7D12        TBLW  0x12
  920  6632        ZALS  0x32
  921  1044        SUB   0x44
  922  7933        AND   0x33
  923  0031        ADD   0x31
  924  6734        TBLR  0x34
  925  6632        ZALS  0x32
  926  1144        SUB   0x44,1
  927  7933        AND   0x33
  928  0031        ADD   0x31
  929  6735        TBLR  0x35
  92A  7F89        ZAC
  92B  6A12        LT    0x12
  92C  6D45        MPY   0x45
  92D  6C35        LTA   0x35
  92E  6D45        MPY   0x45
  92F  7F90        SPAC
  930  5806        SACH  0x06
  931  6034        ADDH  0x34
  932  5836        SACH  0x36
  933  6534        ZALH  0x34
  934  6206        SUBH  0x06
  935  5837        SACH  0x37
  936  2F10        LAC   0x10,15
  937  6A16        LT    0x16
  938  6D24        MPY   0x24
  939  7F8F        APAC
  93A  6C15        LTA   0x15
  93B  6D23        MPY   0x23
  93C  7F8F        APAC
  93D  6C16        LTA   0x16
  93E  5814        SACH  0x14
  93F  7F89        ZAC
  940  6D29        MPY   0x29
  941  7F8F        APAC
  942  6B15        LTD   0x15
  943  6D28        MPY   0x28
  944  7F8F        APAC
  945  6B14        LTD   0x14
  946  6D27        MPY   0x27
  947  7F8F        APAC
  948  6C1B        LTA   0x1B
  949  580D        SACH  0x0D
  94A  2F11        LAC   0x11,15
  94B  6D24        MPY   0x24
  94C  7F8F        APAC
  94D  6B1A        LTD   0x1A
  94E  6D23        MPY   0x23
  94F  7F8F        APAC
  950  6C20        LTA   0x20
  951  581A        SACH  0x1A
  952  2F2C        LAC   0x2C,15
  953  6D24        MPY   0x24
  954  7F8F        APAC
  955  6B1F        LTD   0x1F
  956  6D23        MPY   0x23
  957  7F8F        APAC
  958  6C20        LTA   0x20
  959  581E        SACH  0x1E
  95A  7F89        ZAC
  95B  6D29        MPY   0x29
  95C  7F8F        APAC
  95D  6C1F        LTA   0x1F
  95E  4710        IN    0x10,PA7
  95F  6D28        MPY   0x28
  960  7F8F        APAC
  961  6B1E        LTD   0x1E
  962  6D27        MPY   0x27
  963  7F8F        APAC
  964  7F8F        APAC
  965  5812        SACH  0x12
  966  7F80        NOP
  967  692D        DMOV  0x2D
  968  2F10        LAC   0x10,15
  969  6A16        LT    0x16
  96A  6D24        MPY   0x24
  96B  7F8F        APAC
  96C  6B15        LTD   0x15
  96D  6D23        MPY   0x23
  96E  7F8F        APAC
  96F  7F8F        APAC
  970  5815        SACH  0x15
  971  7F80        NOP
  972  7F80        NOP
  973  7F80        NOP
  974  7F80        NOP
  975  4711        IN    0x11,PA7
  976  4D36        OUT   0x36,PA5
  977  4E37        OUT   0x37,PA6
  978  6632        ZALS  0x32
  979  6101        ADDS  0x01
  97A  7933        AND   0x33
  97B  5032        SACL  0x32
  97C  0031        ADD   0x31
  97D  7D12        TBLW  0x12
  97E  6632        ZALS  0x32
  97F  1044        SUB   0x44
  980  7933        AND   0x33
  981  0031        ADD   0x31
  982  6734        TBLR  0x34
  983  6632        ZALS  0x32
  984  1144        SUB   0x44,1
  985  7933        AND   0x33
  986  0031        ADD   0x31
  987  6735        TBLR  0x35
  988  7F89        ZAC
  989  6A12        LT    0x12
  98A  6D45        MPY   0x45
  98B  6C35        LTA   0x35
  98C  6D45        MPY   0x45
  98D  7F90        SPAC
  98E  5806        SACH  0x06
  98F  6034        ADDH  0x34
  990  5836        SACH  0x36
  991  6534        ZALH  0x34
  992  6206        SUBH  0x06
  993  5837        SACH  0x37
  994  2F11        LAC   0x11,15
  995  6A1B        LT    0x1B
  996  6D24        MPY   0x24
  997  7F8F        APAC
  998  6B1A        LTD   0x1A
  999  6D23        MPY   0x23
  99A  7F8F        APAC
  99B  6C1B        LTA   0x1B
  99C  5819        SACH  0x19
  99D  7F89        ZAC
  99E  6D29        MPY   0x29
  99F  7F8F        APAC
  9A0  6C1A        LTA   0x1A
  9A1  6D28        MPY   0x28
  9A2  7F8F        APAC
  9A3  6B19        LTD   0x19
  9A4  6D27        MPY   0x27
  9A5  7F8F        APAC
  9A6  6C20        LTA   0x20
  9A7  580E        SACH  0x0E
  9A8  2F2C        LAC   0x2C,15
  9A9  6D24        MPY   0x24
  9AA  7F8F        APAC
  9AB  6B1F        LTD   0x1F
  9AC  6D23        MPY   0x23
  9AD  7F8F        APAC
  9AE  7F8F        APAC
  9AF  581E        SACH  0x1E
  9B0  7F89        ZAC
  9B1  6A20        LT    0x20
  9B2  6D29        MPY   0x29
  9B3  7F8F        APAC
  9B4  6C1F        LTA   0x1F
  9B5  6D28        MPY   0x28
  9B6  7F8F        APAC
  9B7  6B1E        LTD   0x1E
  9B8  6D27        MPY   0x27
  9B9  7F8F        APAC
  9BA  7F8F        APAC
  9BB  5812        SACH  0x12
  9BC  4710        IN    0x10,PA7
  9BD  650F        ZALH  0x0F
  9BE  620E        SUBH  0x0E
  9BF  582D        SACH  0x2D
  9C0  690E        DMOV  0x0E
  9C1  F900 08A2   B     L8A2

  9C3  7D85        TBLW  *,AR1
  9C4  CB46        .word 0xCB46
  9C5  0000        ADD   0x00
  9C6  0000        ADD   0x00
  9C7  1B9A        SUB   *-,11
  9C8  3734        .word 0x3734
  9C9  1B9A        SUB   *-,11
  9CA  0000        ADD   0x00
  9CB  0000        ADD   0x00
