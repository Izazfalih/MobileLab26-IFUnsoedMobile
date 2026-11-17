import 'package:flutter/material.dart';
import 'package:modul_2/column_widget.dart';
import 'package:modul_2/hello_world.dart';
import 'package:modul_2/row_widget.dart';
import 'package:modul_2/ui/produk_form.dart';
import 'package:modul_2/ui/produk_page.dart';

void main() {
  runApp(const Modul2App());
}

class Modul2App extends StatelessWidget {
  const Modul2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 2 - Widget & Layout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Modul2Dashboard(),
    );
  }
}

class Modul2Dashboard extends StatelessWidget {
  const Modul2Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul 2: Widget & Desain'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuItem(
            context,
            icon: Icons.inventory_2,
            title: 'List Produk (ProdukPage)',
            subtitle: 'Implementasi Card dan ListView produk',
            destination: const ProdukPage(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.add_box,
            title: 'Form Produk (ProdukForm)',
            subtitle: 'Input data produk dan navigasi ke ProdukDetail',
            destination: const ProdukForm(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.text_fields,
            title: 'Hello World Widget',
            subtitle: 'Widget StatelessWidget dasar',
            destination: const HelloWorld(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.view_column,
            title: 'Column Widget',
            subtitle: 'Tata letak vertikal menggunakan Column',
            destination: const ColumnWidget(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.table_rows,
            title: 'Row Widget',
            subtitle: 'Tata letak horizontal menggunakan Row',
            destination: const RowWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget destination,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
