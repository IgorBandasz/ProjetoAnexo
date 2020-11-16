unit ULocOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFLocOS = class(TForm)
    pBotoes: TPanel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btRemover: TBitBtn;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    btSair: TBitBtn;
    dbgServicos: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    pDados: TPanel;
    lbCodigo: TLabel;
    lbData: TLabel;
    edtPkCodVeiculo: TEdit;
    medtDataOs: TMaskEdit;
    lbPlaca: TLabel;
    medtPlacaVeiculo: TMaskEdit;
    edtValorTotal: TEdit;
    lbValor: TLabel;
    lbCliente: TLabel;
    edtFkCodCli: TEdit;
    btProcuraCliente: TBitBtn;
    lbNomeCliente: TLabel;
    dbedtPkCodOS: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLocOS: TFLocOS;

implementation

{$R *.dfm}

uses UDM;

end.
