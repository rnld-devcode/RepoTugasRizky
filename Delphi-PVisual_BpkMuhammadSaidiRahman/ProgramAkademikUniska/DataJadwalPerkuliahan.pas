unit DataJadwalPerkuliahan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls,
  DataModule, Vcl.DBCtrls;

type
  TFormJadwalPerkuliahan = class(TForm)
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
    Label5: TLabel;
    EdID: TEdit;
    ButtonPanel: TPanel;
    BitTutup: TBitBtn;
    BitBersih: TBitBtn;
    BitHapus: TBitBtn;
    BitUbah: TBitBtn;
    BitTambah: TBitBtn;
    SideLPanel: TPanel;
    GridPanel: TPanel;
    TabelJadwal: TDBGrid;
    SearchPanel: TPanel;
    Label6: TLabel;
    SearchBoxMK: TEdit;
    DataJadwal: TDataSource;
    Daftar_Matakuliah: TDBLookupComboBox;
    Daftar_Dosen: TDBLookupComboBox;
    Pilihan_Hari: TComboBox;
    Pilihan_Waktu: TComboBox;
    Pilihan_Ruangan: TComboBox;
    DataMK: TDataSource;
    DataDosen: TDataSource;
    procedure BitTambahClick(Sender: TObject);
    procedure TabelJadwalCellClick(Column: TColumn);
    procedure BitUbahClick(Sender: TObject);
    procedure BitHapusClick(Sender: TObject);
    procedure BitBersihClick(Sender: TObject);
    procedure BitTutupClick(Sender: TObject);
  private
    procedure bersih();
    procedure tampil_data();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormJadwalPerkuliahan: TFormJadwalPerkuliahan;

implementation

{$R *.dfm}

{ TFormJadwalPerkuliahan }

procedure TFormJadwalPerkuliahan.bersih;
begin
  Daftar_Matakuliah.KeyValue := Null;
  Daftar_Dosen.KeyValue      := Null;
  Pilihan_Hari.Text          := '';
  Pilihan_Waktu.Text         := '';
  Pilihan_Ruangan.Text       := '';
  BitTambah.Enabled          := True;
  BitUbah.Enabled            := False;
  BitHapus.Enabled           := False;
  tampil_data;
end;

procedure TFormJadwalPerkuliahan.BitBersihClick(Sender: TObject);
begin
  bersih;
end;

procedure TFormJadwalPerkuliahan.BitHapusClick(Sender: TObject);
begin
  if(messagedlg('Yakin ingin hapus data jadwal perkuliahan ini?', mtConfirmation, [mbYes, mbNo], 0) = mryes) then
    begin
    DataModule1.FDQueryCRUDJadwal.sql. Text := 'DELETE FROM jadwal WHERE id =: f';
    DataModule1.FDQueryCRUDJadwal.ParamByName('f').AsString := EdID.Text;
    DataModule1.FDQueryCRUDJadwal.ExecSQL;
    showmessage('Data jadwal perkuliahan berhasil dihapus!');
    bersih;
    end;
end;

procedure TFormJadwalPerkuliahan.BitTambahClick(Sender: TObject);
begin
  if(Daftar_Matakuliah. Text = '') or (Daftar_Dosen. Text = '') or
    (Pilihan_Hari. Text = '') or (Pilihan_Waktu. Text = '') or (Pilihan_Ruangan. Text='' ) then
  begin
    messagedlg('Harap isi data jadwal dengan lengkap!', mtwarning, [mbok], 0);
  end
  else
  begin
    DataModule1.FDQueryCRUDJadwal.sql. Text := 'INSERT INTO jadwal VALUES (null, :a, :b, :c, :d, :e)';
    DataModule1.FDQueryCRUDJadwal. ParamByName( 'a' ) .AsString := Daftar_Matakuliah.KeyValue;
    DataModule1.FDQueryCRUDJadwal. ParamByName( 'b' ).AsString  := Daftar_Dosen.KeyValue;
    DataModule1.FDQueryCRUDJadwal. ParamByName('c').AsString    := Pilihan_Hari. Text;
    DataModule1.FDQueryCRUDJadwal. ParamByName( 'd') .AsString  := Pilihan_Waktu. Text;
    DataModule1.FDQueryCRUDJadwal. ParamByName('e' ).AsString   := Pilihan_Ruangan. Text;
    DataModule1.FDQueryCRUDJadwal. ExecSQL;
    messagedlg('Data jadwal perkuliahan berhasil ditambahkan!', mtInformation, [mbOk], 0);
    bersih;
  end;


end;

procedure TFormJadwalPerkuliahan.BitTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFormJadwalPerkuliahan.BitUbahClick(Sender: TObject);
begin
  if(Daftar_Matakuliah. Text = '') or (Daftar_Dosen. Text = '') or
    (Pilihan_Hari. Text = '') or (Pilihan_Waktu. Text = '') or (Pilihan_Ruangan. Text='' ) then
  begin
    messagedlg('Harap isi data jadwal dengan lengkap!', mtwarning, [mbok], 0);
  end
  else
  begin
  DataModule1.FDQueryCRUDJadwal.sql.Text := 'UPDATE jadwal SET matkul_id =:a, dosen_id =: b, hari =: c, waktu =: d, ruang =: e WHERE id =: f';
  DataModule1.FDQueryCRUDJadwal. ParamByName('a') .AsString := Daftar_Matakuliah.KeyValue;
  DataModule1.FDQueryCRUDJadwal. ParamByName('b').AsString  := Daftar_Dosen.KeyValue;
  DataModule1.FDQueryCRUDJadwal. ParamByName('c').AsString  := Pilihan_Hari. Text;
  DataModule1.FDQueryCRUDJadwal. ParamByName('d') .AsString := Pilihan_Waktu. Text;
  DataModule1.FDQueryCRUDJadwal. ParamByName('e').AsString  := Pilihan_Ruangan. Text;
  DataModule1.FDQueryCRUDJadwal. ParamByName('f').AsString  := EdID.Text;
  DataModule1.FDQueryCRUDJadwal. ExecSQL;
  messagedlg('Data jadwal perkuliahan berhasil ditambahkan!', mtInformation, [mbOk], 0);
  bersih;
  end;
end;

procedure TFormJadwalPerkuliahan.TabelJadwalCellClick(Column: TColumn);
begin
  Daftar_Matakuliah.KeyValue := TabelJadwal.Fields[4].AsString;
  Daftar_Dosen.KeyValue := TabelJadwal.Fields[5].AsString;
  Pilihan_Hari.Text := TabelJadwal.Fields[1].AsString;
  Pilihan_Waktu.Text := TabelJadwal.Fields[2].AsString;
  Pilihan_Ruangan.Text := TabelJadwal.Fields[3].AsString;
  EdID. Text := TabelJadwal.Fields[0].AsString;
  BitTambah.Enabled := False;
  BitUbah.Enabled   := True;
  BitHapus.Enabled  := True;
end;

procedure TFormJadwalPerkuliahan.tampil_data;
begin
  DataModule1.FDQueryJadwalPerkuliahan.Active := False;
  DataModule1.FDQueryJadwalPerkuliahan.SQL.Text := 'SELECT jadwal .* , mata_kuliah. nama_mk,' +
    'dosen. nama_dosen FROM jadwal INNER JOIN mata_kuliah ' +
    'ON jadwal.matkul_id = mata_kuliah.id INNER JOIN dosen ON jadwal. dosen_id = dosen.id';
  DataModule1.FDQueryJadwalPerkuliahan.Active := True;
end;

end.
