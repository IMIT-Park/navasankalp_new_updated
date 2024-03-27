// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) =>
    List<TransactionModel>.from(
        json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
  int? pId;
  String? phone;
  String? amount;
  int? status;
  int? statusMessage;
  String? createdAt;
  String? updatedAt;
  String? paymentId;

  TransactionModel({
    this.pId,
    this.phone,
    this.amount,
    this.status,
    this.statusMessage,
    this.createdAt,
    this.updatedAt,
    this.paymentId,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        pId: json["p_id"],
        phone: json["phone"],
        amount: json["amount"],
        status: json["status"],
        statusMessage: json["status_message"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        paymentId: json["payment_id"],
      );

  Map<String, dynamic> toJson() => {
        "p_id": pId,
        "phone": phone,
        "amount": amount,
        "status": status,
        "status_message": statusMessage,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "payment_id": paymentId,
      };

  static listFromJson(list) => List<TransactionModel>.from(
      list.map((x) => TransactionModel.fromJson(x)));
}
