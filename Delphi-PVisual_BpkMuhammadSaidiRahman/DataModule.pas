unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TDataModule1 = class(TDataModule)
    FDConnectionUniska: TFDConnection;
    FDQueryMataKuliah: TFDQuery;
    FDQueryMataKuliahid: TFDAutoIncField;
    FDQueryMataKuliahkode_mk: TStringField;
    FDQueryMataKuliahnama_mk: TStringField;
    FDQueryMataKuliahdeskripsi: TStringField;
    FDQueryMataKuliahsks: TIntegerField;
    FDQueryMataKuliahsemester: TStringField;
    FDQueryDosen: TFDQuery;
    FDQueryDosenid: TFDAutoIncField;
    FDQueryDosennidn: TStringField;
    FDQueryDosennama_dosen: TStringField;
    FDQueryDosentahun_bekerja: TIntegerField;
    FDQueryDosenalamat: TStringField;
    FDQueryDosenpendidikan_terakhir: TStringField;
    FDPhysMySQLDriverLinkUniska: TFDPhysMySQLDriverLink;
    FDQueryJadwalPerkuliahan: TFDQuery;
    FDQueryCRUDJadwal: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FDQueryJadwalPerkuliahanid: TFDAutoIncField;
    FDQueryJadwalPerkuliahanmatkul_id: TIntegerField;
    FDQueryJadwalPerkuliahandosen_id: TIntegerField;
    FDQueryJadwalPerkuliahanhari: TStringField;
    FDQueryJadwalPerkuliahanwaktu: TStringField;
    FDQueryJadwalPerkuliahanruang: TStringField;
    FDQueryJadwalPerkuliahannama_mk: TStringField;
    FDQueryJadwalPerkuliahannama_dosen: TStringField;
    ImageMenu: TImageCollection;
    VirtualImageMenu: TVirtualImageList;
    VirtualImageButton: TVirtualImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
