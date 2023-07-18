program Trabalho;
uses
  Forms,
  Windows,
  UntPricipal in 'UntPricipal.pas' {frmPrincipal},
  Apresentacao in 'Apresentacao.pas' {FRMtelaapresentacao};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Eletro - Sistema de Ordenação Interna';
// linha para Apresentação
  FRMtelaapresentacao := TFRMtelaapresentacao.Create(Application);
// linha para Apresentação
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  // linha para Apresentação
  FRMtelaapresentacao.Show;
  FRMtelaapresentacao.Refresh;
  sleep(1500);
  FRMtelaapresentacao.Close;
// linha para Apresentação
  Application.Run;
end.
