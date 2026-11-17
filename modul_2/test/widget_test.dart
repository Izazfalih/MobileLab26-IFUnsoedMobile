import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul_2/column_widget.dart';
import 'package:modul_2/hello_world.dart';
import 'package:modul_2/main.dart';
import 'package:modul_2/row_widget.dart';
import 'package:modul_2/ui/produk_detail.dart';
import 'package:modul_2/ui/produk_page.dart';

void main() {
  testWidgets('Modul 2 Dashboard smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Modul2App());

    expect(find.text('Modul 2: Widget & Desain'), findsOneWidget);
    expect(find.text('List Produk (ProdukPage)'), findsOneWidget);
  });

  testWidgets('HelloWorld widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HelloWorld()));

    expect(find.text('Belajar Flutter'), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('ColumnWidget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ColumnWidget()));

    expect(find.text('Widget Column'), findsOneWidget);
  });

  testWidgets('RowWidget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RowWidget()));

    expect(find.text('Widget Row'), findsOneWidget);
  });

  testWidgets('ProdukDetail widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ProdukDetail(
        kodeProduk: 'A001',
        namaProduk: 'Laptop',
        harga: 15000000,
      ),
    ));

    expect(find.text('Detail Produk'), findsOneWidget);
    expect(find.text('Kode Produk : A001'), findsOneWidget);
  });

  testWidgets('ProdukPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProdukPage()));

    expect(find.text('List Data Produk'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
  });
}
