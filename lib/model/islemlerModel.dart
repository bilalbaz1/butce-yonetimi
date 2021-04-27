// To parse this JSON data, do
//
//     final islemlerModel = islemlerModelFromJson(jsonString);

//  flutter packages pub run build_runner build --delete-conflicting-outputs

import 'dart:convert';
import 'package:hive/hive.dart';
part 'islemlerModel.g.dart';

IslemlerModel islemlerModelFromJson(String str) =>
    IslemlerModel.fromJson(json.decode(str));

String islemlerModelToJson(IslemlerModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class IslemlerModel {
  IslemlerModel({
    this.baslik,
    this.kategori,
    this.isKazanc,
    this.tutar,
    this.kartNo,
    this.tarih,
  });

  @HiveField(0)
  String baslik;

  @HiveField(1)
  String kategori;

  @HiveField(2)
  bool isKazanc;

  @HiveField(3)
  double tutar;

  @HiveField(4)
  int kartNo;

  @HiveField(5)
  int hiveIndex;

  @HiveField(6)
  DateTime tarih;

  factory IslemlerModel.fromJson(Map<String, dynamic> json) => IslemlerModel(
        baslik: json["baslik"],
        kategori: json["kategori"],
        isKazanc: json["isKazanc"],
        tutar: json["tutar"],
        kartNo: json["kartNo"],
        tarih: json["tarih"],
      );

  Map<String, dynamic> toJson() => {
        "baslik": baslik,
        "kategori": kategori,
        "isKazanc": isKazanc,
        "tutar": tutar,
        "kartNo": kartNo,
        "tarih": tarih,
      };
}
