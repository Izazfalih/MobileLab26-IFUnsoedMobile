# Praktikum Pemrograman Mobile - Jualan

Repository ini berisi hasil praktikum Pemrograman Mobile menggunakan Android Studio, Kotlin, dan Jetpack Compose.

---

# Pertemuan 1
## Inisialisasi Project Android & Implementasi Function Sederhana

### Deskripsi
Pada pertemuan pertama dilakukan proses inisialisasi project Android menggunakan Android Studio serta mempelajari dasar Kotlin dan Jetpack Compose.

### Materi
- Pengenalan Kotlin
- Jetpack Compose & Declarative UI
- Android Studio & Android SDK
- Struktur Project Android
- Mengganti Icon Aplikasi
- Membuat Function & Composable
- Menjalankan Aplikasi pada Emulator

### Implementasi
Pada pertemuan ini dibuat project Android dengan:
- **Nama Aplikasi:** Jualan
- **Bahasa:** Kotlin
- **UI Toolkit:** Jetpack Compose
- **IDE:** Android Studio

Project menggunakan pendekatan Declarative UI dengan Jetpack Compose, di mana seluruh tampilan aplikasi dibuat menggunakan fungsi `@Composable`.

---

# Pertemuan 2
## Material Design 3: Components & Forms

### Deskripsi
Pada pertemuan kedua dilakukan implementasi Material Design 3 (MD3) menggunakan Jetpack Compose untuk membangun tampilan aplikasi, sistem tema terpusat, komponen UI, dan formulir interaktif.

### Materi
- Material Design 3 (MD3)
- Color Scheme & Role-Based Styling
- Theme & Tipografi (Typography)
- Scaffold & TopAppBar
- OutlinedTextField & Button
- Jetpack Navigation (`NavHost` & `NavController`)
- Asynchronous Feedback dengan Coroutine & `Snackbar`
- Penguncian Tema (`dynamicColor = false`)

### Implementasi

#### 1. Modifikasi Color (`Color.kt`)
Melakukan konfigurasi palet warna aplikasi:
- `Primary = Color(0xFF3AA34B)`
- `PrimaryVariant = Color(0xFF0F8B88)`
- `Secondary = Color(0xFF76BA43)`
- `Background = Color(0xFFF5F5F5)`
- `Surface = Color(0xFFFFFFFF)`

#### 2. Modifikasi Theme (`Theme.kt`)
Mengatur pemetaan peran warna untuk `LightColorScheme` dan `DarkColorScheme`, serta mengatur `dynamicColor = false` agar konsistensi identitas visual aplikasi terjaga.

#### 3. Modifikasi Tipografi (`Type.kt`)
Mendefinisikan gaya tipografi standar aplikasi: `headlineMedium`, `titleLarge`, `bodyLarge`, `bodyMedium`, dan `labelLarge`.

#### 4. Pembuatan Screen & Navigasi
- **`BasicInfoScreen.kt`**: Menampilkan informasi tentang aplikasi "Jualan", logo UMKM, kartu misi UMKM Lokal, dan tombol navigasi ke formulir kontak.
- **`HubungiKamiScreen.kt`**: Menyediakan formulir input `OutlinedTextField` untuk Email dan Pesan, tombol Kirim Pesan yang memicu kemunculan `Snackbar` ("Pesan Terkirim"), serta tombol navigasi kembali (`popBackStack()`).
- **`MainActivity.kt`**: Menghubungkan layar menggunakan `rememberNavController()` dan `NavHost` dengan rute `"basic_info"` dan `"form_screen"`.

---

# Pertemuan 3
## Dynamic Lists with Lazy Layouts

### Deskripsi
Pada pertemuan ketiga dipelajari konsep *Dynamic Lists* dan *Lazy Layouts* pada Jetpack Compose untuk merender data dalam jumlah banyak secara efisien tanpa membebani memori perangkat.

### Materi
- Konsep Lazy Layouts (`LazyRow` dan `LazyVerticalGrid`)
- Penggunaan Data Class Kotlin (`Category` dan `Product`)
- Desain Data Dummy menggunakan Kotlin Singleton Object (`DummyData`)
- Desain Komponen Custom List Item (`ProductItemCard` dan `CategoryItem`)
- Interaktivitas & Filtering State (`mutableStateOf` dan `remember`)
- Notifikasi Interaktif menggunakan `Toast`
- Multi-Preview Komponen & Screen (Light Mode & Dark Mode)
- Pembuatan Activity Baru (`HomeActivity`) dan Pengaturan Launcher Activity pada `AndroidManifest.xml`

### Implementasi

#### 1. Data Model (`com.pemmob.izazfalih.data.model`)
- **`Category.kt`**: Menyimpan identitas kategori produk (`id`, `name`, `description`, `products_count`).
- **`Product.kt`**: Menyimpan identitas produk (`id`, `category_id`, `category`, `name`, `description`, `price`, `stock`, `img`).

#### 2. Dummy Data (`com.pemmob.izazfalih.data.dummy`)
- **`DummyData.kt`**: Objek singleton yang menyediakan data tiruan berupa 3 kategori (*Makanan*, *Minuman*, *Kerajinan*) dan 15 produk lokal khas daerah (seperti *Kripik Singkong*, *Mendoan*, *Sale Pisang*, *Getuk Goreng*, *Nopia*, *Batik Purbalingga*, dll.).
- **`dummy_product.xml`**: Aset vektor gambar produk berdimensi 1:1.

#### 3. Komponen UI & Layout Produk (`DaftarProductScreen.kt`)
- **`ProductItemCard`**: Menampilkan kartu produk dengan rasio gambar 1:1, badge kategori di sudut kanan atas, nama produk, harga berformat Rupiah, dan stok produk.
- **`CategoryItem`**: Tombol/kartu filter kategori horizontal yang berubah warna secara otomatis ketika dipilih (`isSelected`).
- **`DaftarProdukScreen`**:
  - `TopAppBar` berwarna hijau dengan judul "Daftar Produk UMKM" dan aksi ikon keranjang belanja (`ShoppingCart`).
  - `LazyRow` untuk navigasi filter kategori secara horizontal.
  - `LazyVerticalGrid` 2 kolom untuk menyusun katalog produk yang tersaring secara dinamis.
  - Interaksi klik pada kartu produk menampilkan notifikasi `Toast` bertuliskan `"Clicked: <Nama Produk>"`.
- **`@Preview`**: Mendukung pratinjau komponen mandiri (`PreviewProduct`, `PreviewCategory`) dan pratinjau layar penuh dalam mode **Light Mode** dan **Dark Mode**.

#### 4. HomeActivity & Konfigurasi Manifest
- **`HomeActivity.kt`**: Dibuat sebagai Activity utama yang langsung memanggil `DaftarProdukScreen()`.
- **`AndroidManifest.xml`**: Disesuaikan dengan menjadikan `HomeActivity` sebagai launcher activity utama aplikasi.