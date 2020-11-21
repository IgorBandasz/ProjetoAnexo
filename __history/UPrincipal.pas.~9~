unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask;

type
  TFPrincipal = class(TForm)
    menuPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Cliente1: TMenuItem;
    Produto1: TMenuItem;
    Servio1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Marca1: TMenuItem;
    Veculo1: TMenuItem;
    OS1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Servio1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Veculo1Click(Sender: TObject);
    procedure OS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses UCadCliente, UCadServico, UCadProduto, UCadMarca, UCadVeiculo, ULocOS;

procedure TFPrincipal.Cliente1Click(Sender: TObject);
begin
  if FCadCliente = nil then
    Application.CreateForm(TFCadCliente,FCadCliente);
  FCadCliente.ShowModal;
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

procedure TFPrincipal.OS1Click(Sender: TObject);
begin
  if FLocOS = nil then
    Application.CreateForm(TFLocOS,FLocOS);
  FLocOS.ShowModal;
end;

procedure TFPrincipal.Produto1Click(Sender: TObject);
begin
  if FCadProduto = nil then
    Application.CreateForm(TFCadProduto,FCadProduto);
  FCadProduto.ShowModal;
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

procedure TFPrincipal.Veculo1Click(Sender: TObject);
begin
   if FCadVeiculo = nil then
    Application.CreateForm(TFCadVeiculo,FCadVeiculo);
  FCadVeiculo.ShowModal;
end;

end.
