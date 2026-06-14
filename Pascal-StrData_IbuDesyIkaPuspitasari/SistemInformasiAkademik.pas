program SistemInformasiAkademik;
uses crt;

const
    MAX_MK_PER_MHS = 5;
    MAX_MASTER_MK = 22;
    MAX_MHS = 100;

type
    //M. Rizky Rinaldy - array of struct (C++), array of record (pascal)
    KRS = record
        kodeMK: string[10];
        nilai: char;
    end;

    Mahasiswa = record
        npm: string[15];
        nama: string[50];
        MK_Diambil: array[1..MAX_MK_PER_MHS] of KRS;
        jumlah_MK_Diambil: integer;
    end;
    
    MataKuliah = record
        kode: string[10];
        nama: string[50];
        sks: integer;
    end;

var
    daftarMK: array[1..MAX_MASTER_MK] of MataKuliah;
    listMhs: array[1..MAX_MHS] of Mahasiswa;
    jumlahMhs: integer = 0;
    i: integer;

procedure MuatMataKuliah;
begin
    // Semester 1
    daftarMK[1].kode  := 'MGU1101'; daftarMK[1].nama  := 'Pendidikan Agama                 '; daftarMK[1].sks  := 2;
    daftarMK[2].kode  := 'MGU1104'; daftarMK[2].nama  := 'Bahasa Indonesia                 '; daftarMK[2].sks  := 2;
    daftarMK[3].kode  := 'TIF1101'; daftarMK[3].nama  := 'Logika Matematika                '; daftarMK[3].sks  := 2;
    daftarMK[4].kode  := 'TIF1102'; daftarMK[4].nama  := 'Pengantar Teknologi Informasi    '; daftarMK[4].sks  := 2;
    daftarMK[5].kode  := 'TIF1103'; daftarMK[5].nama  := 'Algoritma Pemrograman 1          '; daftarMK[5].sks  := 2;
    daftarMK[6].kode  := 'TIF1104'; daftarMK[6].nama  := 'Praktek Algoritma Pemrograman 1  '; daftarMK[6].sks  := 1;
    daftarMK[7].kode  := 'TIF1105'; daftarMK[7].nama  := 'Sistem Basis Data                '; daftarMK[7].sks  := 2;
    daftarMK[8].kode  := 'TIF1106'; daftarMK[8].nama  := 'Praktek Sistem Basis Data        '; daftarMK[8].sks  := 1;
    daftarMK[9].kode  := 'TIF1107'; daftarMK[9].nama  := 'Rangkaian Digital                '; daftarMK[9].sks  := 2;
    daftarMK[10].kode := 'TIF1108'; daftarMK[10].nama := 'Office Automation System         '; daftarMK[10].sks := 2;
    daftarMK[11].kode := 'TIF1109'; daftarMK[11].nama := 'Komponen dan Arsitektur Komputer '; daftarMK[11].sks := 2;
    // Semester 2
    daftarMK[12].kode := 'MGU1102'; daftarMK[12].nama := 'Pancasila                        '; daftarMK[12].sks := 2;
    daftarMK[13].kode := 'TIF1201'; daftarMK[13].nama := 'Matematika Diskrit               '; daftarMK[13].sks := 2;
    daftarMK[14].kode := 'TIF1202'; daftarMK[14].nama := 'Sistem Informasi Manajemen       '; daftarMK[14].sks := 2;
    daftarMK[15].kode := 'TIF1203'; daftarMK[15].nama := 'Algoritma Pemrograman 2          '; daftarMK[15].sks := 2;
    daftarMK[16].kode := 'TIF1204'; daftarMK[16].nama := 'Praktek Algoritma Pemrograman 2  '; daftarMK[16].sks := 1;
    daftarMK[17].kode := 'TIF1205'; daftarMK[17].nama := 'Perancangan Basis Data           '; daftarMK[17].sks := 2;
    daftarMK[18].kode := 'TIF1206'; daftarMK[18].nama := 'Struktur Data                    '; daftarMK[18].sks := 2;
    daftarMK[19].kode := 'TIF1207'; daftarMK[19].nama := 'Komunikasi Data                  '; daftarMK[19].sks := 2;
    daftarMK[20].kode := 'TIF1208'; daftarMK[20].nama := 'Pemrograman Visual               '; daftarMK[20].sks := 2;
    daftarMK[21].kode := 'TIF1209'; daftarMK[21].nama := 'Praktek Pemrograman Visual       '; daftarMK[21].sks := 1;
    daftarMK[22].kode := 'TIF1210'; daftarMK[22].nama := 'Komputer Akuntansi               '; daftarMK[22].sks := 2;
    // Semester 3-8
end;

function CariIndexMK(kode: string): integer;
begin
    CariIndexMK := -1;
    for i := 1 to MAX_MASTER_MK do
        if daftarMK[i].kode = kode then CariIndexMK := i;
end;

procedure TambahMahasiswa;
begin 
    clrscr;
    writeln('+=============================================+');
    writeln('|          INPUT DATA MAHASISWA BARU          |');
    writeln('+=============================================+');
    
    inc(jumlahMhs); 
    
    write('| NPM           : '); readln(listMhs[jumlahMhs].npm); 
    write('| Nama Lengkap  : '); readln(listMhs[jumlahMhs].nama); 
    
    writeln('+=============================================+');
    
    if (listMhs[jumlahMhs].npm = '') or (listMhs[jumlahMhs].nama = '') then 
    begin
        writeln('| ERROR: Data tidak boleh kosong!             |');
        writeln('+=============================================+');
        dec(jumlahMhs);
    end
    else 
    begin
        writeln('| SUKSES: Mahasiswa berhasil ditambahkan!     |');
        writeln('+=============================================+');
    end;
    readkey;
end;

procedure TampilkanDaftarMahasiswa;
var i: integer;
begin
    clrscr;
    writeln('+=============================================+');
    writeln('|          DAFTAR MAHASISWA TERDAFTAR         |');
    writeln('+=============================================+');
    writeln('|    NPM     | NAMA MAHASISWA                 |');
    writeln('+------------+--------------------------------+');
    
    if jumlahMhs = 0 then
        writeln('|           (Belum ada data mahasiswa)        |')
    else
    begin
        for i := 1 to jumlahMhs do
        begin
            writeln('| ', listMhs[i].npm:-10, ' | ', listMhs[i].nama:-30, ' |');
        end;
    end;
    
    writeln('+=============================================+');
    write('Tekan tombol apa saja untuk kembali...'); readkey;
end;

function CariIndexMhs(targetNIM: string): integer;
begin
    CariIndexMhs := -1; 
    for i := 1 to jumlahMhs do
        if listMhs[i].npm = targetNIM then begin CariIndexMhs := i; break; end;
end;

function CariMahasiswa(var idx: integer): boolean;
var npm: string;
begin
    write('Masukkan NPM: '); readln(npm);
    idx := CariIndexMhs(npm);
    if idx = -1 then
    begin
        writeln('NPM tidak ditemukan!');
        readkey;
        CariMahasiswa := false;
    end
    else
        CariMahasiswa := true;
end;

procedure InputNilai(idxMhs: integer);
var i, n, idxMK: integer; kode: string;
begin
    clrscr;
    writeln('+====================================================+');
    writeln('|                DAFTAR MATA KULIAH                  |');
    writeln('+----------+-----------------------------------+-----+');
    writeln('| Kode MK  | Nama Mata Kuliah                  | SKS |');
    writeln('+----------+-----------------------------------+-----+');
    for i := 1 to MAX_MASTER_MK do
        writeln('| ', daftarMK[i].kode:8, ' | ', daftarMK[i].nama:32, ' | ', daftarMK[i].sks:3, ' |');
    writeln('+----------+-----------------------------------+-----+');

    write('Berapa MK yang diambil (max 5): '); readln(n);
    if n > MAX_MK_PER_MHS then n := MAX_MK_PER_MHS;
    listMhs[idxMhs].jumlah_MK_Diambil := n;
            
    writeln('+====================================================+');
    for i := 1 to n do
    begin
        write('Masukkan Kode MK ke-', i, ': '); readln(kode);
        idxMK := CariIndexMK(kode);
        if idxMK <> -1 then
        begin
            listMhs[idxMhs].MK_Diambil[i].kodeMK := kode;
            writeln('Mata Kuliah: ', daftarMK[idxMK].nama, ' (', daftarMK[idxMK].sks, ' SKS)');
            write('Nilai (A/B/C/D/E): '); readln(listMhs[idxMhs].MK_Diambil[i].nilai);
        end 
        else 
            writeln('Kode MK tidak terdaftar!');
    end;
    writeln('+====================================================+');
    writeln('Input nilai selesai. Tekan Enter untuk kembali...'); readkey;
end;

procedure TampilkanKHS(idx: integer);
var i, idxMK, bobot, totalSKS, totalNilai: integer;
begin
    clrscr;
    writeln('+===================================================================+');
    writeln('|                   KARTU HASIL STUDI (KHS)                         |');
    writeln('+===================================================================+');
    writeln('| Nama : ', listMhs[idx].nama,                                    ' |');
    writeln('| NPM  : ', listMhs[idx].npm,                                     ' |');
    writeln('+---------+-----------------------------------+-----+-------+-------+');
    writeln('| KODE    | NAMA MATA KULIAH                  | SKS | NILAI | BOBOT |');
    writeln('+---------+-----------------------------------+-----+-------+-------+');
    
    totalSKS := 0; totalNilai := 0;
    for i := 1 to listMhs[idx].jumlah_MK_Diambil do
    begin
        idxMK := CariIndexMK(listMhs[idx].MK_Diambil[i].kodeMK);
        case upcase(listMhs[idx].MK_Diambil[i].nilai) of
            'A': bobot := 4; 'B': bobot := 3; 'C': bobot := 2; 'D': bobot := 1; else bobot := 0;
        end;
        
        totalNilai := totalNilai + (daftarMK[idxMK].sks * bobot);
        totalSKS := totalSKS + daftarMK[idxMK].sks;
        
        writeln('| ', daftarMK[idxMK].kode:6, 
                ' | ', daftarMK[idxMK].nama:31, 
                ' | ', daftarMK[idxMK].sks:3, 
                ' |   ', upcase(listMhs[idx].MK_Diambil[i].nilai):1, 
                '   | ', bobot:3, '   |');
    end;
    
    writeln('+---------+-----------------------------------+-----+-------+-------+');
    writeln('| TOTAL SKS                       : ', totalSKS:3, '                             |');
    if totalSKS > 0 then 
        writeln('| INDEKS PRESTASI KUMULATIF (IPK) : ', (totalNilai / totalSKS):0:2, '                            |')
    else 
        writeln('| INDEKS PRESTASI KUMULATIF (IPK) : 0.00                         |');
    writeln('+===================================================================+');
    write('Tekan Enter untuk kembali...'); readkey;
end;

var pilihan: char; idx: integer;
begin
    MuatMataKuliah;
    repeat
        clrscr;
        writeln('+=============================================+');
        writeln('|       SISTEM INFORMASI AKADEMIK (SIA)       |');
        writeln('+=============================================+');
        writeln('|  1. Tambah Mahasiswa                        |');
        writeln('|  2. Daftar Mahasiswa                        |');
        writeln('|  3. Input Nilai Mata Kuliah                 |');
        writeln('|  4. Tampilkan KHS                           |');
        writeln('|  5. Keluar dari Program                     |');
        writeln('+=============================================+');
        write('   Pilih menu (1-5): '); pilihan := readkey;
        writeln;
        
        case pilihan of
            '1': TambahMahasiswa;
            '2': TampilkanDaftarMahasiswa;
            '3': if CariMahasiswa(idx) then InputNilai(idx); 
            '4': if CariMahasiswa(idx) then TampilkanKHS(idx); 
        end;
    until pilihan = '5';
end.
