program StackQueuewithArray;

uses crt, sysutils, dos;

const
  WIDTH = 80;
  MAX = 10;
  MAX_BARANG = 20;

type
  TPesanan = record
    idPesanan, namaPembeli, namaBarang, alamat: string;
    jumlah: integer;
    totalHarga: longint;
    status: string;
  end;

  TBarang = record
    nama, kategori: string;
    stok: integer;
    harga: longint;
  end;

var
  stackData: array[1..MAX] of TPesanan;
  top: integer;
  queueData: array[1..MAX] of TPesanan;
  head, tail: integer;
  
  DaftarBarang: array[1..MAX_BARANG] of TBarang;
  jumlahBarangSaatIni: integer;
  i: integer;
  
  h, m, s, hund, yy, mm, dd, dow: word; 
  pilihan, subPilihan: char;
  inputNama, userMode: string;

{Dummy Data}
procedure DummyData;
  begin
    {Dummmy Stock}
    jumlahBarangSaatIni := 3;
    DaftarBarang[1].nama := 'Laptop';   DaftarBarang[1].kategori := 'Elektronik'; DaftarBarang[1].stok := 5;  DaftarBarang[1].harga := 5000000;
    DaftarBarang[2].nama := 'Mouse';    DaftarBarang[2].kategori := 'Aksesoris';  DaftarBarang[2].stok := 15; DaftarBarang[2].harga := 150000;
    DaftarBarang[3].nama := 'Keyboard'; DaftarBarang[3].kategori := 'Aksesoris';  DaftarBarang[3].stok := 10; DaftarBarang[3].harga := 250000;

    {Dummy Queue Pesanan}
    head := 1;
    tail := 0;
    tail := tail + 1;
    queueData[tail].idPesanan := 'ORD-20260705-001';
    queueData[tail].namaPembeli := 'M. RIZKY  RINALDY';
    queueData[tail].namaBarang := 'LAPTOP';
    queueData[tail].jumlah := 1;
    queueData[tail].totalHarga := 5000000;
    queueData[tail].alamat := 'Bati-bati';
    queueData[tail].status := 'Pending';

    tail := tail + 1;
    queueData[tail].idPesanan := 'ORD-20260705-002';
    queueData[tail].namaPembeli := 'MADHIYAH';
    queueData[tail].namaBarang := 'MOUSE';
    queueData[tail].jumlah := 3;
    queueData[tail].totalHarga := 450000;
    queueData[tail].alamat := 'Martapura';
    queueData[tail].status := 'Pending';

    tail := tail + 1;
    queueData[tail].idPesanan := 'ORD-20260705-003';
    queueData[tail].namaPembeli := 'ABDUL HAIYI';
    queueData[tail].namaBarang := 'KEYBOARD';
    queueData[tail].jumlah := 2;
    queueData[tail].totalHarga := 500000;
    queueData[tail].alamat := 'Gambut';
    queueData[tail].status := 'Pending';

    {Dummy Stack Riwayat}
    top := top + 1;
    stackData[top].idPesanan := 'ORD-20260704-001';
    stackData[top].namaPembeli := 'MADHIYAH';
    stackData[top].namaBarang := 'MOUSE';
    stackData[top].jumlah := 2;
    stackData[top].status := 'Selesai';

    top := top + 1;
    stackData[top].idPesanan := 'ORD-20260704-002';
    stackData[top].namaPembeli := 'M. RIZKY RINALDY';
    stackData[top].namaBarang := 'LAPTOP';
    stackData[top].jumlah := 1;
    stackData[top].status := 'Dibatalkan';

    top := top + 1;
    stackData[top].idPesanan := 'ORD-20260704-003';
    stackData[top].namaPembeli := 'ABDUL HAIYI';
    stackData[top].namaBarang := 'KEYBOARD';
    stackData[top].jumlah := 1;
    stackData[top].status := 'Selesai';
  end;
{--- Prosedur UI ---}
procedure TeksAnimasi(teks: string; line: char);
    var i, j, spasiKiri : integer;
    begin
        spasiKiri := (WIDTH - length(teks)) div 2;
        for j := 1 to spasiKiri do write(' ');
        for i := 1 to length(teks) do
        begin
            write(teks[i]); delay(50);
        end;
        writeln;
        for j := 1 to spasiKiri do write(' ');
        for j := 1 to length(teks) do write(line); writeln;
    end;

procedure loading(teks: string);
    var i, j, spasiKiri: integer; tekslogo: string;
    begin
        spasiKiri := (WIDTH - length(teks)) div 2; writeln;
        tekslogo := ''; for j := 1 to spasiKiri do tekslogo := tekslogo + ' ';
        tekslogo := tekslogo + teks; write(tekslogo);
        for i := 1 to 2 do
        begin
            write(' /'); delay(200); write(#13, tekslogo);
            write(' -'); delay(200); write(#13, tekslogo);
            write(' \'); delay(200); write(#13, tekslogo);
            write(' |'); delay(200); write(#13, tekslogo);
        end;
        writeln;
    end;
function tampilkanWaktuTgl: string;
  var h, m, s, hund: word; yy, mm, dd, dow: word;
  begin
    GetDate(yy, mm, dd, dow);
    GetTime(h, m, s, hund);
    tampilkanWaktuTgl := IntToStr(dd) + '/' + IntToStr(mm) + '/' + IntToStr(yy) + ' ' + IntToStr(h) + ':' + IntToStr(m);
  end;

function FormatDigit(angka, jumlahDigit: integer): string;
  var
    s: string;
  begin
    s := IntToStr(angka);
    while length(s) < jumlahDigit do
      s := '0' + s;
    FormatDigit := s;
  end;

procedure cetakGaris(lebar: integer; simbol: char);
  var i: integer;
  begin
    write('+');
    for i := 1 to lebar do write(simbol);
    writeln('+');
  end;

procedure cetakJudul(teks: string; lebar: integer);
  var sisa, kiri, kanan, i: integer;
  begin
    cetakGaris(WIDTH, '=');
    write('|');
    sisa := lebar - length(teks);
    kiri := sisa div 2;
    kanan := sisa - kiri;
    for i := 1 to kiri do write(' ');
    write(teks);
    for i := 1 to kanan do write(' ');
    writeln('|');
    cetakGaris(WIDTH, '=');
  end;

procedure cetakJudulTanpaGaris(teks: string; lebar: integer);
  var sisa, kiri, kanan, i: integer;
  begin
    write('|');
    sisa := lebar - length(teks);
    kiri := sisa div 2;
    kanan := sisa - kiri;
    for i := 1 to kiri do write(' ');
    write(teks);
    for i := 1 to kanan do write(' ');
    writeln('|');
  end;
procedure listMenu(teks: string; lebar: integer);
  var sisaSpasi, k: integer;
  begin
    sisaSpasi := (lebar - 2) - length(teks);
    teks := '| ' + teks;
    for k := 1 to sisaSpasi do teks := teks + ' ';
    teks := teks + ' |';
    writeln(teks);
  end;

procedure infoHeader(labelTeks: string; info: string; lebar: integer);
  var sisaSpasi: integer;
  begin
    sisaSpasi := lebar - 2 - length(labelTeks) - length(info);
    write('| ', labelTeks);
    while sisaSpasi > 0 do begin write(' '); sisaSpasi := sisaSpasi - 1; end;
    writeln(info, ' |');
  end;

procedure headerPanel;
  begin
    cetakGaris(WIDTH, '=');
    cetakJudulTanpaGaris('SELAMAT DATANG DI RNLDcom', WIDTH);
    cetakJudulTanpaGaris('Menyediakan Berbagai Kelengkapan Komputer dan Aksesoris', WIDTH); 
    cetakGaris(WIDTH, '=');
    infoHeader(' ', tampilkanWaktuTgl, WIDTH);
    infoHeader(inputNama, userMode, WIDTH);
  end;

procedure popUp(pesan: string);
  begin
    writeln;
    cetakJudul(pesan, WIDTH);
    write('Tekan ENTER untuk melanjutkan...');
  end;

{--- Prosedur Manajemen Stock ---}
function loginAdmin: boolean;
  var pass: string;
  begin
    cetakJudul('LOGIN ADMIN', WIDTH);
    write(' ==> Masukkan Password Admin: '); readln(pass);
    if pass = 'admin123' then
      loginAdmin := true
    else begin
      popUp('Password Salah!');
      loginAdmin := false;
      readln();
    end;
  end;
procedure tambahBarangBaru;
  begin
    if jumlahBarangSaatIni < MAX_BARANG then
    begin
      jumlahBarangSaatIni := jumlahBarangSaatIni + 1;
      cetakJudul(' >>> Tambah Barang Baru <<<', WIDTH);
      write(' --> Nama Barang : '); readln(DaftarBarang[jumlahBarangSaatIni].nama);
      write(' --> Kategori    : '); readln(DaftarBarang[jumlahBarangSaatIni].kategori);
      write(' --> Harga       : '); readln(DaftarBarang[jumlahBarangSaatIni].harga);
      write(' --> Stok Awal   : '); readln(DaftarBarang[jumlahBarangSaatIni].stok);
      popUp('Barang berhasil ditambahkan!');
    end else writeln('Kapasitas penuh!');
    readkey;
  end;

procedure tampilkanStok;
  var i: integer; status: string;
  begin
    cetakGaris(WIDTH, '-');
    writeln('| ', 'No':3,' | ', 'Nama Barang':17, ' | ', 'Kategori':15, ' | ', 'Harga':12, ' | ', 'Stok':6, ' | ', 'Status':10, ' |');
    cetakGaris(WIDTH, '-');

    for i := 1 to jumlahBarangSaatIni do
    begin
      if DaftarBarang[i].stok > 0 then status := 'Tersedia' else status := 'Habis';
      
      writeln('| ', i:3, ' | ', 
              DaftarBarang[i].nama:17, ' | ', 
              DaftarBarang[i].kategori:15, ' | ', 
              'Rp', DaftarBarang[i].harga:10, ' | ', 
              DaftarBarang[i].stok:6, ' | ', 
              status:10, ' |');
    end;
    cetakGaris(WIDTH, '-');
  end;

procedure tambahStok;
  var kode, tambahan, labelLebar: integer;
  begin
    clrscr;
    labelLebar := 50;
    tampilkanStok();
    write(' ==> Pilih nomor barang (1-':labelLebar-2, jumlahBarangSaatIni,') : '); readln(kode);
    if (kode >= 1) and (kode <= jumlahBarangSaatIni) then
    begin
      write('Jumlah stok tambahan':labelLebar,' : '); readln(tambahan);
      DaftarBarang[kode].stok := DaftarBarang[kode].stok + tambahan;
      popUp('Stok berhasil diperbarui!');
    end else popUp('Kode tidak valid!');
    readkey;
  end;

{Prosedure Pesanan Online}
procedure pesananBaru;
  var 
    idUnik, inputNamaBarang: string; 
    i, indexDitemukan, labelLebar, nextTail: integer;
  begin
    labelLebar := 50;
    clrscr;
    nextTail := (tail mod MAX) + 1;
    
    if nextTail = head then 
      popUp('Antrian penuh!')
    else begin
      tampilkanStok;
      write(' ==> Masukkan nama barang yang ingin dibeli':labelLebar, ' : '); readln(inputNamaBarang);
      indexDitemukan := 0;
      for i := 1 to jumlahBarangSaatIni do 
        if SameText(inputNamaBarang, DaftarBarang[i].nama) then indexDitemukan := i;
        
      if indexDitemukan = 0 then 
        popUp('Error: Nama barang tidak ditemukan!')
      else begin
        write('Jumlah yang dibeli':labelLebar, ' : '); readln(i);
        
        if i <= 0 then 
          popUp('Jumlah harus > 0!')
        else if i > DaftarBarang[indexDitemukan].stok then 
          popUp('Maaf, stok tidak mencukupi!')
        else begin
          tail := nextTail;
          if head = 0 then head := 1;
          
          queueData[tail].jumlah := i;
          queueData[tail].totalHarga := queueData[tail].jumlah * DaftarBarang[indexDitemukan].harga;
          
          gettime(h, m, s, hund); getdate(yy, mm, dd, dow);
          idUnik := 'ORD-' + IntToStr(yy) + FormatDigit(mm,2) + FormatDigit(dd,2) + '-' + FormatDigit(tail, 3);

          write('Alamat Pengiriman':labelLebar, ' : '); readln(queueData[tail].alamat);
          
          DaftarBarang[indexDitemukan].stok := DaftarBarang[indexDitemukan].stok - queueData[tail].jumlah;
          queueData[tail].idPesanan := idUnik;
          queueData[tail].namaPembeli := inputNama;
          queueData[tail].namaBarang := DaftarBarang[indexDitemukan].nama;
          queueData[tail].status := 'Pending';
          
          top := top + 1;
          stackData[top] := queueData[tail];
          popUp('Pesanan berhasil dibuat! Total: Rp' + IntToStr(queueData[tail].totalHarga));
        end;
      end;
    end;
    readln();
  end;

procedure antrianPesanan;
  var i, count: integer;
  begin
    clrscr;
    cetakJudul('ANTRIAN PESANAN', WIDTH);
    writeln('| ', 'No.':3, ' | ', 'ID Pesanan':18, ' | ', 'Barang':19, ' | ', 'Jml':3, ' | ', 'Total':10, ' | ', 'Alamat':10, ' |');
    cetakGaris(WIDTH, '-');
    
    if head = 0 then 
      writeln('|':2, 'Antrian Kosong!':76, ' |')
    else begin
      i := head;
      count := 1;
      repeat
        writeln('| ', count:3, ' | ', 
                queueData[i].idPesanan:18, ' | ', 
                queueData[i].namaBarang:19, ' | ', 
                queueData[i].jumlah:3, ' | ',
                queueData[i].totalHarga:10, ' | ',
                queueData[i].alamat:10, ' |');
        
        if i = tail then break;
        i := (i mod MAX) + 1;
        count := count + 1;
      until false;
    end;
    cetakGaris(WIDTH, '-');
    readln();
  end;

procedure batalkanPesananTerakhir(pembeliLogin: string);
  var 
    i: integer;
  begin
    if head = 0 then 
      popUp('Antrian kosong!')
    else begin
      if (queueData[tail].namaPembeli <> pembeliLogin) then 
        popUp('Hanya pesanan terakhir (paling baru) yang bisa dibatalkan!')
      else begin
        for i := 1 to jumlahBarangSaatIni do
          if SameText(queueData[tail].namaBarang, DaftarBarang[i].nama) then
            DaftarBarang[i].stok := DaftarBarang[i].stok + queueData[tail].jumlah;
        
        top := top + 1; 
        stackData[top] := queueData[tail];
        stackData[top].status := 'Dibatalkan';
        
        if head = tail then begin
          head := 0; 
          tail := 0;
        end else begin
          if tail = 1 then tail := MAX
          else tail := tail - 1;
        end;
        popUp('Pesanan terakhir Anda berhasil dibatalkan!');
      end;
    end;
    readln();
  end;

procedure tampilkanRiwayat(pembeliLogin: string; isAdmin: boolean);
  var i, count: integer;
  begin
    clrscr;
    cetakJudul('RIWAYAT TRANSAKSI ANDA', WIDTH);
    writeln('| ', 'No':3, ' | ', 'ID Pesanan   ':20, ' | ', 'Nama Barang':25, ' | ', 'Jml  ':6, ' | ', 'Status   ':12, ' |');
    cetakGaris(WIDTH, '-');
    count := 0;
    if top = 0 then 
      popUp('Belum ada riwayat transaksi.')
    else 
      for i := top downto 1 do
        if (isAdmin) or (stackData[i].namaPembeli = pembeliLogin) then
        begin
          count := count + 1;
          writeln('| ', count:3, ' | ', 
                        stackData[i].idPesanan:20, ' | ', 
                        stackData[i].namaBarang:25, ' | ', 
                        stackData[i].jumlah:6, ' | ', 
                        stackData[i].status:12, ' |');
        end;
    cetakGaris(WIDTH, '-');
    if count = 0 then popUp('Anda tidak memiliki riwayat transaksi.');
    readln;
  end;

procedure updateStatusRiwayat(idDicari: string; statusBaru: string);
  var i: integer;
  begin
    for i := 1 to top do
    begin
      if Trim(stackData[i].idPesanan) = Trim(idDicari) then
      begin
        stackData[i].status := statusBaru;
      end;
    end;
  end;

procedure konfirmasiSelesai;
  var pesanan: TPesanan;
  begin
    loading('Memproses Pesanan');
    if head = 0 then popUp('Tidak ada antrian.')
    else begin
      pesanan := queueData[head]; 

      updateStatusRiwayat(pesanan.idPesanan, 'Selesai');
      
      if head = tail then begin
        head := 0; tail := 0;
      end else 
        head := (head mod MAX) + 1;
        
      popUp('Pesanan ' + pesanan.idPesanan + ' selesai!');
    end;
    readln();
  end;


{--- Program Utama ---}
begin
  clrscr;
  TeksAnimasi('IMPLEMENTASI STACK DAN QUEUE MENGGUNAKAN ARRAY', '-');
  TeksAnimasi('M. RIZKY RINALDY - 2510010102', ' ');
  loading('Memuat Program...');
  top := 0; head := 0; tail := 0;
  DummyData();
  repeat
    clrscr;
    cetakJudul('SISTEM ONLINE SHOP', WIDTH);
    listMenu('1. Mode Pembeli', WIDTH);
    listMenu('2. Mode Penjual', WIDTH);
    listMenu('0. Keluar', WIDTH);
    cetakGaris(WIDTH, '-');
    write(' ==> Masuk Sebagai (1-2): '); readln(pilihan);
    case pilihan of
      '1': begin
        loading('...Masuk Sebagai Pembeli...');
        userMode := 'Mode Pembeli';
        cetakJudul('LOGIN', WIDTH);
        write(' ==> Masukkan nama Anda: '); readln(inputNama); 
        inputNama := UpperCase(inputNama);
        repeat
          clrscr;
          headerPanel();
          tampilkanStok();
          listMenu('1. [ ORDER   ] Pesan Barang', WIDTH);
          listMenu('2. [ CANCEL  ] Batalkan Pesanan', WIDTH);
          listMenu('3. [ HISTORY ] Lihat Riwayat Pesanan', WIDTH);
          listMenu('0. Kembali', WIDTH);
          cetakGaris(WIDTH, '-');
          write(' ==> Pilih: '); readln(subPilihan);
          case subPilihan of
            '1': pesananBaru();
            '2': batalkanPesananTerakhir(inputNama);
            '3': tampilkanRiwayat(inputNama, false);
          end;
          readkey;
        until subPilihan = '0';
      end;
      '2': begin
            loading('...Masuk Sebagai Penjual...');
             if loginAdmin then
              begin
                inputNama := 'ADMIN';
                repeat
                  userMode := 'Mode Penjual';
                  clrscr;
                  headerPanel();
                  tampilkanStok();
                  listMenu('N. [NEW] Menambahkan Item Barang Baru', WIDTH);
                  listMenu('A. [ADD] Menambahkan Stock Barang', WIDTH);
                  cetakJudul('DASHBOARD PENJUAL', WIDTH);
                  listMenu('1. [ ORDERAN ] Lihat Antrian', WIDTH);
                  listMenu('2. [ KIRIM   ] Proses Pesanan', WIDTH);
                  listMenu('3. [ HISTORY ] Lihat Riwayat Pesanan', WIDTH);
                  listMenu('0. Kembali', WIDTH);
                  cetakGaris(WIDTH, '-');
                  write(' ==> Pilih: '); readln(subPilihan);
                  case UpperCase(subPilihan) of
                    'N': tambahBarangBaru;
                    'A': tambahStok;
                    '1': antrianPesanan();
                    '2': konfirmasiSelesai();
                    '3': tampilkanRiwayat('', true);
                  end;
                until subPilihan = '0';
              end;
        end;
    end;
  until pilihan = '0';
end.