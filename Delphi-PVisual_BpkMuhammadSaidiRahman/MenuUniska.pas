unit MenuUniska;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls,
  DataModule, DataMataKuliah, DataDosen ;

type
  TFormMenuUniska = class(TForm)
    MainPanel: TPanel;
    HeaderPanel: TPanel;
    ButtonPanel: TPanel;
    BitDosen: TBitBtn;
    BitMatakuliah: TBitBtn;
    SideLPanel: TPanel;
    SideRpanel: TPanel;
    SideTPanel: TPanel;
    SideBPanel: TPanel;
    Image3: TImage;
    procedure BitMatakuliahClick(Sender: TObject);
    procedure BitDosenClick(Sender: TObject);
  private
    { Private declarations }
  public
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

end.
