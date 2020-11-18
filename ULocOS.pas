unit ULocOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFLocOS = class(TForm)
    pBotoes: TPanel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btRemover: TBitBtn;
    btSair: TBitBtn;
    dbgServicos: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    procedure mostra;
    procedure limpa;
    procedure controleBotoes(acao :integer);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure edtFkCodCliExit(Sender: TObject);
    procedure medtPlacaVeiculoExit(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtPkCodOSChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbPesquisaChange(Sender: TObject);
  private
    procedure controleNotoes(acao: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLocOS: TFLocOS;
  acaoGeral :integer =3;
implementation

{$R *.dfm}

uses UDM;

{ TFLocOS }

procedure TFLocOS.btAlterarClick(Sender: TObject);
begin
  btPesquisar.Enabled := false;
  acaoGeral := 1;
  controleBotoes(acaoGeral);
end;

procedure TFLocOS.btCancelarClick(Sender: TObject);
begin
  btPesquisar.Enabled := true;
  acaoGeral := 3;
  mostra;
  controleBotoes(acaoGeral);
end;

procedure TFLocOS.btNovoClick(Sender: TObject);
begin
  btPesquisar.Enabled := false;
  acaoGeral := 0;
  controleBotoes(acaoGeral);
end;

procedure TFLocOS.btPesquisarClick(Sender: TObject);
var
  comando, condicao : string;
begin
  comando := STbOS;
  condicao := Trim(edtPesquisa.Text);
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodos ='+condicao;
      2: condicao := ' where fkcodcli ='+condicao;
      3: condicao := ' where fkcodveiculo ='+condicao;
      4: condicao := ' where upper(nomecli) like upper('+QuotedStr(condicao+'%')+')';
      5: condicao := ' where upper(placaveiculo) like upper('+QuotedStr(condicao+'%')+')';

    end;
    comando := comando+condicao;
  end;
  DM.executaSql(comando,dm.sqlOS);

end;

procedure TFLocOS.btRemoverClick(Sender: TObject);
var
  comando : string;
begin
  try
    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    comando:='DELETE FROM TBOS'
       +' WHERE PKCODOS = '+edtPkCodOS.Text;

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

procedure TFLocOS.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TFLocOS.btSalvarClick(Sender: TObject);
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
        Dm.executaSql(STbCliente,DM.sqlCliente);
        if DM.sqlCliente.FieldByName('pkcodcli').AsString = '' then
        begin
          showmessage('Voc� precisa cadastrar um Cliente na �rea de cadastramento de Cliente');
        end;
        comando:=' INSERT INTO TBOS (DATAOS, FKCODVEICULO, FKCODCLI, VALORTOTAL)'+
        'VALUES ('+QuotedStr(medtDataOS.Text)
                  +','+DM.salvaChave(lbFkcodVeiculo.Caption)
                  +','+DM.salvaChave(edtFkCodCli.Text)
                  +','+DM.limpaVir(edtValorTotal.Text)
                  +')';
      end;
      1: begin
        comando:='UPDATE TBOS'
           +' SET DATAOS = '+QuotedStr(medtDataOS.Text)
           +', FKCODVEICULO ='+DM.salvaChave(lbFkcodVeiculo.Caption)
           +', FKCODCLI ='+DM.salvaChave(edtFkCodCli.Text)
           +', VALORTOTAL ='+DM.limpaVir(edtValorTotal.Text)
           +' WHERE PKCODOS = '+edtPkCodOS.Text;
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

procedure TFLocOS.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TFLocOS.controleBotoes(acao: integer);
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
      if edtFkCodCLi.CanFocus then
        edtFkCodCli.SetFocus;
    end;
    1: begin
      BtSalvar.Enabled := true;
      BtCancelar.Enabled := true;
      if edtFkCodCli.CanFocus then
        edtFkCodCli.SetFocus;
    end;
    else begin
       BtNovo.Enabled := true;
       if DM.sqlOS.FieldByName('pkcodos').AsString <> '' then
       begin
          BtAlterar.Enabled := true;
          BtRemover.Enabled := true;
       end;
    end;
  end;
end;

procedure TFLocOS.controleNotoes(acao: integer);
begin

end;

procedure TFLocOS.dbedtPkCodOSChange(Sender: TObject);
begin
  if acaoGeral in[0,1] then
    exit;
  mostra;
end;

procedure TFLocOS.edtFkCodCliExit(Sender: TObject);
var
 x:string;
begin
   x:=Trim(edtFkCodCli.Text);
   if x='' then
   begin
     lbNomeCliente.Caption:='';
     Exit;
   end;
   x := STbCliente+' where pkcodcli='+x;
   DM.executaSQl(x,DM.SqlGeral);
   if DM.SqlGeral.FieldByName('pkcodcli').AsString='' then
   begin
     ShowMessage('Cliente com este c�digo n�o encontrado');
     if edtFkCodCli.CanFocus then
       edtFkCodCli.SetFocus;
     Exit;
   end;
   lbNomeCliente.Caption := DM.SqlGeral.FieldByName('nomecli').AsString;
end;

procedure TFLocOS.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1,2,3: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
  end;
end;

procedure TFLocOS.FormActivate(Sender: TObject);
begin
  btPesquisarClick(nil);
  controleBotoes(acaoGeral);
end;

procedure TFLocOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  acaoGeral := 3;
  FLocOS := nil;
  Action := caFree;
end;

procedure TFLocOS.limpa;
var
  i: integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then TEdit(Components[i]).Text := '';
    if Components[i] is TMaskEdit then TMaskEdit(Components[i]).Text := ''
  end;
end;

procedure TFLocOS.medtPlacaVeiculoExit(Sender: TObject);
var
 x:string;
begin
   x:=medtPlacaVeiculo.Text;
   if x = '' then
   begin
     lbFkCodVeiculo.Caption := '';
     Exit;
   end;
   x := STbVeiculo+' where placaveiculo='+x;
   DM.executaSQl(x,DM.SqlGeral);
   if DM.SqlGeral.FieldByName('pkcodveiculo').AsString='' then
   begin
     ShowMessage('Ve�culo com esta placa n�o encontrado');
     if medtPlacaVeiculo.CanFocus then
       medtPlacaVeiculo.SetFocus;
     Exit;
   end;
   lbFkCodVeiculo.Caption := DM.SqlGeral.FieldByName('pkcodveiculo').AsString;

end;

procedure TFLocOS.mostra;
begin
  if(DM.sqlOS.Active = false) or (DM.sqlOS.FieldByName('pkcodos').AsString = '') then
  begin
    limpa;
    exit;
  end;
  edtPkCodOS.Text := DM.sqlOS.FieldByName('pkcodveiculo').AsString;
  medtPlacaVeiculo.Text := DM.sqlOS.FieldByName('placaveiculo').AsString;
  edtFkCodCli.Text := DM.sqlOS.FieldByName('fkcodcli').AsString;
  lbNomeCliente.Caption := DM.sqlOS.FieldByName('nomecli').AsString;
  medtDataOS.Text := FormatDateTime('dd/mm/yyyy', DM.sqlOS.FieldByName('dataos').AsString);
  edtValorTotal.Text := DM.sqlOS.FieldByName('valortotal').AsString;
end;

end.
