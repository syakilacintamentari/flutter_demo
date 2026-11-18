import 'package:flutter/material.dart';

class RestoProvider extends ChangeNotifier{
  final List<Map<String, dynamic>> _pesanan = [];

  //buat getter pesanan
  List<Map<String, dynamic>> get pesanan => _pesanan;

  //buat totalItemPesanan (total kuantitas semua item)
  int get totalItemPesanan{
    int total = 0;
    for (final p in _pesanan){
      total +=int.tryParse(p['jumlah'].toString()) ??0;
    }
    return total;
}

//buat totalBayar (total rupiah semua subtotal
int get totalBayar{
  int total = 0;
  for (final p in _pesanan){
    total +=int.tryParse(p['subtotal'].toString())??0;
  }
  return total;
}

//buat method tambahPesanan
void tambahPesanan(Map<String,dynamic>item){
  final index = _pesanan.indexWhere((p) => p ['id'] ==item['id']);
  final harga = int.tryParse(item['harga'].toString())??0;

  if (index != -1) {
    //jika item sudah ada: tambah jumlah, hitung ulang subtotal
    final jumlahBaru =
    (int.tryParse(_pesanan[index]['jumlah'].toString())??0) + 1;
    _pesanan[index]['jumlah'] =jumlahBaru.toString();
    _pesanan[index]['subtotal'] (jumlahBaru*harga).toString();
  }else{
    //jika belum ada: tambah map baru
    _pesanan.add({
      'id':item['id'],
      'jumlah':'1',
      'harga':item['harga'],
      'subtotal':item['harga'],
    });
  }
  notifyListeners();
}

//buat method hapusItemPesanan
void hapusItemPesanan(String id){
  _pesanan.removeWhere((p) => p['id']==id);
  notifyListeners();
}

//kosongkan pesanan
void kosongkanPesanan(){
  _pesanan.clear();
  notifyListeners();
}

}