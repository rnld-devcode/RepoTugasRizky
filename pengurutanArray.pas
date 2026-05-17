program pengurutanArray;
uses crt;

const
  n = 8;

type
  IntArray = array[1..n] of integer;

var
  A: IntArray;
  pilihan: integer;

procedure ResetData(var arr: IntArray);
const
  Original: array[1..n] of integer = (8, 4, 1, 6, 20, 9, 14, 17);
begin
  arr := Original;
end;

procedure TampilkanData(arr: IntArray);
var i: integer;
begin
  for i := 1 to n do
    write(arr[i], ' ');
  writeln;
end;

procedure BubbleSort(var arr: IntArray);
var i, j, temp: integer;
begin
  for i := 1 to n-1 do
    for j := n downto i+1 do
      if arr[j] < arr[j-1] then
      begin
        temp := arr[j];
        arr[j] := arr[j-1];
        arr[j-1] := temp;
      end;
end;

procedure SelectionSort(var arr: IntArray);
var i, j, minIdx, temp: integer;
begin
  for i := 1 to n-1 do
  begin
    minIdx := i;
    for j := i+1 to n do
      if arr[j] < arr[minIdx] then minIdx := j;
    temp := arr[minIdx];
    arr[minIdx] := arr[i];
    arr[i] := temp;
  end;
end;

procedure InsertionSort(var arr: IntArray);
var i, j, key: integer;
begin
  for i := 2 to n do
  begin
    key := arr[i];
    j := i - 1;
    while (j >= 1) and (arr[j] > key) do
    begin
      arr[j+1] := arr[j];
      j := j - 1;
    end;
    arr[j+1] := key;
  end;
end;

procedure InsertionSortRecursive(var arr: IntArray; k: integer);
var key, j: integer;
begin
  if k <= 1 then exit;
  InsertionSortRecursive(arr, k - 1);
  key := arr[k];
  j := k - 1;
  while (j >= 1) and (arr[j] > key) do
  begin
    arr[j+1] := arr[j];
    j := j - 1;
  end;
  arr[j+1] := key;
end;

begin
  repeat
    clrscr;
    ResetData(A);
    writeln('=== MENU PENGURUTAN DATA ===');
    writeln('Data Awal: 8, 4, 1, 6, 20, 9, 14, 17');
    writeln('1. Bubble Sort (Iteratif)');
    writeln('2. Selection Sort (Iteratif)');
    writeln('3. Insertion Sort (Iteratif)');
    writeln('4. Insertion Sort (Rekursif)');
    writeln('0. Keluar');
    write('Pilih menu (0-4): '); readln(pilihan);

    if (pilihan >= 1) and (pilihan <= 4) then
    begin
      writeln('---');
      case pilihan of
        1: begin writeln('Memproses Bubble Sort...'); BubbleSort(A); end;
        2: begin writeln('Memproses Selection Sort...'); SelectionSort(A); end;
        3: begin writeln('Memproses Insertion Sort...'); InsertionSort(A); end;
        4: begin writeln('Memproses Insertion Sort Rekursif...'); InsertionSortRecursive(A, n); end;
      end;
      write('Hasil Akhir: ');
      TampilkanData(A);
      writeln('---');
      write('Tekan Enter untuk kembali ke menu...');
      readln;
    end;
    
  until pilihan = 0;
end.