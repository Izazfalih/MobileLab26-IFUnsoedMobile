import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:router_flutter/column_widget.dart';
import 'package:router_flutter/hello_world.dart';
import 'package:router_flutter/main.dart';
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
    await tester.pumpWidget(const MaterialApp(
      home: ProdukDetail(
        kodeProduk: 'A001',
        namaProduk: 'Laptop',
        harga: 15000000,
      ),
    ));

    expect(find.text('Detail Produk'), findsOneWidget);
    expect(find.text('Kode Produk : A001'), findsOneWidget);
    expect(find.text('Nama Produk : Laptop'), findsOneWidget);
    expect(find.text('Harga Produk : 15000000'), findsOneWidget);
  });

  testWidgets('ProdukPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProdukPage()));

    expect(find.text('List Data Produk'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
    expect(find.text('Playstation'), findsOneWidget);
    expect(find.text('Radio'), findsOneWidget);
    expect(find.byType(Card), findsNWidgets(3));
  });
}
