unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TFPrincipal = class(TForm)
    pCadastro: TPanel;
    pRelatorios: TPanel;
    lbCadastro: TLabel;
    lbRelatorios: TLabel;
    btCadCliente: TBitBtn;
    btCadVeiculo: TBitBtn;
    btCadMarca: TBitBtn;
    btCadProduto: TBitBtn;
    btCadServico: TBitBtn;
    btCadOS: TBitBtn;
    btRelServico: TBitBtn;
    btRelProduto: TBitBtn;
    btRelMarca: TBitBtn;
    btRelVeiculo: TBitBtn;
    btRelCliente: TBitBtn;
    btRelOS: TBitBtn;
    Label1: TLabel;
    lbTitulo: TLabel;
    procedure Sair1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Servio1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Veculo1Click(Sender: TObject);
    procedure OS1Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure Servio2Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure Veculo2Click(Sender: TObject);
    procedure Marca2Click(Sender: TObject);
    procedure OS2Click(Sender: TObject);
    procedure btCadOSClick(Sender: TObject);
    procedure btCadClienteClick(Sender: TObject);
    procedure btCadVeiculoClick(Sender: TObject);
    procedure btCadMarcaClick(Sender: TObject);
    procedure btCadProdutoClick(Sender: TObject);
    procedure btCadServicoClick(Sender: TObject);
    procedure btRelOSClick(Sender: TObject);
    procedure btRelClienteClick(Sender: TObject);
    procedure btRelVeiculoClick(Sender: TObject);
    procedure btRelMarcaClick(Sender: TObject);
    procedure btRelProdutoClick(Sender: TObject);
    procedure btRelServicoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses UCadCliente, UCadServico, UCadProduto, UCadMarca, UCadVeiculo, ULocOS,
  URelatorioProduto, URelatorioServico, URelatorioCliente, URelatorioVeiculo,
  URelatorioMarca, URelatorioOS;

procedure TFPrincipal.btCadClienteClick(Sender: TObject);
begin
  if FCadCliente = nil then
    Application.CreateForm(TFCadCliente,FCadCliente);
  FCadCliente.ShowModal;
end;

procedure TFPrincipal.btCadMarcaClick(Sender: TObject);
begin
   if FCadMarca = nil then
    Application.CreateForm(TFCadMarca,FCadMarca);
  FCadMarca.ShowModal;
end;

procedure TFPrincipal.btCadOSClick(Sender: TObject);
begin
   if FLocOS = nil then
    Application.CreateForm(TFLocOS,FLocOS);
  FLocOS.ShowModal;
end;

procedure TFPrincipal.btCadProdutoClick(Sender: TObject);
begin
   if FCadProduto = nil then
    Application.CreateForm(TFCadProduto,FCadProduto);
  FCadProduto.ShowModal;
end;

procedure TFPrincipal.btCadServicoClick(Sender: TObject);
begin
   if FCadServico = nil then
    Application.CreateForm(TFCadServico,FCadServico);
  FCadServico.ShowModal;
end;

procedure TFPrincipal.btCadVeiculoClick(Sender: TObject);
begin
   if FCadVeiculo = nil then
    Application.CreateForm(TFCadVeiculo,FCadVeiculo);
  FCadVeiculo.ShowModal;
end;

procedure TFPrincipal.btRelClienteClick(Sender: TObject);
begin
    if FRelatorioCliente = nil then
    Application.CreateForm(TFRelatorioCliente,FRelatorioCliente);
  FRelatorioCliente.ShowModal;
end;

procedure TFPrincipal.btRelMarcaClick(Sender: TObject);
begin
   if FRelatorioMarca = nil then
    Application.CreateForm(TFRelatorioMarca,FRelatorioMarca);
  FRelatorioMarca.ShowModal;
end;

procedure TFPrincipal.btRelOSClick(Sender: TObject);
begin
   if FRelatorioOS = nil then
    Application.CreateForm(TFRelatorioOS,FRelatorioOS);
  FRelatorioOS.ShowModal;
end;

procedure TFPrincipal.btRelProdutoClick(Sender: TObject);
begin
   if FRelatorioProduto = nil then
    Application.CreateForm(TFRelatorioProduto,FRelatorioProduto);
  FRelatorioProduto.ShowModal;
end;

procedure TFPrincipal.btRelServicoClick(Sender: TObject);
begin
   if FRelatorioServico = nil then
    Application.CreateForm(TFRelatorioServico,FRelatorioServico);
  FRelatorioServico.ShowModal;
end;

procedure TFPrincipal.btRelVeiculoClick(Sender: TObject);
begin
   if FRelatorioVeiculo = nil then
    Application.CreateForm(TFRelatorioVeiculo, FRelatorioVeiculo);
   FRelatorioVeiculo.ShowModal;
end;

procedure TFPrincipal.Cliente1Click(Sender: TObject);
begin
  if FCadCliente = nil then
    Application.CreateForm(TFCadCliente,FCadCliente);
  FCadCliente.ShowModal;
end;

procedure TFPrincipal.Cliente2Click(Sender: TObject);
begin
  if FRelatorioCliente = nil then
    Application.CreateForm(TFRelatorioCliente,FRelatorioCliente);
  FRelatorioCliente.ShowModal;
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FPrincipal := nil;
  Action := caFree;
end;

procedure TFPrincipal.Marca1Click(Sender: TObject);
begin
   if FCadMarca = nil then
    Application.CreateForm(TFCadMarca,FCadMarca);
  FCadMarca.ShowModal;
end;

procedure TFPrincipal.Marca2Click(Sender: TObject);
begin
   if FRelatorioMarca = nil then
    Application.CreateForm(TFRelatorioMarca,FRelatorioMarca);
  FRelatorioMarca.ShowModal;
end;

procedure TFPrincipal.OS1Click(Sender: TObject);
begin
  if FLocOS = nil then
    Application.CreateForm(TFLocOS,FLocOS);
  FLocOS.ShowModal;
end;

procedure TFPrincipal.OS2Click(Sender: TObject);
begin
   if FRelatorioOS = nil then
    Application.CreateForm(TFRelatorioOS,FRelatorioOS);
  FRelatorioOS.ShowModal;
end;

procedure TFPrincipal.Produto1Click(Sender: TObject);
begin
  if FCadProduto = nil then
    Application.CreateForm(TFCadProduto,FCadProduto);
  FCadProduto.ShowModal;
end;

procedure TFPrincipal.Produto2Click(Sender: TObject);
begin
   if FRelatorioProduto = nil then
    Application.CreateForm(TFRelatorioProduto,FRelatorioProduto);
  FRelatorioProduto.ShowModal;
end;

procedure TFPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFPrincipal.Servio1Click(Sender: TObject);
begin
  if FCadServico = nil then
    Application.CreateForm(TFCadServico,FCadServico);
  FCadServico.ShowModal;
end;

procedure TFPrincipal.Servio2Click(Sender: TObject);
begin
   if FRelatorioServico = nil then
    Application.CreateForm(TFRelatorioServico,FRelatorioServico);
  FRelatorioServico.ShowModal;
end;

procedure TFPrincipal.Veculo1Click(Sender: TObject);
begin
   if FCadVeiculo = nil then
    Application.CreateForm(TFCadVeiculo,FCadVeiculo);
  FCadVeiculo.ShowModal;
end;

procedure TFPrincipal.Veculo2Click(Sender: TObject);
begin
  if FRelatorioVeiculo = nil then
    Application.CreateForm(TFRelatorioVeiculo, FRelatorioVeiculo);
    FRelatorioVeiculo.ShowModal;
end;

end.
