unit PerhitunganTabung;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  Vcl.WinXPanels;

type
  TFormPerhitunganTabung = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Image2: TImage;
    Panel2: TPanel;
    Image1: TImage;
    ImageListTombol: TImageList;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel5: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel6: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPerhitunganTabung: TFormPerhitunganTabung;

implementation

{$R *.dfm}

procedure TFormPerhitunganTabung.BitBtn1Click(Sender: TObject);
var
r, t, V, L  : real;
begin
  r := StrToFloat(edit1.text);
  t := StrToFloat(edit2.text);

  V := 3.14 * r * r * t;
  L := 2 * 3.14 * r * (r + t);


  edit3.text := FloatToStrF(V, ffFixed, 15, 2);
  edit4.text := FloatToStrF(L, ffFixed, 15, 2);

end;

procedure TFormPerhitunganTabung.BitBtn2Click(Sender: TObject);
begin
edit1.Clear;
edit2.clear;
edit3.Clear;
edit4.clear;
end;

end.
