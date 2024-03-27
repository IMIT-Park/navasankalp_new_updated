// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

List<HistoryModel> historyModelFromJson(String str) => List<HistoryModel>.from(
    json.decode(str).map((x) => HistoryModel.fromJson(x)));

String historyModelToJson(List<HistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryModel {
  int? id;
  String? title;
  String? description;
  String? link;
  String? createdAt;
  String? updatedAt;

  HistoryModel({
    this.id,
    this.title,
    this.description,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        link: json["link"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "link": link,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  static listFromJson(list) =>
      List<HistoryModel>.from(list.map((x) => HistoryModel.fromJson(x)));
}
