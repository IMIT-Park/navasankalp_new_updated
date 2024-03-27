// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  int? id;
  int? userId;
  String? message;
  String? title;
  String? imageUrl;
  String? linkUrl;
  int? readStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotificationModel({
    this.id,
    this.userId,
    required this.message,
    required this.title,
    this.imageUrl,
    required this.linkUrl,
    required this.readStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        userId: json["user_id"],
        message: json["message"],
        title: json["title"],
        imageUrl: json["ImageURL"],
        linkUrl: json["linkUrl"],
        readStatus: json["read_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "message": message,
        "title": title,
        "ImageURL": imageUrl,
        "linkUrl": linkUrl,
        "read_status": readStatus,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  static listFromJson(list) => List<NotificationModel>.from(
      list.map((x) => NotificationModel.fromJson(x)));
}

// To parse this JSON data, do
//
//     final noficationReadRequestModel = noficationReadRequestModelFromJson(jsonString);

NoficationReadRequestModel noficationReadRequestModelFromJson(String str) =>
    NoficationReadRequestModel.fromJson(json.decode(str));

String noficationReadRequestModelToJson(NoficationReadRequestModel data) =>
    json.encode(data.toJson());

class NoficationReadRequestModel {
  int? notificationId;

  NoficationReadRequestModel({
    this.notificationId,
  });

  factory NoficationReadRequestModel.fromJson(Map<String, dynamic> json) =>
      NoficationReadRequestModel(
        notificationId: json["notification_id"],
      );

  Map<String, dynamic> toJson() => {
        "notification_id": notificationId,
      };
}
