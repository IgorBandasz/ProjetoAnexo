unit UCadVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFCadVeiculo = class(TForm)
    pBotoes: TPanel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btRemover: TBitBtn;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    btSair: TBitBtn;
    dbgVeiculos: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    pDados: TPanel;
    lbCodigo: TLabel;
    lbMarca: TLabel;
    lbPlaca: TLabel;
    edtPkCodVeiculo: TEdit;
    cbNomeMarca: TComboBox;
    cbFkCodMarca: TComboBox;
    dbedtPkCodVeiculo: TDBEdit;
    medtPlacaVeiculo: TMaskEdit;
    pOrdem: TPanel;
    lbOrdem: TLabel;
    cbOrdem: TComboBox;
    procedure mostra;
    procedure limpa;
    procedure controleBotoes(acao :integer);
    procedure carregaMarca;
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtPkCodVeiculoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbNomeMarcaExit(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure cbOrdemChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadVeiculo: TFCadVeiculo;
  acaoGeral :integer=3;

implementation

{$R *.dfm}

uses UDM;

{ TFCadVeiculo }

procedure TFCadVeiculo.btAlterarClick(Sender: TObject);
begin
  btPesquisar.Enabled := false;
  acaoGeral := 1;
  controleBotoes(acaoGeral);
end;

procedure TFCadVeiculo.btCancelarClick(Sender: TObject);
begin
  btPesquisar.Enabled := true;
  acaoGeral := 3;
  mostra;
  controleBotoes(acaoGeral);
end;

procedure TFCadVeiculo.btNovoClick(Sender: TObject);
begin
  btPesquisar.Enabled := false;
  acaoGeral := 0;
  controleBotoes(acaoGeral);
end;

procedure TFCadVeiculo.btPesquisarClick(Sender: TObject);
var
  comando, condicao, ordem : string;
begin
  comando := STbVeiculo;
  condicao := Trim(edtPesquisa.Text);
  if condicao <> '' then
  begin
    case cbPesquisa.ItemIndex of
      1: condicao := ' where pkcodveiculo ='+condicao;
      2: condicao := ' where upper(v.placaveiculo) like upper('+QuotedStr(condicao+'%')+')';
      3: condicao := ' where upper(m.nomemarca) like upper('+QuotedStr(condicao+'%')+')';
    end;
    comando := comando+condicao;
  end;

  case cbOrdem.ItemIndex of
    0: ordem := ' order by v.placaveiculo';
    1: ordem := ' order by v.placaveiculo desc';
    2: ordem := ' order by m.nomemarca';
    3: ordem := ' order by m.nomemarca desc';
    4: ordem := ' order by v.pkcodveiculo';
    5: ordem := ' order by v.pkcodveiculo desc';
  end;
  comando := comando + ordem;

  DM.executaSql(comando,dm.sqlVeiculo);
end;

procedure TFCadVeiculo.btRemoverClick(Sender: TObject);
var
  comando : string;
begin
  try
    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    comando:='DELETE FROM TBVEICULO'
       +' WHERE PKCODVEICULO = '+edtPkCodVeiculo.Text;

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

procedure TFCadVeiculo.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TFCadVeiculo.btSalvarClick(Sender: TObject);
var
  comando : string;
begin
  try
    btPesquisar.Enabled := true;

    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    case acaoGeral of
      0: begin
        comando := 'select * from tbveiculo where placaveiculo ='+QuotedStr(medtPlacaVeiculo.Text);
        DM.executaSql(comando,DM.sqlGeral);
        if DM.sqlGeral.FieldByName('pkcodveiculo').AsString <> '' then
          begin
            ShowMessage('Placa de veículo já cadastrada');
            if medtPlacaVeiculo.CanFocus then
              medtPlacaVeiculo.SetFocus;
            exit
        end;

        if cbFkCodMarca.Text = '' then
        begin
          showmessage('Você precisa cadastrar uma Marca na área de cadastramento primeiro, só depois poderá cadastrar um Veículo');
          exit;
        end;
        comando:=' INSERT INTO TBVEICULO (PLACAVEICULO, FKCODMARCA)'+
        'VALUES ('+QuotedStr(medtPlacaVeiculo.Text)
                  +','+DM.salvaChave(cbFkCodMarca.Text)+')';
      end;
      1: begin
        comando:='UPDATE TBVEICULO'
           +' SET PLACAVEICULO = '+QuotedStr(medtPlacaVeiculo.Text)
           +', FKCODMARCA ='+DM.salvaChave(cbFkCodMarca.Text)
           +' WHERE PKCODVEICULO = '+edtPkCodVeiculo.Text;
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

procedure TFCadVeiculo.carregaMarca;
var
 x:string;
begin
  x:='select * from tbmarca order by nomemarca';
  DM.executaSQl(x,DM.SqlGeral);
  cbNomeMarca.Items.Clear;
  cbFkCodMarca.Items.Clear;
  while not DM.SqlGeral.Eof do
  begin
    cbFkCodMarca.Items.Add(dm.SqlGeral.FieldByName('pkcodmarca').AsString);
    cbNomeMarca.Items.Add(dm.SqlGeral.FieldByName('nomemarca').AsString);
    DM.SqlGeral.Next;
  end;

end;

procedure TFCadVeiculo.cbNomeMarcaExit(Sender: TObject);
begin
  cbFkCodMarca.ItemIndex := cbNomeMarca.ItemIndex;
end;

procedure TFCadVeiculo.cbOrdemChange(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFCadVeiculo.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
  if edtPesquisa.CanFocus then
    edtPesquisa.SetFocus;
end;

procedure TFCadVeiculo.controleBotoes(acao: integer);
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
      if medtPlacaVeiculo.CanFocus then
        medtPlacaVeiculo.SetFocus;
    end;
    1: begin
      BtSalvar.Enabled := true;
      BtCancelar.Enabled := true;
      if medtPlacaVeiculo.CanFocus then
        medtPlacaVeiculo.SetFocus;
    end;
    else begin
       BtNovo.Enabled := true;
       if DM.sqlVeiculo.FieldByName('pkcodveiculo').AsString <> '' then
       begin
          BtAlterar.Enabled := true;
          BtRemover.Enabled := true;
       end;
    end;
  end;
end;

procedure TFCadVeiculo.dbedtPkCodVeiculoChange(Sender: TObject);
begin
  if acaoGeral in[0,1] then
    exit;
  mostra;
end;

procedure TFCadVeiculo.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  case cbPesquisa.ItemIndex of
    0: key := #0;
    1: key := DM.LimpaEdit((Sender as TCustomEdit),Key);
  end;
end;

procedure TFCadVeiculo.FormActivate(Sender: TObject);
begin
  carregaMarca;
  btPesquisarClick(nil);
  controleBotoes(acaoGeral);
end;

procedure TFCadVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  acaoGeral := 3;
  FCadVeiculo := nil;
  Action := caFree;
end;

procedure TFCadVeiculo.limpa;
var
  i : integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then TEdit(Components[i]).Text := '';
    if Components[i] is TMaskEdit then TMaskEdit(Components[i]).Text := '';
    cbNomeMarca.ItemIndex := 0;
    cbNomeMarcaExit(nil);
  end;
end;

procedure TFCadVeiculo.mostra;
begin
  if(DM.sqlVeiculo.Active = false) or (DM.sqlVeiculo.FieldByName('pkcodveiculo').AsString = '') then
  begin
    limpa;
    exit;
  end;
  edtPkCodVeiculo.Text := DM.sqlVeiculo.FieldByName('pkcodveiculo').AsString;
  medtPlacaVeiculo.Text := DM.sqlVeiculo.FieldByName('placaveiculo').AsString;
  cbFkCodMarca.ItemIndex := cbFkCodMarca.Items.IndexOf(DM.sqlVeiculo.FieldByName('fkcodmarca').AsString);
  cbNomeMarca.ItemIndex := cbFkCodMarca.ItemIndex;
end;

end.
