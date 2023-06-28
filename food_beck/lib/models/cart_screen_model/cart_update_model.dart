// To parse this JSON data, do
//
//     final cartUpdateModel = cartUpdateModelFromJson(jsonString);

import 'dart:convert';

CartUpdateModel cartUpdateModelFromJson(String str) =>
    CartUpdateModel.fromJson(json.decode(str));

class CartUpdateModel {
  bool success;
  String message;

  CartUpdateModel({
    required this.success,
    required this.message,
  });

  factory CartUpdateModel.fromJson(Map<String, dynamic> json) =>
      CartUpdateModel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
      );
}
