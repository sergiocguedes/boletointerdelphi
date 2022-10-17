program Api_Banco_Inter_v2;

uses
  Vcl.Forms,
  uFrm.Main in 'uFrm.Main.pas' {FrmPrincipal},
  uController.BancoInter in 'Controller\uController.BancoInter.pas',
  uLkJSON in 'Controller\uLkJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
