import 'package:flutter/material.dart';

class BottomBarState with ChangeNotifier {
  int _aktifSayfa = 0;

  int get getAktifSayfa => _aktifSayfa;
  set setAktifSayfa(int aktifSayfa) => this._aktifSayfa = aktifSayfa;

  void sayfaDegistir(int sayfaNo) {
    _aktifSayfa = sayfaNo;
    notifyListeners();
  }
}
