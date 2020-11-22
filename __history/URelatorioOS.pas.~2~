unit URelatorioOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFRelatorioOS = class(TForm)
    dbgRelatorioOS: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    procedure cbPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioOS: TFRelatorioOS;

implementation

{$R *.dfm}

uses UDM;

procedure TFRelatorioOS.btPesquisarClick(Sender: TObject);
var
  comando, condicao : string;
begin
  comando := SRelatorioOS;
  condicao := Trim(edtPesquisa.Text);
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where  extract(MONTH from dataos) = '+condicao;
      2: condicao := ' where  extract(YEAR from dataos) = '+condicao;
    end;
    comando := comando+condicao;
  end;
  comando := comando + ' group by extract(MONTH from dataos),extract(YEAR from dataos)';
  DM.executaSql(comando,DM.sqlRelatorioOS);

end;

procedure TFRelatorioOS.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TFRelatorioOS.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1,2: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
  end;
end;

procedure TFRelatorioOS.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFRelatorioOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRelatorioOS := nil;
  Action := caFree;
end;

end.
