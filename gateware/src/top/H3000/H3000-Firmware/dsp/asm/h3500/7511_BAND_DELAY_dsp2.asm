; Eventide h3500 DSP microcode
; key 7511  algorithm 75 (BAND DELAY)  DSP 2
; source H3000-Upgrade_ROM4.BIN offset 0B8E7, 231 program words loaded at 800
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
  80C  506D        SACL  0x6D
  80D  296D        LAC   0x6D,9
  80E  5071        SACL  0x71
  80F  2F6D        LAC   0x6D,15
  810  5070        SACL  0x70
  811  7F89        ZAC
  812  506C        SACL  0x6C
  813  106D        SUB   0x6D
  814  586E        SACH  0x6E
  815  7EFF        LACK  0xFF
  816  5072        SACL  0x72
  817  2772        LAC   0x72,7
  818  7A72        OR    0x72
  819  506F        SACL  0x6F
  81A  F800 0888   CALL  L888
  81C  6881        LARP  1
L81D:
  81D  F600 0821   BIOZ  L821
  81F  F900 081D   B     L81D

L821:
  821  4072        IN    0x72,PA0
  822  6572        ZALH  0x72
  823  FD00 0826   BGEZ  L826
  825  7F80        NOP
L826:
  826  F600 0826   BIOZ  L826
L828:
  828  4572        IN    0x72,PA5
  829  3972        LAR   AR1,0x72
  82A  4681        IN    *,PA6,AR1
  82B  655B        ZALH  0x5B
  82C  6D5A        MPY   0x5A
  82D  6C5A        LTA   0x5A
  82E  7F8F        APAC
  82F  585B        SACH  0x5B
  830  655D        ZALH  0x5D
  831  6D02        MPY   0x02
  832  7F8F        APAC
  833  6C01        LTA   0x01
  834  625B        SUBH  0x5B
  835  585C        SACH  0x5C
  836  6D5C        MPY   0x5C
  837  7F8E        PAC
  838  445D        IN    0x5D,PA4
  839  6C07        LTA   0x07
  83A  605A        ADDH  0x5A
  83B  585A        SACH  0x5A
  83C  4461        IN    0x61,PA4
  83D  655F        ZALH  0x5F
  83E  6D5E        MPY   0x5E
  83F  6C5E        LTA   0x5E
  840  4465        IN    0x65,PA4
  841  7F8F        APAC
  842  585F        SACH  0x5F
  843  6561        ZALH  0x61
  844  4469        IN    0x69,PA4
  845  6D08        MPY   0x08
  846  7F8F        APAC
  847  6C07        LTA   0x07
  848  625F        SUBH  0x5F
  849  5860        SACH  0x60
  84A  6D60        MPY   0x60
  84B  7F8E        PAC
  84C  6C0D        LTA   0x0D
  84D  605E        ADDH  0x5E
  84E  585E        SACH  0x5E
  84F  6563        ZALH  0x63
  850  6D62        MPY   0x62
  851  6C62        LTA   0x62
  852  7F8F        APAC
  853  5863        SACH  0x63
  854  6565        ZALH  0x65
  855  6D0E        MPY   0x0E
  856  7F8F        APAC
  857  6C0D        LTA   0x0D
  858  6263        SUBH  0x63
  859  5864        SACH  0x64
  85A  6D64        MPY   0x64
  85B  7F8E        PAC
  85C  6C13        LTA   0x13
  85D  6062        ADDH  0x62
  85E  5862        SACH  0x62
  85F  6567        ZALH  0x67
  860  6D66        MPY   0x66
  861  6C66        LTA   0x66
  862  7F8F        APAC
  863  496A        OUT   0x6A,PA1
  864  5867        SACH  0x67
  865  6569        ZALH  0x69
  866  496B        OUT   0x6B,PA1
  867  6D14        MPY   0x14
  868  7F8F        APAC
  869  6C13        LTA   0x13
  86A  6267        SUBH  0x67
  86B  5868        SACH  0x68
  86C  6D68        MPY   0x68
  86D  7F8E        PAC
  86E  6C03        LTA   0x03
  86F  6066        ADDH  0x66
  870  5866        SACH  0x66
  871  7F89        ZAC
  872  6D5A        MPY   0x5A
  873  6C09        LTA   0x09
  874  6D5E        MPY   0x5E
  875  6C0F        LTA   0x0F
  876  6D62        MPY   0x62
  877  6C15        LTA   0x15
  878  6D66        MPY   0x66
  879  6C04        LTA   0x04
  87A  586A        SACH  0x6A
  87B  7F89        ZAC
  87C  6D5A        MPY   0x5A
  87D  6C0A        LTA   0x0A
  87E  6D5E        MPY   0x5E
  87F  6C10        LTA   0x10
  880  6D62        MPY   0x62
  881  6C16        LTA   0x16
  882  6D66        MPY   0x66
  883  6C01        LTA   0x01
  884  586B        SACH  0x6B
  885  7F80        NOP
  886  F900 0828   B     L828

L888:
  888  666F        ZALS  0x6F
  889  5073        SACL  0x73
L88A:
  88A  F600 088E   BIOZ  L88E
  88C  F900 088A   B     L88A

L88E:
  88E  4072        IN    0x72,PA0
  88F  6572        ZALH  0x72
  890  FD00 0893   BGEZ  L893
  892  7F80        NOP
L893:
  893  F600 0893   BIOZ  L893
L895:
  895  4572        IN    0x72,PA5
  896  3972        LAR   AR1,0x72
  897  4681        IN    *,PA6,AR1
  898  7F80        NOP
  899  7F80        NOP
  89A  7F80        NOP
  89B  7F80        NOP
  89C  7F80        NOP
  89D  7F80        NOP
  89E  6673        ZALS  0x73
  89F  616D        ADDS  0x6D
  8A0  5073        SACL  0x73
  8A1  4F73        OUT   0x73,PA7
  8A2  616D        ADDS  0x6D
  8A3  5073        SACL  0x73
  8A4  4F73        OUT   0x73,PA7
  8A5  616D        ADDS  0x6D
  8A6  5073        SACL  0x73
  8A7  4F73        OUT   0x73,PA7
  8A8  616D        ADDS  0x6D
  8A9  5073        SACL  0x73
  8AA  4F73        OUT   0x73,PA7
  8AB  616D        ADDS  0x6D
  8AC  5073        SACL  0x73
  8AD  4F73        OUT   0x73,PA7
  8AE  616D        ADDS  0x6D
  8AF  5073        SACL  0x73
  8B0  4F73        OUT   0x73,PA7
  8B1  616D        ADDS  0x6D
  8B2  5073        SACL  0x73
  8B3  4F73        OUT   0x73,PA7
  8B4  616D        ADDS  0x6D
  8B5  5073        SACL  0x73
  8B6  4F73        OUT   0x73,PA7
  8B7  616D        ADDS  0x6D
  8B8  5073        SACL  0x73
  8B9  4F73        OUT   0x73,PA7
  8BA  616D        ADDS  0x6D
  8BB  5073        SACL  0x73
  8BC  4F73        OUT   0x73,PA7
  8BD  616D        ADDS  0x6D
  8BE  5073        SACL  0x73
  8BF  4F73        OUT   0x73,PA7
  8C0  616D        ADDS  0x6D
  8C1  5073        SACL  0x73
  8C2  4F73        OUT   0x73,PA7
  8C3  616D        ADDS  0x6D
  8C4  5073        SACL  0x73
  8C5  4F73        OUT   0x73,PA7
  8C6  616D        ADDS  0x6D
  8C7  5073        SACL  0x73
  8C8  4F73        OUT   0x73,PA7
  8C9  616D        ADDS  0x6D
  8CA  5073        SACL  0x73
  8CB  4F73        OUT   0x73,PA7
  8CC  616D        ADDS  0x6D
  8CD  5073        SACL  0x73
  8CE  4F73        OUT   0x73,PA7
  8CF  616D        ADDS  0x6D
  8D0  5073        SACL  0x73
  8D1  4F73        OUT   0x73,PA7
  8D2  616D        ADDS  0x6D
  8D3  5073        SACL  0x73
  8D4  4F73        OUT   0x73,PA7
  8D5  616D        ADDS  0x6D
  8D6  5073        SACL  0x73
  8D7  4F73        OUT   0x73,PA7
  8D8  616D        ADDS  0x6D
  8D9  5073        SACL  0x73
  8DA  4F73        OUT   0x73,PA7
  8DB  616D        ADDS  0x6D
  8DC  5073        SACL  0x73
  8DD  4F73        OUT   0x73,PA7
  8DE  7F80        NOP
  8DF  7F80        NOP
  8E0  7F80        NOP
  8E1  7F80        NOP
  8E2  7F80        NOP
  8E3  2073        LAC   0x73
  8E4  FA00 0895   BLZ   L895
  8E6  7F8D        RET

