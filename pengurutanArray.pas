program pengurutanAngka;
uses crt, sysutils, windows;
const
    JUMLAH_DATA = 8;
    BUBBLE = 0;
    SELECTION = 1;
    INSERTION = 2;
var
    data_acak : array[1..JUMLAH_DATA] of integer = (8, 4, 1, 6, 20, 9, 14, 17);
    data_urut : array[1..JUMLAH_DATA] of integer;
procedure ResetData;
begin
    data_acak[1] := 8;
    data_acak[2] := 4;
    data_acak[3] := 1;
    data_acak[4] := 6;
    data_acak[5] := 20;
    data_acak[6] := 9;
    data_acak[7] := 14;
    data_acak[8] := 17;
end;
procedure MuatData;
var i: integer;
begin
    for i := 1 to JUMLAH_DATA do
        data_urut[i] := data_acak[i];
end;
procedure TampilkanData();
var i: integer;
begin
    for i := 1 to JUMLAH_DATA do
        write(data_urut[i], ' ');
    writeln;
end;
procedure BubbleSort();
var i, j, temp: integer;
begin
    for i := 1 to JUMLAH_DATA - 1 do
    begin
        for j := 1 to JUMLAH_DATA - i do
        begin
            if data_urut[j] > data_urut[j + 1] then
            begin
                temp := data_urut[j];
                data_urut[j] := data_urut[j + 1];
                data_urut[j + 1] := temp;
            end;
        end;;
    end;
end;
procedure SelectionSort();
var i, j, minIdx, temp: integer;
begin
    for i := 1 to JUMLAH_DATA - 1 do
    begin
        minIdx := i;
        for j := i + 1 to JUMLAH_DATA do
        begin
            if data_urut[j] < data_urut[minIdx] then
                minIdx := j;
        end;
        if minIdx <> i then
        begin
            temp := data_urut[i];
            data_urut[i] := data_urut[minIdx];
            data_urut[minIdx] := temp;
        end;
    end;
end;
procedure InsertionSort();
var i, j, key: integer;
begin
    for i := 1 to JUMLAH_DATA do
    begin
        key := data_urut[i];
        j := i - 1;
        while (j > 0) and (data_urut[j] > key) do
        begin
            data_urut[j + 1] := data_urut[j];
            dec(j);
        end;
        data_urut[j + 1] := key;
    end;
end;
procedure urutkanData(metode: integer);
var
    waktu_awal, waktu_akhir, selisih_waktu: Int64;
    microdetik: double;
begin
    QueryPerformanceFrequency(selisih_waktu);

    QueryPerformanceCounter(waktu_awal);
    case metode of
        BUBBLE: BubbleSort();
        SELECTION: SelectionSort();
        INSERTION: InsertionSort();
    else
        InsertionSort();
    end;

    QueryPerformanceCounter(waktu_akhir);
    microdetik := (waktu_akhir - waktu_awal) / selisih_waktu * 1000000;
    writeln('data terurut:');
    TampilkanData();
    writeln('waktu: ', microdetik:0:2, ' mikrodetik');
    writeln('---------------------------------------');
    writeln;
end;

begin
    clrscr;
    ResetData();

    MuatData();
    writeln('Perbandingan Metode Pengurutan');
    writeln('Data Acak:');
    TampilkanData();
    writeln('---------------------------------------');
    writeln;
    

    writeln('--------------Bubble Sort--------------');
    muatData();
    urutkanData(BUBBLE);

    writeln('------------Selection Sort-------------');
    muatData();
    urutkanData(SELECTION);

    writeln('------------Insertion Sort-------------');
    muatData();
    urutkanData(INSERTION);

    writeln('Tekan Enter untuk keluar...');
    readln;
end.