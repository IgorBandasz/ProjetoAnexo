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
    pOrdem: TPanel;
    lbOrdem: TLabel;
    cbOrdem: TComboBox;
    procedure btPesquisarClick(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbOrdemChange(Sender: TObject);
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
  comando, condicao, cond, ordem : string;
begin
  comando := SRelatorioServ;
  cond := Trim(edtPesquisa.Text);
  condicao := '';
  if cond <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where s.pkcodservico ='+cond;
      2: condicao := ' where upper(s.descricaoservico) like upper('+QuotedStr(cond+'%')+')';
      3: condicao := ' where s.valorbase >'+cond;
      4: condicao := ' where s.valorbase <'+cond;
    end;
    comando := comando+condicao;
    condicao := '';
  end;
  comando := comando + SRelatorioServ2;
  if cond <> '' then
  begin
    case cbPesquisa.ItemIndex of
      5: condicao := ' having count(*) > '+cond;
      6: condicao := ' having count(*) < '+cond;
    end;
    comando := comando + condicao;
  end;

  case cbOrdem.ItemIndex of
    0: ordem := ' order by s.descricaoservico';
    1: ordem := ' order by s.descricaoservico desc';
    2: ordem := ' order by s.pkcodservico';
    3: ordem := ' order by s.pkcodservico desc';
    4: ordem := ' order by s.valorbase desc';
    5: ordem := ' order by s.valorbase';
    6: ordem := ' order by count(*) desc';
    7: ordem := ' order by count(*)';
  end;
  comando := comando + ordem;

  DM.executaSql(comando,DM.sqlRelatorioServ);
end;

procedure TFRelatorioServico.cbOrdemChange(Sender: TObject);
begin
  btPesquisarClick(nil);
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
    1,5,6: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
    3,4: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
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
