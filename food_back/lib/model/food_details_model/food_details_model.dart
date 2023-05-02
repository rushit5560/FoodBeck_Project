import 'dart:convert';

FoodDetailsModel foodDetailsModelFromJson(String str) => FoodDetailsModel.fromJson(json.decode(str));

String foodDetailsModelToJson(FoodDetailsModel data) => json.encode(data.toJson());

class FoodDetailsModel {
  bool success;
  FoodData data;
  String message;

  FoodDetailsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory FoodDetailsModel.fromJson(Map<String, dynamic> json) => FoodDetailsModel(
    success: json["success"] ?? false,
    data: FoodData.fromJson(json["data"] ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class FoodData {
  int id;
  String name;
  String description;
  String image;
  int categoryId;
  int subcategoryId;
  List<Variation> variations;
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
  Restaurant restaurant;

  FoodData({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.subcategoryId,
    required this.variations,
    // this.addOns,
    // this.attributes,
    // this.choiceOptions,
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
    // this.slug,
    // this.createdAt,
    // this.updatedAt,
    required this.restaurant,
  });

  factory FoodData.fromJson(Map<String, dynamic> json) => FoodData(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    image: json["image"] ?? "",
    categoryId: json["category_id"] ?? 0,
    subcategoryId: json["subcategory_id"] ?? 0,
    variations: List<Variation>.from((json["variations"] ?? []).map((x) => Variation.fromJson(x))),
    // addOns: json["add_ons"],
    // attributes: json["attributes"],
    // choiceOptions: json["choice_options"],
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
    rating: json["rating"] ?? "0",
    recommended: json["recommended"] ?? 0,
    // slug: json["slug"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
    restaurant: Restaurant.fromJson(json["restaurant"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
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
    "restaurant": restaurant.toJson(),
  };
}

class Restaurant {
  String name;
  int id;

  Restaurant({
    required this.name,
    required this.id,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    name: json["name"] ?? "",
    id: json["id"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}

class Variation {
  String name;
  List<VariantValue> values;
  String selectedVariantValue;

  Variation({
    required this.name,
    required this.values,
    required this.selectedVariantValue,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    name: json["name"] ?? "",
    values: List<VariantValue>.from((json["values"] ?? []).map((x) => VariantValue.fromJson(x))),
    selectedVariantValue: json["values"][0]['optionPrice']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "values": List<dynamic>.from(values.map((x) => x.toJson())),
  };
}

class VariantValue {
  String label;
  String optionPrice;

  VariantValue({
    required this.label,
    required this.optionPrice,
  });

  factory VariantValue.fromJson(Map<String, dynamic> json) => VariantValue(
    label: json["label"] ?? "",
    optionPrice: json["optionPrice"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "optionPrice": optionPrice,
  };
}
