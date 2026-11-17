import 'package:flutter/material.dart';
import 'package:modul_3/login_page.dart';

void main() {
  runApp(const Modul3App());
}

class Modul3App extends StatelessWidget {
  const Modul3App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Modul 3 - Routes, Login & Local Storage',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
