// To parse this JSON data, do
//
//     final directoryModel = directoryModelFromJson(jsonString);

import 'dart:convert';

DirectoryModel directoryModelFromJson(String str) =>
    DirectoryModel.fromJson(json.decode(str));

String directoryModelToJson(DirectoryModel data) => json.encode(data.toJson());

class DirectoryModel {
  List<Datum>? data;

  DirectoryModel({
    this.data,
  });

  factory DirectoryModel.fromJson(Map<String, dynamic> json) => DirectoryModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? head;
  String? designation;
  String? name;
  String? image;
  String? address;
  String? phone;
  String? landline;
  String? email;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.head,
    this.designation,
    this.name,
    this.image,
    this.address,
    this.phone,
    this.landline,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        head: json["head"],
        designation: json["designation"],
        name: json["name"],
        image: json["image"],
        address: json["address"],
        phone: json["phone"],
        landline: json["landline"],
        email: json["email"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "head": head,
        "designation": designation,
        "name": name,
        "image": image,
        "address": address,
        "phone": phone,
        "landline": landline,
        "email": email,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
