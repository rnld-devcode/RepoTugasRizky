unit MenuUniska;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Themes, Vcl.Styles,
  DataModule, DataMataKuliah, DataDosen, DataJadwalPerkuliahan, ProfilePengguna;

type
  TFormMenuUniska = class(TForm)
    MainPanel: TPanel;
    HeaderPanel: TPanel;
    ButtonPanel: TPanel;
    BitJadwal: TBitBtn;
    BitMatakuliah: TBitBtn;
    SideBPanel: TPanel;
    BitBtn1: TBitBtn;
    Image3: TImage;
    Label1: TLabel;
    SideLPanel: TPanel;
    PanelRPanel: TPanel;
    BitExit: TBitBtn;
    Pilihan_Tema: TComboBox;
    BitProfil: TBitBtn;
    BitInfo: TBitBtn;
    BitSetting: TBitBtn;
    PanelInfo: TPanel;
    LogoInfo: TImage;
    LabelInfo: TLabel;
    procedure BitMatakuliahClick(Sender: TObject);
    procedure BitDosenClick(Sender: TObject);
    procedure BitJadwalClick(Sender: TObject);
    procedure BitProfilClick(Sender: TObject);
    procedure BitInfoClick(Sender: TObject);
    procedure BitExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pilihan_TemaChange(Sender: TObject);
    procedure BitSettingClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadDataUser(ANama, ANIM: string);
    { Public declarations }
  end;

var
  FormMenuUniska: TFormMenuUniska;

implementation

{$R *.dfm}

procedure TFormMenuUniska.BitDosenClick(Sender: TObject);
begin
  FormDataDosen.Show
end;

procedure TFormMenuUniska.BitMatakuliahClick(Sender: TObject);
begin
  FormMataKuliah.Show;
end;

procedure TFormMenuUniska.Pilihan_TemaChange(Sender: TObject);
begin
  TStyleManager.TrySetStyle(Pilihan_Tema.Text);
end;

procedure TFormMenuUniska.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  for StyleName in TStyleManager.StyleNames do
    Pilihan_Tema.Items.Add(StyleName);
end;

procedure TFormMenuUniska.LoadDataUser(ANama, ANIM: string);
begin

end;

procedure TFormMenuUniska.BitExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMenuUniska.BitInfoClick(Sender: TObject);
begin
  PanelInfo.Visible := not PanelInfo.Visible;
  if PanelInfo.Visible then
    PanelInfo.BringToFront;
end;

procedure TFormMenuUniska.BitProfilClick(Sender: TObject);
begin
    FormProfile.ShowModal;
end;

procedure TFormMenuUniska.BitSettingClick(Sender: TObject);
begin
  Pilihan_Tema.Visible := not Pilihan_Tema.Visible;
  if Pilihan_Tema.Visible then
    Pilihan_Tema.BringToFront;
  BitProfil.Visible     := not BitProfil.Visible;
  BitInfo.Visible       := not BitInfo.Visible;
  BitExit.Visible       := not BitExit.Visible;
end;

procedure TFormMenuUniska.BitJadwalClick(Sender: TObject);
begin
  FormJadwalPerkuliahan.Show
end;

end.
