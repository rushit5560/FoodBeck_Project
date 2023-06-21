import 'dart:convert';

import '../common_models/food_data_model.dart';

AllFoodModel allFoodModelFromJson(String str) => AllFoodModel.fromJson(json.decode(str));

// String allFoodModelToJson(AllFoodModel data) => json.encode(data.toJson());

class AllFoodModel {
  bool success;
  List<FoodData> data;
  String message;

  AllFoodModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AllFoodModel.fromJson(Map<String, dynamic> json) => AllFoodModel(
    success: json["success"] ?? false,
    data: List<FoodData>.from((json["data"] ?? []).map((x) => FoodData.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

