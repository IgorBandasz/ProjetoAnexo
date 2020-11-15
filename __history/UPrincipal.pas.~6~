unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFPrincipal = class(TForm)
    menuPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Cliente1: TMenuItem;
    Produto1: TMenuItem;
    Servio1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Servio1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses UCadCliente, UCadServico, UCadProduto;

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

end.
