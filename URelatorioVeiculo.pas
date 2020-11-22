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
    procedure btPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
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
  comando, condicao : string;
begin
  comando := SRelatorioVei;
  condicao := Trim(edtPesquisa.Text);
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodveiculo ='+condicao;
      2: condicao := ' where upper(placaveiculo) like upper('+QuotedStr(condicao+'%')+')';
      3: condicao := ' where upper(nomemarca) like upper('+QuotedStr(condicao+'%')+')';
    end;
    comando := comando+condicao;
  end;
  comando := comando+' group by v.pkcodveiculo, v.placaveiculo, m.nomemarca';
  DM.executaSql(comando,DM.sqlRelatorioVei);
end;

procedure TFRelatorioVeiculo.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TFRelatorioVeiculo.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
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
