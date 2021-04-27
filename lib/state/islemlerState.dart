import 'package:butce/db/hiveDb.dart';
import 'package:butce/helper/locator.dart';
import 'package:butce/model/islemlerModel.dart';
import 'package:flutter/material.dart';

enum IslemlerDurum { IslemlerGeldi, IslemlerBos, IslemlerHata }

class IslemlerState with ChangeNotifier {
  List<IslemlerModel> _tumIslemler = [];
  List<IslemlerModel> _harcananIslemler = [];
  List<IslemlerModel> _kazanilanIslemler = [];
  double _bakiye = 0;
  double _gelir = 0;
  double _gider = 0;

  IslemlerDurum _durum = IslemlerDurum.IslemlerBos;

  IslemlerDurum get getDurum => this._durum;

  List<IslemlerModel> get getTumIslemler => this._tumIslemler;
  List<IslemlerModel> get getHarcananIslemler => this._harcananIslemler;
  List<IslemlerModel> get getKazanilanIslemler => this._kazanilanIslemler;
  double get getBakiye => this._bakiye;
  double get getGelir => this._gelir;
  double get getGider => this._gider;

  final _hive = locator<HiveDB>();

  IslemlerState() {
    _kontrol();
  }

  Future<void> _kontrol() async {
    List<IslemlerModel> harcanan = [];
    List<IslemlerModel> kazanilan = [];
    _gelir = 0;
    _gider = 0;
    _bakiye = 0;

    List<IslemlerModel> gelen = await _hive.harcananGetir();
    _tumIslemler = gelen;

    for (var i = 0; i < gelen.length; i++) {
      var isKazanc = gelen[i].isKazanc;
      if (isKazanc) {
        kazanilan.add(gelen[i]);
        _bakiye = _bakiye + gelen[i].tutar;
        _gelir = _gelir + gelen[i].tutar;
      } else {
        harcanan.add(gelen[i]);
        _bakiye = _bakiye - gelen[i].tutar;
        _gider = _gider + gelen[i].tutar;
      }
    }

    _harcananIslemler = harcanan;
    _kazanilanIslemler = kazanilan;
    _durum = IslemlerDurum.IslemlerGeldi;
    notifyListeners();
  }

  Future<bool> islemEkle(IslemlerModel model) async {
    bool durum = await _hive.harcananEkle(model);
    if (durum) {
      _tumIslemler.insert(0, model);
      if (model.isKazanc) {
        _kazanilanIslemler.insert(0, model);
        _bakiye = _bakiye + model.tutar;
        _gelir = _gelir + model.tutar;
      } else {
        _harcananIslemler.insert(0, model);
        _bakiye = _bakiye - model.tutar;
        _gider = _gider + model.tutar;
      }

      notifyListeners();
      return true;
    } else
      return false;
  }

  Future<bool> islemSil(int hiveIndex) async {
    await _hive.harcananSil(hiveIndex).then((value) {
      _kontrol();
    });
    return true;
  }
}
