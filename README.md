# Praktikum Pemrograman Mobile - Flutter & CodeIgniter 4 REST API

Repository ini berisi implementasi tugas dan materi Praktikum Pemrograman Mobile pada branch `flutter`. Seluruh materi telah ditata rapi dengan struktur **1 Modul 1 Folder Project Mandiri** untuk memudahkan eksekusi dan peninjauan kode.

---

## 📋 Daftar Isi
1. [Struktur Repositori](#-struktur-repositori)
2. [Ringkasan Tiap Modul](#-ringkasan-tiap-modul)
   - [Modul 1: Bahasa Pemrograman Dart (`modul_1_dart`)](#modul-1-bahasa-pemrograman-dart-modul_1_dart)
   - [Modul 2: Widget & Desain Flutter (`modul_2`)](#modul-2-widget--desain-flutter-modul_2)
   - [Modul 3: Routes, Login & Local Storage (`modul_3`)](#modul-3-routes-login--local-storage-modul_3)
   - [Modul 4: Model Data & UI Tokokita (`modul_4`)](#modul-4-model-data--ui-tokokita-modul_4)
   - [Modul 5: REST API Integration & BLoC (`modul_5`)](#modul-5-rest-api-integration--bloc-modul_5)
   - [Backend REST API CodeIgniter 4 (`backend_toko_api`)](#backend-rest-api-codeigniter-4-backend_toko_api)
3. [Panduan Menjalankan Proyek](#-panduan-menjalankan-proyek)

---

## 📁 Struktur Repositori

```text
.
├── backend_toko_api/        # Backend REST API CodeIgniter 4 & MySQL (toko_api)
├── modul_1_dart/            # Modul 1: Dasar Dart Console Application
├── modul_2/                 # Modul 2: Flutter Widget Dasar & Desain Layout
├── modul_3/                 # Modul 3: Navigasi Rute, Login, & SharedPreferences
├── modul_4/                 # Modul 4: Tokokita CRUD Bagian 1 (Model & Layout UI)
├── modul_5/                 # Modul 5: Tokokita CRUD Bagian 2 (Koneksi REST API & BLoC)
├── .gitignore
└── README.md
```

---

## 📚 Ringkasan Tiap Modul

### Modul 1: Bahasa Pemrograman Dart (`modul_1_dart`)
Mempelajari dasar sintaksis dan paradigma pemrograman Dart:
* **Fitur:** Hello World, Tipe Data (`int`, `double`, `String`, `bool`, `var`), Operator Matematika & Logika, Percabangan `if-else`, Perulangan `for` & `while`, Fungsi Modular, OOP (`class` & objek), Pustaka bawaan (`dart:math`), Exception Handling (`try`, `on`, `catch`), dan Operasi Asinkronus (`async`, `await`, `Future`).
* **Jalankan:** `cd modul_1_dart && dart run bin/main.dart`

### Modul 2: Widget & Desain Flutter (`modul_2`)
Membangun tampilan antarmuka (UI) dasar pada framework Flutter:
* **Fitur:**
  * `HelloWorld`: Widget teks sederhana berbasis `StatelessWidget`.
  * `ColumnWidget` & `RowWidget`: Pengorganisasian layout vertikal dan horizontal.
  * `ProdukForm`: Formulir input produk (Kode, Nama, Harga).
  * `ProdukDetail`: Menampilkan data hasil passing route dari `ProdukForm`.
  * `ProdukPage`: Daftar produk statis menggunakan `ListView` dan `Card`.
  * `Modul2Dashboard`: Dashboard menu untuk mengakses semua komponen di atas.
* **Jalankan:** `cd modul_2 && flutter run`

### Modul 3: Routes, Login & Local Storage (`modul_3`)
Manajemen rute multi-halaman, autentikasi sesi lokal, dan navigasi drawer:
* **Fitur:**
  * `LoginPage`: Form login dengan validasi kredensial pengguna.
  * Local Storage (`SharedPreferences`): Menyimpan username sesi aktif saat login dan menghapusnya saat logout.
  * `HomePage`: Menampilkan ucapan selamat datang dinamis berdasarkan username yang tersimpan di storage.
  * `SideMenu (Drawer)`: Laci navigasi samping terintegrasi menuju Home, About, fitur Modul 2, dan aksi Logout.
  * `AboutPage`: Halaman sekunder tentang aplikasi.
* **Jalankan:** `cd modul_3 && flutter run`

### Modul 4: Model Data & UI Tokokita (`modul_4`)
Fondasi aplikasi e-commerce "Tokokita" bagian pertama:
* **Fitur:**
  * Pembuatan Model Deserialisasi JSON: `Login`, `Registrasi`, `Produk`.
  * Halaman `LoginPage` dan `RegistrasiPage` dengan validasi form (panjang karakter, format regex email, konfirmasi password).
  * Halaman `ProdukPage` (ListView produk), `ProdukForm` (mode ganda Tambah/Ubah), dan `ProdukDetail` (rincian produk & dialog konfirmasi hapus).
* **Jalankan:** `cd modul_4 && flutter run`

### Modul 5: REST API Integration & BLoC (`modul_5`)
Menghubungkan frontend Tokokita dengan backend RESTful API secara nyata:
* **Fitur:**
  * **Helpers:**
    * `user_info.dart`: Mengelola token JWT/auth key dan user ID menggunakan `SharedPreferences`.
    * `api.dart`: Client HTTP otomatis menyertakan header `Authorization: Bearer <token>` dan method GET, POST, DELETE.
    * `api_url.dart`: Pemetaan endpoint dinamis (`10.0.2.2:8081` untuk Android emulator dan `localhost:8081` untuk desktop/iOS).
    * `app_exception.dart`: Penanganan exception status kode HTTP (400, 401, 403, 422, 500).
  * **BLoC Controllers:**
    * `RegistrasiBloc`: Registrasi akun baru ke database API.
    * `LoginBloc`: Autentikasi akun dan penerimaan token.
    * `LogoutBloc`: Pembersihan sesi dan token.
    * `ProdukBloc`: Operasi CRUD live (`getProduks`, `addProduk`, `updateProduk`, `deleteProduk`).
  * **Common Widgets:** `SuccessDialog` dan `WarningDialog` kustom.
  * **UI Interaktif:**
    * Cek sesi token otomatis pada `main.dart`.
    * `ProdukPage` memuat data live dari server menggunakan `FutureBuilder`.
    * Form produk mengirim request simpan/ubah live ke server.
    * Detail produk menghapus data langsung dari database backend.
* **Jalankan:** `cd modul_5 && flutter run`

### Backend REST API CodeIgniter 4 (`backend_toko_api`)
Backend penyedia layanan REST API dengan database MySQL:
* **Database:** `toko_api` (Tabel: `member`, `member_token`, `produk`).
* **Endpoint:**
  * `POST /registrasi` : Pendaftaran user baru dengan enkripsi password.
  * `POST /login` : Autentikasi dan pembuatan token 100 karakter.
  * `GET /produk` : Mengambil seluruh daftar produk.
  * `GET /produk/{id}` : Mengambil satu produk berdasarkan ID.
  * `POST /produk` : Menambah produk baru.
  * `PUT /produk/{id}` atau `POST /produk/{id}/update` : Memperbarui data produk.
  * `DELETE /produk/{id}` : Menghapus produk.

---

## 🚀 Panduan Menjalankan Proyek

### 1. Menjalankan Database MySQL (Docker)
```bash
docker run -d \
  --name mysql-tokokita \
  -p 3306:3306 \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
  -e MYSQL_DATABASE=toko_api \
  --restart unless-stopped \
  mysql:8.0
```

### 2. Menjalankan Server Backend CodeIgniter 4
```bash
cd backend_toko_api
composer install
php spark serve --port 8081
```

### 3. Menjalankan Aplikasi Flutter (Pilih Modul yang Diinginkan)
Masuk ke salah satu folder modul lalu jalankan:
```bash
# Contoh menjalankan Modul 5 (Aplikasi Tokokita Full API):
cd modul_5
flutter pub get
flutter run
```
