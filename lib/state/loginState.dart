import 'package:butce/helper/locator.dart';
import 'package:butce/helper/repository/bilgilerSqLiteRepo.dart';
import 'package:butce/model/bilgilerModel.dart';
import 'package:butce/model/islemlerModel.dart';
import 'package:butce/service/prefService.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

enum UserDurum { Beklemede, OturumAcik, OturumKapali, OturumAciliyor }

class LoginState with ChangeNotifier {
  final _service = locator<PrefService>();
  final _sqlite = locator<BilgilerSqLiteRepo>();

  UserDurum _durum = UserDurum.Beklemede;
  LoginState() {
    _kontrol();
  }

  UserDurum get getDurum => _durum;

  Future<void> _kontrol() async {
    await dbOpenBox();
    Future.delayed(Duration(seconds: 3), () async {
      String ad = await _service.stringGetir("ad");
      if (ad == null) {
        _durum = UserDurum.OturumKapali;
        notifyListeners();
      } else {
        _durum = UserDurum.OturumAcik;
        notifyListeners();
      }
    });
  }

  Future<bool> uyeOl(BuildContext context, BilgilerModel bilgilerModel) async {
    try {
      await _service.stringEkle("ad", bilgilerModel.ad);
      await _sqlite.ekle(bilgilerModel);
      _durum = UserDurum.OturumAcik;
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint("Üye olurken Hata : " + e.toString());
      _durum = UserDurum.OturumKapali;
      notifyListeners();
      return false;
    }
  }

  Future<void> dbOpenBox() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(IslemlerModelAdapter());

    await Hive.openBox("islemler");
  }
}
