unit DataDosen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls, DataModule;

type
  TFormDataDosen = class(TForm)
    MainPanel: TPanel;
    StatusBarRizky: TStatusBar;
    HeaderPanel: TPanel;
    Image1: TImage;
    Image2: TImage;
    InputPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdNIDN: TEdit;
    EdNamaDosen: TEdit;
    EdAlamat: TEdit;
    EdTahunBekerja: TEdit;
    RBS2: TRadioButton;
    RBS3: TRadioButton;
    EdID: TEdit;
    ButtonPanel: TPanel;
    BitTutup: TBitBtn;
    BitBersih: TBitBtn;
    BitHapus: TBitBtn;
    BitUbah: TBitBtn;
    BitTambah: TBitBtn;
    SideLPanel: TPanel;
    GridPanel: TPanel;
    TabelDataDosen: TDBGrid;
    SearchPanel: TPanel;
    Label6: TLabel;
    SearchBoxDosen: TEdit;
    DataTabelDosen: TDataSource;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBersihClick(Sender: TObject);
    procedure BitTambahClick(Sender: TObject);
    procedure BitHapusClick(Sender: TObject);
    procedure BitUbahClick(Sender: TObject);
    procedure BitTutupClick(Sender: TObject);
    procedure SearchBoxDosenChange(Sender: TObject);
    procedure TabelDataDosenCellClick(Column: TColumn);
  private
    procedure bersih();
    procedure tampil_data();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDataDosen: TFormDataDosen;

implementation

{$R *.dfm}

procedure TFormDataDosen.bersih;
begin
  EdID.Clear;
  EdNIDN.Clear;
  EdNamaDosen.Clear;
  EdAlamat.Clear;
  EdTahunBekerja.Clear;
  BitTambah.Enabled := True;
  BitUbah.Enabled := False;
  BitHapus.Enabled := False;
end;

procedure TFormDataDosen.BitBersihClick(Sender: TObject);
begin
  bersih;
  SearchBoxDosen.Clear;
  DataModule1.FDQueryDosen.Close;
  DataModule1.FDQueryDosen.sql.Text := 'SELECT * FROM dosen';;
  DataModule1.FDQueryDosen.Open();
end;

procedure TFormDataDosen.BitHapusClick(Sender: TObject);
var
  IsiTabelKosong: Boolean;
begin
  if (messagedlg('Hapus data ini?', mtconfirmation, [mbyes, mbno], 0) = mryes) then
  begin
    IsiTabelKosong := DataModule1.FDQueryMataKuliah.RecordCount <= 1;
    DataModule1.FDQueryDosen.sql.Text := 'DELETE FROM dosen WHERE id=:id';
    DataModule1.FDQueryDosen.ParamByName('id').AsString := EdID.Text;
    DataModule1.FDQueryDosen.ExecSQL;
    if IsiTabelKosong then
    begin
      DataModule1.FDQueryDosen.sql.Text := 'ALTER TABLE dosen AUTO_INCREMENT = 1';
      DataModule1.FDQueryDosen.ExecSQL;
    end;
    Showmessage('Data Dosen berhasil dihapus');
    bersih;
    tampil_data;
  end;
end;

procedure TFormDataDosen.BitTambahClick(Sender: TObject);
begin
  if (EdNIDN.Text = '') or (EdNamaDosen.Text = '') or (EdAlamat.Text = '') or (EdTahunBekerja.Text = '') then
  begin
    messagedlg('Harap isi data dengan lengkap', mtwarning, [mbok],0)
  end
  else
  begin
    DataModule1.FDQueryDosen.sql.Text := 'INSERT dosen VALUES (null, :nidn, :nama, :tahun, :alamat, :jenjang)';
    DataModule1.FDQueryDosen.ParamByName('nidn').AsString := EdNIDN.Text;
    DataModule1.FDQueryDosen.ParamByName('nama').AsString := EdNamaDosen.Text;
    DataModule1.FDQueryDosen.ParamByName('alamat').AsString := EdAlamat.Text;
    DataModule1.FDQueryDosen.ParamByName('tahun').AsString := EdTahunBekerja.Text;
    if RBS2.Checked = True then
      DataModule1.FDQueryDosen.ParamByName('jenjang').AsString := 'S2'
    else
      DataModule1.FDQueryDosen.ParamByName('jenjang').AsString := 'S3';
    DataModule1.FDQueryDosen.ExecSQL;
    Showmessage('Data Dosen berhasil ditambahkan!');
    bersih;
  end;
end;

procedure TFormDataDosen.BitTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFormDataDosen.BitUbahClick(Sender: TObject);
begin
if (EdNIDN.Text = '') or (EdNamaDosen.Text = '') or (EdAlamat.Text = '') or (EdTahunBekerja.Text = '') then
  begin
    messagedlg('Harap isi data dengan lengkap', mtwarning, [mbok],0)
  end
  else
  begin
    DataModule1.FDQueryDosen.sql.Text := 'UPDATE dosen SET nidn=:nidn, nama_dosen=:nama, tahun_bekerja=:tahun, alamat=:alamat, pendidikan_terakhir=:jenjang WHERE id=:id';
    DataModule1.FDQueryDosen.ParamByName('nidn').AsString := EdNIDN.Text;
    DataModule1.FDQueryDosen.ParamByName('nama').AsString := EdNamaDosen.Text;
    DataModule1.FDQueryDosen.ParamByName('alamat').AsString := EdAlamat.Text;
    DataModule1.FDQueryDosen.ParamByName('tahun').AsString := EdTahunBekerja.Text;
    if RBS2.Checked = True then
      DataModule1.FDQueryDosen.ParamByName('jenjang').AsString := 'S2'
    else
      DataModule1.FDQueryDosen.ParamByName('jenjang').AsString := 'S3';
    DataModule1.FDQueryDosen.ParamByName('id').AsString := EdID.Text;
    DataModule1.FDQueryDosen.ExecSQL;
    Showmessage('Data Dosen berhasil diperbaharui!');
    bersih;
  end;
end;

procedure TFormDataDosen.FormCreate(Sender: TObject);
begin
bersih;
  {TabelDataDosen.Columns[0].Width := 50;
  TabelDataDosen.Columns[1].Width := 70;
  TabelDataDosen.Columns[2].Width := 100;
  TabelDataDosen.Columns[3].Width := 200;}
end;

procedure TFormDataDosen.SearchBoxDosenChange(Sender: TObject);
begin
  DataModule1.FDQueryDosen.Close;
  DataModule1.FDQueryDosen.sql.Text := 'SELECT * FROM dosen WHERE nama_dosen like :nama;';
  DataModule1.FDQueryDosen.ParamByName('nama').AsString := '%' + SearchBoxDosen.Text + '%';
  DataModule1.FDQueryDosen.Open();
end;

procedure TFormDataDosen.TabelDataDosenCellClick(Column: TColumn);
begin
  EdID.Text := TabelDataDosen.Fields[0].AsString;
  EdNIDN.Text := TabelDataDosen.Fields[1].AsString;
  EdNamaDosen.Text := TabelDataDosen.Fields[2].AsString;
  EdTahunBekerja.Text := TabelDataDosen.Fields[3].AsString;
  EdAlamat.Text := TabelDataDosen.Fields[4].AsString;
  if (TabelDataDosen.fields[5].AsString = 'S2') then
    RBS2.Checked := True
  else
    RBS3.Checked := True;
  BitTambah.Enabled := False;
  BitUbah.Enabled := True;
  BitHapus.Enabled := True;
end;

procedure TFormDataDosen.tampil_data;
begin
  DataModule1.FDQueryDosen.Close;
  DataModule1.FDQueryDosen.sql.Text := 'SELECT * FROM dosen;';
  DataModule1.FDQueryDosen.Open();
end;

end.
