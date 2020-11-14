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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

procedure TFPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
