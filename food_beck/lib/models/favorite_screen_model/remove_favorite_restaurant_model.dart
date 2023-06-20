// To parse this JSON data, do
//
//     final removeFavoriterestaurantModel = removeFavoriterestaurantModelFromJson(jsonString);

import 'dart:convert';

RemoveFavoriteRestaurantModel removeFavoriterestaurantModelFromJson(
        String str) =>
    RemoveFavoriteRestaurantModel.fromJson(json.decode(str));

String removeFavoriterestaurantModelToJson(
    RemoveFavoriteRestaurantModel data) =>
    json.encode(data.toJson());

class RemoveFavoriteRestaurantModel {
  bool success;
  String message;

  RemoveFavoriteRestaurantModel({
    required this.success,
    required this.message,
  });

  factory RemoveFavoriteRestaurantModel.fromJson(Map<String, dynamic> json) =>
      RemoveFavoriteRestaurantModel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
