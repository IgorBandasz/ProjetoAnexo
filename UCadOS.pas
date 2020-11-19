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
    lbNomeCliente: TLabel;
    lbFkCodVeiculo: TLabel;
    lbCod: TLabel;
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
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadOS: TFCadOS;
  acaoGeral :integer=3;
  pkCodOS : string;

implementation

{$R *.dfm}

uses UDM, ULocOS;


procedure TFCadOS.btAdicionarProdutoClick(Sender: TObject);
begin
  try
    cdTbRelProdutoOS.Append;
    cdTbRelProdutoOS.FieldByName('fkcodprod').AsInteger := StrToInt(edtFkCodProd.Text);
    cdTbRelProdutoOS.FieldByName('nomeproduto').AsString := edtNomeProduto.Text;
    cdTbRelProdutoOS.FieldByName('quantidade').AsInteger := StrToInt(edtQuantidade.Text);
    cdTbRelProdutoOS.FieldByName('valorunitario').Asfloat := StrToFloat(edtValorUnit.Text);
    cdTbRelProdutoOS.FieldByName('valortotal').Asfloat := cdTbRelProdutoOS.FieldByName('quantidade').AsInteger * cdTbRelProdutoOS.FieldByName('valorunit').Asfloat;
    cdTbRelProdutoOS.FieldByName('controle').AsInteger := 1;
    cdTbRelProdutoOS.Post;
    limpaItem;
    calculaTotal;
  except
     cdTbRelProdutoOS.Cancel;
     showmessage('Erro ao adicionar Produto � lista');
  end;
end;

procedure TFCadOS.btAdicionarServicoClick(Sender: TObject);
begin
  try
    cdTbRelServicoOS.Append;
    cdTbRelServicoOS.FieldByName('fkcodservico').AsInteger := StrToInt(edtFkCodServico.Text);
    cdTbRelServicoOS.FieldByName('descricaoservico').AsString := edtDescricaoServico.Text;
    cdTbRelServicoOS.FieldByName('valorservico').Asfloat := StrToFloat(edtValorServico.Text);
    cdTbRelServicoOS.FieldByName('controle').AsInteger := 1;
    cdTbRelServicoOS.Post;
    limpaItem;
    calculaTotal;
  except
     cdTbRelServicoOS.Cancel;
     showmessage('Erro ao adicionar Servi�o � lista');
  end;
end;

procedure TFCadOS.btCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFCadOS.btSalvarClick(Sender: TObject);
var
  x : string;
begin
  try
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
      edtPkCodOS.Text := Dm.sqlGeral.FieldByName('maior').AsString;
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
    lbNomeCliente.Caption := '';
    exit
  end;

  x:= 'select * from tbcliente where pkcodcli = '+x;
  DM.executaSql(x,DM.sqlGeral);
  if DM.sqlGeral.FieldByName('pkcodcli').AsString = '' then
  begin
    showmessage('Cliente n�o encontrado');
    if edtfkcodcli.CanFocus then
      edtfkcodcli.SetFocus;
    exit;
  end;

  lbNomeCliente.Caption := DM.sqlGeral.FieldByName('nomecli').AsString;
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
    showmessage('Produto n�o encontrado');
    if edtFkCodProd.CanFocus then
      edtFkCodProd.SetFocus;
    exit;
  end;

  edtNomeProduto.Text := DM.sqlGeral.FieldByName('nomeprod').AsString;
  edtValorUnit.Text := DM.sqlGeral.FieldByName('valorvendaprod').AsString;

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
  lbNomeCliente.Caption :='';
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
  showmessage(x);
  DM.executaSql(x,DM.sqlGeral);
  if DM.sqlGeral.FieldByName('pkcodveiculo').AsString = '' then
  begin
    showmessage('Ve�culo n�o encontrado');
    if medtPlacaVeiculo.CanFocus then
      medtPlacaVeiculo.SetFocus;
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
  mostraItens(codigo);
  edtFkCodCliExit(nil);
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
