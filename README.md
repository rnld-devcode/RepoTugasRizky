# 📚 Repositori Tugas Kuliah

Repositori ini merupakan kumpulan tugas kuliah, latihan praktikum, dan proyek ujian untuk mata kuliah berbasis bahasa pemrograman, **Python**, **Pascal**, dll (seperti Algoritma & Pemrograman dan Struktur Data). Semua kode di dalam repositori ini dibuat untuk memenuhi tugas akademik di program studi Informatika/Sistem Informasi.

---

## 📝 Identitas Mahasiswa
* **Nama** : M. Rizky Rinaldy
* **NPM** : 2510010102
* **Program Studi** : Teknik Informatika
---

## 🗂️ Daftar Proyek & Tugas

Di bawah ini adalah daftar program Pascal yang telah digabungkan ke dalam repositori ini:

### 1. 💵 Program Sistem Gaji Bulanan (`/ProgramSistemGaji`)
* **Mata Kuliah:** Algoritma & Pemrograman / Struktur Data
* **Konsep / Struktur Data:** Operasi Aritmatika, Percabangan (`if-then-else` / `case-of`), dan tipe data `Record` untuk data karyawan.
* **Fitur Utama:** * Perhitungan gaji pokok berdasarkan golongan atau jabatan pegawai.
  * Kalkulasi tunjangan otomatis (tunjangan keluarga, anak, atau kehadiran).
  * Pemotongan otomatis (pajak PPh, BPJS, atau asuransi).
  * Cetak slip gaji bulanan total (*Take Home Pay*) untuk karyawan.

### 2. 📞 Program Buku Telepon (`/ProgramBukuTelepon`)
* **Mata Kuliah:** Struktur Data
* **Konsep / Struktur Data:** *Parallel Arrays*, Konstanta, Array Terstruktur.
* **Fitur Utama:** * Penyimpanan hingga 10 kontak (`BATAS_INPUT`).
  * Tambah data kontak baru (*Append Contact*).
  * Pencarian nomor telepon berdasarkan nama menggunakan **Sequential Search**.
  * Menampilkan seluruh daftar kontak (*View List*).

### 3. 🏙️ Program Data Kota (`/ProgramDataKota`)
* **Mata Kuliah:** Struktur Data / Algoritma
* **Konsep / Struktur Data:** Array 1-Dimensi / Record.
* **Fitur Utama:** Manajemen data informasi kota, penambahan data, dan penampilan list informasi geografis/administrasi kota.

### 4. 🔢 Program Pengurutan Array (`/ProgramPengurutanArray`)
* **Mata Kuliah:** Struktur Data
* **Konsep / Algoritma:** Sorting (Bubble Sort / Selection Sort / Insertion Sort).
* **Fitur Utama:** Mengurutkan sekumpulan data angka di dalam array baik secara urut naik (*ascending*) maupun urut turun (*descending*).

### 5. OnGoing

---

## 💻 Prasyarat & Lingkungan Pengembangan

Untuk mengompilasi dan menjalankan program-program di atas, Anda memerlukan compiler Pascal:
* **Free Pascal Compiler (FPC)** versi terbaru.
* Rekomendasi IDE/Text Editor: **VS Code** (dengan ekstensi Pascal), **Lazarus**, atau **Dev-Pascal**.

---

## 🚀 Cara Menjalankan Program

Pilih salah satu file tugas yang ingin dijalankan, kemudian ikuti langkah-langkah berikut melalui Terminal atau Command Prompt:

1. **Kompilasi kode sumber menggunakan FPC:**
   ```bash
   Fpc namafile.pas

2. **Jalankan file executable hasil kompilasi:**
   ```bash
   ./namafile
