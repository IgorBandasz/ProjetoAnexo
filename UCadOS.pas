unit UCadOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Mask,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Datasnap.DBClient;

type
  TFCadOS = class(TForm)
    pBotoes: TPanel;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    dbgServicos: TDBGrid;
    pDados: TPanel;
    lbCodigo: TLabel;
    lbData: TLabel;
    lbPlaca: TLabel;
    lbValor: TLabel;
    lbCliente: TLabel;
    lbNomeCliente: TLabel;
    lbFkCodVeiculo: TLabel;
    lbCod: TLabel;
    edtPkCodOS: TEdit;
    medtDataOs: TMaskEdit;
    medtPlacaVeiculo: TMaskEdit;
    edtFkCodCli: TEdit;
    btProcuraCliente: TBitBtn;
    lbValorTotal: TLabel;
    cdTbRelProdutoOS: TClientDataSet;
    dsCdTbRelProdutoOS: TDataSource;
    pInsereProduto: TPanel;
    lbCodProd: TLabel;
    lbnomeprod: TLabel;
    lbQuantidade: TLabel;
    lbValorUnit: TLabel;
    edtfkcodprod: TEdit;
    edtNomeProduto: TEdit;
    edtQuantidade: TEdit;
    edtValorUnit: TEdit;
    cdTbRelServicoOS: TClientDataSet;
    dsCdTbRelServicoOS: TDataSource;
    DBGrid1: TDBGrid;
    pInsereServico: TPanel;
    lbCodServ: TLabel;
    edtFkCodServico: TEdit;
    lbDescricaoServ: TLabel;
    edtDescricaoServico: TEdit;
    lbValorServ: TLabel;
    edtValorServico: TEdit;
    btAdicionarServico: TBitBtn;
    BitBtn1: TBitBtn;
    procedure edtFkCodCliChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadOS: TFCadOS;

implementation

{$R *.dfm}

uses UDM;

procedure TFCadOS.edtFkCodCliChange(Sender: TObject);
var
 x:string;
begin
   x:=Trim(edtFkCodCli.Text);
   if x='' then
   begin
     lbNomeCliente.Caption:='';
     Exit;
   end;
   x := STbCliente+' where pkcodcli='+x;
   DM.executaSQl(x,DM.SqlGeral);
   if DM.SqlGeral.FieldByName('pkcodcli').AsString='' then
   begin
     ShowMessage('Cliente com este código não encontrado');
     if edtFkCodCli.CanFocus then
       edtFkCodCli.SetFocus;
     Exit;
   end;
   lbNomeCliente.Caption := DM.SqlGeral.FieldByName('nomecli').AsString;
end;

end.
