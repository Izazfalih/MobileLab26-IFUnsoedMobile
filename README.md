# Praktikum Pemrograman Mobile - Flutter & Dart

Repository ini berisi implementasi tugas dan materi Praktikum Pemrograman Mobile menggunakan **Framework Flutter** dan bahasa pemrograman **Dart** pada branch `flutter`.

---

## 📋 Daftar Isi
1. [Ringkasan Materi Praktikum](#-ringkasan-materi-praktikum)
   - [Modul 1: Bahasa Pemrograman Dart](#modul-1-bahasa-pemrograman-dart)
   - [Modul 2: Pengenalan & Desain Framework Flutter (Widget & Layout)](#modul-2-pengenalan--desain-framework-flutter-widget--layout)
   - [Modul 3: Routes, Side Menu, Login & Local Storage](#modul-3-routes-side-menu-login--local-storage)
   - [Modul 4: Operasi CRUD dengan API CodeIgniter 4 & Flutter](#modul-4-operasi-crud-dengan-api-codeigniter-4--flutter)
2. [Alur Navigasi & Integrasi Aplikasi](#-alur-navigasi--integrasi-aplikasi)
3. [Struktur Direktori Proyek](#-struktur-direktori-proyek)
4. [Persyaratan & Instalasi](#-persyaratan--instalasi)
5. [Cara Menjalankan](#-cara-menjalankan)

---

## 📚 Ringkasan Materi Praktikum

### Modul 1: Bahasa Pemrograman Dart

Modul 1 berfokus pada penguasaan dasar bahasa Dart sebagai fondasi pengembangan aplikasi menggunakan framework Flutter.

#### Pokok Bahasan:
1. **Hello World**: Struktur fungsi utama `void main()` dan perintah output `print()`.
2. **Tipe Data Fundamental**:
   - `int`: Bilangan bulat tanpa komponen desimal.
   - `double`: Bilangan desimal/pecahan.
   - `String`: Deretan karakter / teks literal.
   - `bool`: Nilai logika kebenaran (`true` / `false`).
   - `var`: Inferensi tipe data otomatis pada saat inisialisasi awal.
3. **Operasi Matematika dan Logika**: Penggunaan operator aritmatika (`+`, `/`, `~/`) dan perbandingan (`>`).
4. **Struktur Kontrol**:
   - Percabangan: `if` - `else`.
   - Perulangan: `for` loop dan `while` loop.
5. **Fungsi (Functions)**: Deklarasi fungsi dengan parameter, tipe kembalian, dan modularisasi kode.
6. **Pemrograman Berorientasi Objek (OOP)**:
   - Definisi `class` dengan atribut dan konstruktor ringkas Dart (`this.nama`).
   - Pembuatan instance objek dan pemanggilan method.
7. **Import Pustaka**: Penggunaan modul bawaan Dart (`dart:math`) untuk fitur seperti bilangan acak (`Random`).
8. **Penanganan Eksepsi (Exception Handling)**:
   - Blok `try` - `catch` untuk menangani kesalahan runtime.
   - Penanganan selektif dengan kata kunci `on UnsupportedError`.
9. **Asinkronus (`async` & `await`)**:
   - Konsep penanganan operasi I/O dan delay tanpa memblokir thread eksekusi utama melalui `Future` dan `Future.delayed`.

> File eksekusi mandiri untuk materi Modul 1 tersedia pada: [`bin/modul1_dart.dart`](bin/modul1_dart.dart) yang dapat dijalankan langsung dengan perintah `dart run bin/modul1_dart.dart`.

---

### Modul 2: Pengenalan & Desain Framework Flutter (Widget & Layout)

Modul 2 membahas pengenalan arsitektur Flutter, struktur proyek, serta implementasi widget dasar dan interaktif.

#### Pokok Bahasan & Komponen:
1. **StatelessWidget vs StatefulWidget**:
   - `StatelessWidget`: Widget statis yang konfigurasinya tidak berubah setelah diinisialisasi (contoh: teks label, layout statis).
   - `StatefulWidget`: Widget dinamis yang dapat menyimpan dan merespon perubahan data internal (*state*) melalui fungsi `setState()`.
2. **Widget Dasar & Layout**:
   - [`lib/hello_world.dart`](lib/hello_world.dart): Menampilkan teks *"Hello World"* di tengah layar menggunakan kombinasi `Scaffold`, `AppBar`, `Center`, dan `Text`.
   - [`lib/column_widget.dart`](lib/column_widget.dart): Penataan elemen UI secara vertikal menggunakan widget `Column` (Kolom 1 s.d. Kolom 4).
   - [`lib/row_widget.dart`](lib/row_widget.dart): Penataan elemen UI secara horizontal menggunakan widget `Row` (Row 1 s.d. Row 4).
3. **Formulir & Navigasi Antar Halaman**:
   - [`lib/ui/produk_form.dart`](lib/ui/produk_form.dart): Formulir input data produk menggunakan `TextField` dan `TextEditingController` untuk Kode Produk, Nama Produk, dan Harga.
   - [`lib/ui/produk_detail.dart`](lib/ui/produk_detail.dart): Halaman detail penerima parameter hasil masukan form menggunakan `MaterialPageRoute`.
4. **ListView & Card UI**:
   - [`lib/ui/produk_page.dart`](lib/ui/produk_page.dart): Menampilkan daftar koleksi item produk (Kulkas, Playstation, Radio) dalam layout scrollable `ListView` yang dibungkus dengan kartu elegan `Card` dan `ListTile`.

---

### Modul 3: Routes, Side Menu, Login & Local Storage

Modul 3 membahas mekanisme autentikasi sederhana, penyimpanan preferensi lokal (*local storage*), serta navigasi menu laci (*Drawer side menu*).

#### Pokok Bahasan & Komponen:
1. **Penyimpanan Lokal (Local Storage)**:
   - Memanfaatkan library `shared_preferences` untuk menyimpan preferensi sesi pengguna (username) secara persisten di penyimpanan perangkat.
2. **Halaman Login ([`lib/login_page.dart`](lib/login_page.dart))**:
   - Input username dan password dengan fitur proteksi `obscureText: true` pada password.
   - Validasi kredensial: username `admin` dan password `admin`.
   - Penyimpanan username ke local storage via `_saveUsername()`.
   - Dialog umpan balik (`AlertDialog`) ketika login berhasil maupun gagal.
3. **Halaman Utama ([`lib/home_page.dart`](lib/home_page.dart))**:
   - Membaca username dari local storage via `_loadUsername()` dan menampilkannya secara dinamis (*"Ini adalah halaman User admin"*).
   - Terintegrasi dengan laci navigasi samping (*side menu*).
4. **Side Menu Drawer ([`lib/sidemenu.dart`](lib/sidemenu.dart))**:
   - Komponen `Drawer` yang berisi `DrawerHeader` dan daftar navigasi `ListTile`.
   - Rute ke **Home** (`HomePage`), **About** (`AboutPage`), menu fitur **Modul 2** (Data Produk, Form Tambah Produk, Column, Row, Hello World), serta aksi **Logout** yang membersihkan sesi pengguna di local storage.
5. **Halaman Informasi ([`lib/about_page.dart`](lib/about_page.dart))**:
   - Halaman sekunder yang menampilkan informasi tentang aplikasi dengan drawer navigasi terpadu.

---

### Modul 4: Operasi CRUD dengan API CodeIgniter 4 & Flutter

Modul 4 mengintegrasikan aplikasi mobile Flutter dengan backend RESTful API berbasis CodeIgniter 4 dan database MySQL (Docker).

#### Pokok Bahasan:
1. **Model Data Flutter (`lib/model/`)**:
   - `login.dart`: Serialisasi dan deserialisasi data respon login (`token`, `userID`, `userEmail`).
   - `registrasi.dart`: Model respon pendaftaran akun (`code`, `status`, `data`).
   - `produk.dart`: Model entitas produk (`id`, `kode_produk`, `nama_produk`, `harga`).
2. **Halaman Autentikasi (`lib/ui/`)**:
   - `login_page.dart`: Antarmuka login dengan navigasi ke registrasi dan redirect ke katalog produk.
   - `registrasi_page.dart`: Form pendaftaran dengan validasi input (nama, email regex, panjang password, konfirmasi password).
3. **Halaman CRUD Produk (`lib/ui/`)**:
   - `produk_page.dart`: Tampilan daftar produk interaktif (`ItemProduk`) dengan menu Drawer logout dan aksi tambah produk (+).
   - `produk_form.dart`: Formulir dinamis mode ganda (Tambah Produk atau Ubah Produk).
   - `produk_detail.dart`: Rincian spesifikasi produk dengan aksi **EDIT** dan konfirmasi **DELETE** via `AlertDialog`.
4. **Backend REST API (CodeIgniter 4 - `toko-api`)**:
   - Base API Resource: `RestfulController` dengan format standar JSON `{code, status, data}`.
   - Endpoint Auth: `POST /registrasi` (enkripsi password hash) dan `POST /login` (verifikasi password & random auth token).
   - Endpoint CRUD: `POST /produk`, `GET /produk`, `GET /produk/{id}`, `PUT /produk/{id}`, `DELETE /produk/{id}`.
   - Database MySQL (`toko_api` di Docker port `3306`) dengan tabel `member`, `member_token`, dan `produk`.

---

## 🧭 Alur Navigasi & Integrasi Aplikasi

```
                   +------------------------+
                   |       main.dart        |
                   +-----------+------------+
                               |
                               v
                     +--------------------+
                     |     LoginPage      |
                     +---------+----------+
                               |
             +-----------------+-----------------+
             | (Gagal)                           | (Sukses: admin/admin)
             v                                   v
   +--------------------+               +--------------------+
   |   Dialog Gagal     |               |  Dialog Berhasil   |
   +--------------------+               +---------+----------+
                                                  |
                                                  v
                                        +--------------------+
                                        |      HomePage      |
                                        +---------+----------+
                                                  |
                                       Buka SideMenu (Drawer)
                                                  |
       +--------------------+---------------------+--------------------+--------------------+
       |                    |                     |                    |                    |
       v                    v                     v                    v                    v
+--------------+   +-----------------+   +-----------------+   +---------------+   +----------------+
|  AboutPage   |   |   ProdukPage    |   |   ProdukForm    |   | Widget Demos  |   |     Logout     |
+--------------+   |   (ListView)    |   | (Input Produk)  |   | (Column, Row, |   | (Hapus Session |
                   +--------+--------+   +--------+--------+   |  Hello World) |   |  -> LoginPage) |
                            |                     |            +---------------+   +----------------+
                            +----[Tambah Data]----+
                                      |
                                      v
                             +-----------------+
                             |  ProdukDetail   |
                             +-----------------+
```

---

## 📁 Struktur Direktori Proyek

```
.
├── analysis_options.yaml       # Konfigurasi linter Dart & Flutter
├── pubspec.yaml                # Manajemen dependensi (shared_preferences, cupertino_icons)
├── bin/
│   └── modul1_dart.dart        # Script runnable seluruh materi Modul 1 (Dart)
├── lib/
│   ├── main.dart               # Entry point aplikasi Flutter (menuju LoginPage)
│   ├── login_page.dart         # Autentikasi, form login, & SharedPreferences (Modul 3)
│   ├── home_page.dart          # Halaman beranda dengan username dinamis & drawer (Modul 3)
│   ├── sidemenu.dart           # Drawer navigasi terintegrasi (Modul 3)
│   ├── about_page.dart         # Halaman About (Modul 3)
│   ├── hello_world.dart        # Widget dasar Hello World (Modul 2)
│   ├── column_widget.dart      # Widget Column (Modul 2)
│   ├── row_widget.dart         # Widget Row (Modul 2)
│   ├── model/
│   │   ├── login.dart          # Model autentikasi login (Modul 4)
│   │   ├── registrasi.dart     # Model respon registrasi (Modul 4)
│   │   └── produk.dart         # Model entitas produk (Modul 4)
│   └── ui/
│       ├── login_page.dart     # Halaman login Tokokita (Modul 4)
│       ├── registrasi_page.dart# Halaman registrasi Tokokita (Modul 4)
│       ├── produk_form.dart    # Form Tambah / Ubah produk (Modul 4)
│       ├── produk_detail.dart  # Rincian produk & aksi Edit / Hapus (Modul 4)
│       └── produk_page.dart    # ListView kartu produk (Modul 4)
└── test/
    └── widget_test.dart        # Pengujian otomatis widget aplikasi
```

---

## ⚙️ Persyaratan & Instalasi

Pastikan komputer telah terpasang:
- **Flutter SDK**: `>= 3.13.0`
- **Dart SDK**: `>= 3.0.0`
- Teks editor / IDE: **Visual Studio Code** atau **Android Studio** dengan plugin Flutter & Dart

### Langkah Instalasi
1. Clone repository dan checkout ke branch `flutter`:
   ```bash
   git clone -b flutter https://github.com/Izazfalih/MobileLab26-IFUnsoedMobile.git
   cd MobileLab26-IFUnsoedMobile
   ```

2. Unduh paket dependensi:
   ```bash
   flutter pub get
   ```

---

## 🚀 Cara Menjalankan

### 1. Menjalankan Kode Modul 1 (Dart Console)
Untuk mengeksekusi materi dasar bahasa Dart:
```bash
dart run bin/modul1_dart.dart
```

### 2. Menjalankan Aplikasi Flutter (Modul 2 & 3)
Jalankan aplikasi pada emulator atau perangkat fisik:
```bash
flutter run
```
*Gunakan akun login bawaan:*
- **Username**: `admin`
- **Password**: `admin`

### 3. Menjalankan Unit & Widget Test
Pastikan seluruh komponen berfungsi normal dengan suite test:
```bash
flutter test
```
