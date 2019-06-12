object DesForm: TDesForm
  Left = 222
  Top = 157
  Width = 704
  Height = 521
  Caption = 'DES'#21152#23494#35299#23494#28436#31034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object MainPage: TPageControl
    Left = 0
    Top = 0
    Width = 696
    Height = 494
    ActivePage = TabSheet3
    Align = alClient
    TabIndex = 3
    TabOrder = 0
    TabWidth = 100
    object TabSheet1: TTabSheet
      Caption = #25991#20214#21152#23494
      DesignSize = (
        688
        466)
      object Label1: TLabel
        Left = 32
        Top = 29
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #28304#25991#20214
      end
      object Label2: TLabel
        Left = 18
        Top = 67
        Width = 97
        Height = 13
        AutoSize = False
        Caption = #30446#26631#25991#20214
      end
      object Label31: TLabel
        Left = 44
        Top = 99
        Width = 39
        Height = 13
        AutoSize = False
        Caption = #23494#30721
      end
      object txtSourcePath: TEdit
        Left = 80
        Top = 24
        Width = 524
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object txtDestPath: TEdit
        Left = 80
        Top = 64
        Width = 524
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object CmdEncrypt: TBitBtn
        Left = 459
        Top = 434
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #21152#23494
        ModalResult = 4
        TabOrder = 2
        OnClick = CmdEncryptClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000324334222222443333388F3833333388F333
          000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
          F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
          223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
          3338888300003AAAAAAA33333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          00003A444333333A22222438888F333338F3333800003A2243333333A2222438
          F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
          22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
          33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object CmdUncode: TBitBtn
        Left = 534
        Top = 434
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #35299#23494
        ModalResult = 4
        TabOrder = 3
        OnClick = CmdUncodeClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          04000000000068010000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000394334999999443333388F3833333388F333
          000039944999999999433338F8833FFFFF338F33000039999997777799943338
          F333F88888F338F3000039999973333379994338F33F8333338F338F00003999
          9933333337994338F33833333338F38F000039999993333337444338FFFF8F33
          3338888300003777777733333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          000037444333333799999438888F333338F33338000037994333333379999438
          F38F3333338333380000337994333334499994338338FFFFF883333800003379
          99444449999994338F3388888333FF3800003337999999999977943338FF3333
          33FF88F80000333377999999773373333388FFFFFF8833830000333333777777
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object cmdClose: TBitBtn
        Left = 610
        Top = 434
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #36864#20986
        TabOrder = 4
        Kind = bkClose
      end
      object cmdSourcePath: TButton
        Left = 611
        Top = 23
        Width = 65
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #27983#35272
        TabOrder = 5
        OnClick = cmdSourcePathClick
      end
      object cmdDestPath: TButton
        Left = 611
        Top = 63
        Width = 65
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #27983#35272
        TabOrder = 6
        OnClick = cmdDestPathClick
      end
      object txtPassWord: TEdit
        Left = 80
        Top = 96
        Width = 97
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 8
        TabOrder = 7
      end
    end
    object TabSheet2: TTabSheet
      Caption = #23494#38053
      ImageIndex = 1
      object Label3: TLabel
        Left = 96
        Top = 16
        Width = 41
        Height = 13
        AutoSize = False
        Caption = #39640#31471
      end
      object Label4: TLabel
        Left = 480
        Top = 0
        Width = 41
        Height = 13
        AutoSize = False
        Caption = '7-0'
      end
      object Label5: TLabel
        Left = 144
        Top = 0
        Width = 41
        Height = 13
        AutoSize = False
        Caption = '63-56'
      end
      object Label6: TLabel
        Left = 192
        Top = 0
        Width = 41
        Height = 13
        AutoSize = False
        Caption = '55-48'
      end
      object Label7: TLabel
        Left = 240
        Top = 0
        Width = 41
        Height = 13
        AutoSize = False
        Caption = '47-40'
      end
      object Label8: TLabel
        Left = 288
        Top = 0
        Width = 41
        Height = 13
        AutoSize = False
        Caption = '39-32'
      end
      object Label9: TLabel
        Left = 336
        Top = 0
        Width = 41
        Height = 13
        AutoSize = False
        Caption = '31-24'
      end
      object Label10: TLabel
        Left = 384
        Top = 0
        Width = 41
        Height = 13
        AutoSize = False
        Caption = '23-16'
      end
      object Label11: TLabel
        Left = 432
        Top = 0
        Width = 41
        Height = 13
        AutoSize = False
        Caption = '15-8'
      end
      object Label12: TLabel
        Left = 520
        Top = 16
        Width = 41
        Height = 13
        AutoSize = False
        Caption = #20302#31471
      end
      object Label13: TLabel
        Left = 42
        Top = 46
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#19968
      end
      object Label14: TLabel
        Left = 42
        Top = 70
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#20108
      end
      object Label15: TLabel
        Left = 42
        Top = 94
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#19977
      end
      object Label16: TLabel
        Left = 42
        Top = 118
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#22235
      end
      object Label17: TLabel
        Left = 42
        Top = 142
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#20116
      end
      object Label18: TLabel
        Left = 42
        Top = 166
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#20845
      end
      object Label19: TLabel
        Left = 42
        Top = 190
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#19971
      end
      object Label20: TLabel
        Left = 42
        Top = 214
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#20843
      end
      object Label21: TLabel
        Left = 42
        Top = 238
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#20061
      end
      object Label22: TLabel
        Left = 42
        Top = 262
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#21313
      end
      object Label23: TLabel
        Left = 26
        Top = 286
        Width = 71
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#21313#19968
      end
      object Label24: TLabel
        Left = 26
        Top = 310
        Width = 79
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#21313#20108
      end
      object Label25: TLabel
        Left = 26
        Top = 334
        Width = 79
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#21313#19977
      end
      object Label26: TLabel
        Left = 26
        Top = 358
        Width = 79
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#21313#22235
      end
      object Label27: TLabel
        Left = 26
        Top = 382
        Width = 79
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#21313#20116
      end
      object Label28: TLabel
        Left = 26
        Top = 406
        Width = 79
        Height = 13
        AutoSize = False
        Caption = #23376#23494#38053#21313#20845
      end
      object txtSubKey8: TEdit
        Left = 136
        Top = 16
        Width = 41
        Height = 21
        MaxLength = 3
        TabOrder = 0
        Text = '1'
        OnEnter = txtSubKeyEnter
        OnExit = txtSubKeyExit
      end
      object txtSubKey7: TEdit
        Left = 184
        Top = 16
        Width = 41
        Height = 21
        MaxLength = 3
        TabOrder = 1
        Text = '1'
        OnEnter = txtSubKeyEnter
        OnExit = txtSubKeyExit
      end
      object txtSubKey6: TEdit
        Left = 232
        Top = 16
        Width = 41
        Height = 21
        MaxLength = 3
        TabOrder = 2
        Text = '1'
        OnEnter = txtSubKeyEnter
        OnExit = txtSubKeyExit
      end
      object txtSubKey5: TEdit
        Left = 280
        Top = 16
        Width = 41
        Height = 21
        MaxLength = 3
        TabOrder = 3
        Text = '1'
        OnEnter = txtSubKeyEnter
        OnExit = txtSubKeyExit
      end
      object txtSubKey4: TEdit
        Left = 328
        Top = 16
        Width = 41
        Height = 21
        MaxLength = 3
        TabOrder = 4
        Text = '1'
        OnEnter = txtSubKeyEnter
        OnExit = txtSubKeyExit
      end
      object txtSubKey3: TEdit
        Left = 376
        Top = 16
        Width = 41
        Height = 21
        MaxLength = 3
        TabOrder = 5
        Text = '1'
        OnEnter = txtSubKeyEnter
        OnExit = txtSubKeyExit
      end
      object txtSubKey2: TEdit
        Left = 424
        Top = 16
        Width = 41
        Height = 21
        MaxLength = 3
        TabOrder = 6
        Text = '1'
        OnEnter = txtSubKeyEnter
        OnExit = txtSubKeyExit
      end
      object txtSubKey1: TEdit
        Left = 472
        Top = 16
        Width = 41
        Height = 21
        MaxLength = 3
        TabOrder = 7
        Text = '1'
        OnEnter = txtSubKeyEnter
        OnExit = txtSubKeyExit
      end
      object txtKey1: TEdit
        Left = 104
        Top = 43
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 8
      end
      object txtKey2: TEdit
        Left = 104
        Top = 67
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 9
      end
      object txtKey3: TEdit
        Left = 104
        Top = 91
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 10
      end
      object txtKey4: TEdit
        Left = 104
        Top = 115
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 11
      end
      object txtKey5: TEdit
        Left = 104
        Top = 139
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 12
      end
      object txtKey6: TEdit
        Left = 104
        Top = 163
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 13
      end
      object txtKey7: TEdit
        Left = 104
        Top = 187
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 14
      end
      object txtKey8: TEdit
        Left = 104
        Top = 211
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 15
      end
      object txtKey9: TEdit
        Left = 104
        Top = 235
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 16
      end
      object txtKey10: TEdit
        Left = 104
        Top = 259
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 17
      end
      object txtKey11: TEdit
        Left = 104
        Top = 283
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 18
      end
      object txtKey12: TEdit
        Left = 104
        Top = 307
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 19
      end
      object txtKey13: TEdit
        Left = 104
        Top = 331
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 20
      end
      object txtKey14: TEdit
        Left = 104
        Top = 355
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 21
      end
      object txtKey15: TEdit
        Left = 104
        Top = 379
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 22
      end
      object txtKey16: TEdit
        Left = 104
        Top = 403
        Width = 440
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 23
      end
      object CmdGetKey: TBitBtn
        Left = 562
        Top = 12
        Width = 81
        Height = 25
        Caption = #38543#26426#23494#38053
        TabOrder = 24
        OnClick = CmdGetKeyClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
          3333333333333FF3333333330000333333364463333333333333388F33333333
          00003333333E66433333333333338F38F3333333000033333333E66333333333
          33338FF8F3333333000033333333333333333333333338833333333300003333
          3333446333333333333333FF3333333300003333333666433333333333333888
          F333333300003333333E66433333333333338F38F333333300003333333E6664
          3333333333338F38F3333333000033333333E6664333333333338F338F333333
          0000333333333E6664333333333338F338F3333300003333344333E666433333
          333F338F338F3333000033336664333E664333333388F338F338F33300003333
          E66644466643333338F38FFF8338F333000033333E6666666663333338F33888
          3338F3330000333333EE666666333333338FF33333383333000033333333EEEE
          E333333333388FFFFF8333330000333333333333333333333333388888333333
          0000}
        NumGlyphs = 2
      end
      object RadioGroup1: TRadioGroup
        Left = 560
        Top = 48
        Width = 113
        Height = 65
        Caption = #23376#23494#38053#29983#25104#26041#24335
        TabOrder = 25
      end
      object RB1: TRadioButton
        Left = 568
        Top = 64
        Width = 89
        Height = 17
        Caption = #26631#20934
        Checked = True
        TabOrder = 26
        TabStop = True
        OnClick = RBClick
      end
      object RB2: TRadioButton
        Left = 568
        Top = 88
        Width = 89
        Height = 17
        Caption = #30452#25509#31227#20301
        TabOrder = 27
        OnClick = RBClick
      end
    end
    object TabSheet4: TTabSheet
      Caption = #21021#22987#32622#25442#34920
      ImageIndex = 3
      object Label29: TLabel
        Left = 32
        Top = 24
        Width = 81
        Height = 13
        AutoSize = False
        Caption = #21021#22987#32622#25442#34920
      end
      object Label30: TLabel
        Left = 64
        Top = 192
        Width = 49
        Height = 13
        AutoSize = False
        Caption = #36870#34920
      end
      object Button1: TButton
        Left = 400
        Top = 24
        Width = 75
        Height = 25
        Caption = #38543#26426'IP'#34920
        TabOrder = 0
        OnClick = Button1Click
      end
      object SGIP: TStringGrid
        Left = 112
        Top = 24
        Width = 257
        Height = 145
        ColCount = 8
        DefaultColWidth = 30
        DefaultRowHeight = 16
        Enabled = False
        FixedCols = 0
        RowCount = 8
        FixedRows = 0
        TabOrder = 1
      end
      object SGIPR: TStringGrid
        Left = 112
        Top = 184
        Width = 257
        Height = 145
        ColCount = 8
        DefaultColWidth = 30
        DefaultRowHeight = 16
        Enabled = False
        FixedCols = 0
        RowCount = 8
        FixedRows = 0
        TabOrder = 2
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21152'/'#35299#23494#28436#31034
      ImageIndex = 2
      DesignSize = (
        688
        466)
      object Label32: TLabel
        Left = 16
        Top = 44
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #21152#23494#21069
      end
      object Label33: TLabel
        Left = 16
        Top = 68
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #21152#23494#21518
      end
      object Label34: TLabel
        Left = 16
        Top = 92
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #35299#23494#21518
      end
      object Label35: TLabel
        Left = 16
        Top = 160
        Width = 225
        Height = 13
        AutoSize = False
        Caption = #21152'/'#35299#23494#36807#31243#20013#30340'L[i]'#21644'R[i]'#25968#25454
      end
      object CmdGetP: TButton
        Left = 16
        Top = 8
        Width = 121
        Height = 25
        Caption = #21462#26126#25991#21040'L0R0'
        TabOrder = 0
        OnClick = CmdGetPClick
      end
      object CmdEncryptTrans: TButton
        Left = 152
        Top = 8
        Width = 121
        Height = 25
        Caption = #32463#36807'16'#27425#21464#25442
        TabOrder = 1
        OnClick = CmdEncryptTransClick
      end
      object CmdShowCode: TButton
        Left = 288
        Top = 8
        Width = 121
        Height = 25
        Caption = #36716#25104#23494#25991
        TabOrder = 2
        OnClick = CmdShowCodeClick
      end
      object txtBinSrc: TEdit
        Left = 71
        Top = 40
        Width = 434
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 3
      end
      object txtBinCode: TEdit
        Left = 71
        Top = 64
        Width = 434
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 4
      end
      object txtBinUnCode: TEdit
        Left = 71
        Top = 88
        Width = 434
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 5
      end
      object CmdGetC: TButton
        Left = 16
        Top = 120
        Width = 121
        Height = 25
        Caption = #21462#23494#25991#21040'L0R0'
        TabOrder = 6
        OnClick = CmdGetCClick
      end
      object CmdDecryptTrans: TButton
        Left = 152
        Top = 120
        Width = 121
        Height = 25
        Caption = #32463#36807'16'#27425#21464#25442
        TabOrder = 7
        OnClick = CmdDecryptTransClick
      end
      object CmdShowText: TButton
        Left = 288
        Top = 120
        Width = 121
        Height = 25
        Caption = #36716#25104#26126#25991
        TabOrder = 8
        OnClick = CmdShowTextClick
      end
      object Memo1: TMemo
        Left = 16
        Top = 176
        Width = 665
        Height = 249
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = cl3DLight
        ScrollBars = ssBoth
        TabOrder = 9
      end
      object txtDestText: TEdit
        Left = 512
        Top = 88
        Width = 105
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 10
      end
      object txtSrcText: TEdit
        Left = 512
        Top = 40
        Width = 105
        Height = 21
        MaxLength = 8
        TabOrder = 11
        Text = '12345678'
      end
      object txtCodeText: TEdit
        Left = 512
        Top = 64
        Width = 105
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 12
      end
      object CmdDoAll: TButton
        Left = 504
        Top = 120
        Width = 121
        Height = 25
        Caption = #33258#21160#25191#34892#20840#36807#31243
        TabOrder = 13
        OnClick = CmdDoAllClick
      end
      object CmdClearLog: TButton
        Left = 600
        Top = 432
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #28165#31354#35760#24405
        TabOrder = 14
        OnClick = CmdClearLogClick
      end
    end
  end
  object OpenDlg: TOpenDialog
    Left = 624
  end
end
