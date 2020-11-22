unit URelatorioProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFRelatorioProduto = class(TForm)
    dbgRelatorioProd: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioProduto: TFRelatorioProduto;

implementation

{$R *.dfm}

uses UDM;

procedure TFRelatorioProduto.btPesquisarClick(Sender: TObject);
var
  comando, condicao : string;
begin
  comando := SRelatorioProd;
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
  comando := comando+' group by p.nomeprod, p.pkcodprod';

  DM.executaSql(comando,DM.sqlRelatorioProd);

end;

procedure TFRelatorioProduto.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TFRelatorioProduto.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
    3: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
    4: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
  end;
end;

procedure TFRelatorioProduto.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFRelatorioProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FRelatorioProduto := nil;
  Action := caFree;
end;

end.
