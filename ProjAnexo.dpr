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
  ULocOS in 'ULocOS.pas' {FLocOS},
  UCadOS in 'UCadOS.pas' {FCadOS},
  UListarClientes in 'UListarClientes.pas' {FListarClientes},
  UListarProdutos in 'UListarProdutos.pas' {FListarProdutos},
  UListarServicos in 'UListarServicos.pas' {FListarServicos},
  URelatorioProduto in 'URelatorioProduto.pas' {FRelatorioProduto},
  URelatorioServico in 'URelatorioServico.pas' {FRelatorioServico},
  URelatorioCliente in 'URelatorioCliente.pas' {FRelatorioCliente};

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
  Application.CreateForm(TFCadOS, FCadOS);
  Application.CreateForm(TFListarClientes, FListarClientes);
  Application.CreateForm(TFListarProdutos, FListarProdutos);
  Application.CreateForm(TFListarServicos, FListarServicos);
  Application.CreateForm(TFRelatorioProduto, FRelatorioProduto);
  Application.CreateForm(TFRelatorioServico, FRelatorioServico);
  Application.CreateForm(TFRelatorioCliente, FRelatorioCliente);
  Application.Run;
end.
