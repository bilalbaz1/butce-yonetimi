import 'dart:convert';

import 'package:butce/model/dovizModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DovizApi {
  String apiKey =
      "apikey 66yGe3eML9CTZXoJGAt9tA:0xZFIubZXTfUpqY5VMTMub"; // https://collectapi.com Ücretsiz Altın, Döviz ve Borsa API kullanıldı
  String baseUrl = "https://api.collectapi.com/economy/";

  /// Döviz kurlarının Türk Lirasına karşı durumlarını anlık olarak getiren servis.
  Future<List<DovizModel>> tlDoviz() async {
    try {
      var url = Uri.parse(baseUrl + "allCurrency");
      var headers = {
        "content-type": "application/json",
        "authorization": apiKey,
      };
      var res = await http.get(url, headers: headers);

      var body = json.decode(res.body);
      if (body["success"] == true) {
        var result = body["result"] as List;
        return result.map((e) => DovizModel.fromJson(e)).toList();
      } else
        throw (body);
    } catch (e) {
      debugPrint("DovizApi tlDoviz HATA : $e");
      return [];
    }
  }
}
