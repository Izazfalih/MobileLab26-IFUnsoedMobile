import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul_5/main.dart';
import 'package:modul_5/model/produk.dart';
import 'package:modul_5/ui/produk_detail.dart';
import 'package:modul_5/ui/produk_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Modul 5 loads LoginPage smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('ProdukDetail widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ProdukDetail(
        produk: Produk(
          id: 1,
          kodeProduk: 'A001',
          namaProduk: 'Laptop',
          hargaProduk: 15000000,
        ),
      ),
    ));

    expect(find.text('Detail Produk'), findsOneWidget);
    expect(find.text('Kode : A001'), findsOneWidget);
    expect(find.text('Nama : Laptop'), findsOneWidget);
    expect(find.text('Harga : Rp. 15000000'), findsOneWidget);
  });

  testWidgets('ListProduk widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListProduk(
          list: [
            Produk(
              id: 1,
              kodeProduk: 'A001',
              namaProduk: 'Kamera',
              hargaProduk: 5000000,
            ),
            Produk(
              id: 2,
              kodeProduk: 'A002',
              namaProduk: 'Kulkas',
              hargaProduk: 2500000,
            ),
            Produk(
              id: 3,
              kodeProduk: 'A003',
              namaProduk: 'Mesin Cuci',
              hargaProduk: 2000000,
            ),
          ],
        ),
      ),
    ));

    expect(find.text('Kamera'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
    expect(find.text('Mesin Cuci'), findsOneWidget);
    expect(find.byType(Card), findsNWidgets(3));
  });
}
