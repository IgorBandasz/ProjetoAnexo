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
    pOrdem: TPanel;
    lbOrdem: TLabel;
    cbOrdem: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbOrdemChange(Sender: TObject);
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
  comando, condicao, cond, ordem : string;
begin
  comando := SRelatorioProd;
  cond := Trim(edtPesquisa.Text);
  condicao := '';
  if cond <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where p.pkcodprod ='+cond;
      2: condicao := ' where upper(p.nomeprod) like upper('+QuotedStr(cond+'%')+')';
      3: condicao := ' where p.valorvendaprod >'+cond;
      4: condicao := ' where p.valorvendaprod <'+cond;
    end;
    comando := comando+condicao;
    condicao := '';
  end;
  comando := comando + SRelatorioProd2;
  if cond <> '' then
  begin
    case cbPesquisa.ItemIndex of
      5: condicao := ' having sum(r.quantidade) > '+cond;
      6: condicao := ' having sum(r.quantidade) < '+cond;
    end;
    comando := comando + condicao;
  end;

  case cbOrdem.ItemIndex of
    0: ordem := ' order by p.nomeprod';
    1: ordem := ' order by p.nomeprod desc';
    2: ordem := ' order by p.pkcodprod';
    3: ordem := ' order by p.pkcodprod desc';
    4: ordem := ' order by p.valorvendaprod desc';
    5: ordem := ' order by p.valorvendaprod';
    6: ordem := ' order by sum(r.quantidade) desc';
    7: ordem := ' order by sum(r.quantidade)';
  end;
  comando := comando + ordem;

  DM.executaSql(comando,DM.sqlRelatorioProd);
end;

procedure TFRelatorioProduto.cbOrdemChange(Sender: TObject);
begin
  btPesquisarClick(nil);
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
    1,5,6: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
    3,4: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
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
