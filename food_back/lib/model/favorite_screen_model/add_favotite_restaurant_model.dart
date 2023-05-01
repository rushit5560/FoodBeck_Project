// To parse this JSON data, do
//
//     final addFavoriterestaurantModel = addFavoriterestaurantModelFromJson(jsonString);

import 'dart:convert';

AddFavoriterestaurantModel addFavoriterestaurantModelFromJson(String str) =>
    AddFavoriterestaurantModel.fromJson(json.decode(str));

// String addFavoriterestaurantModelToJson(AddFavoriterestaurantModel data) => json.encode(data.toJson());

class AddFavoriterestaurantModel {
  bool success;
  AddFavoriterestaurant data;
  String message;

  AddFavoriterestaurantModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AddFavoriterestaurantModel.fromJson(Map<String, dynamic> json) =>
      AddFavoriterestaurantModel(
        success: json["success"] ?? false,
        data: AddFavoriterestaurant.fromJson(json["data"] ?? {}),
        message: json["message"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "success": success,
  //     "data": data.toJson(),
  //     "message": message,
  // };
}

class AddFavoriterestaurant {
  String userId;
  String restaurantId;
  // DateTime updatedAt;
  // DateTime createdAt;
  int id;

  AddFavoriterestaurant({
    required this.userId,
    required this.restaurantId,
    // required this.updatedAt,
    // required this.createdAt,
    required this.id,
  });

  factory AddFavoriterestaurant.fromJson(Map<String, dynamic> json) =>
      AddFavoriterestaurant(
        userId: json["user_id"] ?? "",
        restaurantId: json["restaurant_id"] ?? "",
        // updatedAt: DateTime.parse(json["updated_at"]),
        // createdAt: DateTime.parse(json["created_at"]),
        id: json["id"] ?? 0,
      );

  // Map<String, dynamic> toJson() => {
  //     "user_id": userId,
  //     "restaurant_id": restaurantId,
  //     "updated_at": updatedAt.toIso8601String(),
  //     "created_at": createdAt.toIso8601String(),
  //     "id": id,
  // };
}
