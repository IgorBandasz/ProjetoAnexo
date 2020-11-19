unit UCadMarca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFCadMarca = class(TForm)
    pBotoes: TPanel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btRemover: TBitBtn;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    btSair: TBitBtn;
    dbgMarcas: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    pDados: TPanel;
    lbCodigo: TLabel;
    lbNome: TLabel;
    edtNomeMarca: TEdit;
    edtPkCodMarca: TEdit;
    dbedtPkCodMarca: TDBEdit;
    procedure mostra;
    procedure limpa;
    procedure controleBotoes(acao: integer);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtPkCodMarcaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadMarca: TFCadMarca;
  acaoGeral :integer = 3;
implementation

{$R *.dfm}

uses UDM;

{ TFCadMarca }

procedure TFCadMarca.btAlterarClick(Sender: TObject);
begin
  btPesquisar.Enabled := false;
  acaoGeral := 1;
  controleBotoes(acaoGeral);
end;

procedure TFCadMarca.btCancelarClick(Sender: TObject);
begin
  btPesquisar.Enabled := true;
  acaoGeral := 3;
  mostra;
  controleBotoes(acaoGeral);
end;

procedure TFCadMarca.btNovoClick(Sender: TObject);
begin
  btPesquisar.Enabled := false;
  acaoGeral := 0;
  controleBotoes(acaoGeral);
end;

procedure TFCadMarca.btPesquisarClick(Sender: TObject);
var
  comando, condicao : string;
begin
  comando := STbMarca;
  condicao := Trim(edtPesquisa.Text);
  limpa;
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodmarca ='+condicao;
      2: condicao := ' where upper(nomemarca) like upper('+QuotedStr(condicao+'%')+')';
    end;
    comando := comando+condicao;
  end;
  DM.executaSql(comando,DM.sqlMarca);
end;

procedure TFCadMarca.btRemoverClick(Sender: TObject);
var
  comando : string;
begin
  try
    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    comando:='DELETE FROM TBMARCA'
       +' WHERE PKCODMARCA = '+edtPkCodMarca.Text;

    DM.executaSql(comando,dm.sqlAltera);
    DM.fdtTransacaoAltera.Commit;
    btPesquisarClick(nil);
    acaoGeral := 3;
    controleBotoes(acaoGeral);
  except
   on E: Exception do
    begin
      DM.fdtTransacaoAltera.Rollback;
      ShowMessage('Erro: ' + E.Message );
    end;

    {showmessage('erro ao salvar dados'); }
  end;
end;

procedure TFCadMarca.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TFCadMarca.btSalvarClick(Sender: TObject);
var
  comando : string;
begin
  btPesquisar.Enabled := true;
  try
    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    case acaoGeral of
      0: begin
        comando:=' INSERT INTO TBMARCA (NOMEMARCA)'+
        'VALUES ('+QuotedStr(edtNomeMarca.Text)+')';
      end;
      1: begin
        comando:='UPDATE TBMARCA'
           +' SET NOMEMARCA = '+QuotedStr(edtNomeMarca.Text)
           +' WHERE PKCODMARCA = '+edtPkCodMarca.Text;
      end;
    end;

    DM.executaSql(comando,DM.sqlAltera);
    DM.fdtTransacaoAltera.Commit;
    btPesquisarClick(nil);
    acaoGeral := 3;
    controleBotoes(acaoGeral);
  except
    DM.fdtTransacaoAltera.Rollback;
    showmessage('erro ao salvar dados');
  end;

end;

procedure TFCadMarca.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TFCadMarca.controleBotoes(acao: integer);
begin
  BtNovo.Enabled := false;
  BtAlterar.Enabled := false;
  BtRemover.Enabled := false;
  BtSalvar.Enabled := false;
  BtCancelar.Enabled := false;
  case acao of
    0: begin
      limpa;
      BtSalvar.Enabled := true;
      BtCancelar.Enabled := true;
      if edtNomeMarca.CanFocus then
        edtNomeMarca.SetFocus;
    end;
    1: begin
      BtSalvar.Enabled := true;
      BtCancelar.Enabled := true;
      if edtNomeMarca.CanFocus then
        edtNomeMarca.SetFocus;
    end;
    else begin
       BtNovo.Enabled := true;
       if DM.sqlMarca.FieldByName('pkcodmarca').AsString <> '' then
       begin
          BtAlterar.Enabled := true;
          BtRemover.Enabled := true;
       end;
    end;
  end;
end;

procedure TFCadMarca.dbedtPkCodMarcaChange(Sender: TObject);
begin
   if acaoGeral in[0,1] then
    exit;
  mostra;
end;

procedure TFCadMarca.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
  end;
end;

procedure TFCadMarca.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
  controleBotoes(acaoGeral);
end;

procedure TFCadMarca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  acaoGeral := 3;
  FCadMarca := nil;
  Action := caFree;
end;

procedure TFCadMarca.limpa;
var
  i : integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then TEdit(Components[i]).Text := '';
  end;
end;

procedure TFCadMarca.mostra;
begin
  if(DM.sqlMarca.Active = false) or (DM.sqlMarca.FieldByName('pkcodmarca').AsString = '') then
  begin
    limpa;
    exit;
  end;
  edtPkCodMarca.Text := Dm.sqlMarca.FieldByName('pkcodmarca').AsString;
  edtNomeMarca.Text := Dm.sqlMarca.FieldByName('nomemarca').AsString;
end;

end.
