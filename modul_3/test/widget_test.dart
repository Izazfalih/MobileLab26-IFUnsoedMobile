import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul_3/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Modul 3 loads LoginPage smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Modul3App());

    expect(find.text('Login'), findsWidgets);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
