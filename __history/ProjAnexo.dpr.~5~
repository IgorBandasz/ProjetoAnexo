program ProjAnexo;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UCadCliente in 'UCadCliente.pas' {FCadCliente},
  UDM in 'UDM.pas' {DM: TDataModule},
  UCadServico in 'UCadServico.pas' {FCadServico},
  UCadProduto in 'UCadProduto.pas' {FCadProduto},
  UCadMarca in 'UCadMarca.pas' {FCadMarca},
  UCadVeiculo in 'UCadVeiculo.pas' {FCadVeiculo},
  ULocOS in 'ULocOS.pas' {FLocOS};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFCadCliente, FCadCliente);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFCadServico, FCadServico);
  Application.CreateForm(TFCadProduto, FCadProduto);
  Application.CreateForm(TFCadMarca, FCadMarca);
  Application.CreateForm(TFCadVeiculo, FCadVeiculo);
  Application.CreateForm(TFLocOS, FLocOS);
  Application.Run;
end.
