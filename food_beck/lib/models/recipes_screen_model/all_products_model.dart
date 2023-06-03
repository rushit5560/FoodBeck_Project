// To parse this JSON data, do
//
//     final takeYourPickProductModel = takeYourPickProductModelFromJson(jsonString);

import 'dart:convert';

AllProductsModel takeYourPickProductModelFromJson(String str) => AllProductsModel.fromJson(json.decode(str));

String takeYourPickProductModelToJson(AllProductsModel data) => json.encode(data.toJson());

class AllProductsModel {
  AllProductsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final List<TakeYourPickProduct> data;
  final String message;

  factory AllProductsModel.fromJson(Map<String, dynamic> json) => AllProductsModel(
    success: json["success"]??"",
    data: List<TakeYourPickProduct>.from(json["data"].map((x) => TakeYourPickProduct.fromJson(x))??{}),
    message: json["message"]??"",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    //"data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class TakeYourPickProduct {
  TakeYourPickProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    this.subcategoryId,
    required this.variations,
    required this.addOns,
    this.attributes,
    this.choiceOptions,
    required this.price,
    required this.discount,
    required this.discountType,
    required this.availableTimeStarts,
    required this.availableTimeEnds,
    required this.veg,
    this.calories,
    this.minimumorderquantity,
    this.totalallowedquantity,
    required this.status,
    required this.restaurantId,
    required this.orderCount,
    required this.avgRating,
    required this.ratingCount,
    this.rating,
    required this.recommended,
    this.slug,
    // required this.createdAt,
    // required this.updatedAt,
  });

  final int id;
  final String name;
  final String description;
  final String image;
  final int categoryId;
  final dynamic subcategoryId;
  final String variations;
  final String addOns;
  final String? attributes;
  final String? choiceOptions;
  final String price;
  final String discount;
  final String discountType;
  final String availableTimeStarts;
  final String availableTimeEnds;
  final int veg;
  final String? calories;
  final String? minimumorderquantity;
  final String? totalallowedquantity;
  final int status;
  final int restaurantId;
  final int orderCount;
  final int avgRating;
  final int ratingCount;
  final dynamic rating;
  final int recommended;
  final dynamic slug;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  factory TakeYourPickProduct.fromJson(Map<String, dynamic> json) => TakeYourPickProduct(
    id: json["id"]??0,
    name: json["name"]??"",
    description: json["description"]??"",
    image: json["image"]??"",
    categoryId: json["category_id"]??0,
    subcategoryId: json["subcategory_id"]??"",
    variations: json["variations"]??"",
    addOns: json["add_ons"]??"",
    attributes: json["attributes"]??"",
    choiceOptions: json["choice_options"]??"",
    price: json["price"]??"",
    discount: json["discount"]??"",
    discountType: json["discount_type"]??"",
    availableTimeStarts: json["available_time_starts"]??"",
    availableTimeEnds: json["available_time_ends"]??"",
    veg: json["veg"]??0,
    calories: json["calories"]??"",
    minimumorderquantity: json["minimumorderquantity"]??"",
    totalallowedquantity: json["totalallowedquantity"]??"",
    status: json["status"]??0,
    restaurantId: json["restaurant_id"]??0,
    orderCount: json["order_count"]??0,
    avgRating: json["avg_rating"]??0,
    ratingCount: json["rating_count"]??0,
    rating: json["rating"]??"",
    recommended: json["recommended"]??0,
    slug: json["slug"]??"",
    // createdAt: DateTime.parse(json["created_at"]??""),
    // updatedAt: DateTime.parse(json["updated_at"]??""),
  );
  //
  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "description": description,
  //   "image": image,
  //   "category_id": categoryId,
  //   "subcategory_id": subcategoryId,
  //   "variations": variations,
  //   "add_ons": addOns,
  //   "attributes": attributes,
  //   "choice_options": choiceOptions,
  //   "price": price,
  //   "discount": discount,
  //   "discount_type": discountType,
  //   "available_time_starts": availableTimeStarts,
  //   "available_time_ends": availableTimeEnds,
  //   "veg": veg,
  //   "calories": calories,
  //   "minimumorderquantity": minimumorderquantity,
  //   "totalallowedquantity": totalallowedquantity,
  //   "status": status,
  //   "restaurant_id": restaurantId,
  //   "order_count": orderCount,
  //   "avg_rating": avgRating,
  //   "rating_count": ratingCount,
  //   "rating": rating,
  //   "recommended": recommended,
  //   "slug": slug,
  //   // "created_at": createdAt.toIso8601String(),
  //   // "updated_at": updatedAt.toIso8601String(),
  // };
}
