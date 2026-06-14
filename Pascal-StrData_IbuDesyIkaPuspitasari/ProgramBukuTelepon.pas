program BukuTelepon;
uses crt;
const
    BATAS_INPUT = 10;

var
    nama        : array[1..BATAS_INPUT] of String;
    nomor       : array[1..BATAS_INPUT] of String;
    jumlahNomor, pilihan                : integer;
    namaBaru, nomorBaru, namaCari       : string;

procedure AppendContact(p_nama, p_nomor: string);
begin
    if jumlahNomor < BATAS_INPUT then
        begin
        jumlahNomor := jumlahNomor + 1;
        nama[jumlahNomor] := p_nama;
        nomor[jumlahNomor] := p_nomor;
        writeln('-------------------------------');
        write('Berhasil Menambahkan:  ', p_nama);
        end
    else
        write('Gagal: Mencapai Batas Penyimpanan');  
end;

procedure SearchContact(dicari : string);
var
    i       : integer;
    found   : boolean;
begin
    found := false;
    for i := 1 to jumlahNomor
    do
    begin
        if upcase(nama[i]) = upcase(dicari)then
        begin
            writeln('-------------------------------');
            writeln('Data Ditemukan!');
            writeln('Nama   : ', nama[i]);
            writeln('Nomor  : ', nomor[i]);
            found := true;
            break;
        end;
    end;

    if not found then
        begin
            writeln('-------------------------------');
            writeln('Maaf, Nama "', dicari, '" tidak terdaftar');
            writeln();
        end;
end;

procedure ViewAllContacts;
var
  i: integer;
begin
  writeln('========DAFTAR KONTAK==========');
  if jumlahNomor = 0 then
    writeln('Memori kosong. Belum ada data.')
  else
  begin
    writeln('No | Nama           | Nomor Telepon');
    writeln('-----------------------------------');
    for i := 1 to jumlahNomor do
    begin
      writeln(i:2, ' | ', nama[i]:-14, ' | ', nomor[i]);
    end;
    writeln('-----------------------------------');
    writeln('Total: ', jumlahNomor, '/', BATAS_INPUT, ' kontak.');
  end;
end;

begin
    jumlahNomor := 0;

    repeat
        clrscr;
        writeln('===============================');
        writeln('     PROGRAM BUKU TELEPON      ');
        writeln('===============================');
        writeln('1. Tambah Kontak');
        writeln('2. Cari Kontak');
        writeln('3. Tampilkan Seluruh Kontak');
        writeln('4. Keluar');
        writeln('-------------------------------');
        write('Pilih Menu (1-4): '); readln(pilihan);
        writeln;

        case pilihan of
            1: begin
                    writeln('[MENU TAMBAH KONTAK]');
                    write('Masukkan Nama  : '); readln(namaBaru);
                    write('Masukkan Nomor : '); readln(nomorBaru);
                    AppendContact(namaBaru, nomorBaru);
                    writeln;
                    write('Tekan Enter untuk kembali...');
                    readln;
               end;
            2: begin
                if jumlahNomor = 0 then
                    begin
                        writeln('Phonebook masih kosong!');
                        writeln();
                        write('Tekan Enter untuk kembali...');
                        readln();
                    end
                else
                    begin
                        writeln('[MENU CARI KONTAK]');
                        write('Masukkan Nama yang dicari: '); readln(namaCari);
                        SearchContact(namaCari);
                        writeln();
                        write('Tekan Enter untuk kembali...');
                        readln;
                    end;
               end;
            3: begin
                    clrscr;
                    ViewAllContacts;
                    writeln();
                    write('Tekan Enter untuk kembali...');
                    readln;
                end;
            4: writeln('Keluar dari program...');
        else
            begin
                writeln('Pilihan tidak valid! Masukkan angka 1, 2, 3, atau 4.');
                readln;
            end;
        end;
    until pilihan = 4;
end.