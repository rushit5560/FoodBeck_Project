// To parse this JSON data, do
//
//     final cartUpdateModel = cartUpdateModelFromJson(jsonString);

import 'dart:convert';

CartUpdateModel cartUpdateModelFromJson(String str) =>
    CartUpdateModel.fromJson(json.decode(str));

class CartUpdateModel {
  bool success;
  String message;
  String error;


  CartUpdateModel({
    required this.success,
    required this.message,
    required this.error,

  });

  factory CartUpdateModel.fromJson(Map<String, dynamic> json) =>
      CartUpdateModel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        error: json["error"] ?? "",

      );
}
