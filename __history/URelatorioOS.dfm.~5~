object FRelatorioOS: TFRelatorioOS
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de OS'
  ClientHeight = 496
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object dbgRelatorioOS: TDBGrid
    Left = 0
    Top = 41
    Width = 541
    Height = 393
    Align = alTop
    DataSource = DM.dsRelatorioOS
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MES'
        Title.Alignment = taCenter
        Title.Caption = 'M'#202'S'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNT'
        Title.Alignment = taCenter
        Title.Caption = 'Quant. OS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVG'
        Title.Alignment = taCenter
        Title.Caption = 'M'#233'dia OS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUM'
        Title.Alignment = taCenter
        Title.Caption = 'Somat'#243'rio OS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 127
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 434
    Width = 541
    Height = 53
    Align = alTop
    TabOrder = 1
    object cbPesquisa: TComboBox
      Left = 18
      Top = 14
      Width = 183
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todos'
      OnChange = cbPesquisaChange
      Items.Strings = (
        'Todos'
        'M'#234's igual a'
        'Ano igual a'
        'Ano maior que'
        'Ano menor que'
        'Quant. OS maior que'
        'Quant. OS menor que'
        'M'#233'dia OS maior que'
        'M'#233'dia OS menor que'
        'Somat'#243'rio OS maior que'
        'Somat'#243'rio OS menor que')
    end
    object edtPesquisa: TEdit
      Left = 219
      Top = 14
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 438
      Top = 10
      Width = 83
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesquisarClick
    end
  end
  object pOrdem: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 41
    Align = alTop
    TabOrder = 2
    object lbOrdem: TLabel
      Left = 32
      Top = 10
      Width = 58
      Height = 18
      Caption = 'Ordenar:'
    end
    object cbOrdem: TComboBox
      Left = 114
      Top = 7
      Width = 199
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Mais recente'
      OnChange = cbOrdemChange
      Items.Strings = (
        'Mais recente'
        'Mais antigo'
        'Maior quant. OS'
        'Menor quant. OS'
        'Maior m'#233'dia OS'
        'Menor m'#233'dia OS'
        'Maior somat'#243'rio OS'
        'Menor somat'#243'rio OS')
    end
  end
end
