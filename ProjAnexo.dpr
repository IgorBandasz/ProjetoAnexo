program ProjAnexo;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UCadCliente in 'UCadCliente.pas' {FCadCliente},
  UDM in 'UDM.pas' {DM: TDataModule},
  UCadServico in 'UCadServico.pas' {FCadServico},
  UCadProduto in 'UCadProduto.pas' {FCadProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFCadCliente, FCadCliente);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFCadServico, FCadServico);
  Application.CreateForm(TFCadProduto, FCadProduto);
  Application.Run;
end.
