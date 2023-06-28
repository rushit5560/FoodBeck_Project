// To parse this JSON data, do
//
//     final addFavoriteRestaurantModel = addFavoriteRestaurantModelFromJson(jsonString);

import 'dart:convert';

AddFavoriteRestaurantModel addFavoriteRestaurantModelFromJson(String str) =>
    AddFavoriteRestaurantModel.fromJson(json.decode(str));

class AddFavoriteRestaurantModel {
  bool success;
  AddFavoriteRestaurant data;
  String message;

  AddFavoriteRestaurantModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AddFavoriteRestaurantModel.fromJson(Map<String, dynamic> json) =>
      AddFavoriteRestaurantModel(
        success: json["success"] ?? false,
        data: AddFavoriteRestaurant.fromJson(json["data"] ?? {}),
        message: json["message"] ?? "",
      );
}

class AddFavoriteRestaurant {
  String userId;
  String restaurantId;

  // DateTime updatedAt;
  // DateTime createdAt;
  int id;

  AddFavoriteRestaurant({
    required this.userId,
    required this.restaurantId,
    // required this.updatedAt,
    // required this.createdAt,
    required this.id,
  });

  factory AddFavoriteRestaurant.fromJson(Map<String, dynamic> json) =>
      AddFavoriteRestaurant(
        userId: json["user_id"] ?? "",
        restaurantId: json["restaurant_id"] ?? "",
        // updatedAt: DateTime.parse(json["updated_at"]),
        // createdAt: DateTime.parse(json["created_at"]),
        id: json["id"] ?? 0,
      );
}
