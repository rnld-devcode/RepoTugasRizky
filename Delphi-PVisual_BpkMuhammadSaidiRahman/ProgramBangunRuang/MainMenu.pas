unit MainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TFormMainMenu = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    Perhitungan1: TMenuItem;
    Perhitungan3: TMenuItem;
    Perhitungan4: TMenuItem;
    abung2: TMenuItem;
    Exit1: TMenuItem;
    ImageListToolBar: TImageList;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Label1: TLabel;
    Image1: TImage;
    StatusBar1: TStatusBar;
    MainPanel: TPanel;
    procedure ToolButton7Click(Sender: TObject);
    procedure Perhitungan4Click(Sender: TObject);
    procedure abung2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure Perhitungan1Click(Sender: TObject);
  private
    FormAktif: TForm;
    procedure TampilkanForm(const FormClass: TFormClass);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainMenu: TFormMainMenu;

implementation
  uses PerhitunganTabung, PerhitunganBalok;
{$R *.dfm}

procedure TFormMainMenu.abung2Click(Sender: TObject);
begin
  TampilkanForm(TFormPerhitunganTabung);
end;

procedure TFormMainMenu.Exit1Click(Sender: TObject);
begin
close;
end;

procedure TFormMainMenu.Home1Click(Sender: TObject);
begin
  ShowMessage('DATA DIRI PEMBUAT' + #13#10 +
              '==================' + #13#10 +
              'Nama    : M. Rizky Rinaldy' + #13#10 +
              'NPM     : 2510010102' + #13#10 +
              'Kelas   : Reguler Pagi Banjarmasin' + #13#10 +
              'Kampus  : FTI UNISKA MAB' + #13#10 +
              'Copyright © 2026');
end;

procedure TFormMainMenu.Perhitungan1Click(Sender: TObject);
 var
  pesan: string;
begin
  pesan :=    ('DAFTAR RUMUS BANGUN RUANG' + #13#10 +
              '--------------------------------' + #13#10 +
              '1. TABUNG' + #13#10 +
              '   Volume = π × r² × t' + #13#10 +
              '   Luas Permukaan = 2 × π × r × (r + t)' + #13#10 + #13#10 +
              '2. BALOK' + #13#10 +
              '   Volume = p × l × t' + #13#10 +
              '   Luas Permukaan = 2 × (pl + pt + lt)');

  Application.MessageBox(PChar(pesan), 'Daftar Rumus Bangun Ruang', MB_OK + MB_ICONINFORMATION);

end;

procedure TFormMainMenu.Perhitungan4Click(Sender: TObject);
begin
  TampilkanForm(TFormPerhitunganBalok);
end;

procedure TFormMainMenu.TampilkanForm(const FormClass: TFormClass);
begin
  if Assigned(FormAktif) then
  begin
    FormAktif.Free;
    FormAktif := nil;
  end;
  FormAktif := FormClass.Create(Self);
  with FormAktif do
  begin
    BorderStyle := bsNone;
    Parent      := MainPanel;
    Align       := alClient;
    Show;
  end;
end;

procedure TFormMainMenu.ToolButton2Click(Sender: TObject);
var
  pesan: string;
begin
  pesan :=    ('DAFTAR RUMUS BANGUN RUANG' + #13#10 +
              '--------------------------------' + #13#10 +
              '1. TABUNG' + #13#10 +
              '   Volume = π × r² × t' + #13#10 +
              '   Luas Permukaan = 2 × π × r × (r + t)' + #13#10 + #13#10 +
              '2. BALOK' + #13#10 +
              '   Volume = p × l × t' + #13#10 +
              '   Luas Permukaan = 2 × (pl + pt + lt)');

  Application.MessageBox(PChar(pesan), 'Daftar Rumus Bangun Ruang', MB_OK + MB_ICONINFORMATION);
end;

procedure TFormMainMenu.ToolButton3Click(Sender: TObject);
begin
  ShowMessage('DATA DIRI PEMBUAT' + #13#10 +
              '==================' + #13#10 +
              'Nama    : M. Rizky Rinaldy' + #13#10 +
              'NPM     : 2510010102' + #13#10 +
              'Kelas   : Reguler Pagi Banjarmasin' + #13#10 +
              'Kampus  : FTI UNISKA MAB' + #13#10 +
              'Copyright © 2026');
end;

procedure TFormMainMenu.ToolButton5Click(Sender: TObject);
var
  FormPerhitunganBalok: TFormPerhitunganBalok;
begin
  TampilkanForm(TFormPerhitunganBalok);
end;

procedure TFormMainMenu.ToolButton7Click(Sender: TObject);
var
  FormPerhitunganTabung: TFormPerhitunganTabung;
begin
  TampilkanForm(TFormPerhitunganTabung);
end;

procedure TFormMainMenu.ToolButton9Click(Sender: TObject);
begin
close;
end;

end.
