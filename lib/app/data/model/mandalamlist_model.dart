// To parse this JSON data, do
//
//     final mandalamModel = mandalamModelFromJson(jsonString);

import 'dart:convert';

List<MandalamModel> mandalamModelFromJson(String str) => List<MandalamModel>.from(json.decode(str).map((x) => MandalamModel.fromJson(x)));

String mandalamModelToJson(List<MandalamModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MandalamModel {
    int? id;
    String? name;
    int? parentId;
    String? president;
    String? phone;

    MandalamModel({
        this.id,
        this.name,
        this.parentId,
        this.president,
        this.phone,
    });

    factory MandalamModel.fromJson(Map<String, dynamic> json) => MandalamModel(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        president: json["president"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "president": president,
        "phone": phone,
    };

         static listFromJson(list) =>
      List<MandalamModel>.from(list.map((x) => MandalamModel.fromJson(x)));
}




// To parse this JSON data, do
//
//     final mandalamlistPostModel = mandalamlistPostModelFromJson(jsonString);


MandalamListRequest mandalamlistPostModelFromJson(String str) => MandalamListRequest.fromJson(json.decode(str));

String mandalamlistPostModelToJson(MandalamListRequest data) => json.encode(data.toJson());

class MandalamListRequest {
    String? block;

    MandalamListRequest({
        this.block,
    });

    factory MandalamListRequest.fromJson(Map<String, dynamic> json) => MandalamListRequest(
        block: json["block"],
    );

    Map<String, dynamic> toJson() => {
        "block": block,
    };
     static listFromJson(list) =>
      List<MandalamModel>.from(list.map((x) => MandalamModel.fromJson(x)));

}