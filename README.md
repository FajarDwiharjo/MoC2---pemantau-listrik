# fajardwiharjo_moc2_pemantau_listrik

## figma design

https://www.figma.com/design/XRdrRbqLjwTJSP3MFXLvIo/MoC2--Fajar---test-design?node-id=0-1&t=OUy9pWWxb6WupKKv-1


## Deskripsi

Panel Monitor adalah aplikasi berbasis Flutter yang dirancang untuk memantau kondisi panel listrik secara real-time. Aplikasi ini menampilkan data konsumsi daya, tegangan, dan arus untuk tiga fasa listrik (R, S, dan T) menggunakan data sensor simulasi.

Proyek ini ditujukan sebagai aplikasi edukasi dan demonstrasi untuk sistem pemantauan kelistrikan.

---

# Fitur

## 1. Halaman Login

### Fungsi
- Menyediakan antarmuka login pengguna yang sederhana.
- Memungkinkan pengguna memasukkan username dan password.
- Berfungsi sebagai titik masuk ke dalam aplikasi.
- Mengarahkan pengguna ke halaman utama setelah login.

### Keterbatasan Saat Ini
- Belum memiliki sistem autentikasi yang sebenarnya.
- Belum terhubung dengan database.
- Belum tersedia fitur registrasi akun.
- Kredensial pengguna belum divalidasi melalui layanan backend.

---

## 2. Halaman Dashboard

### Fungsi
- Menampilkan informasi terbaru mengenai panel listrik.
- Menampilkan total konsumsi daya.
- Menampilkan nilai tegangan dan arus untuk:
  - Fasa R
  - Fasa S
  - Fasa T
- Memperbarui data secara otomatis menggunakan nilai simulasi real-time.
- Menampilkan waktu pembaruan terakhir.
- Menyediakan navigasi menuju halaman detail pemantauan setiap fasa.

### Keterbatasan Saat Ini
- Data yang ditampilkan berasal dari simulasi (dummy data).
- Belum terhubung dengan sensor listrik yang sebenarnya.
- Belum memiliki sistem alarm atau deteksi gangguan.
- Data historis tidak disimpan setelah aplikasi ditutup atau dijalankan ulang.

---

## 3. Halaman Detail Fasa

### Fungsi
- Menampilkan informasi pemantauan secara rinci untuk fasa yang dipilih.
- Menampilkan grafik tren tegangan.
- Menampilkan grafik tren arus.
- Menyimpan riwayat pemantauan terbaru untuk keperluan visualisasi.
- Menghitung dan menampilkan:
  - Tegangan Maksimum
  - Tegangan Minimum
  - Arus Maksimum
  - Arus Minimum
- Menggunakan skala grafik dinamis untuk visualisasi yang lebih baik.

### Keterbatasan Saat Ini
- Data historis hanya tersedia selama sesi aplikasi berlangsung.
- Pilihan rentang waktu (24 Jam dan 7 Hari) saat ini hanya berfungsi sebagai elemen visual.
- Belum tersedia fitur ekspor data atau pembuatan laporan.
- Data masih menggunakan simulasi dan belum berasal dari perangkat keras nyata.

---

## 4. Halaman Analitik

### Fungsi
- Menampilkan analisis grafis untuk:
  - Daya
  - Tegangan
  - Arus
- Mendukung pergantian tampilan berdasarkan metrik pemantauan yang dipilih.
- Menampilkan ringkasan statistik:
  - Nilai maksimum
  - Nilai minimum
  - Nilai rata-rata
- Menampilkan aktivitas pemantauan terbaru.
- Menyediakan visualisasi tren berdasarkan sampel data yang dikumpulkan.

### Keterbatasan Saat Ini
- Statistik hanya dihitung dari data sementara yang tersimpan di memori.
- Riwayat data terbatas pada sampel terbaru.
- Belum tersedia penyimpanan jangka panjang maupun integrasi database.
- Belum memiliki fitur analitik lanjutan atau prediksi.

---

## 5. Halaman Profil

### Fungsi
- Menampilkan informasi aplikasi dan profil pengguna.
- Menyediakan antarmuka informasi pengguna yang sederhana.
- Berfungsi sebagai placeholder untuk fitur manajemen akun di masa mendatang.

### Keterbatasan Saat Ini
- Informasi pengguna bersifat statis.
- Belum tersedia fitur pengeditan profil.
- Belum tersedia pengaturan akun.
- Belum mendukung sinkronisasi cloud.

---

# Teknologi yang Digunakan

- Flutter
- Dart
- Material Design 3
- fl_chart (Visualisasi Data)

---

# Pengembangan di Masa Mendatang

- Integrasi sensor nyata melalui perangkat IoT.
- Penyimpanan data historis menggunakan database.
- Sistem autentikasi pengguna.
- Sistem peringatan dan notifikasi.
- Ekspor data ke format PDF atau Excel.
- Fitur analitik lanjutan dan predictive maintenance.
- Sinkronisasi cloud serta pemantauan jarak jauh.

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
