unit UCadOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Mask,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Datasnap.DBClient;

type
  TFCadOS = class(TForm)
    pBotoes: TPanel;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    dbgServicos: TDBGrid;
    pDados: TPanel;
    lbCodigo: TLabel;
    lbData: TLabel;
    lbPlaca: TLabel;
    lbValor: TLabel;
    lbCliente: TLabel;
    lbFkCodVeiculo: TLabel;
    edtPkCodOS: TEdit;
    medtDataOs: TMaskEdit;
    medtPlacaVeiculo: TMaskEdit;
    edtFkCodCli: TEdit;
    btProcuraCliente: TBitBtn;
    lbValorTotal: TLabel;
    cdTbRelProdutoOS: TClientDataSet;
    dsCdTbRelProdutoOS: TDataSource;
    pInsereProduto: TPanel;
    lbCodProd: TLabel;
    lbnomeprod: TLabel;
    lbQuantidade: TLabel;
    lbValorUnit: TLabel;
    edtFkCodProd: TEdit;
    edtNomeProduto: TEdit;
    edtQuantidade: TEdit;
    edtValorUnit: TEdit;
    cdTbRelServicoOS: TClientDataSet;
    dsCdTbRelServicoOS: TDataSource;
    DBGrid1: TDBGrid;
    pInsereServico: TPanel;
    lbCodServ: TLabel;
    edtFkCodServico: TEdit;
    lbDescricaoServ: TLabel;
    edtDescricaoServico: TEdit;
    lbValorServ: TLabel;
    edtValorServico: TEdit;
    btAdicionarServico: TBitBtn;
    btAdicionarProduto: TBitBtn;
    btRemoverProduto: TBitBtn;
    btRemoverServico: TBitBtn;
    btListarProdutos: TBitBtn;
    btListarServicos: TBitBtn;
    pValorOS: TPanel;
    lbNomeCli: TLabel;
    edtNomeCliente: TEdit;
    procedure mostra(codigo :string);
    procedure mostraItens(codigo :string);
    procedure limpa;
    procedure limpaItem;
    procedure calculaTotal;

    procedure FormActivate(Sender: TObject);
    procedure edtFkCodCliExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSalvarClick(Sender: TObject);
    procedure edtFkCodProdExit(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAdicionarProdutoClick(Sender: TObject);
    procedure btAdicionarServicoClick(Sender: TObject);
    procedure medtPlacaVeiculoExit(Sender: TObject);
    procedure edtFkCodServicoExit(Sender: TObject);
    procedure edtFkCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure edtFkCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorUnitKeyPress(Sender: TObject; var Key: Char);
    procedure edtFkCodServicoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorServicoKeyPress(Sender: TObject; var Key: Char);
    procedure btRemoverProdutoClick(Sender: TObject);
    procedure btRemoverServicoClick(Sender: TObject);
    procedure btProcuraClienteClick(Sender: TObject);
    procedure btListarProdutosClick(Sender: TObject);
    procedure btListarServicosClick(Sender: TObject);
    procedure medtDataOsExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadOS: TFCadOS;
  acaoGeral :integer=3;
  pkCodOS : string;
  pkCodCli : string='';
  pkCodProd : string='';
  pkCodServ : string='';

implementation

{$R *.dfm}

uses UDM, ULocOS, UListarClientes, UListarProdutos, UListarServicos;


procedure TFCadOS.btAdicionarProdutoClick(Sender: TObject);
begin
  if edtFkCodProd.Text = '' then
  begin
    showmessage('Selecione ou digite um Código de Produto');
    exit
  end;
  if edtQuantidade.Text = '' then
  begin
    showmessage('Digite uma Quantidade');
    exit
  end;
  if edtValorUnit.Text = '' then
  begin
    showmessage('Digite um Valor Unitário');
    exit
  end;

  try
    cdTbRelProdutoOS.Append;
    cdTbRelProdutoOS.FieldByName('fkcodprod').AsInteger := StrToInt(edtFkCodProd.Text);
    cdTbRelProdutoOS.FieldByName('nomeproduto').AsString := edtNomeProduto.Text;
    cdTbRelProdutoOS.FieldByName('quantidade').AsInteger := StrToInt(edtQuantidade.Text);
    cdTbRelProdutoOS.FieldByName('valorunitario').Asfloat := StrToFloat(edtValorUnit.Text);
    cdTbRelProdutoOS.FieldByName('valortotal').Asfloat := cdTbRelProdutoOS.FieldByName('quantidade').AsInteger * cdTbRelProdutoOS.FieldByName('valorunitario').Asfloat;
    cdTbRelProdutoOS.FieldByName('controle').AsInteger := 1;
    cdTbRelProdutoOS.Post;
    limpaItem;
    calculaTotal;
  except
     cdTbRelProdutoOS.Cancel;
     showmessage('Erro ao adicionar Produto à lista');
     limpaItem;
  end;
end;

procedure TFCadOS.btAdicionarServicoClick(Sender: TObject);
begin
  if edtFkCodServico.Text = '' then
  begin
    showmessage('Selecione ou digite um Código de Serviço');
    exit
  end;
  if edtValorServico.Text = '' then
  begin
    showmessage('Digite um Valor para o Serviço');
    exit
  end;

  try
    cdTbRelServicoOS.Append;
    cdTbRelServicoOS.FieldByName('fkcodservico').AsInteger := StrToInt(edtFkCodServico.Text);
    cdTbRelServicoOS.FieldByName('descricaoservico').AsString := edtDescricaoServico.Text;
    cdTbRelServicoOS.FieldByName('valorservico').AsFloat := StrToFloat(edtValorServico.Text);
    cdTbRelServicoOS.FieldByName('controle').AsInteger := 1;
    cdTbRelServicoOS.Post;
    limpaItem;
    calculaTotal;
  except
     cdTbRelServicoOS.Cancel;
     showmessage('Erro ao adicionar Serviço à lista');
     limpaItem;
  end;
end;

procedure TFCadOS.btCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFCadOS.btListarProdutosClick(Sender: TObject);
begin
   if FListarProdutos = nil then
    Application.CreateForm(TFlistarProdutos,FListarProdutos);
    FListarProdutos.ShowModal;

  if pkCodProd = '' then
     exit
  else
  begin
     edtFkCodProd.Text := pkCodProd;
     edtFkCodProdExit(nil);
  end;
end;

procedure TFCadOS.btListarServicosClick(Sender: TObject);
begin
  if FListarServicos = nil then
    Application.CreateForm(TFlistarServicos,FListarServicos);
    FListarServicos.ShowModal;

  if pkCodServ = '' then
     exit
  else
  begin
     edtFkCodServico.Text := pkCodServ;
     edtFkCodServicoExit(nil);
  end;
end;

procedure TFCadOS.btProcuraClienteClick(Sender: TObject);
begin
  if FListarClientes = nil then
    Application.CreateForm(TFlistarClientes,FListarClientes);
    FListarClientes.ShowModal;

  if pkCodCli = '' then
     exit
  else
  begin
     edtFkCodCli.Text := pkCodCli;
     edtFkCodCliExit(nil);
  end;
end;

procedure TFCadOS.btRemoverProdutoClick(Sender: TObject);
var
  comando :string;
begin
   if cdTbRelProdutoOS.FieldByName('controle').AsInteger = 1 then
   begin
      cdTbRelProdutoOS.Delete;
      calculaTotal;
      exit
   end;
   try
    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    comando:='DELETE FROM TBRELPRODUTOOS'
       +' WHERE PKCODRELP = '+cdTbRelProdutoOS.FieldByName('pkcodrelp').AsString;
    DM.executaSql(comando,DM.sqlAltera);

    cdTbRelProdutoOS.Delete;
    calculaTotal;
    DM.fdtTransacaoAltera.Commit;
   except
    DM.fdtTransacaoAltera.Rollback;
    showmessage('erro ao apagar dados');
   end;

end;

procedure TFCadOS.btRemoverServicoClick(Sender: TObject);
var
  comando :string;
begin
   if cdTbRelServicoOS.FieldByName('controle').AsInteger = 1 then
   begin
      cdTbRelServicoOS.Delete;
      calculaTotal;
      exit
   end;
   try
    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    comando:='DELETE FROM TBRELSERVICOOS'
       +' WHERE PKCODRELS = '+cdTbRelServicoOS.FieldByName('pkcodrels').AsString;
    DM.executaSql(comando,DM.sqlAltera);

    cdTbRelServicoOS.Delete;
    calculaTotal;
    DM.fdtTransacaoAltera.Commit;
   except
    DM.fdtTransacaoAltera.Rollback;
    showmessage('erro ao apagar dados');
   end;

end;

procedure TFCadOS.btSalvarClick(Sender: TObject);
var
  x : string;
  contador :integer;
begin
  try
    if edtFkCodCli.Text = '' then
    begin
      showmessage('Selecione ou digite um Código de Cliente');
      exit;
    end;

    if medtPlacaVeiculo.Text = '   -    ' then
    begin
      showmessage('Digite uma Placa de veículo');
      exit;
    end;

    contador :=0;

    cdTbRelProdutoOS.First;
    while not cdTbRelProdutoOS.Eof do
    begin
      contador := contador + 1;
      cdTbRelProdutoOS.Next;
    end;

    cdTbRelServicoOS.First;
    while not cdTbRelServicoOS.Eof do
    begin
      contador := contador + 1;
      cdTbRelServicoOS.Next;
    end;

    if contador = 0 then
    begin
      showmessage('Adicione um produto ou serviço na OS');
      exit;
    end;

    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    case acaoGeral of
      0: begin
        x:='INSERT INTO TBOS (FKCODCLI, FKCODVEICULO, DATAOS, VALORTOTAL) '+
        'VALUES ('+DM.salvaChave(edtFkCodCli.text)
                  +', '+DM.salvaChave(lbFkCodVeiculo.Caption)
                  +', '+DM.salvaData(medtDataOS.Text)
                  +', '+DM.limpaVir(lbValorTotal.Caption)+')';
      end;
      1: begin
        x:='UPDATE TBOS'
           +' SET FKCODCLI = '+DM.salvaChave(edtFkCodCli.Text)
           +', FKCODVEICULO = '+DM.salvaChave(lbFkCodVeiculo.Caption)
           +', DATAOS = '+DM.salvaData(medtDataOS.Text)
           +', VALORTOTAL = '+DM.limpaVir(lbValorTotal.Caption)
           +' WHERE PKCODOS = '+edtPkCodOS.Text;
      end;
    end;
    DM.executaSql(x,DM.sqlAltera);
    if acaoGeral = 0 then
    begin
      x := 'select max(pkcodos) as maior from tbos where fkcodcli ='+DM.salvaChave(edtFkCodCli.Text);
      DM.executaSql(x,DM.sqlGeral);
      edtPkCodOS.Text := DM.sqlGeral.FieldByName('maior').AsString;
    end;

    cdTbRelProdutoOS.First;
    while not cdTbRelProdutoOS.Eof do
    begin
      if cdTbRelProdutoOS.FieldByName('controle').AsInteger = 1 then
      begin
        x :='INSERT INTO TBRELPRODUTOOS (FKCODOS, FKCODPROD, QUANTIDADE, VALORUNITARIO, VALORTOTAL) '
            +'VALUES ('+DM.salvaChave(edtPkCodOS.Text)
            +','+DM.salvaChave(cdTbRelProdutoOS.FieldByName('fkcodprod').AsString)
            +','+cdTbRelProdutoOS.FieldByName('quantidade').AsString
            +','+DM.limpaVir(cdTbRelProdutoOS.FieldByName('valorunitario').AsString)
            +','+DM.limpaVir(cdTbRelProdutoOS.FieldByName('valortotal').AsString)
            +')';
        DM.executaSql(x,DM.sqlAltera);
      end;
      cdTbRelProdutoOS.Next;
    end;

    cdTbRelServicoOS.First;
    while not cdTbRelServicoOS.Eof do
    begin
      if cdTbRelServicoOS.FieldByName('controle').AsInteger = 1 then
      begin
        x :='INSERT INTO TBRELSERVICOOS (FKCODOS, FKCODSERVICO, VALORSERVICO) '
            +'VALUES ('+DM.salvaChave(edtPkCodOS.Text)
            +','+DM.salvaChave(cdTbRelServicoOS.FieldByName('fkcodservico').AsString)
            +','+DM.limpaVir(cdTbRelServicoOS.FieldByName('valorservico').AsString)
            +')';
        DM.executaSql(x,DM.sqlAltera);
      end;
      cdTbRelServicoOS.Next;
    end;

    DM.fdtTransacaoAltera.Commit;
    FLocOS.btPesquisarClick(nil);
    acaogeral := 3;

    close;
  except
    DM.fdtTransacaoAltera.Rollback;
    showmessage('Erro ao salvar dados');
  end;

end;

procedure TFCadOS.calculaTotal;
var
  total : real;
begin
  total := 0;
  cdTbRelProdutoOS.First;
  while not cdTbRelProdutoOS.Eof do
  begin
    total := total + cdTbRelProdutoOS.FieldByName('valortotal').AsFloat;
    cdTbRelProdutoOS.Next;
  end;

  cdTbRelServicoOS.First;
  while not cdTbRelServicoOS.Eof do
  begin
    total := total + cdTbRelServicoOS.FieldByName('valorservico').AsFloat;
    cdTbRelServicoOS.Next;
  end;

  lbValorTotal.Caption := FormatFloat('#0.00',total);
end;

procedure TFCadOS.edtFkCodCliExit(Sender: TObject);
var
  x: string;
begin
  x:= trim(edtFkCodCli.Text);
  if x='' then
  begin
    edtNomeCliente.Text := '';
    exit
  end;

  x:= 'select * from tbcliente where pkcodcli = '+x;
  DM.executaSql(x,DM.sqlGeral);
  if DM.sqlGeral.FieldByName('pkcodcli').AsString = '' then
  begin
    showmessage('Cliente não encontrado');
    if edtFkCodCli.CanFocus then
      edtFkCodCli.SetFocus;
    exit;
  end;

  edtNomeCliente.Text := DM.sqlGeral.FieldByName('nomecli').AsString;
end;

procedure TFCadOS.edtFkCodCliKeyPress(Sender: TObject; var Key: Char);
begin
  key := DM.LimpaEdit((Sender as TCustomEdit),Key);
end;

procedure TFCadOS.edtFkCodProdExit(Sender: TObject);
var
  x: string;
begin
  x:= Trim(edtFkCodProd.Text);
  if x='' then
  begin
    edtNomeProduto.Text := '';
    edtValorUnit.Text := '';
    edtQuantidade.Text := '';
    exit
  end;

  x:= 'select * from tbProduto where pkcodprod = '+x;
  DM.executaSql(x,DM.sqlGeral);
  if DM.sqlGeral.FieldByName('pkcodprod').AsString = '' then
  begin
    showmessage('Produto não encontrado');
    if edtFkCodProd.CanFocus then
      edtFkCodProd.SetFocus;
    exit;
  end;

  edtNomeProduto.Text := DM.sqlGeral.FieldByName('nomeprod').AsString;
  edtValorUnit.Text := FormatFloat('#0.00',DM.sqlGeral.FieldByName('valorvendaprod').AsFloat);
  edtQuantidade.Text := '1';
  if edtQuantidade.CanFocus then
    edtQuantidade.SetFocus;
end;

procedure TFCadOS.edtFkCodProdKeyPress(Sender: TObject; var Key: Char);
begin
  key := DM.LimpaEdit((Sender as TCustomEdit),Key);
end;

procedure TFCadOS.edtFkCodServicoExit(Sender: TObject);
var
  x: string;
begin
  x:= Trim(edtFkCodServico.Text);
  if x='' then
  begin
    edtDescricaoServico.Text := '';
    edtValorServico.Text := '';
    exit
  end;

  x:= 'select * from tbservico where pkcodservico = '+x;
  DM.executaSql(x,DM.sqlGeral);
  if DM.sqlGeral.FieldByName('pkcodservico').AsString = '' then
  begin
    showmessage('Serviço não encontrado');
    if edtFkCodServico.CanFocus then
      edtFkCodServico.SetFocus;
    exit;
  end;

  edtDescricaoServico.Text := DM.sqlGeral.FieldByName('descricaoservico').AsString;
  edtValorServico.Text := FormatFloat('#0.00',DM.sqlGeral.FieldByName('valorbase').AsFloat);
end;

procedure TFCadOS.edtFkCodServicoKeyPress(Sender: TObject; var Key: Char);
begin
  key := DM.LimpaEdit((Sender as TCustomEdit),Key);
end;

procedure TFCadOS.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  key := DM.LimpaEdit((Sender as TCustomEdit),Key);
end;

procedure TFCadOS.edtValorServicoKeyPress(Sender: TObject; var Key: Char);
begin
  key := DM.LimpaEdit((Sender as TCustomEdit), Key, ',');
end;

procedure TFCadOS.edtValorUnitKeyPress(Sender: TObject; var Key: Char);
begin
  key := DM.LimpaEdit((Sender as TCustomEdit), Key, ',');
end;

procedure TFCadOS.FormActivate(Sender: TObject);
begin
  case acaoGeral of
    0:begin
        limpa;
        if medtDataOS.CanFocus then
          medtDataOS.SetFocus;
      end;
    1:begin
        mostra(pkCodOS);
        if medtDataOS.CanFocus then
          medtDataOS.SetFocus;
      end;
  end;
end;

procedure TFCadOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.executaSql(STbOS,DM.sqlOS);
  FCadOS := nil;
  Action := caFree;
end;

procedure TFCadOS.limpa;
var
  i : integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then TEdit(Components[i]).Text := '';
    if Components[i] is TMaskEdit then TMaskEdit(Components[i]).Text := '';
  end;

  lbValorTotal.Caption := '0,00';
  edtNomeCliente.Text := '';
  cdTbRelProdutoOS.EmptyDataSet;
  cdTbRelServicoOS.EmptyDataSet;
end;

procedure TFCadOS.limpaItem;
begin
  edtFkCodProd.Text := '';
  edtNomeProduto.Text := '';
  edtQuantidade.Text := '';
  edtValorUnit.Text := '';

  edtFkCodServico.Text := '';
  edtDescricaoServico.Text := '';
  edtValorServico.Text := '';
end;

procedure TFCadOS.medtDataOsExit(Sender: TObject);
var
  x :string;
begin
  x := formatdatetime('dd.mm.yyyy',StrToDate(medtDataOS.Text));
end;

procedure TFCadOS.medtPlacaVeiculoExit(Sender: TObject);
var
  x: string;
begin
  x:= Trim(medtPlacaVeiculo.Text);
  if x='   -    ' then
  begin
    lbFkCodVeiculo.Caption := '';
    exit
  end;

  x:= 'select * from tbveiculo where placaveiculo = '+QuotedStr(medtPlacaVeiculo.Text);
  DM.executaSql(x,DM.sqlGeral);
  if DM.sqlGeral.FieldByName('pkcodveiculo').AsString = '' then
  begin
    showmessage('Veículo não encontrado');
    medtPlacaVeiculo.Text := '';
    exit;
  end;

  lbFkCodVeiculo.Caption := DM.sqlGeral.FieldByName('pkcodveiculo').AsString;

end;

procedure TFCadOS.mostra(codigo: string);
var
  x : string;
begin
  x := STbOS+' where pkcodos ='+codigo;
  DM.executaSql(x,DM.sqlOS);
  edtPkCodOS.Text := DM.sqlOS.FieldByName('pkcodos').AsString;
  edtfkcodcli.Text := DM.sqlOS.FieldByName('fkcodcli').AsString;
  medtDataOS.Text := FormatDateTime('dd/mm/yyyy', DM.sqlOS.FieldByName('dataos').AsDateTime);
  lbValorTotal.Caption := FormatFloat('#0.00', DM.sqlOS.FieldByName('valortotal').AsFloat);
  medtPlacaVeiculo.Text := DM.sqlOS.FieldByName('placaveiculo').AsString;
  mostraItens(codigo);
  edtFkCodCliExit(nil);
  medtPlacaVeiculoExit(nil);
end;

procedure TFCadOS.mostraItens(codigo: string);
var
  x : string;
begin
  x := STbRelProdutoOS+' where fkcodos ='+codigo;
  DM.executaSql(x,DM.sqlGeral);
  cdTbRelProdutoOs.EmptyDataSet;
  while not DM.sqlGeral.Eof do
  begin
    cdTbRelProdutoOS.Append;

    cdTbRelProdutoOS.FieldByName('pkcodrelp').AsInteger := Dm.sqlGeral.FieldByName('pkcodrelp').AsInteger;
    cdTbRelProdutoOS.FieldByName('fkcodos').AsInteger := DM.sqlGeral.FieldByName('fkcodos').AsInteger;
    cdTbRelProdutoOS.FieldByName('fkcodprod').AsInteger := DM.sqlGeral.FieldByName('fkcodprod').AsInteger;
    cdTbRelProdutoOS.FieldByName('nomeproduto').AsString := DM.sqlGeral.FieldByName('nomeprod').AsString;
    cdTbRelProdutoOS.FieldByName('quantidade').AsInteger := DM.sqlGeral.FieldByName('quantidade').AsInteger;
    cdTbRelProdutoOS.FieldByName('valorunitario').Asfloat := DM.sqlGeral.FieldByName('valorunitario').Asfloat;
    cdTbRelProdutoOS.FieldByName('valortotal').Asfloat := DM.sqlGeral.FieldByName('valortotal').Asfloat;
    cdTbRelProdutoOS.FieldByName('controle').AsInteger := -1;

    cdTbRelProdutoOS.Post;
    DM.sqlGeral.Next;
  end;

  x := STbRelServicoOS+' where fkcodos ='+codigo;
  DM.executaSql(x,DM.sqlGeral);
  cdTbRelServicoOs.EmptyDataSet;
  while not DM.sqlGeral.Eof do
  begin
    cdTbRelServicoOS.Append;

    cdTbRelServicoOS.FieldByName('pkcodrels').AsInteger := Dm.sqlGeral.FieldByName('pkcodrels').AsInteger;
    cdTbRelServicoOS.FieldByName('fkcodos').AsInteger := DM.sqlGeral.FieldByName('fkcodos').AsInteger;
    cdTbRelServicoOS.FieldByName('fkcodservico').AsInteger := DM.sqlGeral.FieldByName('fkcodservico').AsInteger;
    cdTbRelServicoOS.FieldByName('descricaoservico').AsString := DM.sqlGeral.FieldByName('descricaoservico').AsString;
    cdTbRelServicoOS.FieldByName('valorservico').Asfloat := DM.sqlGeral.FieldByName('valorservico').Asfloat;
    cdTbRelServicoOS.FieldByName('controle').AsInteger := -1;

    cdTbRelServicoOS.Post;
    DM.sqlGeral.Next;
  end;

end;

end.
