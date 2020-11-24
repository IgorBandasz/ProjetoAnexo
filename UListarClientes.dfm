object FListarClientes: TFListarClientes
  Left = 0
  Top = 0
  Caption = 'Lista de Clientes'
  ClientHeight = 460
  ClientWidth = 717
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
  object lbInstrucao: TLabel
    Left = 24
    Top = 8
    Width = 330
    Height = 19
    Caption = 'Duplo clique no cliente para seleciona-lo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgClientes: TDBGrid
    Left = 0
    Top = 40
    Width = 717
    Height = 367
    Align = alBottom
    DataSource = DM.dsCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDblClick = dbgClientesDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PKCODCLI'
        Title.Caption = 'C'#243'd.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMECLI'
        Title.Caption = 'NOME DO CLIENTE'
        Width = 457
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FONECLI'
        Title.Caption = 'TELEFONE'
        Width = 125
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 407
    Width = 717
    Height = 53
    Align = alBottom
    TabOrder = 1
    object cbPesquisa: TComboBox
      Left = 86
      Top = 14
      Width = 145
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
      Left = 272
      Top = 14
      Width = 201
      Height = 26
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
    object btPesquisar: TBitBtn
      Left = 520
      Top = 9
      Width = 83
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesquisarClick
    end
  end
end
