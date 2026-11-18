import 'package:flutter/material.dart';
import 'package:flutter_demo/counter/hitung_provider.dart';
import 'package:provider/provider.dart';

class Page3 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(context.read<HitungProvider>().angka.toString()),
          SizedBox(height: 10),
          Text("Ini data dari page 2"),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {Navigator.pop(context);
          }, child: Text("Kembali ke hal 2"),

          )
        ],
      ),
    );
  }
}