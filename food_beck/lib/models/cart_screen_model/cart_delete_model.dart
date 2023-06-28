// To parse this JSON data, do
//
//     final cartDeleteModel = cartDeleteModelFromJson(jsonString);

import 'dart:convert';

CartDeleteModel cartDeleteModelFromJson(String str) =>
    CartDeleteModel.fromJson(json.decode(str));

class CartDeleteModel {
  bool success;
  String error;

  CartDeleteModel({
    required this.success,
    required this.error,
  });

  factory CartDeleteModel.fromJson(Map<String, dynamic> json) =>
      CartDeleteModel(
        success: json["success"] ?? false,
        error: json["error"] ?? "",
      );
}
