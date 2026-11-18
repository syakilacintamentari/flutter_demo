import 'package:flutter/material.dart';
import 'package:flutter_demo/counter/hitung_provider.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,

          children: [
            Consumer<HitungProvider>(builder: (context, hitung, child) {
              return 
            Text(hitung.angka.toString(),
            style: TextStyle( fontSize: 28, fontWeight: .bold),
            );
            },
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(onPressed: () {
                  context.read<HitungProvider>().kurang();
                }, 
                child: Icon(Icons.remove)),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: () {
                  context.read<HitungProvider>().tambah();
                }, 
                child: Icon(Icons.add)),

              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/3');
            }, child: Text("Ke halaman 3")),
          ],
        ),
      ),
    );
  }
}