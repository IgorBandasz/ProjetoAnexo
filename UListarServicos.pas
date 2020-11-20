unit UListarServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFListarServicos = class(TForm)
    dbgServicos: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    lbInstrucao: TLabel;
    procedure btPesquisarClick(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgServicosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListarServicos: TFListarServicos;

implementation

{$R *.dfm}

uses UDM, UCadOS;

procedure TFListarServicos.btPesquisarClick(Sender: TObject);
var
  comando, condicao : string;
begin
  comando := STbServico;
  condicao :=Trim(edtPesquisa.Text);
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
  DM.executaSql(comando,dm.sqlServico);

end;

procedure TFListarServicos.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TFListarServicos.dbgServicosDblClick(Sender: TObject);
begin
  UCadOS.pkCodServ := DM.sqlServico.FieldByName('pkcodservico').AsString;
  close;
end;

procedure TFListarServicos.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
    3: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
    4: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
  end;
end;

procedure TFListarServicos.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFListarServicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FListarServicos := nil;
  Action := caFree;
end;

end.
