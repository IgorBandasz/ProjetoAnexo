unit UCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFCadProduto = class(TForm)
    pBotoes: TPanel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btRemover: TBitBtn;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    btSair: TBitBtn;
    dbgProdutos: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    pDados: TPanel;
    lbCodigo: TLabel;
    lbValor: TLabel;
    lbNome: TLabel;
    edtNomeProd: TEdit;
    edtPkCodProd: TEdit;
    edtValorVendaProd: TEdit;
    dbedtPkCodProd: TDBEdit;
    pOrdem: TPanel;
    lbOrdem: TLabel;
    cbOrdem: TComboBox;
    procedure mostra;
    procedure limpa;
    procedure controleBotoes(acao :integer);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtPkCodProdChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtValorVendaProdKeyPress(Sender: TObject; var Key: Char);
    procedure cbPesquisaChange(Sender: TObject);
    procedure cbOrdemChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadProduto: TFCadProduto;
  acaoGeral :integer=3;
implementation

{$R *.dfm}

uses UDM;

{ TFCadProduto }

procedure TFCadProduto.btAlterarClick(Sender: TObject);
begin
  btPesquisar.Enabled := false;
  acaoGeral := 1;
  controleBotoes(acaoGeral);
end;

procedure TFCadProduto.btCancelarClick(Sender: TObject);
begin
  btPesquisar.Enabled := true;
  acaoGeral := 3;
  mostra;
  controleBotoes(acaoGeral);
end;

procedure TFCadProduto.btNovoClick(Sender: TObject);
begin
  btPesquisar.Enabled := false;
  acaoGeral := 0;
  controleBotoes(acaoGeral);
end;

procedure TFCadProduto.btPesquisarClick(Sender: TObject);
var
  comando, condicao, ordem : string;
begin
  comando := STbProduto;
  condicao := Trim(edtPesquisa.Text);
  limpa;
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodprod ='+condicao;
      2: condicao := ' where upper(nomeprod) like upper('+QuotedStr(condicao+'%')+')';
      3: condicao := ' where valorvendaprod >'+DM.limpaVir(condicao);
      4: condicao := ' where valorvendaprod <'+DM.limpaVir(condicao);
    end;
    comando := comando+condicao;
  end;

  case cbOrdem.ItemIndex of
    0: ordem := ' order by nomeprod';
    1: ordem := ' order by nomeprod desc';
    2: ordem := ' order by pkcodprod';
    3: ordem := ' order by pkcodprod desc';
    4: ordem := ' order by valorvendaprod desc';
    5: ordem := ' order by valorvendaprod';
  end;
  comando := comando + ordem;

  DM.executaSql(comando,DM.sqlProduto);
end;

procedure TFCadProduto.btRemoverClick(Sender: TObject);
var
  comando : string;
begin
  try
    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    comando := 'select count(*) as quant from tbrelprodutoos where fkcodprod ='+edtPkCodProd.Text;
    DM.executaSql(comando, DM.sqlGeral);
    if DM.sqlGeral.FieldByName('quant').AsInteger > 0 then
    begin
      showmessage('N�o � poss�vel remover esse Produto enquanto ele estiver resgistrado em alguma OS');
      acaoGeral := 3;
      controleBotoes(acaoGeral);
      exit
    end;


    comando:='DELETE FROM TBPRODUTO'
       +' WHERE PKCODPROD = '+edtPkCodProd.Text;

    DM.executaSql(comando,DM.sqlAltera);
    DM.fdtTransacaoAltera.Commit;
    btPesquisarClick(nil);
    acaoGeral := 3;
    controleBotoes(acaoGeral);
  except
    DM.fdtTransacaoAltera.Rollback;
    showmessage('erro ao apagar dados');
  end;

end;

procedure TFCadProduto.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TFCadProduto.btSalvarClick(Sender: TObject);
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
        comando:=' INSERT INTO TBPRODUTO (NOMEPROD, VALORVENDAPROD)'+
        'VALUES ('+QuotedStr(edtNomeProd.Text)
                  +','+DM.limpaVir(edtValorVendaProd.Text)+')';
      end;
      1: begin
        comando:='UPDATE TBPRODUTO'
           +' SET NOMEPROD = '+QuotedStr(edtNomeProd.Text)
           +', VALORVENDAPROD ='+DM.limpaVir(edtValorVendaProd.Text)
           +' WHERE PKCODPROD = '+edtPkCodProd.Text;
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

procedure TFCadProduto.cbOrdemChange(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFCadProduto.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
  if edtPesquisa.CanFocus then
    edtPesquisa.SetFocus;
end;

procedure TFCadProduto.controleBotoes(acao: integer);
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
      if edtNomeProd.CanFocus then
        edtNomeProd.SetFocus;
    end;
    1: begin
      BtSalvar.Enabled := true;
      BtCancelar.Enabled := true;
      if edtNomeProd.CanFocus then
        edtNomeProd.SetFocus;
    end;
    else begin
       BtNovo.Enabled := true;
       if DM.sqlProduto.FieldByName('pkcodprod').AsString <> '' then
       begin
          BtAlterar.Enabled := true;
          BtRemover.Enabled := true;
       end;
    end;
  end;
end;

procedure TFCadProduto.dbedtPkCodProdChange(Sender: TObject);
begin
  if acaoGeral in[0,1] then
    exit;
  mostra;
end;

procedure TFCadProduto.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
    3: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
    4: key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
  end;
end;

procedure TFCadProduto.edtValorVendaProdKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := DM.LimpaEdit((Sender as TCustomEdit),Key,',');
end;

procedure TFCadProduto.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
  controleBotoes(acaoGeral);
end;

procedure TFCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  acaoGeral := 3;
  FCadProduto := nil;
  Action := caFree;
end;

procedure TFCadProduto.limpa;
var
  i : integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then TEdit(Components[i]).Text := '';
  end;
end;

procedure TFCadProduto.mostra;
begin
  if(dm.sqlProduto.Active = false) or (dm.sqlProduto.FieldByName('pkcodprod').AsString = '') then
  begin
    limpa;
    exit;
  end;
  edtPkCodProd.Text := Dm.sqlProduto.FieldByName('pkcodprod').AsString;
  edtNomeProd.Text := Dm.sqlProduto.FieldByName('nomeprod').AsString;
  edtValorVendaProd.Text := FormatFloat('#0.00',Dm.sqlProduto.FieldByName('valorvendaprod').AsFloat);
end;

end.
