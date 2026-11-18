import 'package:flutter/material.dart';

class HitungProvider extends ChangeNotifier{
//int siapkan variabel yang nilainya akan dibagikan antar halaman
//set modifier nya ke private dengan tanda underscore _
int _angka = 0;

//buatkan method getter
int get angka => _angka;

//buat method untuk menambah angka + 1
void tambah(){
  _angka++;
  notifyListeners();
}

void kurang(){
  _angka--;
  notifyListeners();
}
}