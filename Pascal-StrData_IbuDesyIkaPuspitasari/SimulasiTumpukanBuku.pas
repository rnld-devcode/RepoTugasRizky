program SimulasiTumpukanBuku;
uses sysutils, crt;
const
    WIDTH = 80;
    MAX_TUMPUKAN = 5;

type
    Buku = record
        judul: string;
        pengarang: string;
    end;

    Stack = record
        data: array[1..MAX_TUMPUKAN] of Buku;
        top: integer;
    end;

var
    tumpukanUtama: Stack;
    jumlahBuku, i: integer;
    nomorPilihan: integer;
    pilihanInput: string;
    ulang: char;

procedure BuatGaris(lebar: integer; simbol: char);
var
    i: integer;
begin
    write('+');
    for i := 1 to lebar do
    begin
        write(simbol);
    end;
    writeln('+');
end;

procedure JudulTabel(lebar: integer; teks: string);
var
    totalSpasi, spasiKiri, i: integer;
begin
    totalSpasi := lebar - length(teks);
    if totalSpasi < 0 then
    begin
        writeln('|', teks, '|');
        exit;
    end;
    
    spasiKiri := totalSpasi div 2;
    write('|');
    
    for i := 1 to spasiKiri do
        write(' ');
        
    write(teks);
    
    for i := 1 to (totalSpasi - spasiKiri) do
        write(' ');   
        
    writeln('|');
end;

procedure Judul(lebar: integer; teks: string);
var
    totalSpasi, spasiKiri, i: integer;
begin
    totalSpasi := lebar - length(teks);
    if totalSpasi < 0 then
    begin
        writeln(teks);
        exit;
    end;
    
    spasiKiri := totalSpasi div 2;
    
    for i := 1 to spasiKiri do
        write(' ');
        
    writeln(teks);
end;

procedure TeksAnimasi(teks: string; line: char);
var
    iLokal, jLokal, jumlahSpasiKiri: integer;
    tempString: string;
begin
    jumlahSpasiKiri := (WIDTH - length(teks)) div 2;

    for iLokal := 1 to jumlahSpasiKiri do
        write(' ');
        
    tempString := teks;
    for iLokal := 1 to length(tempString) do
    begin
        write(tempString[iLokal]);
        delay(100); 
    end;
    writeln(); 
    
    for jLokal := 1 to jumlahSpasiKiri do 
        write(' ');
        
    for jLokal := 1 to length(tempString) do 
        write(line);
        
    writeln(); 
end;

procedure loading(teks: string);
var
    iLokal, jLokal, jumlahSpasiKiri: integer;
    tekslogo: string;
begin
    jumlahSpasiKiri := (WIDTH - length(teks)) div 2;
    writeln();
    
    tekslogo := '';
    for jLokal := 1 to jumlahSpasiKiri do
    begin
        tekslogo := tekslogo + ' ';
    end;
    
    tekslogo := tekslogo + teks;
    
    write(tekslogo);
    
    for iLokal := 1 to 3 do
    begin
        write(' /'); delay(250); write(#13, tekslogo);
        write(' -'); delay(250); write(#13, tekslogo);
        write(' \'); delay(250); write(#13, tekslogo);
        write(' |'); delay(250); write(#13, tekslogo);
    end;
    writeln();
end;

procedure InitStack(var s: Stack);
begin
    s.top := 0;
end;

function IsFull(s: Stack): boolean;
begin
    IsFull := s.top = MAX_TUMPUKAN;
end;

function IsEmpty(s: Stack): boolean;
begin
    IsEmpty := s.top = 0;
end;

procedure Push(var s: Stack; b: Buku);
begin
    if not IsFull(s) then
    begin
        s.top := s.top + 1;
        s.data[s.top] := b;
    end;
end;

function Pop(var s: Stack): Buku;
begin
    if not IsEmpty(s) then
    begin
        Pop := s.data[s.top];
        s.top := s.top - 1;
    end;
end;

procedure MuatDataContoh(var s: Stack);
    procedure DataBuku(idx: integer; jdl, pgr: string);
    begin
        s.data[idx].judul := jdl;
        s.data[idx].pengarang := pgr;
    end;
begin
    s.top := 5;
    DataBuku(1, 'The Chronicles of Narnia', 'C.S. Lewis');
    DataBuku(2, 'The Hunger Games', 'Suzanne Collins');
    DataBuku(3, 'Percy Jackson: The Lightning Thief', 'Rick Riordan');
    DataBuku(4, 'The Hobbit', 'J.R.R. Tolkien');
    DataBuku(5, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling');
end;

procedure TampilkanStack(s: Stack);
var
    j: integer;
    isiBaris, TB: string;
    sisaSpasi, k: integer;
begin
    if not IsEmpty(s) then
    begin
        writeln();
        BuatGaris(WIDTH, '-');
        JudulTabel(WIDTH, 'Isi tumpukan buku Saat ini:');
        BuatGaris(WIDTH, '-');
        
        for j := s.top downto 1 do 
        begin
            isiBaris := IntToStr(j) + ' > "' + s.data[j].judul + '" (' + s.data[j].pengarang + ')';
            
            sisaSpasi := (WIDTH - 2) - length(isiBaris);
            
            TB := '| ' + isiBaris;
            for k := 1 to sisaSpasi do
            begin
                TB := TB + ' ';
            end;
            TB := TB + ' |';

            writeln(TB); 
        end;
        BuatGaris(WIDTH, '-');
    end
    else
    begin
        BuatGaris(WIDTH, '-');
        JudulTabel(WIDTH, 'Tumpukan kosong.');
        BuatGaris(WIDTH, '-');
    end;
end;

procedure SimulasiAmbilBuku(var utama: Stack; nomorTarget: integer);
var
    sementara: Stack;
    bukuAngkat, bukuTarget: Buku;
    isiTop: integer;

    procedure CetakRataKiri(teks: string);
    var
        sisaSpasi, kLokal: integer;
        TB: string;
    begin
        sisaSpasi := (WIDTH - 2) - length(teks);
        TB := '| ' + teks;
        for kLokal := 1 to sisaSpasi do 
            TB := TB + ' ';
        TB := TB + ' |';
        writeln(TB);
    end;

begin
    if (nomorTarget < 1) or (nomorTarget > utama.top) then
    begin
        BuatGaris(WIDTH, '-');
        JudulTabel(WIDTH, 'Nomor buku tidak valid! Silakan lihat indeks tumpukan.');
        BuatGaris(WIDTH, '-');
        exit;
    end;

    InitStack(sementara);
    bukuTarget := utama.data[nomorTarget];

    BuatGaris(WIDTH, '=');
    JudulTabel(WIDTH, 'PROSES SIMULASI PENGAMBILAN');
    BuatGaris(WIDTH, '=');
    CetakRataKiri('Buku yang diambil: "' + bukuTarget.judul + '"');
    BuatGaris(WIDTH, '-');

    isiTop := utama.top;
    while (isiTop >= nomorTarget) do
    begin
        if isiTop = nomorTarget then
        begin
            bukuAngkat := Pop(utama);
            CetakRataKiri('   Angkat: "' + bukuAngkat.judul + '"');
            CetakRataKiri('   Ambil : "' + bukuAngkat.judul + '"');
        end
        else
        begin
            bukuAngkat := Pop(utama);
            CetakRataKiri('   Angkat: "' + bukuAngkat.judul + '"');
            Push(sementara, bukuAngkat);
        end;
        isiTop := isiTop - 1;
    end;

    BuatGaris(WIDTH, '-');
    JudulTabel(WIDTH, 'Mengembalikan Buku Lain Ke Tumpukan');
    BuatGaris(WIDTH, '-');

    while not IsEmpty(sementara) do
    begin
        bukuAngkat := Pop(sementara);
        CetakRataKiri('   Tumpuk: "' + bukuAngkat.judul + '"');
        Push(utama, bukuAngkat);
    end;
    BuatGaris(WIDTH, '=');
end;

{ --- PROGRAM UTAMA --- }
var
    bukuInput: Buku;
begin
    clrscr;
    TeksAnimasi('2510010102 - M. RIZKY RINALDY', '-' );
    TeksAnimasi('Struktur Data - Stack pada Array Of Record', '-' );
    loading('==><== Loading');
    clrscr;
    InitStack(tumpukanUtama);
    
    BuatGaris(WIDTH, '=');
    JudulTabel(WIDTH, 'SISTEM SIMULASI TUMPUKAN BUKU');
    BuatGaris(WIDTH, '=');
    write('  ==> Input Data Baru (y/t)  : ');
    readln(pilihanInput);


    if lowercase(pilihanInput) = 't' then
    begin
        MuatDataContoh(tumpukanUtama);
        writeln();
        Judul(WIDTH, '-----Berhasil memuat 5 Contoh Data Buku!-----');
    end
    else
    begin
        BuatGaris(WIDTH, '-');
        JudulTabel(WIDTH, 'INPUT DATA MANUAL');
        BuatGaris(WIDTH, '-');
        write('  ==> Masukkan jumlah buku yang ingin ditumpuk (Max ' + IntToStr(MAX_TUMPUKAN) + '): ');
        readln(jumlahBuku);

        if (jumlahBuku < 1) or (jumlahBuku > MAX_TUMPUKAN) then
        begin
            JudulTabel(WIDTH, 'Jumlah buku tidak valid. Program dihentikan.');
            exit;
        end;

        BuatGaris(WIDTH, '-');
        for i := 1 to jumlahBuku do
        begin
            JudulTabel(WIDTH, 'Data Buku ke-' + IntToStr(i) + ':');
            write('| --> Judul Buku    : ');
            readln(bukuInput.judul);
            write('| --> Nama Pengarang: ');
            readln(bukuInput.pengarang);
            Push(tumpukanUtama, bukuInput);
            BuatGaris(WIDTH, '-');
        end;
    end;

    writeln();
    for i := 1 to (WIDTH - length('MEMASUKI MODE SIMULASI')) div 2 do
        write(' ');
        
    pilihanInput := 'MEMASUKI MODE SIMULASI';
    for i := 1 to length(pilihanInput) do
    begin
        write(pilihanInput[i]);
        delay(100);
    end;
    writeln();
    delay(1000);

    repeat
        clrscr;
        BuatGaris(WIDTH, '=');
        JudulTabel(WIDTH, 'SISTEM SIMULASI TUMPUKAN BUKU');
        BuatGaris(WIDTH, '=');
        TampilkanStack(tumpukanUtama);
        writeln;
        write('  ==> Ambil buku nomor indeks: ');
        readln(nomorPilihan);
        loading('==><== Loading');
        clrscr;

        SimulasiAmbilBuku(tumpukanUtama, nomorPilihan);
        TampilkanStack(tumpukanUtama);
        writeln;
        
        if IsEmpty(tumpukanUtama) then
        begin
            Judul(WIDTH, '-----Semua buku di tumpukan telah habis!-----');
            writeln();
            break;
        end;

        write('  ==> Ingin mengambil buku lagi? (y/t): ');
        readln(ulang); 
        writeln;

    until (ulang = 't') or (ulang = 'T');
    
    BuatGaris(WIDTH, '=');
    JudulTabel(WIDTH, 'Program simulasi selesai');
    BuatGaris(WIDTH, '=');
    writeln();
    TeksAnimasi('2510010102 - M. RIZKY RINALDY', '-' );
    readln
    
end.