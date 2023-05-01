import 'dart:convert';

FoodDetailsModel foodDetailsModelFromJson(String str) => FoodDetailsModel.fromJson(json.decode(str));

String foodDetailsModelToJson(FoodDetailsModel data) => json.encode(data.toJson());

class FoodDetailsModel {
  bool success;
  List<FoodData> data;
  String message;

  FoodDetailsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory FoodDetailsModel.fromJson(Map<String, dynamic> json) => FoodDetailsModel(
    success: json["success"] ?? false,
    data: List<FoodData>.from((json["data"] ?? []).map((x) => FoodData.fromJson(x))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class FoodData {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  int? subcategoryId;
  String? variations;
  String? addOns;
  String? attributes;
  String? choiceOptions;
  String? price;
  String? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? veg;
  String? calories;
  String? minimumorderquantity;
  String? totalallowedquantity;
  int? status;
  int? restaurantId;
  int? orderCount;
  int? avgRating;
  int? ratingCount;
  String? rating;
  int? recommended;
  // dynamic slug;
  // DateTime createdAt;
  // DateTime updatedAt;

  FoodData({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.subcategoryId,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.price,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.veg,
    this.calories,
    this.minimumorderquantity,
    this.totalallowedquantity,
    this.status,
    this.restaurantId,
    this.orderCount,
    this.avgRating,
    this.ratingCount,
    this.rating,
    this.recommended,
    // this.slug,
    // this.createdAt,
    // this.updatedAt,
  });

  factory FoodData.fromJson(Map<String, dynamic> json) => FoodData(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    image: json["image"] ?? "",
    categoryId: json["category_id"] ?? 0,
    subcategoryId: json["subcategory_id"] ?? 0,
    variations: json["variations"] ?? "",
    addOns: json["add_ons"] ?? "",
    attributes: json["attributes"] ?? "",
    choiceOptions: json["choice_options"] ?? "",
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
    "variations": variations,
    "add_ons": addOns,
    "attributes": attributes,
    "choice_options": choiceOptions,
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
}
