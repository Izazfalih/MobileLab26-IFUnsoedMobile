// ignore_for_file: avoid_print
// Modul 1 Pemrograman Mobile - Bahasa Pemrograman Dart
// Berisi implementasi materi dasar Dart dari modul 1:
// 1. Hello World
// 2. Tipe Data pada Dart
// 3. Operasi Matematika dan Logika
// 4. Struktur Kontrol (if-else, for, while)
// 5. Fungsi
// 6. Kelas dan Objek
// 7. Import pustaka
// 8. Penanganan Eksepsi (try, on, catch)
// 9. Asinkronus (async & await)

import 'dart:math';

// ==========================================
// 5. Fungsi
// ==========================================
int tambah(int a, int b) {
  return a + b;
}

// ==========================================
// 6. Kelas dan Objek
// ==========================================
class Mahasiswa {
  String nama;
  int usia;

  Mahasiswa(this.nama, this.usia);

  void perkenalan() {
    print("Halo, saya $nama dan saya berusia $usia tahun.");
  }
}

// ==========================================
// 9. Async dan Await
// ==========================================
Future<void> prosesData() async {
  await Future.delayed(const Duration(seconds: 1));
  print("Data diproses.");
}

void main() async {
  print("==================================================");
  print("MODUL 1: PRAKTIK BAHASA PEMROGRAMAN DART");
  print("==================================================");

  // 1. Program Hello World
  print("\n--- 1. Hello World ---");
  print('hello world');

  // 2. Tipe data pada Dart
  print("\n--- 2. Tipe Data ---");
  int angka = 10;
  double desimal = 3.14;
  String teks = "Halo, dunia!";
  bool benar = true;
  var otomatis = "Tipe otomatis ditentukan oleh Dart";

  print("int: $angka");
  print("double: $desimal");
  print("String: $teks");
  print("bool: $benar");
  print("var: $otomatis");

  // 3. Operasi Matematika dan Logika
  print("\n--- 3. Operasi Matematika dan Logika ---");
  int hasilTambah = 5 + 3;
  double hasilBagi = 10 / 2;
  bool hasilPerbandingan = 5 > 3;

  print("5 + 3 = $hasilTambah");
  print("10 / 2 = $hasilBagi");
  print("5 > 3 = $hasilPerbandingan");

  // 4. Struktur Kontrol
  print("\n--- 4. Struktur Kontrol (Percabangan & Perulangan) ---");
  int angkaKontrol = 4;
  if (angkaKontrol > 5) {
    print("Angka lebih besar dari 5");
  } else {
    print("Angka tidak lebih besar dari 5");
  }

  print("Perulangan for:");
  for (int i = 0; i < 5; i++) {
    print("Iterasi ke-$i");
  }

  print("Perulangan while:");
  while (angkaKontrol > 0) {
    print("Nilai angka: $angkaKontrol");
    angkaKontrol--;
  }

  // 5. Pemanggilan Fungsi
  print("\n--- 5. Fungsi ---");
  int hasil = tambah(3, 7);
  print("Hasil penjumlahan: $hasil");

  // 6. Kelas dan Objek
  print("\n--- 6. Kelas dan Objek ---");
  Mahasiswa mhs = Mahasiswa("Alice", 22);
  mhs.perkenalan();

  // 7. Import (dart:math)
  print("\n--- 7. Penggunaan Import (dart:math) ---");
  int acak = Random().nextInt(10);
  print("Angka acak: $acak");

  // 8. Eksepsi
  print("\n--- 8. Penanganan Eksepsi (Try-Catch) ---");
  try {
    // Pembagian dengan integer division by zero
    int a = 5 ~/ 0;
    print(a);
  } on UnsupportedError {
    print('Operasi tidak didukung');
  }

  try {
    int a = 5 ~/ 0;
    print(a);
  } catch (e) {
    print("Tertangkap exception: $e");
  }

  // 9. Async dan Await
  print("\n--- 9. Fitur Asinkronus (Async & Await) ---");
  print("Memulai pemrosesan...");
  await prosesData();
  print("Pemrosesan selesai.");

  print("\n==================================================");
  print("SEMUA PRAKTIK MODUL 1 SELESAI DIJALANKAN DENGAN SUKSES");
  print("==================================================");
}
