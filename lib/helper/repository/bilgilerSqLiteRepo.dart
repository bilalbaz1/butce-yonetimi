import 'package:butce/db/bilgilerDb.dart';
import 'package:butce/model/bilgilerModel.dart';
import 'package:sqflite/sqflite.dart';

class BilgilerSqLiteRepo {
  /// tüm verileri getirir ama repository de bir tane user alınacak
  Future<List<BilgilerModel>> getir() async {
    Database _db = await SqLiteDB.instance.database;

    var deger = await _db.query("bilgiler");
    List<BilgilerModel> sonuc = deger.isNotEmpty
        ? deger.map((e) => BilgilerModel.fromJson(e)).toList()
        : null;
    return sonuc;
  }

  Future<bool> ekle(BilgilerModel bilgilerModel) async {
    Database _db = await SqLiteDB.instance.database;

    var durum = await _db.insert("bilgiler", bilgilerModel.toJson());
    bool sonuc = durum > 0 ? true : false;
    return sonuc;
  }

  Future<bool> guncelle(Map<String, dynamic> bilgi, String ad) async {
    Database _db = await SqLiteDB.instance.database;

    var durum = await _db.update(
      "bilgiler",
      bilgi,
      where: "ad= ?",
      whereArgs: [ad],
    );

    print(durum);
    bool sonuc = durum > 0 ? true : false;
    print(sonuc);

    return sonuc;
  }

  Future<bool> sil(String ad) async {
    Database _db = await SqLiteDB.instance.database;

    var durum = await _db.delete("bilgiler", where: "ad = ?", whereArgs: [ad]);
    if (durum > 0) {
      print("------------ kullanıcı silindi: " + durum.toString());
      return true;
    } else {
      print("------------ kullanıcı silinirken HATAATTAA: " + durum.toString());
      return false;
    }
  }
}
