object FRelatorioServico: TFRelatorioServico
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Servi'#231'os'
  ClientHeight = 597
  ClientWidth = 926
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
  object dbgRelatorioServico: TDBGrid
    Left = 0
    Top = 41
    Width = 926
    Height = 481
    Align = alTop
    DataSource = DM.dsRelatorioServ
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PKCODSERVICO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAOSERVICO'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DO  SERVI'#199'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 529
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORBASE'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNT'
        Title.Alignment = taCenter
        Title.Caption = 'Quant. Realizada'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 156
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 522
    Width = 926
    Height = 53
    Align = alTop
    TabOrder = 1
    object cbPesquisa: TComboBox
      Left = 88
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
        'C'#243'digo igual a'
        'Nome iniciando por'
        'Valor acima de'
        'Valor abaixo de'
        'Quant. utilizada maior que'
        'Quant. utilizada menor que')
    end
    object edtPesquisa: TEdit
      Left = 304
      Top = 15
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 560
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
    Width = 926
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
      Text = 'A-Z'
      OnChange = cbOrdemChange
      Items.Strings = (
        'A-Z'
        'Z-A'
        'Menor c'#243'digo'
        'Maior c'#243'digo'
        'Maior valor'
        'Menor valor'
        'Maior quant. realizada'
        'Menor quant. realizada')
    end
  end
end
