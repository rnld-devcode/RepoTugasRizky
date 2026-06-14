program ProgramAkademikUniska;

uses
  Vcl.Forms,
  DataMatakuliah in 'DataMatakuliah.pas' {FormMataKuliah},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  DataDosen in 'DataDosen.pas' {FormDataDosen},
  MenuUniska in 'MenuUniska.pas' {FormMenuUniska};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenuUniska, FormMenuUniska);
  Application.CreateForm(TFormMataKuliah, FormMataKuliah);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormDataDosen, FormDataDosen);
  Application.Run;
end.
