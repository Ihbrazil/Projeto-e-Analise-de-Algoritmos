program Trabalho;
uses
  Forms,
  Windows,
  UntPricipal in 'UntPricipal.pas' {frmPrincipal},
  Apresentacao in 'Apresentacao.pas' {FRMtelaapresentacao};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Eletro - Sistema de Ordena��o Interna';
// linha para Apresenta��o
  FRMtelaapresentacao := TFRMtelaapresentacao.Create(Application);
// linha para Apresenta��o
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  // linha para Apresenta��o
  FRMtelaapresentacao.Show;
  FRMtelaapresentacao.Refresh;
  sleep(1500);
  FRMtelaapresentacao.Close;
// linha para Apresenta��o
  Application.Run;
end.
