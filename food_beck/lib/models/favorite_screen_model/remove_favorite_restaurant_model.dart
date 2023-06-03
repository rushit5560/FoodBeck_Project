// To parse this JSON data, do
//
//     final removeFavoriterestaurantModel = removeFavoriterestaurantModelFromJson(jsonString);

import 'dart:convert';

RemoveFavoriterestaurantModel removeFavoriterestaurantModelFromJson(
        String str) =>
    RemoveFavoriterestaurantModel.fromJson(json.decode(str));

String removeFavoriterestaurantModelToJson(
        RemoveFavoriterestaurantModel data) =>
    json.encode(data.toJson());

class RemoveFavoriterestaurantModel {
  bool success;
  String message;

  RemoveFavoriterestaurantModel({
    required this.success,
    required this.message,
  });

  factory RemoveFavoriterestaurantModel.fromJson(Map<String, dynamic> json) =>
      RemoveFavoriterestaurantModel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
