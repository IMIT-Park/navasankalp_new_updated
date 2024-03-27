// To parse this JSON data, do
//
//     final sloganModel = sloganModelFromJson(jsonString);

import 'dart:convert';

List<SloganModel> sloganModelFromJson(String str) => List<SloganModel>.from(
    json.decode(str).map((x) => SloganModel.fromJson(x)));

String sloganModelToJson(List<SloganModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SloganModel {
  int? id;
  String? slogan;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  SloganModel({
    this.id,
    this.slogan,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory SloganModel.fromJson(Map<String, dynamic> json) => SloganModel(
        id: json["id"],
        slogan: json["slogan"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slogan": slogan,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };

  static listFromJson(list) => List<SloganModel>.from(list.map(
        (x) => SloganModel.fromJson(x),
      ));
}
