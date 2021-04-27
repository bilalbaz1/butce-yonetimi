// To parse this JSON data, do
//
//     final bilgilerModel = bilgilerModelFromJson(jsonString);

import 'dart:convert';

BilgilerModel bilgilerModelFromJson(String str) => BilgilerModel.fromJson(json.decode(str));

String bilgilerModelToJson(BilgilerModel data) => json.encode(data.toJson());

class BilgilerModel {
    BilgilerModel({
        this.ad,
        this.resim,
    });

    String ad;
    String resim;

    factory BilgilerModel.fromJson(Map<String, dynamic> json) => BilgilerModel(
        ad: json["ad"],
        resim: json["resim"],
    );

    Map<String, dynamic> toJson() => {
        "ad": ad,
        "resim": resim,
    };
}
