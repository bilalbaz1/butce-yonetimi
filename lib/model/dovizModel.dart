// To parse this JSON data, do
//
//     final dovizModel = dovizModelFromJson(jsonString);

import 'dart:convert';

DovizModel dovizModelFromJson(String str) =>
    DovizModel.fromJson(json.decode(str));

String dovizModelToJson(DovizModel data) => json.encode(data.toJson());

class DovizModel {
  DovizModel({
    this.name,
    this.code,
    this.buying,
    this.buyingstr,
    this.selling,
    this.sellingstr,
    this.rate,
    this.time,
    this.date,
    this.datetime,
    this.calculated,
  });

  String name;
  String code;
  double buying;
  String buyingstr;
  double selling;
  String sellingstr;
  double rate;
  String time;
  DateTime date;
  DateTime datetime;
  int calculated;

  factory DovizModel.fromJson(Map<String, dynamic> json) => DovizModel(
        name: json["name"],
        code: json["code"],
        buying: json["buying"].toDouble(),
        buyingstr: json["buyingstr"],
        selling: json["selling"].toDouble(),
        sellingstr: json["sellingstr"],
        rate: json["rate"].toDouble(),
        time: json["time"],
        date: DateTime.parse(json["date"]),
        datetime: DateTime.parse(json["datetime"]),
        calculated: json["calculated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "buying": buying,
        "buyingstr": buyingstr,
        "selling": selling,
        "sellingstr": sellingstr,
        "rate": rate,
        "time": time,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "datetime": datetime.toIso8601String(),
        "calculated": calculated,
      };
}
