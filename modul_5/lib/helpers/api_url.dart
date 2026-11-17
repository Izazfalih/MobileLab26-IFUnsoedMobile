import 'dart:io';

class ApiUrl {
  // Otomatis memilih 10.0.2.2 untuk Android Emulator dan localhost untuk iOS/macOS/Desktop
  static String baseUrl =
      Platform.isAndroid ? 'http://10.0.2.2:8081' : 'http://localhost:8081';

  static String get registrasi => '$baseUrl/registrasi';
  static String get login => '$baseUrl/login';
  static String get listProduk => '$baseUrl/produk';
  static String get createProduk => '$baseUrl/produk';

  static String updateProduk(int id) {
    return '$baseUrl/produk/$id/update';
  }

  static String showProduk(int id) {
    return '$baseUrl/produk/$id';
  }

  static String deleteProduk(int id) {
    return '$baseUrl/produk/$id';
  }
}

