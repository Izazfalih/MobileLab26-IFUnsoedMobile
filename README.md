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

---

# Pertemuan 4
## Recomposition dan UI Lifecycle

### Deskripsi
Pada pertemuan keempat dipelajari konsep lanjutan dari Jetpack Compose meliputi pengelolaan State, Recomposition, State Hoisting (pemisahan Stateful dan Stateless Composable), Unidirectional Data Flow (UDF), simulasi proses asinkronus (Coroutine & `LaunchedEffect`), validasi form kompleks, dan integrasi navigasi berargumen.

### Materi
- Recomposition & UI Lifecycle
- State Hoisting & Unidirectional Data Flow (UDF)
- Asynchronous Processing dengan `LaunchedEffect` & `delay`
- Form Interaktif Kompleks (`OutlinedTextField`, `ExposedDropdownMenuBox`, `Checkbox`, `PhotoPicker`)
- Validasi Input & Dynamic Button State (`enabled`)
- Visual Feedback (Indikator Loading `CircularProgressIndicator` & Pesan `Toast`)
- Navigasi Berargumen (`detail/{productId}`) dengan `NavType.IntType`
- Action Menu di `TopAppBar` (`DropdownMenu` menuju halaman Hubungi Kami)
- Deklarasi Permission Galeri / Penyimpanan di `AndroidManifest.xml`

### Implementasi

#### 1. Modifikasi Permissions (`AndroidManifest.xml`)
Menambahkan perizinan akses media galeri untuk fitur unggah gambar:
- `android.permission.READ_EXTERNAL_STORAGE` (maxSdkVersion 32)
- `android.permission.READ_MEDIA_IMAGES`

#### 2. Modifikasi Form Hubungi Kami (`HubungiKamiScreen.kt`)
- **Stateful `HubungiKamiScreen`**: Mengelola state lokal (`emailText`, `messageText`, `problemType`, `isAgreed`, `imageUri`), mengevaluasi validasi input secara real-time (`isEmailValid`, `isMessageValid`, `isFormValid`), dan menangani pengiriman pesan dengan `SnackbarHost`.
- **Stateless `StatelessFormHubungiKami`**:
  - Kolom input Email dengan validasi format email (`isError` & `supportingText`).
  - Dropdown menu tipe pesan menggunakan `ExposedDropdownMenuBox` (*Pertanyaan*, *Keluhan*, *Saran*).
  - Kolom input Pesan dengan validasi minimal 10 karakter.
  - Fitur unggah bukti gambar menggunakan `rememberLauncherForActivityResult` (`ActivityResultContracts.PickVisualMedia`).
  - Kartu konfirmasi nama berkas terpilih secara kondisional (`imageUri != null`).
  - Checkbox persetujuan syarat & ketentuan.
  - Tombol Kirim Pesan dengan status dinamis (`enabled = isFormValid`).

#### 3. Modifikasi Daftar Produk (`DaftarProductScreen.kt`)
- Menambahkan kolom pencarian produk (`OutlinedTextField`) yang responsif.
- Mengimplementasikan proses asinkronus dengan `LaunchedEffect` dan `delay(1000)` untuk menyaring data berdasarkan kategori dan kata kunci pencarian.
- Menampilkan animasi `CircularProgressIndicator` saat loading, atau pesan "Produk tidak ditemukan" jika hasil kosong.
- Mengadopsi pola State Hoisting dengan fungsi `StatelessDaftarProduct`.
- Menambahkan menu aksi tiga titik (`MoreVert`) pada `TopAppBar` yang memunculkan `DropdownMenu` untuk navigasi ke halaman Hubungi Kami.

#### 4. Layar Detail Produk (`DetailProductScreen.kt`)
- **Stateful `DetailProductScreen`**: Menerima parameter `productId`, melakukan simulasi pemuatan data produk dari server dengan `LaunchedEffect`, serta mengelola jumlah pembelian (`quantity`).
- **Stateless `StatelessDetailProduct`**:
  - `TopAppBar` dengan tombol kembali (`popBackStack()`).
  - Tampilan gambar produk, nama produk, harga, deskripsi, dan sisa stok.
  - Tombol pengatur kuantitas pembelian (`FilledTonalButton` `+` dan `-`) yang dibatasi sesuai batas stok.
  - Tombol "Tambah ke Keranjang" yang memunculkan konfirmasi `Toast`.

#### 5. Navigasi Terpadu (`HomeActivity.kt`)
Mengonfigurasi rute navigasi aplikasi:
- `"daftar_produk"`: Halaman utama katalog produk.
- `"detail/{productId}"`: Halaman rincian produk berdasarkan ID yang dikirim.
- `"hubungi_kami"`: Halaman formulir layanan bantuan & kontak.

---

# Pertemuan 5
## Networking & Architecture

### Deskripsi
Pada pertemuan kelima dipelajari konsep lanjutan dari Jetpack Compose terkait arsitektur perangkat lunak Android modern (MVVM), pemanggilan API RESTful menggunakan Retrofit & Gson Converter, pemuatan gambar asinkron dari internet menggunakan Coil, pengelolaan status jaringan reaktif menggunakan `StateFlow` dan Sealed Interface (`UI State Pattern`), serta penyesuaian navigasi antar layar menggunakan ViewModel bersama.

### Materi
- Arsitektur MVVM (Model-View-ViewModel)
- Konsumsi RESTful API menggunakan Retrofit & Gson Converter
- Pengelolaan UI State secara reaktif menggunakan Kotlin Coroutines & `StateFlow`
- Pemuatan Gambar dari Internet (Remote Image Loading) menggunakan Coil (`AsyncImage`)
- Pengorganisasian Kode (Package `util`, `network`, `ui.viewmodel`)
- Penghapusan Data Tiruan (Dummy Data) dan beralih ke Data Real-time dari API
- Navigasi Terintegrasi dengan Shared ViewModel di `HomeActivity`
- Penambahan Izin Akses Jaringan (`android.permission.INTERNET`) di `AndroidManifest.xml`

### Implementasi

#### 1. Konfigurasi Dependensi & Permission
- Menambahkan library Retrofit (`3.0.0`), Gson Converter (`3.0.0`), Coil Compose (`2.6.0`), dan Lifecycle ViewModel Compose (`2.8.7`) pada `libs.versions.toml` dan `build.gradle.kts`.
- Menambahkan izin akses internet pada `AndroidManifest.xml`:
  ```xml
  <uses-permission android:name="android.permission.INTERNET" />
  ```

#### 2. Package Util & Network
- **`JualanConstants.kt`**: Menyimpan konfigurasi konstan `BASE_URL = "https://pemmob-if.web.app/"`.
- **`ApiInterface.kt`**: Mendefinisikan antarmuka kontrak pemanggilan API (`getCategories()` dan `getProducts()`) serta singleton `ApiClient` menggunakan `Retrofit.Builder()` dan `GsonConverterFactory`.

#### 3. Arsitektur MVVM & UI State (`ProductViewModel.kt`)
- **`ProductUiState`**: Sealed interface yang merepresentasikan tiga kemungkinan status UI:
  - `Loading`: Menampilkan indikator progress berputar.
  - `Success`: Membawa daftar `categories` dan `products` yang telah dipetakan secara otomatis dengan kategorinya masing-masing.
  - `Error`: Membawa pesan kegagalan jika terjadi kendala jaringan atau server.
- **`ProductViewModel`**: Menggunakan `MutableStateFlow` yang dienkapsulasi dan `viewModelScope` untuk memanggil API secara asinkron tanpa memblokir UI thread.

#### 4. Integrasi Layar & Remote Image Loading
- **`DaftarProductScreen.kt`**:
  - Mengonsumsi `uiState` dari `ProductViewModel` menggunakan `collectAsState()`.
  - Menggunakan Coil `AsyncImage` pada `ProductItemCard` untuk menampilkan gambar dari endpoint server (`${BASE_URL}img/${product.img}`) dengan fallback ke gambar cadangan lokal.
- **`DetailProductScreen.kt`**:
  - Mengambil data produk langsung dari status `ProductUiState.Success`.
  - Menggunakan `AsyncImage` untuk menampilkan foto produk resolusi penuh dari server secara dinamis.

#### 5. Navigasi Terpadu (`HomeActivity.kt`)
- Menginjeksi instance tunggal `ProductViewModel` menggunakan fungsi `viewModel()` ke dalam rute `DaftarProdukScreen` dan `DetailProductScreen`, sehingga data API dapat digunakan bersama tanpa perlu melakukan fetch ulang.