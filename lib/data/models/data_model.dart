// To parse this JSON data, do
//
//     final debitModel = debitModelFromJson(jsonString);

import 'dart:convert';

DebitModel debitModelFromJson(String str) =>
    DebitModel.fromJson(json.decode(str));

class DebitModel {
  DebitModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum>? data;

  factory DebitModel.fromJson(Map<String, dynamic> json) => DebitModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.img,
    this.until,
    this.amount,
    this.outOfAmount,
  });

  String? id;
  String? name;
  String? img;
  String? until;
  String? amount;
  String? outOfAmount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["Name"],
        img: json["Img"],
        until: json["Until"],
        amount: json["Amount"],
        outOfAmount: json["OutOfAmount"],
      );
}
