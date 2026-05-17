program SistemGajiBulanan;

type
  TKaryawan = record
    Nama, Jabatan, Bln_Thn: string;
    GajiPokok, Tunjangan, UpahLembur: Real;
    PotonganAlpa, TotalTerima: Real;
    JamLembur, JmlAlpa: Integer;
  end;

var
  K: TKaryawan;

procedure TentukanJabatan(var Kyw: TKaryawan);
begin
  if Kyw.Jabatan = 'MANAGER' then
  begin
    Kyw.GajiPokok := 8000000;
    Kyw.Tunjangan := 2000000;
  end
  else if Kyw.Jabatan = 'STAFF' then
  begin
    Kyw.GajiPokok := 5000000;
    Kyw.Tunjangan := 500000;
  end
  else
  begin
    Kyw.Jabatan := 'LOGISTIK';
    Kyw.GajiPokok := 3500000;
    Kyw.Tunjangan := 200000;
  end;
end;

function HitungPotonganAlpa(GajiPokok: Real; JmlAlpa: Integer): Real;
begin
  HitungPotonganAlpa := JmlAlpa * (GajiPokok / 25);
end;

function HitungTotalGaji(Gapok, Tunjangan, Lembur, Potongan: Real): Real;
begin
  HitungTotalGaji := (Gapok + Tunjangan + Lembur) - Potongan;
end;

procedure TampilkanStruk(Kyw: TKaryawan);
begin
  writeln;
  writeln('=======================================');
  writeln('    STRUK GAJI BULAN ', Kyw.Bln_Thn);
  writeln('=======================================');
  writeln('Nama Karyawan    : ', Kyw.Nama);
  writeln('Jabatan          : ', Kyw.Jabatan);
  writeln('Jumlah Alpa      : ', Kyw.JmlAlpa, ' Hari');
  writeln('---------------------------------------');
  writeln('Gaji Pokok       : Rp', Kyw.GajiPokok:10:0);
  writeln('Tunjangan        : Rp', Kyw.Tunjangan:10:0);
  writeln('Upah Lembur      : Rp', Kyw.UpahLembur:10:0);
  writeln('Potongan Alpa    : Rp', Kyw.PotonganAlpa:10:0);
  writeln('---------------------------------------');
  writeln('TOTAL DITERIMA   : Rp', Kyw.TotalTerima:10:0);
  writeln('=======================================');
end;

const
  TARIF_LEMBUR = 30000;

begin
  writeln('--- 2510010102 == M.RIZKY RINALDY ---');
  writeln('-------------------------------------');
  writeln('--- INPUT DATA KARYAWAN & ABSENSI ---');
  write('Nama Karyawan              : '); readln(K.Nama);
  write('Jabatan (MANAGER/STAFF)    : '); readln(K.Jabatan);
  write('Periode Tutup Buku (M/Y)   : '); readln(K.Bln_Thn);
  write('Jumlah Jam Lembur          : '); readln(K.JamLembur);
  write('Jumlah Hari Alpa           : '); readln(K.JmlAlpa);

  TentukanJabatan(K); 
  K.UpahLembur := K.JamLembur * TARIF_LEMBUR;
  K.PotonganAlpa := HitungPotonganAlpa(K.GajiPokok, K.JmlAlpa);
  K.TotalTerima := HitungTotalGaji(K.GajiPokok, K.Tunjangan, K.UpahLembur, K.PotonganAlpa);
  TampilkanStruk(K);
end.