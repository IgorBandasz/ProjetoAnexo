object FLocOS: TFLocOS
  Left = 0
  Top = 0
  Caption = 'FLocOS'
  ClientHeight = 534
  ClientWidth = 839
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 18
  object pBotoes: TPanel
    Left = 0
    Top = 169
    Width = 839
    Height = 63
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = -23
    ExplicitTop = 113
    ExplicitWidth = 705
    object btNovo: TBitBtn
      Left = 106
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Novo'
      TabOrder = 0
    end
    object btAlterar: TBitBtn
      Left = 213
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Alterar'
      TabOrder = 1
    end
    object btRemover: TBitBtn
      Left = 323
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Remover'
      TabOrder = 2
    end
    object btSalvar: TBitBtn
      Left = 433
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Salvar'
      TabOrder = 3
    end
    object btCancelar: TBitBtn
      Left = 547
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Cancelar'
      TabOrder = 4
    end
    object btSair: TBitBtn
      Left = 661
      Top = 11
      Width = 83
      Height = 42
      Caption = 'Sair'
      TabOrder = 5
    end
  end
  object dbgServicos: TDBGrid
    Left = 0
    Top = 232
    Width = 839
    Height = 249
    Align = alBottom
    DataSource = DM.dsOS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'PKCODOS'
        Title.Caption = 'C'#243'd.'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FKCODCLI'
        Title.Caption = 'C'#243'd. CLIENTE'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMECLI'
        Title.Caption = 'NOME DO CLIENTE'
        Width = 347
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACAVEICULO'
        Title.Alignment = taCenter
        Title.Caption = 'PLACA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAOS'
        Title.Alignment = taCenter
        Title.Caption = 'DATA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORTOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR TOTAL'
        Width = 124
        Visible = True
      end>
  end
  object pListagem: TPanel
    Left = 0
    Top = 481
    Width = 839
    Height = 53
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -23
    ExplicitTop = 392
    ExplicitWidth = 705
    object cbPesquisa: TComboBox
      Left = 113
      Top = 14
      Width = 155
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todos'
      Items.Strings = (
        'Todos'
        'C'#243'digo igual a'
        'Placa iniciando por'
        'Marca iniciando por')
    end
    object edtPesquisa: TEdit
      Left = 307
      Top = 15
      Width = 201
      Height = 26
      TabOrder = 1
    end
    object btPesquisar: TBitBtn
      Left = 547
      Top = 10
      Width = 83
      Height = 35
      Caption = 'Pesquisar'
      TabOrder = 2
    end
  end
  object pDados: TPanel
    Left = 3
    Top = 8
    Width = 830
    Height = 148
    TabOrder = 3
    object lbCodigo: TLabel
      Left = 84
      Top = 11
      Width = 30
      Height = 18
      Caption = 'C'#243'd:'
    end
    object lbData: TLabel
      Left = 268
      Top = 107
      Width = 36
      Height = 18
      Caption = 'Data:'
    end
    object lbPlaca: TLabel
      Left = 76
      Top = 107
      Width = 38
      Height = 18
      Caption = 'Placa:'
    end
    object lbValor: TLabel
      Left = 470
      Top = 107
      Width = 75
      Height = 18
      Caption = 'Valor Total:'
    end
    object lbCliente: TLabel
      Left = 32
      Top = 59
      Width = 82
      Height = 18
      Caption = 'C'#243'd. Cliente:'
    end
    object lbNomeCliente: TLabel
      Left = 268
      Top = 59
      Width = 91
      Height = 18
      Caption = 'lbNomeCliente'
    end
    object edtPkCodVeiculo: TEdit
      Left = 129
      Top = 8
      Width = 72
      Height = 26
      Enabled = False
      TabOrder = 0
    end
    object medtDataOs: TMaskEdit
      Left = 321
      Top = 104
      Width = 86
      Height = 26
      EditMask = '!90/90/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object medtPlacaVeiculo: TMaskEdit
      Left = 129
      Top = 104
      Width = 70
      Height = 26
      EditMask = '>LLL-0A00;1;_'
      MaxLength = 8
      TabOrder = 2
      Text = '   -    '
    end
    object edtValorTotal: TEdit
      Left = 555
      Top = 104
      Width = 121
      Height = 26
      TabOrder = 3
      Text = 'edtValorTotal'
    end
    object edtFkCodCli: TEdit
      Left = 129
      Top = 56
      Width = 86
      Height = 26
      TabOrder = 4
      Text = 'edtFkCodCli'
    end
    object btProcuraCliente: TBitBtn
      Left = 221
      Top = 57
      Width = 28
      Height = 25
      Caption = '...'
      TabOrder = 5
    end
    object dbedtPkCodOS: TDBEdit
      Left = 712
      Top = 11
      Width = 74
      Height = 26
      DataField = 'PKCODOS'
      DataSource = DM.dsOS
      TabOrder = 6
    end
  end
end
