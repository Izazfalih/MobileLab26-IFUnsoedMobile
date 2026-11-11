import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:router_flutter/column_widget.dart';
import 'package:router_flutter/hello_world.dart';
import 'package:router_flutter/main.dart';
import 'package:router_flutter/model/produk.dart';
import 'package:router_flutter/row_widget.dart';
import 'package:router_flutter/ui/produk_detail.dart';
import 'package:router_flutter/ui/produk_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('MyApp loads LoginPage smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login'), findsWidgets);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('HelloWorld widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HelloWorld()));

    expect(find.text('Belajar Flutter'), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('ColumnWidget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ColumnWidget()));

    expect(find.text('Widget Column'), findsOneWidget);
    expect(find.text('Kolom 1'), findsOneWidget);
    expect(find.text('Kolom 4'), findsOneWidget);
  });

  testWidgets('RowWidget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RowWidget()));

    expect(find.text('Widget Row'), findsOneWidget);
    expect(find.text('Row 1'), findsOneWidget);
    expect(find.text('Row 4'), findsOneWidget);
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
