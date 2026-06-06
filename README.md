# 📚 Repositori Tugas Kuliah

Repositori ini merupakan kumpulan tugas kuliah, latihan praktikum, dan proyek ujian untuk mata kuliah berbasis bahasa pemrograman, **Python**, **Pascal**, dll (seperti Algoritma & Pemrograman dan Struktur Data). Semua kode di dalam repositori ini dibuat untuk memenuhi tugas akademik di program studi Informatika/Sistem Informasi.

---

## 📝 Identitas Mahasiswa
* **Nama** : M. Rizky Rinaldy
* **NPM** : 2510010102
* **Program Studi** : Teknik Informatika
---

## 🗂️ Daftar Tugas

Di bawah ini adalah daftar program Pascal yang telah digabungkan ke dalam repositori ini:

<table>
  <tr>
    <td width="60%">
      <h3>1. 💵 Program Sistem Gaji Bulanan (<code>./ProgramSistemGaji</code>)</h3>
      <ul>
        <li><b>Mata Kuliah:</b> Struktur Data</li>
        <li><b>Konsep:</b> Operasi Aritmatika, Percabangan (<code>if-then-else</code> / <code>case-of</code>), dan tipe data Record untuk data karyawan.</li>
        <li><b>Fitur:</b> * Perhitungan gaji pokok berdasarkan golongan atau jabatan pegawai.
  * Kalkulasi tunjangan otomatis (tunjangan keluarga, anak, atau kehadiran).
  * Pemotongan otomatis (pajak PPh, BPJS, atau asuransi).
  * Cetak slip gaji bulanan total (Take Home Pay) untuk karyawan.</li>
      </ul>
    </td>
    <td width="40%">
      <img src="img/PratinjauProgram/SistemGajiBulanan.png" alt="PratinjauProgram_SistemGajiBulanan">
    </td>
  </tr>
</table>

### 2. 📞 Program Buku Telepon (`./ProgramBukuTelepon`)
* **Mata Kuliah:** Struktur Data
* **Konsep / Struktur:** *Parallel Arrays*, Konstanta, Array Terstruktur.
* **Fitur Utama:** * Penyimpanan hingga 10 kontak (`BATAS_INPUT`).
  * Tambah data kontak baru (*Append Contact*).
  * Pencarian nomor telepon berdasarkan nama menggunakan **Sequential Search**.
  * Menampilkan seluruh daftar kontak (*View List*).

### 3. 🏙️ Program Data Kota (`./ProgramDataKota`)
* **Mata Kuliah:** Struktur Data / Algoritma
* **Konsep / Struktur:** Array 1-Dimensi / Record.
* **Fitur Utama:** Manajemen data informasi kota, penambahan data, dan penampilan list informasi geografis/administrasi kota.

### 4. 🔢 Program Pengurutan Array (`./ProgramPengurutanArray`)
* **Mata Kuliah:** Struktur Data
* **Konsep / Struktur:** Sorting (Bubble Sort / Selection Sort / Insertion Sort).
* **Fitur Utama:** Mengurutkan sekumpulan data angka di dalam array baik secara urut naik (*ascending*) maupun urut turun (*descending*).

### 5. 🎓 Program Sistem Informasi Akademik (`./SistemInformasiAkademik`)
* **Mata Kuliah:** Struktur Data
* **Konsep / Struktur:** Array of Struct, Prosedur Modular, Sequential Search, dan Format Tabel (Fixed-Width Padding).
* **Fitur Utama:** 
  * Manajemen Data Mahasiswa: Menambah data mahasiswa baru dengan validasi input yang aman.
  * Manajemen KRS: Input mata kuliah yang diambil mahasiswa secara sistematis dengan pengecekan kode MK.
  * Kartu Hasil Studi (KHS): Menampilkan laporan hasil studi lengkap dengan perhitungan SKS, nilai huruf (A-E), bobot, dan Indeks Prestasi Kumulatif (IPK) secara otomatis.

### 6. ON GOING
---

## 💻 Prasyarat & Lingkungan Pengembangan

Untuk mengompilasi dan menjalankan program-program di atas, Anda memerlukan compiler Pascal:
* **Free Pascal Compiler (FPC)** versi terbaru.
* Rekomendasi IDE/Text Editor: **VS Code** (dengan ekstensi Pascal), **Lazarus**, atau **Dev-Pascal**.

---

## 🚀 Cara Menjalankan Program

Pilih salah satu file tugas yang ingin dijalankan, kemudian ikuti langkah-langkah berikut melalui Terminal atau Command Prompt:

#. **Akses File Hasil Download Lewat Terminal:**
   ```bash
    cd C:\Users\rizky\Downloads\
   ```
   Note : rizky --> ganti ke nama user sesuai profile di komputer Anda
   
1. **Kompilasi kode sumber menggunakan FPC:**
   ```bash
   Fpc namafile.pas
   ```
2. **Jalankan file executable hasil kompilasi:**
   ```bash
   ./namafile
   ```

![Visual Intruksi Menjalankan Program](img/PratinjauProgram/InstruksiMenjalankanProgram.png)
