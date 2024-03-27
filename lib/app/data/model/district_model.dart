// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

List<DistrictModel> districtModelFromJson(String str) => List<DistrictModel>.from(json.decode(str).map((x) => DistrictModel.fromJson(x)));

String districtModelToJson(List<DistrictModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DistrictModel {
    int? id;
    String? district;
    dynamic createdAt;
    dynamic updatedAt;

    DistrictModel({
        this.id,
        this.district,
        this.createdAt,
        this.updatedAt,
    });

    factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        id: json["id"],
        district: json["district"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "district": district,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
     static listFromJson(list) =>
      List<DistrictModel>.from(list.map((x) => DistrictModel.fromJson(x)));
}
