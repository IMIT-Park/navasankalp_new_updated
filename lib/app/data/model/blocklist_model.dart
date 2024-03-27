// To parse this JSON data, do
//
//     final blockModel = blockModelFromJson(jsonString);

import 'dart:convert';

List<BlockModel> blockModelFromJson(String str) =>
    List<BlockModel>.from(json.decode(str).map((x) => BlockModel.fromJson(x)));

String blockModelToJson(List<BlockModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlockModel {
  int? id;
  String? name;
  int? parentId;
  int? districtId;
  String? president;
  String? phone;

  BlockModel({
    this.id,
    this.name,
    this.parentId,
    this.districtId,
    this.president,
    this.phone,
  });

  factory BlockModel.fromJson(Map<String, dynamic> json) => BlockModel(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        districtId: json["district_id"],
        president: json["president"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "district_id": districtId,
        "president": president,
        "phone": phone,
      };
      static listFromJson(list) =>
      List<BlockModel>.from(list.map((x) => BlockModel.fromJson(x)));
}
// To parse this JSON data, do
//
//     final blockRequestModel = blockRequestModelFromJson(jsonString);


BlockRequestModel blockRequestModelFromJson(String str) => BlockRequestModel.fromJson(json.decode(str));

String blockRequestModelToJson(BlockRequestModel data) => json.encode(data.toJson());

class BlockRequestModel {
    int? districtId;

    BlockRequestModel({
        this.districtId,
    });

    factory BlockRequestModel.fromJson(Map<String, dynamic> json) => BlockRequestModel(
        districtId: json["district_id"],
    );

    Map<String, dynamic> toJson() => {
        "district_id": districtId,
    };
}
