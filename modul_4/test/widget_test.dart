import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul_4/main.dart';
import 'package:modul_4/model/produk.dart';
import 'package:modul_4/ui/produk_detail.dart';
import 'package:modul_4/ui/produk_page.dart';

void main() {
  testWidgets('Modul 4 loads LoginPage smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

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

  testWidgets('ProdukPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProdukPage()));

    expect(find.text('List Produk'), findsOneWidget);
    expect(find.text('Kamera'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
    expect(find.text('Mesin Cuci'), findsOneWidget);
    expect(find.byType(Card), findsNWidgets(3));
  });
}
