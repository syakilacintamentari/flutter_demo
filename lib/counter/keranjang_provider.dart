import 'package:flutter/material.dart';

class KeranjangProvider extends ChangeNotifier {
  final List<String> _items = [];

  //method untuk mendapatkan item keranjang
  List<String> get items => _items;
  //method untuk mendapatkan jumlah item di keranjang
  int get jumlahItem => _items.length;

  //method untuk menambahkan item ke dalam keranjang
  void tambahItem(String namaProduk){
    _items.add(namaProduk);
    notifyListeners();
  }

  void hapusItem(int noProduk){
    _items.removeAt(noProduk);
    notifyListeners();
  }

  void kosongkan(){
    _items.clear();
    notifyListeners();
  }
}