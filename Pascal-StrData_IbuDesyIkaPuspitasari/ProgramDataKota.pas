program DataKota;
uses crt;

const
  MAKS_DATA = 15;

var
  arrKota     : array[1..MAKS_DATA] of string;
  arrProvinsi : array[1..MAKS_DATA] of string;
  i           : integer;
  cariKota    : string;
  ketemu      : boolean;

begin
    //Input Data oleh User
  {clrscr;
  writeln('=== INPUT DATA DATABASE KOTA ===');
  
  for i := 1 to MAKS_DATA do
  begin
    writeln('Data ke-', i);
    write('Nama Kota     : '); readln(arrKota[i]);
    write('Nama Provinsi : '); readln(arrProvinsi[i]);
    writeln;
  end;}

    //Input Data di SourceCode
    clrscr;
    writeln('=== PROGRAM PENCARIAN KOTA ===');
    arrKota[1] := 'Banjarmasin'; arrProvinsi[1] := 'Kalimantan Selatan';
    arrKota[2] := 'Jakarta';     arrProvinsi[2] := 'DKI Jakarta';
    arrKota[3] := 'Surabaya';    arrProvinsi[3] := 'Jawa Timur';
    arrKota[4] := 'Bandung';     arrProvinsi[4] := 'Jawa Barat';
    arrKota[5] := 'Medan';       arrProvinsi[5] := 'Sumatera Utara';
    arrKota[6] := 'Banjarbaru';   arrProvinsi[6] := 'Kalimantan Selatan';
    arrKota[7] := 'Semarang';     arrProvinsi[7] := 'Jawa Tengah';
    arrKota[8] := 'Makassar';     arrProvinsi[8] := 'Sulawesi Selatan';
    arrKota[9] := 'Denpasar';     arrProvinsi[9] := 'Bali';
    arrKota[10] := 'Palembang';   arrProvinsi[10] := 'Sumatera Selatan';
    arrKota[11] := 'Samarinda';   arrProvinsi[11] := 'Kalimantan Timur';
    arrKota[12] := 'Pontianak';   arrProvinsi[12] := 'Kalimantan Barat';
    arrKota[13] := 'Manado';      arrProvinsi[13] := 'Sulawesi Utara';
    arrKota[14] := 'Padang';      arrProvinsi[14] := 'Sumatera Barat';
    arrKota[15] := 'Ambon';       arrProvinsi[15] := 'Maluku';

    writeln('-----------------------------------------');
    writeln('=== PROGRAM PENCARIAN KOTA & PROVINSI ===');
    writeln('-----------------------------------------');
    
    write('Masukkan nama kota tempat tinggal Anda: '); 
    readln(cariKota);

    ketemu := false;
    for i := 1 to MAKS_DATA do
    begin
        if upcase(arrKota[i]) = upcase(cariKota) then
        begin
        writeln('-----------------------------------------');
        writeln('Hasil Pencarian:');
        writeln('Kota     : ', arrKota[i]);
        writeln('Provinsi : ', arrProvinsi[i]);
        ketemu := true;
        break;
        end;
    end;

    if not ketemu then
    begin
        writeln('-----------------------------------------');
        writeln('Maaf, kota "', cariKota, '" tidak ada dalam database kami.');
    end;

    writeln('-----------------------------------------');
    write('Tekan Enter untuk keluar...');
    readln;
end.