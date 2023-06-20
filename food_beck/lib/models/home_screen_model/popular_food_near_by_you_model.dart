import 'dart:convert';

import '../common_models/food_data_model.dart';

PopularFoodNearByModel popularFoodNearByModelFromJson(String str) => PopularFoodNearByModel.fromJson(json.decode(str));

String popularFoodNearByModelToJson(PopularFoodNearByModel data) => json.encode(data.toJson());

class PopularFoodNearByModel {
  PopularFoodNearByModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<FoodData> data;
  String message;

  factory PopularFoodNearByModel.fromJson(Map<String, dynamic> json) => PopularFoodNearByModel(
    success: json["success"] ?? false,
    data: List<FoodData>.from((json["data"] ?? []).map((x) => FoodData.fromJson(x))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

/*class PopularFoodData {
  PopularFoodData({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.subcategoryId,
    // required this.variations,
    // required this.addOns,
    // required this.attributes,
    // required this.choiceOptions,
    required this.price,
    required this.discount,
    required this.discountType,
    required this.availableTimeStarts,
    required this.availableTimeEnds,
    required this.veg,
    required this.calories,
    required this.minimumorderquantity,
    required this.totalallowedquantity,
    required this.status,
    required this.restaurantId,
    required this.orderCount,
    required this.avgRating,
    required this.ratingCount,
    required this.rating,
    required this.recommended,
    // required this.slug,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String name;
  String description;
  String image;
  int categoryId;
  int subcategoryId;
  // String variations;
  // String addOns;
  // String attributes;
  // String choiceOptions;
  String price;
  String discount;
  String discountType;
  String availableTimeStarts;
  String availableTimeEnds;
  int veg;
  String calories;
  String minimumorderquantity;
  String totalallowedquantity;
  int status;
  int restaurantId;
  int orderCount;
  int avgRating;
  int ratingCount;
  String rating;
  int recommended;
  // dynamic slug;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory PopularFoodData.fromJson(Map<String, dynamic> json) => PopularFoodData(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    image: json["image"] ?? "",
    categoryId: json["category_id"] ?? 0,
    subcategoryId: json["subcategory_id"] ?? 0,
    // variations: json["variations"] ?? "",
    // addOns: json["add_ons"] ?? "",
    // attributes: json["attributes"] ?? "",
    // choiceOptions: json["choice_options"] ?? "",
    price: json["price"] ?? "",
    discount: json["discount"] ?? "",
    discountType: json["discount_type"] ?? "",
    availableTimeStarts: json["available_time_starts"] ?? "",
    availableTimeEnds: json["available_time_ends"] ?? "",
    veg: json["veg"] ?? 0,
    calories: json["calories"] ?? "",
    minimumorderquantity: json["minimumorderquantity"] ?? "",
    totalallowedquantity: json["totalallowedquantity"] ?? "",
    status: json["status"] ?? 0,
    restaurantId: json["restaurant_id"] ?? 0,
    orderCount: json["order_count"] ?? 0,
    avgRating: json["avg_rating"] ?? 0,
    ratingCount: json["rating_count"] ?? 0,
    rating: json["rating"] ?? "",
    recommended: json["recommended"] ?? 0,
    // slug: json["slug"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    // "variations": variations,
    // "add_ons": addOns,
    // "attributes": attributes,
    // "choice_options": choiceOptions,
    "price": price,
    "discount": discount,
    "discount_type": discountType,
    "available_time_starts": availableTimeStarts,
    "available_time_ends": availableTimeEnds,
    "veg": veg,
    "calories": calories,
    "minimumorderquantity": minimumorderquantity,
    "totalallowedquantity": totalallowedquantity,
    "status": status,
    "restaurant_id": restaurantId,
    "order_count": orderCount,
    "avg_rating": avgRating,
    "rating_count": ratingCount,
    "rating": rating,
    "recommended": recommended,
    // "slug": slug,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}*/
