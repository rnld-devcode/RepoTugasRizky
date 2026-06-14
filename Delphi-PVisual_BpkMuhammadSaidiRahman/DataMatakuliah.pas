unit DataMatakuliah;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids,
  DataModule, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TFormMataKuliah = class(TForm)
    MainPanel: TPanel;
    StatusBarRizky: TStatusBar;
    HeaderPanel: TPanel;
    InputPanel: TPanel;
    Label1: TLabel;
    EdKodeMK: TEdit;
    ButtonPanel: TPanel;
    GridPanel: TPanel;
    TabelMataKuliah: TDBGrid;
    DataMataKuliah: TDataSource;
    EdNamaMK: TEdit;
    Label2: TLabel;
    EdDeskripsi: TEdit;
    Label3: TLabel;
    EdSKS: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    RBGanjil: TRadioButton;
    RBGenap: TRadioButton;
    BitTutup: TBitBtn;
    BitBersih: TBitBtn;
    BitHapus: TBitBtn;
    BitUbah: TBitBtn;
    BitTambah: TBitBtn;
    SideLPanel: TPanel;
    Image1: TImage;
    Image2: TImage;
    SearchPanel: TPanel;
    SearchBoxMK: TEdit;
    Label6: TLabel;
    EdID: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitTambahClick(Sender: TObject);
    procedure TabelMataKuliahCellClick(Column: TColumn);
    procedure BitUbahClick(Sender: TObject);
    procedure BitHapusClick(Sender: TObject);
    procedure BitBersihClick(Sender: TObject);
    procedure BitTutupClick(Sender: TObject);
    procedure SearchBoxMKChange(Sender: TObject);
  private
    procedure bersih();
    procedure tampil_data();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMataKuliah: TFormMataKuliah;

implementation

{$R *.dfm}

{ TFormMataKuliah }

procedure TFormMataKuliah.bersih;
begin
  EdID.Clear;
  EdKodeMK.Clear;
  EdNamaMK.Clear;
  EdDeskripsi.Clear;
  EdSKS.Clear;
  BitTambah.Enabled := True;
  BitUbah.Enabled := False;
  BitHapus.Enabled := False;
end;

procedure TFormMataKuliah.BitBersihClick(Sender: TObject);
begin
  bersih;
  DataModule1.FDQueryMataKuliah.Close;
  DataModule1.FDQueryMataKuliah.sql.Text := 'SELECT * FROM mata_kuliah;';
  DataModule1.FDQueryMataKuliah.Open();
end;

procedure TFormMataKuliah.BitHapusClick(Sender: TObject);
var
  IsiTabelKosong: Boolean;
begin
  if (messagedlg('Hapus data ini?', mtconfirmation, [mbyes, mbno], 0) = mryes) then
  begin
    IsiTabelKosong := DataModule1.FDQueryMataKuliah.RecordCount <= 1;
    DataModule1.FDQueryMataKuliah.sql.Text := 'DELETE FROM mata_kuliah WHERE id=:id';
    DataModule1.FDQueryMataKuliah.ParamByName('id').AsString := EdID.Text;
    DataModule1.FDQueryMataKuliah.ExecSQL;
    if IsiTabelKosong then
    begin
      DataModule1.FDQueryMataKuliah.sql.Text := 'ALTER TABLE mata_kuliah AUTO_INCREMENT = 1';
      DataModule1.FDQueryMataKuliah.ExecSQL;
    end;
    Showmessage('Data Matakuliah berhasil dihapus');
    bersih;
    tampil_data;
  end;
end;

procedure TFormMataKuliah.BitTambahClick(Sender: TObject);
begin
  if (EdKodeMK.Text = '') or (EdNamaMK.Text = '') or (EdDeskripsi.Text = '') or (EdSKS.Text = '') then
  begin
    messagedlg('Harap isi data dengan lengkap', mtwarning, [mbok],0)
  end
  else
  begin
    DataModule1.FDQueryMataKuliah.sql.Text := 'INSERT INTO mata_kuliah VALUES (null, :kode, :nama, :desk, :sks, :semester)';
    DataModule1.FDQueryMataKuliah.ParamByName('kode').AsString := EdKodeMK.Text;
    DataModule1.FDQueryMataKuliah.ParamByName('nama').AsString := EdNamaMK.Text;
    DataModule1.FDQueryMataKuliah.ParamByName('desk').AsString := EdDeskripsi.Text;
    DataModule1.FDQueryMataKuliah.ParamByName('sks').AsString := EdSKS.Text;
    if RBGanjil.Checked = True then
      DataModule1.FDQueryMataKuliah.ParamByName('semester').AsString := 'Ganjil'
    else
      DataModule1.FDQueryMataKuliah.ParamByName('semester').AsString := 'Genap';
    DataModule1.FDQueryMataKuliah.ExecSQL;
    Showmessage('Data Matakuliah berhasil ditambahkan!');
    bersih;
  end;
end;

procedure TFormMataKuliah.BitTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFormMataKuliah.BitUbahClick(Sender: TObject);
begin
if (EdKodeMK.Text = '') or (EdNamaMK.Text = '') or (EdDeskripsi.Text = '') or (EdSKS.Text = '') then
  begin
    messagedlg('Harap isi data dengan lengkap', mtwarning, [mbok],0)
  end
  else
  begin
    DataModule1.FDQueryMataKuliah.sql.Text := 'UPDATE mata_kuliah SET kode_mk=:kode, nama_mk=:nama, deskripsi=:desk, sks=:sks, semester=:smt WHERE id=:id';
    DataModule1.FDQueryMataKuliah.ParamByName('kode').AsString := EdKodeMK.Text;
    DataModule1.FDQueryMataKuliah.ParamByName('nama').AsString := EdNamaMK.Text;
    DataModule1.FDQueryMataKuliah.ParamByName('desk').AsString := EdDeskripsi.Text;
    DataModule1.FDQueryMataKuliah.ParamByName('sks').AsString := EdSKS.Text;
    if RBGanjil.Checked = True then
      DataModule1.FDQueryMataKuliah.ParamByName('smt').AsString := 'Ganjil'
    else
      DataModule1.FDQueryMataKuliah.ParamByName('smt').AsString := 'Genap';
    DataModule1.FDQueryMataKuliah.ParamByName('id').AsString := EdID.Text;
    DataModule1.FDQueryMataKuliah.ExecSQL;
    Showmessage('Data Matakuliah berhasil diperbaharui!');
    bersih;
  end;
end;

procedure TFormMataKuliah.FormCreate(Sender: TObject);
begin
  bersih;
  {TabelMataKuliah.Columns[0].Width := 50;
  TabelMataKuliah.Columns[1].Width := 70;
  TabelMataKuliah.Columns[2].Width := 100;
  TabelMataKuliah.Columns[3].Width := 200;}
end;

procedure TFormMataKuliah.SearchBoxMKChange(Sender: TObject);
begin
  DataModule1.FDQueryMataKuliah.Close;
  DataModule1.FDQueryMataKuliah.sql.Text := 'SELECT * FROM mata_kuliah WHERE nama_mk like :nama;';
  DataModule1.FDQueryMataKuliah.ParamByName('nama').AsString := '%' + SearchBoxMK.Text + '%';
  DataModule1.FDQueryMataKuliah.Open();
end;

procedure TFormMataKuliah.TabelMataKuliahCellClick(Column: TColumn);
begin
  EdID.Text := TabelMataKuliah.Fields[0].AsString;
  EdKodeMK.Text := TabelMataKuliah.Fields[1].AsString;
  EdNamaMK.Text := TabelMataKuliah.Fields[2].AsString;
  EdDeskripsi.Text := TabelMataKuliah.Fields[3].AsString;
  EdSKS.Text := TabelMataKuliah.Fields[4].AsString;
  if (TabelMataKuliah.fields[5].AsString = 'Ganjil') then
    RBGanjil.Checked := True
  else
    RBGenap.Checked := True;
  BitTambah.Enabled := False;
  BitUbah.Enabled := True;
  BitHapus.Enabled := True;
end;

procedure TFormMataKuliah.tampil_data;
begin
  DataModule1.FDQueryMataKuliah.Close;
  DataModule1.FDQueryMataKuliah.sql.Text := 'SELECT * FROM mata_kuliah;';
  DataModule1.FDQueryMataKuliah.Open();
end;

end.
