program ProjAnexo;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UCadCliente in 'UCadCliente.pas' {FCadCliente},
  UDM in 'UDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFCadCliente, FCadCliente);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
