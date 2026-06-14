object DataModule1: TDataModule1
  Height = 1080
  Width = 1440
  PixelsPerInch = 144
  object FDConnectionUniska: TFDConnection
    Params.Strings = (
      'Database=uniska'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 64
  end
  object FDQueryMataKuliah: TFDQuery
    Connection = FDConnectionUniska
    SQL.Strings = (
      'SELECT * FROM mata_kuliah;')
    Left = 240
    object FDQueryMataKuliahid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDQueryMataKuliahkode_mk: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'kode_mk'
      Origin = 'kode_mk'
      Size = 15
    end
    object FDQueryMataKuliahnama_mk: TStringField
      FieldName = 'nama_mk'
      Origin = 'nama_mk'
      Required = True
      Size = 70
    end
    object FDQueryMataKuliahdeskripsi: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'deskripsi'
      Origin = 'deskripsi'
      Size = 100
    end
    object FDQueryMataKuliahsks: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sks'
      Origin = 'sks'
    end
    object FDQueryMataKuliahsemester: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'semester'
      Origin = 'semester'
      FixedChar = True
      Size = 6
    end
  end
  object FDQueryDosen: TFDQuery
    Connection = FDConnectionUniska
    SQL.Strings = (
      'SELECT * FROM dosen;')
    Left = 400
    object FDQueryDosenid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDQueryDosennidn: TStringField
      FieldName = 'nidn'
      Origin = 'nidn'
      Required = True
      Size = 10
    end
    object FDQueryDosennama_dosen: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nama_dosen'
      Origin = 'nama_dosen'
      Size = 100
    end
    object FDQueryDosentahun_bekerja: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tahun_bekerja'
      Origin = 'tahun_bekerja'
    end
    object FDQueryDosenalamat: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'alamat'
      Origin = 'alamat'
      Size = 100
    end
    object FDQueryDosenpendidikan_terakhir: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pendidikan_terakhir'
      Origin = 'pendidikan_terakhir'
      FixedChar = True
      Size = 2
    end
  end
  object FDPhysMySQLDriverLinkUniska: TFDPhysMySQLDriverLink
    VendorLib = 
      'R:\UNISKA\Semester 2\MK - Pemprograman Visual\Tugas\Latihan5_Dat' +
      'abaseUniska\Win32\Debug\libmysql.dll'
    Left = 600
  end
end
