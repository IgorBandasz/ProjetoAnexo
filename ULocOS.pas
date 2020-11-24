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
    dbgOS: TDBGrid;
    pListagem: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TEdit;
    btPesquisar: TBitBtn;
    pOrdem: TPanel;
    lbOrdem: TLabel;
    cbOrdem: TComboBox;
    procedure controleBotoes();
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbPesquisaChange(Sender: TObject);
    procedure cbOrdemChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLocOS: TFLocOS;
  acaoGeral :integer =3;
implementation

{$R *.dfm}

uses UDM, UCadOS;

{ TFLocOS }

procedure TFLocOS.btAlterarClick(Sender: TObject);
begin
  UCadOS.acaoGeral := 1;
  UCadOS.pkCodOS := DM.sqlOS.FieldByName('pkcodos').AsString;
  if FCadOS = nil then
    application.Createform(TFCadOS,FCadOS);
  FCadOS.ShowModal;
end;

procedure TFLocOS.btNovoClick(Sender: TObject);
begin
  UCadOS.acaoGeral := 0;
  if FCadOS = nil then
    application.Createform(TFCadOS,FCadOS);
  FCadOS.ShowModal;
end;

procedure TFLocOS.btPesquisarClick(Sender: TObject);
var
  comando, condicao, ordem : string;
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
      6: condicao := ' where fkcodmarca ='+condicao;
      7: condicao := ' where upper(nomemarca) like upper('+QuotedStr(condicao+'%')+')';

    end;
    comando := comando+condicao;
  end;

  case cbOrdem.ItemIndex of
    0: ordem := ' order by extract(YEAR from o.dataos) desc, extract(MONTH from o.dataos) desc, extract(DAY from o.dataos) desc';
    1: ordem := ' order by extract(YEAR from o.dataos), extract(MONTH from o.dataos), extract(DAY from o.dataos)';
    2: ordem := ' order by o.pkcodos';
    3: ordem := ' order by o.pkcodos desc';
    4: ordem := ' order by o.fkcodcli';
    5: ordem := ' order by o.fkcodcli desc';
    6: ordem := ' order by c.nomecli';
    7: ordem := ' order by c.nomecli desc';
    8: ordem := ' order by v.placaveiculo';
    9: ordem := ' order by v.placaveiculo desc';
    10: ordem := ' order by o.valortotal desc';
    11: ordem := ' order by o.valortotal';
  end;
  comando := comando + ordem;

  DM.executaSql(comando,DM.sqlOS);
end;

procedure TFLocOS.btRemoverClick(Sender: TObject);
var
  comando, codigo : string;
begin
  try
    if DM.fdtTransacaoAltera.TransactionIntf.Active then
      DM.fdtTransacaoAltera.Rollback;
    DM.fdtTransacaoAltera.StartTransaction;

    codigo := DM.sqlOS.FieldByName('pkcodos').AsString;

    comando:='DELETE FROM TBRELPRODUTOOS'
       +' WHERE FKCODOS = '+codigo;
    DM.executaSql(comando,DM.sqlAltera);

    comando:='DELETE FROM TBRELSERVICOOS'
       +' WHERE FKCODOS = '+codigo;
    DM.executaSql(comando,DM.sqlAltera);

    comando:='DELETE FROM TBOS'
       +' WHERE PKCODOS = '+codigo;
    DM.executaSql(comando,DM.sqlAltera);

    DM.fdtTransacaoAltera.Commit;
    btPesquisarClick(nil);
    controleBotoes();
  except
    DM.fdtTransacaoAltera.Rollback;
    showmessage('erro ao apagar dados');
  end;
end;

procedure TFLocOS.btSairClick(Sender: TObject);
begin
  close;
end;


procedure TFLocOS.cbOrdemChange(Sender: TObject);
begin
  btPesquisarClick(nil);
end;

procedure TFLocOS.cbPesquisaChange(Sender: TObject);
begin
  edtPesquisa.Text := '';
  if edtPesquisa.CanFocus then
    edtPesquisa.SetFocus;
end;

procedure TFLocOS.controleBotoes();
begin
  BtAlterar.Enabled := false;
  BtRemover.Enabled := false;
  if DM.sqlOS.FieldByName('pkcodos').AsString <> '' then
    begin
      BtAlterar.Enabled := true;
      BtRemover.Enabled := true;
    end;
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
  controleBotoes();
end;

procedure TFLocOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FLocOS := nil;
  Action := caFree;
end;

end.
