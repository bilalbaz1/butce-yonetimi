import 'package:shared_preferences/shared_preferences.dart';

/// Shared Preferences ; ekleme ve getirme
class PrefService {
  Future<bool> stringEkle(String key, String value) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    Future<bool> sonuc = _pref.setString(key, value);
    return sonuc;
  }

  Future<bool> intEkle(String key, int value) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    Future<bool> sonuc = _pref.setInt(key, value);
    return sonuc;
  }

  Future<bool> boolEkle(String key, bool value) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    Future<bool> sonuc = _pref.setBool(key, value);
    return sonuc;
  }

  Future<String> stringGetir(String key) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    String sonuc = _pref.getString(key);
    return sonuc;
  }

  Future<int> intGetir(String key) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    int sonuc = _pref.getInt(key);
    return sonuc;
  }

  Future<bool> boolGetir(String key) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    bool sonuc = _pref.getBool(key);
    return sonuc;
  }
}
