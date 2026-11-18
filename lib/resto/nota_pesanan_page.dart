import 'package:flutter/material.dart';
import 'package:flutter_demo/resto/resto_provider.dart';
import 'package:provider/provider.dart';

class NotaPesananPage extends StatelessWidget {
  const NotaPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota Pesanan'),
        actions: [
          TextButton(
            onPressed: () => context.read<RestoProvider>().kosongkanPesanan(),
            child: const Text('Reset'),
          ),
        ],
      ),
      body: Consumer<RestoProvider>(
        builder: (context, resto, child) {
          if (resto.pesanan.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada pesanan yang dipilih',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: resto.pesanan.length,
                  itemBuilder: (context, index) {
                    final p = resto.pesanan[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Text('Menu ID: ${p['id']}'),
                        subtitle: Text(
                          'Jumlah: ${p['jumlah']} x Rp ${p['harga']} = Rp ${p['subtotal']}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.red),
                          onPressed: () {
                            context
                                .read<RestoProvider>()
                                .hapusItemPesanan(p['id']);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  border: Border(
                    top: BorderSide(color: Theme.of(context).dividerColor),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Bayar:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rp ${resto.totalBayar}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}