import 'dart:convert';

import '../common_models/restaurant_data_model.dart';

AllPopularRestaurantsModel allPopularRestaurantsFromJson(String str) =>
    AllPopularRestaurantsModel.fromJson(json.decode(str));

String allPopularRestaurantsToJson(AllPopularRestaurantsModel data) =>
    json.encode(data.toJson());

class AllPopularRestaurantsModel {
  AllPopularRestaurantsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<RestaurantData> data;
  String message;

  factory AllPopularRestaurantsModel.fromJson(Map<String, dynamic> json) =>
      AllPopularRestaurantsModel(
        success: json["success"] ?? false,
        data: List<RestaurantData>.from(
            json["data"].map((x) => RestaurantData.fromJson(x)) ?? []),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        // "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}




