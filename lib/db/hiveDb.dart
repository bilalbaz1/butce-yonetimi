import 'package:butce/model/islemlerModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class HiveDB {
  static final String islemlerBox = "islemler";

  Future<bool> harcananEkle(IslemlerModel model) async {
    var tablo = Hive.box(islemlerBox);
    var deger = await tablo.add(model);
    return deger >= 0 ? true : false;
  }

  Future<List<IslemlerModel>> harcananGetir() async {
    var tablo = Hive.box(islemlerBox);
    List<IslemlerModel> liste = [];
    for (var i = 0; i < tablo.length; i++) {
      var deger = await tablo.getAt(i) as IslemlerModel;
      deger.hiveIndex = i;
      liste.add(deger);
    }
    if (liste.length != 0) {
      var tersListe = liste.reversed.toList();
      return tersListe;
    } else
      return [];
  }

  Future<void> harcananGuncelle(
      int index, IslemlerModel challengesModel) async {
    var tablo = Hive.box(islemlerBox);
    await tablo.putAt(index, challengesModel);
    debugPrint("---- degisen index : " + index.toString());
  }

  Future<void> harcananSil(int hiveIndex) async {
    var tablo = Hive.box(islemlerBox);
    await tablo.deleteAt(hiveIndex);
  }
}
