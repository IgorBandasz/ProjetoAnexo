unit URelatorioVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFRelatorioVeiculo = class(TForm)
    dbgRelatorioVei: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    pOrdem: TPanel;
    lbOrdem: TLabel;
    cbOrdem: TComboBox;
    btSair: TBitBtn;
    procedure btPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure cbOrdemChange(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioVeiculo: TFRelatorioVeiculo;

implementation

{$R *.dfm}

uses UDM;

procedure TFRelatorioVeiculo.btPesquisarClick(Sender: TObject);
var
  comando, condicao, cond, ordem : string;
begin
  comando := SRelatoriovei;
  cond := Trim(edtPesquisa.Text);
  condicao := '';
  if cond <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodveiculo ='+cond;
      2: condicao := ' where upper(v.placaveiculo) like upper('+QuotedStr(cond+'%')+')';
      3: condicao := ' where upper(m.nomemarca) like upper('+QuotedStr(cond+'%')+')';
    end;
    comando := comando+condicao;
    condicao := '';
  end;
  comando := comando + SRelatorioVei2;
  if cond <> '' then
  begin
    case cbPesquisa.ItemIndex of
      4: condicao := ' having count(*) > '+cond;
      5: condicao := ' having count(*) < '+cond;
      6: condicao := ' having avg(valortotal) > '+cond;
      7: condicao := ' having avg(valortotal) < '+cond;
      8: condicao := ' having sum(valortotal) > '+cond;
      9: condicao := ' having sum(valortotal) < '+cond;
    end;
    comando := comando + condicao;
  end;

  case cbOrdem.ItemIndex of
    0: ordem := ' order by v.placaveiculo';
    1: ordem := ' order by v.placaveiculo desc';
    2: ordem := ' order by m.nomemarca';
    3: ordem := ' order by m.nomemarca desc';
    4: ordem := ' order by v.pkcodveiculo';
    5: ordem := ' order by v.pkcodveiculo desc';
    6: ordem := ' order by count(*) desc';
    7: ordem := ' order by count(*)';
    8: ordem := ' order by avg(valortotal) desc';
    9: ordem := ' order by avg(valortotal)';
    10: ordem := ' order by sum(valortotal) desc';
    11: ordem := ' order by sum(valortotal)';
  end;
  comando := comando + ordem;

  DM.executaSql(comando,DM.sqlRelatorioVei);
end;

procedure TFRelatorioVeiculo.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TFRelatorioVeiculo.cbOrdemChange(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFRelatorioVeiculo.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
  if edtPesquisa.CanFocus then
    edtPesquisa.SetFocus;
end;

procedure TFRelatorioVeiculo.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1,4,5: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
    6,7,8,9: key := DM.LimpaEdit((Sender as TCustomEdit),Key, ',');
  end;
end;

procedure TFRelatorioVeiculo.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFRelatorioVeiculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FRelatorioVeiculo := nil;
  Action := caFree;
end;

end.
