import 'package:flutter/material.dart';
import 'package:flutter_demo/counter/hitung_provider.dart';
import 'package:flutter_demo/counter/keranjang_page.dart';
import 'package:flutter_demo/counter/keranjang_provider.dart';
import 'package:flutter_demo/counter/page_2.dart';
import 'package:flutter_demo/counter/page_3.dart';
import 'package:flutter_demo/resto/resto_provider.dart';
import 'package:flutter_demo/resto/menu_resto_page.dart';
import 'package:flutter_demo/resto/nota_pesanan_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HitungProvider()),
        ChangeNotifierProvider(create: (context) => KeranjangProvider()),
        ChangeNotifierProvider(create: (context) => RestoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Page2(),
        '/3': (context) => const Page3(),
        '/keranjang': (context) => const KeranjangPage(),
        '/menu-resto': (context) => const MenuRestoPage(),
        '/pesanan-resto': (context) => const NotaPesananPage(),
      },
      initialRoute: '/menu-resto',
    );
  }
}