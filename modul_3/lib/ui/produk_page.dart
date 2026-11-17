import 'package:flutter/material.dart';
import 'package:modul_3/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Data Produk'),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text('Kulkas'),
              subtitle: Text('30000'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Playstation'),
              subtitle: Text('30000'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Radio'),
              subtitle: Text('30000'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah Produk',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProdukForm(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
