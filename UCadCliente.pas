unit UCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TFCadCliente = class(TForm)
    dbgClientes: TDBGrid;
    pListagem: TPanel;
    lbNome: TLabel;
    edtNomeCli: TEdit;
    lbCodigo: TLabel;
    edtPkCodCli: TEdit;
    lbFone: TLabel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    pBotoes: TPanel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btRemover: TBitBtn;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    btSair: TBitBtn;
    dbedtCodCli: TDBEdit;
    medtFoneCli: TMaskEdit;
    pOrdem: TPanel;
    lbOrdem: TLabel;
    cbOrdem: TComboBox;
    procedure btSairClick(Sender: TObject);
    procedure dbedtCodCliChange(Sender: TObject);
    procedure mostra;
    procedure limpa;
    procedure controleBotoes(acao :integer);
    procedure FormActivate(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSalvarClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure cbPesquisaChange(Sender: TObject);
    procedure cbOrdemChange(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadCliente: TFCadCliente;
  acaoGeral: integer=3;
implementation

{$R *.dfm}

uses UDM;

procedure TFCadCliente.btAlterarClick(Sender: TObject);
begin
  acaoGeral := 1;
  btPesquisar.Enabled := false;
  controleBotoes(acaogeral);
end;

procedure TFCadCliente.btCancelarClick(Sender: TObject);
begin
  acaoGeral := 3;
  btPesquisar.Enabled := true;
  mostra;
  controleBotoes(acaoGeral);
end;

procedure TFCadCliente.btNovoClick(Sender: TObject);
begin
  acaoGeral := 0;
  btPesquisar.Enabled := false;
  controleBotoes(acaogeral);
end;

procedure TFCadCliente.btPesquisarClick(Sender: TObject);
var
  comando, condicao , ordem: string;
begin
  comando := STbCliente;
  condicao := Trim(edtPesquisa.Text);
  limpa;
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodcli ='+condicao;
      2: condicao := ' where upper(nomecli) like upper('+QuotedStr(condicao+'%')+')';
    end;
    comando := comando+condicao;
  end;

  case cbOrdem.ItemIndex of
    0: ordem := ' order by nomecli';
    1: ordem := ' order by nomecli desc';
    2: ordem := ' order by pkcodcli';
    3: ordem := ' order by pkcodcli desc';
    4: ordem := ' order by fonecli ';
    5: ordem := ' order by fonecli desc';
  end;
  comando := comando + ordem;

  DM.executaSql(comando,DM.sqlCliente);
end;

procedure TFCadCliente.btRemoverClick(Sender: TObject);
var
  comando : string;
begin
  try
    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    comando:='DELETE FROM TBCLIENTE'
       +' WHERE PKCODCLI = '+edtPkCodCli.Text;

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

procedure TFCadCliente.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TFCadCliente.btSalvarClick(Sender: TObject);
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
        comando:=' INSERT INTO TBCLIENTE (NOMECLI, FONECLI)'+
        'VALUES ('+QuotedStr(edtNomeCli.Text)+','+QuotedStr(medtFoneCli.Text)+')';
      end;
      1: begin
        comando:='UPDATE TBCLIENTE'
           +' SET NOMECLI = '+QuotedStr(edtNomeCli.Text)
           +', FONECLI ='+QuotedStr(medtFoneCli.Text)
           +' WHERE PKCODCLI = '+edtPkCodCli.Text;
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

procedure TFCadCliente.cbOrdemChange(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFCadCliente.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
  if edtPesquisa.CanFocus then
    edtPesquisa.SetFocus;
end;

procedure TFCadCliente.controleBotoes(acao: integer);
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
      if edtNomeCli.CanFocus then
        edtNomeCli.SetFocus;
    end;
    1: begin
      BtSalvar.Enabled := true;
      BtCancelar.Enabled := true;
      if edtNomeCli.CanFocus then
        edtNomeCli.SetFocus;
    end;
    else begin
       BtNovo.Enabled := true;
       if DM.sqlCliente.FieldByName('pkcodcli').AsString <> '' then
       begin
          BtAlterar.Enabled := true;
          BtRemover.Enabled := true;
       end;
    end;
  end;


end;

procedure TFCadCliente.dbedtCodCliChange(Sender: TObject);
begin
  if acaoGeral in[0,1] then
    exit;
  mostra;
end;

procedure TFCadCliente.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
  end;
end;

procedure TFCadCliente.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
  controleBotoes(acaoGeral);
end;

procedure TFCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  acaoGeral := 3;
  FCadCliente := nil;
  Action := caFree;
end;

procedure TFCadCliente.limpa;
var
  i : integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then TEdit(Components[i]).Text := '';
    if Components[i] is TMaskEdit then TMaskEdit(Components[i]).Text := '';
  end;
end;

procedure TFCadCliente.mostra;
begin
  if(dm.sqlCliente.Active = false) or (dm.sqlCliente.FieldByName('pkcodcli').AsString = '') then
  begin
    limpa;
    exit;
  end;
  edtPkCodCli.Text := Dm.sqlCliente.FieldByName('pkcodcli').AsString;
  edtNomeCli.Text := Dm.sqlCliente.FieldByName('nomecli').AsString;
  medtFoneCli.Text := Dm.sqlCliente.FieldByName('fonecli').AsString;
end;

end.
