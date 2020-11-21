unit UListarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFListarClientes = class(TForm)
    dbgClientes: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    lbInstrucao: TLabel;
    procedure btPesquisarClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure cbPesquisaChange(Sender: TObject);
    procedure dbgClientesDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListarClientes: TFListarClientes;

implementation

{$R *.dfm}

uses UDM, UCadOS;

procedure TFListarClientes.btPesquisarClick(Sender: TObject);
var
  comando, condicao : string;
begin
  comando := STbCliente;
  condicao := Trim(edtPesquisa.Text);
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodcli ='+condicao;
      2: condicao := ' where upper(nomecli) like upper('+QuotedStr(condicao+'%')+')';
    end;
    comando := comando+condicao;
  end;
  DM.executaSql(comando,DM.sqlCliente);

end;

procedure TFListarClientes.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TFListarClientes.dbgClientesDblClick(Sender: TObject);
begin
  UCadOS.pkCodCli := DM.sqlCliente.FieldByName('pkcodcli').AsString;
  close;
end;

procedure TFListarClientes.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
  end;
end;

procedure TFListarClientes.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFListarClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FListarClientes := nil;
  Action := caFree;
end;

end.
