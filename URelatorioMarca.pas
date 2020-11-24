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
    pOrdem: TPanel;
    lbOrdem: TLabel;
    cbOrdem: TComboBox;
    btSair: TBitBtn;
    procedure btPesquisarClick(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbOrdemChange(Sender: TObject);
    procedure btSairClick(Sender: TObject);
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
  comando, condicao, cond, ordem : string;
begin
  comando := SRelatorioMarca;
  cond := Trim(edtPesquisa.Text);
  condicao := '';
  if cond <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodmarca ='+cond;
      2: condicao := ' where upper(nomemarca) like upper('+QuotedStr(cond+'%')+')';
    end;
    comando := comando+condicao;
    condicao := '';
  end;
  comando := comando + SRelatorioMarca2;
  if cond <> '' then
  begin
    case cbPesquisa.ItemIndex of
      3: condicao := ' having count(*) > '+cond;
      4: condicao := ' having count(*) < '+cond;
      5: condicao := ' having avg(valortotal) > '+cond;
      6: condicao := ' having avg(valortotal) < '+cond;
      7: condicao := ' having sum(valortotal) > '+cond;
      8: condicao := ' having sum(valortotal) < '+cond;
    end;
    comando := comando + condicao;
  end;

  case cbOrdem.ItemIndex of
    0: ordem := ' order by m.nomemarca';
    1: ordem := ' order by m.nomemarca desc';
    2: ordem := ' order by m.pkcodmarca';
    3: ordem := ' order by m.pkcodmarca desc';
    4: ordem := ' order by count(*) desc';
    5: ordem := ' order by count(*)';
    6: ordem := ' order by avg(valortotal) desc';
    7: ordem := ' order by avg(valortotal)';
    8: ordem := ' order by sum(valortotal) desc';
    9: ordem := ' order by sum(valortotal)';
  end;
  comando := comando + ordem;

  DM.executaSql(comando,DM.sqlRelatorioMarca);
end;

procedure TFRelatorioMarca.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TFRelatorioMarca.cbOrdemChange(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFRelatorioMarca.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
  if edtPesquisa.CanFocus then
    edtPesquisa.SetFocus;
end;

procedure TFRelatorioMarca.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1,3,4: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
    5,6,7,8: key := DM.LimpaEdit((Sender as TCustomEdit),Key, ',');
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
