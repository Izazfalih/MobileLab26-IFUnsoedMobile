# GempaKu 🌍

Aplikasi Android modern untuk menampilkan informasi gempa bumi terkini di Indonesia secara dinamis, mengonsumsi data resmi dari **BMKG REST API**. Dibangun menggunakan **Kotlin**, **Jetpack Compose**, **Material Design 3**, dan arsitektur **MVVM**.

Proyek ini dibuat untuk memenuhi tugas **Responsi / Ujian Praktikum Pemrograman Mobile**.

---

## 📱 Fitur Utama

1. **Informasi Gempa Terkini**: Menampilkan daftar 15 gempa bumi terbaru berkekuatan M 5.0+ secara dinamis dari server BMKG.
2. **Arsitektur MVVM**: Pemisahan tanggung jawab yang jelas antara UI, ViewModel, Repository, dan Remote Data Source. Tidak ada pemanggilan API langsung dari Composable.
3. **Pencarian Lokal (Filter Wilayah)**: Fitur pencarian instan berdasarkan **Wilayah** (case-insensitive) yang memfilter data di memori tanpa memanggil ulang API BMKG.
4. **State-Driven UI dengan StateFlow**:
   - `UiState.Loading`: Menampilkan indikator loading saat mengambil data.
   - `UiState.Success`: Menampilkan daftar gempa dengan `LazyColumn`.
   - `UiState.Error`: Menampilkan pesan error dan tombol **Retry** jika koneksi gagal.
5. **Navigasi Bersih (Navigation Compose)**:
   - **Home Screen**: Menampilkan TopAppBar "GempaKu", bar pencarian, dan daftar kartu gempa (`LazyColumn`).
   - **Detail Screen**: Menampilkan 7 informasi lengkap gempa beserta tombol navigasi kembali (Back).
6. **7 Data Lengkap Gempa di Detail Screen**:
   - Tanggal
   - Jam
   - Koordinat
   - Magnitude
   - Kedalaman
   - Wilayah
   - Potensi (status potensi tsunami)
7. **Material Design 3 Theme**:
   - Skema warna kustom (*Deep Navy Blue* & *Alert Red Accent*).
   - Mendukung penuh **Light Mode** dan **Dark Mode** otomatis.
   - Override tipografi Material 3 di `Type.kt`.

---

## 🛠️ Teknologi & Library

- **Bahasa**: Kotlin
- **UI Toolkit**: Jetpack Compose & Material Design 3
- **Networking**: Retrofit 2 (`com.squareup.retrofit2:retrofit`)
- **JSON Converter**: Gson Converter (`com.squareup.retrofit2:converter-gson`)
- **Navigasi**: Navigation Compose (`androidx.navigation:navigation-compose`)
- **State Management**: StateFlow & ViewModel Compose (`androidx.lifecycle:lifecycle-viewmodel-compose`)
- **Izin**: `android.permission.INTERNET` di `AndroidManifest.xml`

---

## 🌐 BMKG REST API

- **Base URL**: `https://data.bmkg.go.id/`
- **Endpoint**: `DataMKG/TEWS/gempaterkini.json`
- **Full URL**: `https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json`
- **Autentikasi**: Tanpa API Key

---

## 🏗️ Struktur Proyek

```
com.example.gempaku
│
├── data
│   ├── model
│   │   └── Earthquake.kt              // Data class & pemetaan JSON Gson
│   │
│   ├── remote
│   │   ├── BmkgApiService.kt          // Interface endpoint Retrofit
│   │   └── RetrofitInstance.kt        // Singleton Retrofit client
│   │
│   └── repository
│       └── EarthquakeRepository.kt    // Repository layer penghubung API & ViewModel
│
├── ui
│   ├── screen
│   │   ├── HomeScreen.kt              // Layar utama: Search bar & LazyColumn
│   │   └── DetailScreen.kt            // Layar detail: 7 informasi lengkap & Back button
│   │
│   ├── viewmodel
│   │   └── EarthquakeViewModel.kt     // ViewModel mengelola StateFlow & filter pencarian
│   │
│   ├── UiState.kt                     // Sealed interface: Loading, Success, Error
│   │
│   └── theme
│       ├── Color.kt                   // Definisi palet warna kustom
│       ├── Theme.kt                   // Konfigurasi Material 3 Light & Dark Theme
│       └── Type.kt                    // Override tipografi Material 3
│
└── MainActivity.kt                    // Entry point & NavHost Navigation Compose
```

---

## 🚀 Cara Menjalankan

1. Clone repositori ini:
   ```bash
   git clone https://github.com/Izazfalih/prakmobile-responsi1.git
   ```
2. Buka folder proyek di **Android Studio**.
3. Tunggu proses **Gradle Sync** selesai.
4. Hubungkan perangkat Android fisik atau jalankan emulator.
5. Klik tombol **Run (▶)** di Android Studio.
