unit URelatorioMarca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFRelatorioMarca = class(TForm)
    dbgRelatorioMarca: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    procedure btPesquisarClick(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioMarca: TFRelatorioMarca;

implementation

{$R *.dfm}

uses UDM;

procedure TFRelatorioMarca.btPesquisarClick(Sender: TObject);
var
  comando, condicao : string;
begin
  comando := SRelatorioMarca;
  condicao := Trim(edtPesquisa.Text);
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodmarca ='+condicao;
      2: condicao := ' where upper(nomemarca) like upper('+QuotedStr(condicao+'%')+')';
    end;
    comando := comando+condicao;
  end;
  comando := comando + ' group by m.nomemarca, m.pkcodmarca';
  DM.executaSql(comando,DM.sqlRelatorioMarca);
end;

procedure TFRelatorioMarca.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TFRelatorioMarca.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
  end;
end;

procedure TFRelatorioMarca.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFRelatorioMarca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRelatorioMarca := nil;
  Action := caFree;
end;

end.
