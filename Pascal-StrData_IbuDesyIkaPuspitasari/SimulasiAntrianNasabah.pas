program SimulasiAntrianNasabah;
uses crt;

const
    WIDTH       = 100;
    MAX_ANTRIAN = 15;

type
    nasabah = record
        no_rek  : string;
        nama    : string;
        no_antri: string;
    end;

    AntrianTeller      = array[1..MAX_ANTRIAN] of nasabah;
    AntrianCustService = array[1..MAX_ANTRIAN] of nasabah;

var
    queueTeller             : AntrianTeller;
    queueCS                 : AntrianCustService;
    rposT, sposT, nomorT    : integer; 
    rposCS, sposCS, nomorCS : integer;
    pilihan                 : char;

procedure BuatGaris(karakter: char);
    var i: integer;
    begin
        write('+');
        for i := 1 to WIDTH do write(karakter);
        writeln('+');
    end;

procedure Judul(teks: string);
    var totalSpasi, spasiKiri, i : integer;
    begin
        totalSpasi := WIDTH - length(teks);
        spasiKiri := totalSpasi div 2;
        writeln;
        for i := 1 to spasiKiri do write(' '); write(teks);
        writeln;
    end;

procedure JudulTabel(teks: string);
    var totalSpasi, spasiKiri, i : integer;
    begin
        totalSpasi := WIDTH - length(teks);
        if totalSpasi < 0 then
        begin
            writeln('|', teks, '|'); 
            exit;
        end;

        spasiKiri := totalSpasi div 2;
        BuatGaris('=');
        write('|'); for i := 1 to spasiKiri do write(' '); 
        write(teks);
        for i := 1 to (totalSpasi - spasiKiri) do write(' '); writeln('|');
        BuatGaris('=');
    end;

procedure ListRataKiri(teks: string);
    var sisaSpasi, k: integer;
    begin
        sisaSpasi := (WIDTH - 2) - length(teks);
        teks := '| ' + teks;
        for k := 1 to sisaSpasi do 
            teks := teks + ' ';
        teks := teks + ' |';
        writeln(teks);
    end;

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

procedure MuatIndexAwal;
begin
    rposT := 1;
    sposT := 1;
    nomorT := 1;

    rposCS := 1;
    sposCS := 1;
    nomorCS := 1;
end;

procedure StoreTeller;
var n : nasabah; strNo, pesanSukses : string; nextPos : integer;
begin
    nextPos := (sposT mod MAX_ANTRIAN) + 1;

    if nextPos = rposT then 
        writeln(' [ANTRIAN PENUH] Silahkan Tunggu Beberapa Saat!')
    else
        begin
            clrscr;
            JudulTabel('>>> INPUT DATA NASABAH BARU TELLER <<<');
            write('     --> Masukkan Nama   : '); readln(n.nama);
            write('     --> Masukkan No.Rek : '); readln(n.no_rek);
            str(nomorT, strNo);
            if nomorT < 10 then n.no_antri := 'T-0' + strNo else n.no_antri := 'T-' + strNo;
            nomorT := nomorT + 1;

            queueTeller[sposT] := n;
            sposT := nextPos;
            loading('Mencetak Tiket');
            pesanSukses := '[SUKSES] Tiket ' + n.no_antri + ' Loket Teller atas nama ' + n.nama + ' dicetak.';
            JudulTabel(pesanSukses);
        end;
end;

procedure StoreCS;
var n : nasabah; strNo, pesanSukses : string; nextPos : integer;
begin
    nextPos := (sposCS mod MAX_ANTRIAN) + 1;
    if nextPos = rposCS then 
        writeln(' [ANTRIAN PENUH] Silahkan Tunggu Beberapa Saat!')
    else
        begin
            clrscr;
            JudulTabel('>>> INPUT DATA NASABAH BARU CS <<<');
            write('     --> Masukkan Nama   : '); readln(n.nama);
            write('     --> Masukkan No.Rek : '); readln(n.no_rek);
            str(nomorCS, strNo);
            if nomorCS < 10 then n.no_antri := 'CS-0' + strNo else n.no_antri := 'CS-' + strNo;
            nomorCS := nomorCS + 1;

            queueCS[sposCS] := n;
            sposCS := nextPos;
            loading('Mencetak Tiket');
            pesanSukses := '[SUKSES] Tiket ' + n.no_antri + ' Loket CS atas nama ' + n.nama + ' dicetak.';
            JudulTabel(pesanSukses);
        end;
end;

procedure RetrieveTeller;
var pesanPanggil: string;
begin
    if rposT = sposT then
        JudulTabel(' [KOSONG] Tidak ada antrian di Teller.')
    else
        begin
            clrscr;
            pesanPanggil := '[PANGGILAN] Nomor Antrian ' + queueTeller[rposT].no_antri + ' atas nama ' + queueTeller[rposT].nama + ' silakan ke Teller.';
            JudulTabel(pesanPanggil);
            rposT := (rposT mod MAX_ANTRIAN) + 1;
        end;
end;

procedure RetrieveCS;
var pesanPanggil: string;
begin
    if rposCS = sposCS then
        JudulTabel(' [KOSONG] Tidak ada antrian di Customer Service.')
    else
        begin
            clrscr;
            pesanPanggil := '[PANGGILAN] Nomor Antrian ' + queueCS[rposCS].no_antri + ' atas nama ' + queueCS[rposCS].nama + ' silakan ke CS.';
            JudulTabel(pesanPanggil);
            rposCS := (rposCS mod MAX_ANTRIAN) + 1;
        end;
end;

procedure IsiDataDummy;
    var 
        i: integer;
        strNo: string;
        namaT  : array[1..5] of string = ('Naruto', 'Sasuke', 'Sakura', 'Kakashi', 'Sai');
        namaCS : array[1..5] of string = ('Shikamaru', 'Ino', 'Choji', 'Hinata', 'Kiba');
    begin
        clrscr;
        JudulTabel('>>> PROSES PENGISIAN DATA DUMMY NASABAH <<<');
        loading('Membuat 5 Data Teller & 5 Data CS');
        for i := 1 to 5 do
        begin
            queueTeller[sposT].nama := namaT[i];
            queueTeller[sposT].no_rek := '1000' + chr(48 + i);
            str(nomorT, strNo); if nomorT < 10 then queueTeller[sposT].no_antri := 'T-0' + strNo else queueTeller[sposT].no_antri := 'T-' + strNo;
            sposT := (sposT mod MAX_ANTRIAN) + 1; nomorT := nomorT + 1;
        end;
        for i := 1 to 5 do
        begin
            queueCS[sposCS].nama := namaCS[i];
            queueCS[sposCS].no_rek := '2000' + chr(48 + i);
            str(nomorCS, strNo); if nomorCS < 10 then queueCS[sposCS].no_antri := 'CS-0' + strNo else queueCS[sposCS].no_antri := 'CS-' + strNo;
            sposCS := (sposCS mod MAX_ANTRIAN) + 1; nomorCS := nomorCS + 1;
        end;
        JudulTabel('[SUKSES] 10 Data Dummy Bank Konoha Berhasil Ditambahkan!');
    end;

procedure PapanInformasiLive;
    var
        iT, iCS, k, angkaT, angkaCS: integer;
        strNo: string;
        barisKiri, barisKanan, barisGabungan, teksCS: string;
    begin
        BuatGaris('-');
        ListRataKiri('         >>> DAFTAR ANTRIAN TELLER <<<           |       >>> DAFTAR ANTRIAN CUST SERVICE ] <<<');
        writeln('+------+-------+-----------------------------------+-----+--------+----------------------------------+');
        ListRataKiri(' No. | Tiket | Nama Nasabah                      | No. | Tiket  | Nama Nasabah');
        writeln('+------+-------+-----------------------------------+-----+--------+----------------------------------+');

        iT := rposT;
        iCS := rposCS;
        angkaT := 1;
        angkaCS := 1;

        while (iT <> sposT) or (iCS <> sposCS) do
        begin
            if iT <> sposT then
            begin
                str(angkaT, strNo);
                barisKiri := '  ' + strNo + '. | ' + queueTeller[iT].no_antri + '  | ' + queueTeller[iT].nama;
                for k := 1 to (49 - length(barisKiri)) do barisKiri := barisKiri + ' ';
                iT := (iT mod MAX_ANTRIAN) + 1;
                angkaT := angkaT + 1;
            end
            else
                barisKiri := '     |       |                                   ';

            if iCS <> sposCS then
            begin
                str(angkaCS, strNo);
                teksCS := '  ' + strNo + '. | ' + queueCS[iCS].no_antri + '  | ' + queueCS[iCS].nama;
                for k := 1 to (47 - length(teksCS)) do teksCS := teksCS + ' ';
                barisKanan := '|' + teksCS;
                iCS := (iCS mod MAX_ANTRIAN) + 1;
                angkaCS := angkaCS + 1;
            end
            else
                barisKanan := '|     |        |                                 ';

            barisGabungan := barisKiri + barisKanan;
            ListRataKiri(barisGabungan);
        end;

        if (rposT = sposT) and (rposCS = sposCS) then
            ListRataKiri('        (Tidak ada antrian aktif)                |            (Tidak ada antrian aktif)');
            
        writeln('+------+-------+-----------------------------------+-----+--------+----------------------------------+');
    end;

{ --- PROGRAM UTAMA --- }
begin
    clrscr;
    MuatIndexAwal();
    writeln; writeln; writeln;
    TeksAnimasi('STRUKTUR DATA - QUEUE(ANTRIAN)', '-');
    TeksAnimasi('2510010102 - M. Rizky Rinaldy', '-');
    loading('Sinkronisasi Sistem Antrian');
    
    repeat
        clrscr;
        JudulTabel('SISTEM PELAYANAN NASABAH BANK KONOHA');
        writeln;
        PapanInformasiLive; 
        writeln;

        JudulTabel('MENU NASABAH');
        ListRataKiri(' 1. Ambil Antrian Teller');
        ListRataKiri(' 2. Ambil Antrian Customer Service');
        BuatGaris('-');
        writeln('   0. Untuk Keluar');
        writeln;

        JudulTabel('MENU PETUGAS BANK');
        ListRataKiri(' T. Panggil Antrian Teller');
        ListRataKiri(' C. Panggil Antrian Customer Service');
        BuatGaris('-');

        writeln('   0. Untuk Keluar');
        writeln;
        write('     --> Pilih menu: '); pilihan := upcase(readkey); writeln(pilihan);


        case pilihan of
            '#': IsiDataDummy;
            '1': StoreTeller;
            '2': StoreCS;
            'T': RetrieveTeller;
            'C': RetrieveCS;
            '0': JudulTabel('TERIMA KASIH TELAH MENGGUNAKAN LAYANAN BANK KONOHA');
        else
            writeln(' Pilihan tidak valid!');
        end;
        
        if pilihan <> '0' then
            begin
                writeln; write(' Tekan ENTER untuk kembali ke menu...'); readln;
            end;
    until pilihan = '0';
    writeln;
    TeksAnimasi('2510010102 - M. Rizky Rinaldy', '-');
    loading('Menutup Program');
end.