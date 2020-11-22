object FRelatorioMarca: TFRelatorioMarca
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio das Marcas de ve'#237'culos'
  ClientHeight = 425
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object dbgRelatorioMarca: TDBGrid
    Left = 0
    Top = 0
    Width = 824
    Height = 318
    Align = alTop
    DataSource = DM.dsRelatorioMarca
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PKCODMARCA'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. '
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEMARCA'
        Title.Alignment = taCenter
        Title.Caption = 'NOME DA MARCA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 334
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
        Width = 105
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
        Width = 139
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 318
    Width = 824
    Height = 53
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -3
    ExplicitTop = 369
    ExplicitWidth = 690
    object cbPesquisa: TComboBox
      Left = 36
      Top = 13
      Width = 149
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todos'
      OnChange = cbPesquisaChange
      Items.Strings = (
        'Todos'
        'C'#243'digo igual a'
        'Nome iniciando por')
    end
    object edtPesquisa: TEdit
      Left = 214
      Top = 14
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 470
      Top = 9
      Width = 83
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesquisarClick
    end
  end
end
