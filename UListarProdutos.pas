unit UListarProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFListarProdutos = class(TForm)
    dbgProdutos: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    lbInstrucao: TLabel;
    pOrdem: TPanel;
    lbOrdem: TLabel;
    cbOrdem: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure cbPesquisaChange(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure cbOrdemChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListarProdutos: TFListarProdutos;

implementation

{$R *.dfm}

uses UDM, UCadOS;

procedure TFListarProdutos.btPesquisarClick(Sender: TObject);
var
  comando, condicao, ordem : string;
begin
  comando := STbProduto;
  condicao := Trim(edtPesquisa.Text);
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodprod ='+condicao;
      2: condicao := ' where upper(nomeprod) like upper('+QuotedStr(condicao+'%')+')';
      3: condicao := ' where valorvendaprod >'+DM.limpaVir(condicao);
      4: condicao := ' where valorvendaprod <'+DM.limpaVir(condicao);
    end;
    comando := comando+condicao;
  end;

  case cbOrdem.ItemIndex of
    0: ordem := ' order by nomeprod';
    1: ordem := ' order by nomeprod desc';
    2: ordem := ' order by pkcodprod';
    3: ordem := ' order by pkcodprod desc';
    4: ordem := ' order by valorvendaprod desc';
    5: ordem := ' order by valorvendaprod';
  end;
  comando := comando + ordem;

  DM.executaSql(comando,DM.sqlProduto);

end;

procedure TFListarProdutos.cbOrdemChange(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFListarProdutos.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TFListarProdutos.dbgProdutosDblClick(Sender: TObject);
begin
  UCadOS.pkCodProd := DM.sqlProduto.FieldByName('pkcodprod').AsString;
  close;
end;

procedure TFListarProdutos.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
    3: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
    4: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
  end;
end;

procedure TFListarProdutos.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFListarProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FListarProdutos := nil;
  Action := caFree;
end;

end.
