unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Vcl.StdCtrls;

type
  TDM = class(TDataModule)
    fdcConexao: TFDConnection;
    fdtTransacao: TFDTransaction;
    sqlCliente: TFDQuery;
    dsCliente: TDataSource;
    fdtTransacaoAltera: TFDTransaction;
    sqlAltera: TFDQuery;
    sqlServico: TFDQuery;
    dsServico: TDataSource;
    sqlProduto: TFDQuery;
    dsProduto: TDataSource;
    sqlMarca: TFDQuery;
    dsMarca: TDataSource;
    sqlVeiculo: TFDQuery;
    dsVeiculo: TDataSource;
    sqlGeral: TFDQuery;
    sqlOS: TFDQuery;
    dsOS: TDataSource;
    sqlRelatorioProd: TFDQuery;
    dsRelatorioProd: TDataSource;
    sqlRelatorioServ: TFDQuery;
    dsRelatorioServ: TDataSource;
    sqlRelatorioCli: TFDQuery;
    dsRelatorioCli: TDataSource;
    sqlRelatorioVei: TFDQuery;
    dsRelatorioVei: TDataSource;
    sqlRelatorioMarca: TFDQuery;
    dsRelatorioMarca: TDataSource;
    sqlRelatorioOS: TFDQuery;
    dsRelatorioOS: TDataSource;
  private

    { Private declarations }
  public
    procedure executaSql(comando : string; q :TFDQuery);
    function LimpaEdit(Edt: TCustomEdit; K : char; C :char='#'): char;
    function limpaVir(num : string):string;
    function salvaChave(chave : string):string;
    function salvaData(data : string):string;
    { Public declarations }
  end;

var
  DM: TDM;
  STbCliente :string= 'select * from tbcliente ';
  STbServico :string= 'select * from tbservico ';
  STbProduto :string= 'select * from tbproduto ';
  STbMarca   :string= 'select * from tbmarca ';
  STbVeiculo :string= 'select * from tbveiculo v  '
                    + 'inner join tbmarca m on m.pkcodmarca = v.fkcodmarca ';
  STbOS :string= 'select * from tbos o '
                +' inner join tbcliente c on c.pkcodcli = o.fkcodcli'
                +' inner join tbveiculo v on v.pkcodveiculo = o.fkcodveiculo'
                +' inner join tbmarca m on m.pkcodmarca = v.fkcodmarca';
  STbRelProdutoOS :string= 'select * from tbrelprodutoos r'
                          +' inner join tbproduto p on p.pkcodprod = r.fkcodprod';
  STbRelServicoOS :string= 'select * from tbrelservicoos r '
                          +' inner join tbservico s on s.pkcodservico = r.fkcodservico ';

  SRelatorioProd :string= 'select p.pkcodprod, p.nomeprod, p.valorvendaprod, sum(r.quantidade) from tbproduto p '
                         +' left join tbrelprodutoos r on p.pkcodprod = r.fkcodprod ';
  SRelatorioProd2 :string=' group by p.nomeprod, p.pkcodprod, p.valorvendaprod';

  SRelatorioServ :string= 'select s.pkcodservico, s.descricaoservico, s.valorbase, count(*) from tbservico s '
                         +' inner join tbrelservicoos r on s.pkcodservico = r.fkcodservico';
  SRelatorioServ2 :string=' group by s.descricaoservico, s.pkcodservico, s.valorbase';

  SRelatorioCli :string= 'select c.pkcodcli, c.nomecli, count(*), sum(o.valortotal), avg(o.valortotal) from tbcliente c '
                        +' inner join tbos o on c.pkcodcli = o.fkcodcli';
  SRelatorioCli2 :string=' group by c.nomecli, c.pkcodcli ';

  SRelatorioVei :string= 'select v.pkcodveiculo, v.placaveiculo, m.nomemarca, count(*), avg(o.valortotal), sum(o.valortotal) from tbveiculo v '
                        +' inner join tbos o on v.pkcodveiculo = o.fkcodveiculo '
                        +' inner join tbmarca m on m.pkcodmarca = v.fkcodmarca';
  SRelatorioVei2 :string=' group by v.placaveiculo, v.pkcodveiculo, m.nomemarca ';

  SRelatorioMarca :string= 'select m.pkcodmarca, m.nomemarca, count(*), avg(o.valortotal), sum(o.valortotal) from tbmarca m '
                          +' inner join tbveiculo v on m.pkcodmarca = v.fkcodmarca '
                          +' inner join tbos o on v.pkcodveiculo = o.fkcodveiculo ';
  SRelatorioMarca2 :string=' group by m.nomemarca, m.pkcodmarca';

  SRelatorioOS :string= 'select extract(MONTH from dataos) AS MES, extract(YEAR from dataos) AS ANO, '
                        +' count(*), avg(valortotal), sum(valortotal) from tbos ';
  SRelatorioOS2 :string= ' group by extract(MONTH from dataos),extract(YEAR from dataos) ';


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.executaSql(comando : string; q :TFDQuery);
begin
  comando := trim(comando);
  with q do
  begin
    close;
    sql.clear;
    sql.Add(comando);
    if UpperCase(Copy(comando,1,6)) = 'SELECT' then
      open
    else
      execsql;
  end;

end;

function TDM.limpaVir(num: string): string;
var
  i: integer;
begin
  num := trim(num);
  if num='' then
    num:='0';

  for I := 1 to Length(num) do
    if num[i]=',' then
      num[i]:='.';

  limpaVir := num;
end;

function TDM.salvaChave(chave: string): string;
begin
  chave:=Trim(chave);
  if (chave='') or (chave='-1') then
    chave:='NULL';
  salvaChave:=chave;
end;

function TDM.salvaData(data: string): string;
var
  x : string;
begin
  if data = '  /  /    ' then
    x:='NULL'
  else
    x:= QuotedStr(formatdatetime('dd.mm.yyyy',StrToDate(data)));
  salvaData := x;
end;

function TDM.LimpaEdit(Edt: TCustomEdit; K, C: char): char;
var
  B, I: integer;
begin
  if not(K in['0'..'9', #8, C, #13]) then
  begin
    LimpaEdit := #0;
    Exit;
  end;

  B := 0;
  for I := 1 to Length(Edt.Text) do
    if Edt.Text[I] = C then
      B := B + 1;

  if (B > 0) then
    if ((K in['0'..'9', #8])) then
      LimpaEdit := K
    else
    begin
      K := #0;
      LimpaEdit := (#0) ;
    end;

  LimpaEdit := K;
end;

end.
