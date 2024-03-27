// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

AccountModel accountModelFromJson(String str) => AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
    int? id;
    int? uId;
    String? userName;
    String? name;
    String? address;
    int? district;
    int? mandalam;
    int? booth;
    int? block;
    String? phoneNumber;
    String? photo;
    dynamic dob;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? blockId;
    String? blockName;
    int? mandalamId;
    String? mandalamName;
    String? districtName;

    AccountModel({
        this.id,
        this.uId,
        this.userName,
        this.name,
        this.address,
        this.district,
        this.mandalam,
        this.booth,
        this.block,
        this.phoneNumber,
        this.photo,
        this.dob,
        this.createdAt,
        this.updatedAt,
        this.blockId,
        this.blockName,
        this.mandalamId,
        this.mandalamName,
        this.districtName,
    });

    factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json["id"],
        uId: json["u_id"],
        userName: json["user_name"],
        name: json["name"],
        address: json["address"],
        district: json["district"],
        mandalam: json["mandalam"],
        booth: json["booth"],
        block: json["block"],
        phoneNumber: json["phone_number"],
        photo: json["photo"],
        dob: json["dob"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        blockId: json["block_id"],
        blockName: json["block_name"],
        mandalamId: json["mandalam_id"],
        mandalamName: json["mandalam_name"],
        districtName: json["district_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "u_id": uId,
        "user_name": userName,
        "name": name,
        "address": address,
        "district": district,
        "mandalam": mandalam,
        "booth": booth,
        "block": block,
        "phone_number": phoneNumber,
        "photo": photo,
        "dob": dob,
        "created_at": "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "updated_at": "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
        "block_id": blockId,
        "block_name": blockName,
        "mandalam_id": mandalamId,
        "mandalam_name": mandalamName,
        "district_name": districtName,
    };
}
// To parse this JSON data, do
//
//     final accountPostModel = accountPostModelFromJson(jsonString);


AccountPostModel accountPostModelFromJson(String str) => AccountPostModel.fromJson(json.decode(str));

String accountPostModelToJson(AccountPostModel data) => json.encode(data.toJson());

class AccountPostModel {
    String? name;
    String? address;
    int? district;
    int? mandalam;
    int? booth;
    int? block;
    String? phoneNumber;
    String? photo;

    AccountPostModel({
        this.name,
        this.address,
        this.district,
        this.mandalam,
        this.booth,
        this.block,
        this.phoneNumber,
        this.photo,
    });

    factory AccountPostModel.fromJson(Map<String, dynamic> json) => AccountPostModel(
        name: json["name"],
        address: json["address"],
        district: json["district"],
        mandalam: json["mandalam"],
        booth: json["booth"],
        block: json["block"],
        phoneNumber: json["phone_number"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "district": district,
        "mandalam": mandalam,
        "booth": booth,
        "block": block,
        "phone_number": phoneNumber,
        "photo": photo,
    };
}
