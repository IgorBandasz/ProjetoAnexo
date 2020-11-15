unit UCadServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFCadServico = class(TForm)
    pDados: TPanel;
    lbCodigo: TLabel;
    lbValor: TLabel;
    lbDescricao: TLabel;
    edtDescricaoServico: TEdit;
    edtPkCodServico: TEdit;
    pBotoes: TPanel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btRemover: TBitBtn;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    btSair: TBitBtn;
    dbgServicos: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    edtValorBase: TEdit;
    dbedtPkCodServico: TDBEdit;
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
    procedure dbedtPkCodServicoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtValorBaseKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadServico: TFCadServico;
  acaoGeral : integer=3;
implementation

{$R *.dfm}

uses UDM;

procedure TFCadServico.btAlterarClick(Sender: TObject);
begin
  btPesquisar.Enabled := false;
  acaoGeral := 1;
  controleBotoes(acaoGeral);
end;

procedure TFCadServico.btCancelarClick(Sender: TObject);
begin
  btPesquisar.Enabled := true;
  acaoGeral := 3;
  mostra;
  controleBotoes(acaoGeral);
end;

procedure TFCadServico.btNovoClick(Sender: TObject);
begin
  btPesquisar.Enabled := false;
  acaoGeral := 0;
  controleBotoes(acaoGeral);
end;

procedure TFCadServico.btPesquisarClick(Sender: TObject);
var
  comando, condicao : string;
begin
  comando := STbServico;
  condicao := trim(edtPesquisa.Text);
  limpa;
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

procedure TFCadServico.btRemoverClick(Sender: TObject);
var
  comando : string;
begin
  try
    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    comando:='DELETE FROM TBSERVICO'
       +' WHERE PKCODSERVICO = '+edtPkCodServico.Text;

    DM.executaSql(comando,dm.sqlAltera);
    DM.fdtTransacaoAltera.Commit;
    btPesquisarClick(nil);
    acaoGeral := 3;
    controleBotoes(acaoGeral);
  except
    DM.fdtTransacaoAltera.Rollback;
    showmessage('erro ao apagar dados');
  end;
end;

procedure TFCadServico.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TFCadServico.btSalvarClick(Sender: TObject);
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
        comando:=' INSERT INTO TBSERVICO (DESCRICAOSERVICO, VALORBASE)'+
        'VALUES ('+QuotedStr(edtDescricaoServico.Text)
                  +','+DM.limpaVir(edtValorBase.Text)+')';
      end;
      1: begin
        comando:='UPDATE TBSERVICO'
           +' SET DESCRICAOSERVICO = '+QuotedStr(edtDescricaoServico.Text)
           +', VALORBASE ='+DM.limpaVir(edtValorBase.Text)
           +' WHERE PKCODSERVICO = '+edtPkCodServico.Text;
      end;
    end;

    DM.executaSql(comando,dm.sqlAltera);
    DM.fdtTransacaoAltera.Commit;
    btPesquisarClick(nil);
    acaoGeral := 3;
    controleBotoes(acaoGeral);

  except
    DM.fdtTransacaoAltera.Rollback;
    showmessage('erro ao salvar dados');
  end;

end;

procedure TFCadServico.controleBotoes(acao: integer);
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
      if edtDescricaoServico.CanFocus then
        edtDescricaoServico.SetFocus;
    end;
    1: begin
      BtSalvar.Enabled := true;
      BtCancelar.Enabled := true;
      if edtDescricaoServico.CanFocus then
        edtDescricaoServico.SetFocus;
    end;
    else begin
       BtNovo.Enabled := true;
       if dm.sqlServico.FieldByName('pkcodservico').AsString <> '' then
       begin
          BtAlterar.Enabled := true;
          BtRemover.Enabled := true;
       end;
    end;
  end;
end;

procedure TFCadServico.dbedtPkCodServicoChange(Sender: TObject);
begin
  if acaoGeral in[0,1] then
    exit;
  mostra;
end;

procedure TFCadServico.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
    3: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
    4: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
  end;
end;

procedure TFCadServico.edtValorBaseKeyPress(Sender: TObject; var Key: Char);
begin
   key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
end;

procedure TFCadServico.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
  controleBotoes(acaoGeral);
end;

procedure TFCadServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  acaoGeral := 3;
  FCadServico := nil;
  Action := caFree;
end;

procedure TFCadServico.limpa;
var
  i : integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then TEdit(Components[i]).Text := '';
  end;
end;

procedure TFCadServico.mostra;
begin
  if(dm.sqlServico.Active = false) or (dm.sqlServico.FieldByName('pkcodservico').AsString = '') then
  begin
    limpa;
    exit;
  end;
  edtPkCodServico.Text := Dm.sqlServico.FieldByName('pkcodservico').AsString;
  edtDescricaoServico.Text := Dm.sqlServico.FieldByName('descricaoservico').AsString;
  edtValorBase.Text := Dm.sqlServico.FieldByName('valorbase').AsString;

end;

end.
