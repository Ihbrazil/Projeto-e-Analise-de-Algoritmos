unit Apresentacao;

{Tela de Apresentação}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, jpeg;

type
  TFRMtelaapresentacao = class(TForm)
    PNLapresentacao: TPanel;
    LBLsistema: TLabel;
    LBLordenacao: TLabel;
    IMGcesjf: TImage;
    IMGsistemaordenacaoprevenus: TImage;
    IMGsvd: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMtelaapresentacao: TFRMtelaapresentacao;

implementation

{$R *.DFM}

end.
