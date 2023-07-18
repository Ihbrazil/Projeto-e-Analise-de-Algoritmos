object frmPrincipal: TfrmPrincipal
  Left = 238
  Top = 62
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Eletro - Sistema de Ordena'#231#227'o Interna'
  ClientHeight = 637
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000007F70000000000000000000000
    000007F00F700000000000000000000000007F0100F700000000000000000000
    707FF019100FF700000000700000000777FF01F1F910FFF70880077000000077
    77F091F1F00000FF70887700000007F7070000080FFFFF0F7777F7F000007FFF
    F0FFFF00FFFFFFF070FF7F7F00000FFFFFFFFFF0FFFFFFFF0FFFFFF0000000FF
    FFFFFF1111FFFFFFFFFFFF000000000FF77771999917777FFFFFFFFF00000000
    0000009999000077FFFFFF00000000888000F000700000000FFFF00000000088
    0000F0E070F0E07780000008000000880000F00070F000F78000000770000788
    0000FF0070FF00788000000770000788000007F0707F07F80000008770000788
    0000077070770F700000007700000778800000077700F7800000087700000078
    80000077F777778000000777000000788800008F7F77F8800000877000000077
    88800007FFFF7000000877700000000788887777000077880088770000000000
    7887700000000077888777000000000077700000000000007777700000000000
    000000000000000007777000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3FFFFFF81FFFFDF00FFDFE4003ED76000
    018F8000000F8000001B00000007000000030000000F8000000340000007C000
    000F8000000F86000047860001C3060003C30700078307000F8703800F078380
    0F0781800E0F80000C0FC000001FE00F001FE03FC03FF1FFF03FFFFFF87F}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 200
    Top = 56
    Width = 561
    Height = 473
    Color = clMoneyGreen
    TabOrder = 2
    object Label1: TLabel
      Left = 34
      Top = 0
      Width = 195
      Height = 23
      Caption = 'Inst'#226'ncias de Entrada'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 352
      Top = 0
      Width = 96
      Height = 23
      Caption = 'Ordenados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object memVetorOriginal: TMemo
      Left = 8
      Top = 24
      Width = 265
      Height = 437
      Hint = 'Mostra a Base de Dados Usada pelos M'#233'todos de Ordena'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 0
    end
    object memVetorOrdenado: TMemo
      Left = 288
      Top = 24
      Width = 265
      Height = 435
      Hint = 'Mostra os Dados Ordenados pelo M'#233'todo Escolhido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 808
    Height = 57
    Align = alTop
    Caption = 'M'#233'todos de Ordena'#231#227'o Interna'
    Color = clMedGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clAqua
    Font.Height = -32
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object pnlSelecao: TPanel
    Left = 0
    Top = 56
    Width = 201
    Height = 553
    Color = clOlive
    TabOrder = 0
    object pnlMetodoOrdenacao: TPanel
      Left = 8
      Top = 200
      Width = 185
      Height = 73
      Color = clTeal
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 158
        Height = 18
        Caption = 'M'#233'todo de ordena'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cmbbxTipoAlgoritmo: TComboBox
        Left = 16
        Top = 40
        Width = 145
        Height = 21
        Hint = 'Selecione o M'#233'todo dr Ordena'#231#227'o'
        Enabled = False
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Selecione '
        OnChange = cmbbxTipoAlgoritmoChange
        Items.Strings = (
          'Selecione '
          'BubbleSort'
          'SelectSort'
          'InsertSort'
          'QuickSort'
          'HeapSort'
          'ShellSort'
          'MergeSort')
      end
    end
    object rdgpTipoCaso: TRadioGroup
      Left = 8
      Top = 88
      Width = 185
      Height = 105
      Hint = 'Selecione o Tipo de Caso'
      Caption = 'Tipo de Caso'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      Items.Strings = (
        'Otimista'
        'M'#233'dio'
        'Pessimista')
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object pnlEscolhasFeitas: TPanel
      Tag = 7
      Left = 8
      Top = 392
      Width = 185
      Height = 105
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object lblNumeroElementos: TLabel
        Left = 8
        Top = 78
        Width = 27
        Height = 23
        Caption = '< >'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 60
        Width = 163
        Height = 18
        Caption = 'N'#250'mero de Elementos:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeAlgoritmo: TLabel
        Left = 8
        Top = 30
        Width = 27
        Height = 23
        Caption = '< >'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 12
        Width = 145
        Height = 18
        Caption = 'O Sort selecionado: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlBotoes: TPanel
      Left = 8
      Top = 280
      Width = 185
      Height = 57
      Color = clTeal
      TabOrder = 2
      object btbtnGerar: TButton
        Left = 8
        Top = 16
        Width = 75
        Height = 25
        Caption = '&Gerar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btbtnGerarClick
      end
      object btnExecutar: TButton
        Left = 102
        Top = 16
        Width = 75
        Height = 25
        Hint = 'Clique para Iniciar a Gera'#231#227'o e Ordena'#231#227'o e Ordena'#231#227'o dos Dados'
        Caption = '&Ordenar'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnExecutarClick
      end
    end
    object pnlLimpar: TPanel
      Left = 8
      Top = 344
      Width = 185
      Height = 41
      Color = clTeal
      TabOrder = 4
      object btnLimparTudo: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Hint = 
          'Clique para Limpar e dar  In'#237'cio nova Gera'#231#227'o e Ordena'#231#227'o e Orde' +
          'na'#231#227'o dos Dados'
        Caption = '&Limpar'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnLimparTudoClick
      end
      object btnLimparOrdenados: TButton
        Left = 96
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Limpa Ord.'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnLimparOrdenadosClick
      end
    end
    object pnlNumeroPosicoes: TPanel
      Left = 8
      Top = 8
      Width = 185
      Height = 73
      Color = clTeal
      TabOrder = 5
      object Label4: TLabel
        Left = 8
        Top = 9
        Width = 159
        Height = 18
        Caption = 'N'#250'mero de elementos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbxNumeroPosicoes: TComboBox
        Left = 8
        Top = 36
        Width = 145
        Height = 21
        Hint = 'Selecione o N'#250'mero de elementos'
        ItemHeight = 13
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Selecione'
        OnChange = cbxNumeroPosicoesChange
        OnExit = cbxNumeroPosicoesExit
        Items.Strings = (
          'Selecione'
          '50000'
          '100000'
          '250000'
          '500000'
          '1000000')
      end
    end
    object pnlOpcao: TPanel
      Left = 8
      Top = 504
      Width = 185
      Height = 41
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object chcListar: TCheckBox
        Left = 27
        Top = 14
        Width = 121
        Height = 17
        Caption = 'Exibir Listas'
        TabOrder = 0
      end
    end
  end
  object pnlTempo: TPanel
    Left = 200
    Top = 529
    Width = 609
    Height = 80
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    Color = clMedGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clAqua
    Font.Height = -21
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lblGerar: TLabel
      Left = 8
      Top = 21
      Width = 114
      Height = 23
      Caption = '00:00:00:000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOrdenar: TLabel
      Left = 472
      Top = 21
      Width = 114
      Height = 23
      Caption = '00:00:00:000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 606
    Width = 808
    Height = 31
    Color = clTeal
    Panels = <
      item
        Width = 100
      end
      item
        Text = 
          '        Bruno Rodrigo  -  Isaias Horta Brazil   -  Ernani Guilho' +
          'n  -  Rafael Bispo'
        Width = 550
      end
      item
        Width = 100
      end>
  end
  object Panel5: TPanel
    Left = 753
    Top = 57
    Width = 56
    Height = 472
    Color = clTeal
    TabOrder = 5
  end
  object TimerGerar: TTimer
    Enabled = False
    Interval = -1
    OnTimer = TimerGerarTimer
    Left = 768
    Top = 387
  end
  object TimerOrdenar: TTimer
    Enabled = False
    Interval = -1
    OnTimer = TimerOrdenarTimer
    Left = 768
    Top = 449
  end
  object TimerAtualizarHora: TTimer
    OnTimer = TimerAtualizarHoraTimer
    Left = 768
    Top = 328
  end
end
