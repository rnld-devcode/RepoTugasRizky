unit PerhitunganBalok;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
  TFormPerhitunganBalok = class(TForm)
    ImageListTombol: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    Image2: TImage;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit5: TEdit;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel6: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPerhitunganBalok: TFormPerhitunganBalok;

implementation

{$R *.dfm}

procedure TFormPerhitunganBalok.BitBtn1Click(Sender: TObject);
var
p, l, t, V, Luas : real;
begin
  p := StrToFloat(edit1.text);
  l := StrToFloat(edit2.text);
  t := StrToFloat(edit5.text);

  V := p * l * t;
  Luas := 2 * ((p*l)+(p*t)+(l*t));

  edit3.text := FloatToStrF(V, ffFixed, 15, 2);
  edit4.text := FloatToStrF(Luas, ffFixed, 15, 2);

end;

procedure TFormPerhitunganBalok.BitBtn2Click(Sender: TObject);
begin
  edit1.clear;
  edit2.clear;
  edit3.clear;
  edit4.clear;
  edit5.clear;
end;

end.
