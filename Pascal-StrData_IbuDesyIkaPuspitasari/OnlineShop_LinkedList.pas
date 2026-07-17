program StackQueuewithLinkedList;

uses crt, sysutils, dos;

const
  WIDTH = 80;

type
  TPesanan = record
    idPesanan, namaPembeli, namaBarang, alamat: string;
    jumlah: integer;
    totalHarga: longint;
    status: string;
  end;
  PNode = ^TNode;
  TNode = record
    data: TPesanan;
    next: PNode;
  end;

  TBarang = record
    nama, kategori: string;
    stok: integer;
    harga: longint;
  end;

var
  headQueue, tailQueue, topStack: PNode;

  counterPesanan: integer;
  DaftarBarang: array of TBarang;
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

    {Dummy Stack Riwayat}

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
    if jumlahBarangSaatIni = Length(DaftarBarang) then
    begin
      popUp('Jumlah Item Mencapai Batas Sementara, Menambahkan space kosong...');
      loading('Mengalokasikan Memori Tambahan...');
      SetLength(DaftarBarang, Length(DaftarBarang) + 5);
    end;
    jumlahBarangSaatIni := jumlahBarangSaatIni + 1;
    cetakJudul(' >>> Tambah Barang Baru <<<', WIDTH);
    write(' --> Nama Barang : '); readln(DaftarBarang[jumlahBarangSaatIni - 1].nama);
    write(' --> Kategori    : '); readln(DaftarBarang[jumlahBarangSaatIni - 1].kategori);
    write(' --> Harga       : '); readln(DaftarBarang[jumlahBarangSaatIni - 1].harga);
    write(' --> Stok Awal   : '); readln(DaftarBarang[jumlahBarangSaatIni - 1].stok);
    
    popUp('Barang berhasil ditambahkan!');
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
      if DaftarBarang[i].stok > 1 then status := 'Tersedia' else status := 'Habis';
      
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
procedure pushRiwayat(dataPesanan: TPesanan);
  var newNode: PNode;
  begin
    new(newNode);
    newNode^.data := dataPesanan;
    newNode^.next := topStack;
    topStack := newNode;
  end;

procedure pesananBaru;
  var 
    inputNamaBarang: string; 
    i, indexDitemukan, jumlahBeli: integer;
    nodeBaru: PNode;
  begin
    clrscr;
    tampilkanStok;
    write(' ==> Masukkan nama barang yang ingin dibeli : '); readln(inputNamaBarang);
    indexDitemukan := -1; 
    for i := 0 to jumlahBarangSaatIni - 1 do 
      if SameText(inputNamaBarang, DaftarBarang[i].nama) then indexDitemukan := i;
      
    if indexDitemukan = -1 then popUp('Error: Nama barang tidak ditemukan!')
    else begin
      write('                         Jumlah yang dibeli : '); readln(jumlahBeli);
        
      if jumlahBeli <= 0 then popUp('Jumlah harus > 0!')
      else if jumlahBeli > DaftarBarang[indexDitemukan].stok then popUp('Maaf, stok tidak mencukupi!')
      else begin
        new(nodeBaru);
        nodeBaru^.data.jumlah := jumlahBeli;
        nodeBaru^.data.totalHarga := jumlahBeli * DaftarBarang[indexDitemukan].harga;
        nodeBaru^.data.namaBarang := DaftarBarang[indexDitemukan].nama;
        
        gettime(h, m, s, hund); getdate(yy, mm, dd, dow);
        nodeBaru^.data.idPesanan := 'ORD-' + IntToStr(yy) + FormatDigit(mm,2) + FormatDigit(dd,2) + '-' + FormatDigit(counterPesanan, 3);
        write('                          Alamat Pengiriman : '); readln(nodeBaru^.data.alamat);
        DaftarBarang[indexDitemukan].stok := DaftarBarang[indexDitemukan].stok - jumlahBeli;
        
        nodeBaru^.data.namaPembeli := inputNama;
        nodeBaru^.data.status := 'Pending';
        nodeBaru^.next := nil;

        counterPesanan := counterPesanan + 1;
        
        if tailQueue = nil then begin
          headQueue := nodeBaru;
          tailQueue := nodeBaru;
        end else begin
          tailQueue^.next := nodeBaru;
          tailQueue := nodeBaru;
        end;
        pushRiwayat(nodeBaru^.data); 
        popUp('Pesanan berhasil dibuat!');
      end;
    end;
  end;

procedure antrianPesanan;
  var curr: PNode; count: integer;
  begin
    clrscr;
    cetakJudul('ANTRIAN PESANAN', WIDTH);
    writeln('| ', 'No.':3, ' | ', 'ID Pesanan':18, ' | ', 'Barang':19, ' | ', 'Jml':3, ' | ', 'Total':10, ' | ', 'Alamat':10, ' |');
    cetakGaris(WIDTH, '-');
    
    if headQueue = nil then 
      popUp('Antrian Kosong!')
    else begin
      curr := headQueue;
      count := 1;
      while curr <> nil do begin
        writeln('| ', count:3, ' | ', curr^.data.idPesanan:18, ' | ', 
                curr^.data.namaBarang:19, ' | ', curr^.data.jumlah:3, ' | ', 
                curr^.data.totalHarga:10, ' | ', curr^.data.alamat:10, ' |');
        curr := curr^.next;
        count := count + 1;
      end;
    end;
    cetakGaris(WIDTH, '-');
    readln();
  end;

procedure batalkanPesanan(nomorUrut: integer; pembeliLogin: string);
  var 
    curr, prev: PNode;
    count, j: integer;
  begin
    if headQueue = nil then 
      popUp('Antrian kosong!')
    else begin
      curr := headQueue;
      prev := nil;
      count := 1;

      while (curr <> nil) and (count < nomorUrut) do begin
        prev := curr;
        curr := curr^.next;
        count := count + 1;
      end;

      if (curr = nil) or (curr^.data.namaPembeli <> pembeliLogin) then
        popUp('Nomor tidak valid atau pesanan bukan milik Anda!')
      else begin
        for j := 0 to jumlahBarangSaatIni - 1 do
          if SameText(curr^.data.namaBarang, DaftarBarang[j].nama) then
            DaftarBarang[j].stok := DaftarBarang[j].stok + curr^.data.jumlah;

        if prev = nil then headQueue := curr^.next
        else prev^.next := curr^.next;
        if curr = tailQueue then tailQueue := prev;

        curr^.data.status := 'Dibatalkan';
        pushRiwayat(curr^.data);
        
        dispose(curr);
        popUp('Pesanan berhasil dibatalkan!');
      end;
    end;
  end;

procedure tampilkanRiwayat(pembeliLogin: string; isAdmin: boolean);
var 
  curr: PNode; 
  count: integer;
  sudahDitampilkan: boolean;
  daftarID: array of string;
  idx: integer;
begin
  clrscr;
  cetakJudul('RIWAYAT TRANSAKSI', WIDTH);
  writeln('| ', 'No':3, ' | ', 'ID Pesanan':20, ' | ', 'Nama Barang':20, ' | ', 'Jumlah':8, ' | ', 'Status':15, ' |');
  cetakGaris(WIDTH, '-');
  
  SetLength(daftarID, 0);
  curr := topStack;
  count := 1;
  
  while curr <> nil do 
  begin
    if (isAdmin) or (curr^.data.namaPembeli = pembeliLogin) then
    begin
      sudahDitampilkan := false;
      for idx := 0 to High(daftarID) do
        if daftarID[idx] = curr^.data.idPesanan then sudahDitampilkan := true;
      
      if not sudahDitampilkan then
      begin
        writeln('| ', count:3, ' | ', 
                     curr^.data.idPesanan:20, ' | ', 
                     curr^.data.namaBarang:20, ' | ', 
                     curr^.data.jumlah:8, ' | ',
                     curr^.data.status:15, ' |');
        
        SetLength(daftarID, Length(daftarID) + 1);
        daftarID[High(daftarID)] := curr^.data.idPesanan;
        count := count + 1;
      end;
    end;
    curr := curr^.next;
  end;
  cetakGaris(WIDTH, '-');
  write('Tekan ENTER untuk kembali...');
  readln;
end;

procedure updateStatusRiwayat(idDicari: string; statusBaru: string);
  var 
    curr: PNode;
  begin
    curr := topStack;
    while curr <> nil do
    begin

      if Trim(curr^.data.idPesanan) = Trim(idDicari) then
      begin
        curr^.data.status := statusBaru;
      end;
      
      curr := curr^.next;
    end;
  end;

procedure konfirmasiSelesai;
  var 
    nodeSelesai: PNode;
  begin
    loading('Memproses Pesanan');
    if headQueue = nil then 
      popUp('Tidak ada antrian.')
    else 
    begin
      nodeSelesai := headQueue;
      nodeSelesai^.data.status := 'Selesai';
      pushRiwayat(nodeSelesai^.data);
      headQueue := headQueue^.next;
    
      if headQueue = nil then 
        tailQueue := nil;
      dispose(nodeSelesai);
      
      popUp('Pesanan berhasil diproses dan masuk ke riwayat!');
    end;
    readln();
  end;


{--- Program Utama ---}
begin

  clrscr;
  TeksAnimasi('IMPLEMENTASI STACK DAN QUEUE MENGGUNAKAN LINKED LIST', '-');
  TeksAnimasi('M. RIZKY RINALDY - 2510010102', ' ');
  loading('Memuat Program...');
  headQueue := nil; tailQueue := nil; topStack := nil;
  counterPesanan := 1;
  jumlahBarangSaatIni := 0;
  SetLength(DaftarBarang, 10); 
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
          listMenu('0. [ LOG OUT ]', WIDTH);
          cetakGaris(WIDTH, '-');
          write(' ==> Pilih: '); readln(subPilihan);
          case subPilihan of
            '1': pesananBaru();
            '2': begin
                  antrianPesanan(); 
                  write(' ==> Masukkan nomor urut pesanan yang ingin dibatalkan: '); 
                  readln(i);
                  batalkanPesanan(i, inputNama);
                end;
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
                  listMenu('0. [ LOG OUT ]', WIDTH);
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