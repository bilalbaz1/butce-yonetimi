import 'package:butce/helper/locator.dart';
import 'package:butce/helper/repository/bilgilerSqLiteRepo.dart';
import 'package:butce/model/bilgilerModel.dart';
import 'package:flutter/material.dart';

enum BilgilerDurum { BilgilerDolu, BilgilerBos, BilgilerGeliyor, BilgilerHata }

class BilgilerState with ChangeNotifier {
  BilgilerModel _bilgiler;
  BilgilerDurum _durum = BilgilerDurum.BilgilerGeliyor;

  BilgilerModel get getBilgiler => this._bilgiler;
  BilgilerDurum get getBilgilerDurum => this._durum;

  final _bilgilerRepo = locator<BilgilerSqLiteRepo>();

  BilgilerState() {
    _kontrol();
  }

  Future<void> _kontrol() async {
    var userList = await _bilgilerRepo.getir();
    if (userList != null) {
      _bilgiler = userList[0];
      _durum = BilgilerDurum.BilgilerDolu;
      notifyListeners();
    } else {
      _durum = BilgilerDurum.BilgilerBos;
      notifyListeners();
    }
  }

  Future<bool> bilgiGuncelle(Map<String, dynamic> bilgi) async {
    var durum = await _bilgilerRepo.guncelle(bilgi, _bilgiler.ad);
    _kontrol();
    return durum;
  }
}
