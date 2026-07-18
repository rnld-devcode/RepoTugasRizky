program ProgramBangunRuang;

uses
  Vcl.Forms,
  MainMenu in 'MainMenu.pas' {FormMainMenu},
  PerhitunganTabung in 'PerhitunganTabung.pas' {FormPerhitunganTabung},
  PerhitunganBalok in 'PerhitunganBalok.pas' {FormPerhitunganBalok};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainMenu, FormMainMenu);
  Application.CreateForm(TFormPerhitunganTabung, FormPerhitunganTabung);
  Application.CreateForm(TFormPerhitunganBalok, FormPerhitunganBalok);
  Application.Run;
end.
