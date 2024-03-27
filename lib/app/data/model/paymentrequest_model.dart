// To parse this JSON data, do
//
//     final paymentRequestModel = paymentRequestModelFromJson(jsonString);
import 'dart:convert';

PaymentRequestModel paymentRequestModelFromJson(String str) =>
    PaymentRequestModel.fromJson(json.decode(str));
String paymentRequestModelToJson(PaymentRequestModel data) =>
    json.encode(data.toJson());

class PaymentRequestModel {
  String? paymentId;
  String? amount;
  String? status;
  PaymentRequestModel({
    this.paymentId,
    this.amount,
    this.status,
  });
  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      PaymentRequestModel(
        paymentId: json["payment_id"],
        amount: json["amount"],
        status: json["status"],
      );
  Map<String, dynamic> toJson() => {
        "payment_id": paymentId,
        "amount": amount,
        "status": status,
      };
}
