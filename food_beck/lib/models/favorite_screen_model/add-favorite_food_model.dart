// To parse this JSON data, do
//
//     final addFavoriteFoodModel = addFavoriteFoodModelFromJson(jsonString);

import 'dart:convert';

AddFavoriteFoodModel addFavoriteFoodModelFromJson(String str) =>
    AddFavoriteFoodModel.fromJson(json.decode(str));

// String addFavoriteFoodModelToJson(AddFavoriteFoodModel data) => json.encode(data.toJson());

class AddFavoriteFoodModel {
  bool success;
  AddFavoriteFood data;
  String message;

  AddFavoriteFoodModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AddFavoriteFoodModel.fromJson(Map<String, dynamic> json) =>
      AddFavoriteFoodModel(
        success: json["success"] ?? false,
        data: AddFavoriteFood.fromJson(json["data"] ?? {}),
        message: json["message"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "success": success,
  //     "data": data.toJson(),
  //     "message": message,
  // };
}

class AddFavoriteFood {
  String userId;
  String foodId;
  // DateTime updatedAt;
  // DateTime createdAt;
  int id;

  AddFavoriteFood({
    required this.userId,
    required this.foodId,
    // required this.updatedAt,
    // required this.createdAt,
    required this.id,
  });

  factory AddFavoriteFood.fromJson(Map<String, dynamic> json) =>
      AddFavoriteFood(
        userId: json["user_id"] ?? "",
        foodId: json["food_id"] ?? "",
        // updatedAt: DateTime.parse(json["updated_at"]),
        // createdAt: DateTime.parse(json["created_at"]),
        id: json["id"] ?? 0,
      );

  // Map<String, dynamic> toJson() => {
  //     "user_id": userId,
  //     "food_id": foodId,
  //     "updated_at": updatedAt.toIso8601String(),
  //     "created_at": createdAt.toIso8601String(),
  //     "id": id,
  // };
}
