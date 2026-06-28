unit ProfilePengguna;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtDlgs;

type
  TFormProfile = class(TForm)
    MainPanel: TPanel;
    ButtonPanel: TPanel;
    PanelIdentitas: TPanel;
    PanelInformasi: TPanel;
    BitGantiFoto: TBitBtn;
    BitTambah: TBitBtn;
    BitTutup: TBitBtn;
    BingkaiFotoProfile: TShape;
    FotoProfil: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    HeaderPanel: TPanel;
    procedure BitTutupClick(Sender: TObject);
    procedure BitGantiFotoClick(Sender: TObject);
    procedure BitTambahClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProfile: TFormProfile;

implementation

{$R *.dfm}

procedure TFormProfile.BitGantiFotoClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    FotoProfil.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TFormProfile.BitTambahClick(Sender: TObject);
begin
  showmessage('Masih Tahap Pengembangan Belum Dimasukin ke Database✌')
end;

procedure TFormProfile.BitTutupClick(Sender: TObject);
begin
  Close;
end;

end.
