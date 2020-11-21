unit URelatorioServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFRelatorioServico = class(TForm)
    dbgRelatorioServico: TDBGrid;
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
  FRelatorioServico: TFRelatorioServico;

implementation

{$R *.dfm}

uses UDM;

procedure TFRelatorioServico.btPesquisarClick(Sender: TObject);
var
  comando, condicao : string;
begin
  comando := SRelatorioServ;
  condicao := Trim(edtPesquisa.Text);
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodservico ='+condicao;
      2: condicao := ' where upper(descricaoservico) like upper('+QuotedStr(condicao+'%')+')';
      3: condicao := ' where valorbase >'+DM.limpaVir(condicao);
      4: condicao := ' where valorbase <'+DM.limpaVir(condicao);
    end;
    comando := comando+condicao;
  end;
  comando := comando+' group by s.descricaoservico, s.pkcodservico';

  DM.executaSql(comando,DM.sqlRelatorioServ);

end;

procedure TFRelatorioServico.cbPesquisaChange(Sender: TObject);
begin
  edtpesquisa.Text := '';
end;

procedure TFRelatorioServico.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
    3: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
    4: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
  end;
end;

procedure TFRelatorioServico.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFRelatorioServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FRelatorioServico := nil;
  Action := caFree;
end;

end.
