

class FoodData {
  int id;
  String name;
  String description;
  String image;
  String categoryId;
  // dynamic subcategoryId;
  List<Variation> variations;
  // dynamic addOns;
  String price;
  String discount;
  String discountType;
  String availableTimeStarts;
  String availableTimeEnds;
  String veg;
  // dynamic calories;
  // dynamic minimumorderquantity;
  // dynamic totalallowedquantity;
  String status;
  String restaurantId;
  String orderCount;
  String avgRating;
  String ratingCount;
  String rating;
  String recommended;
  // dynamic slug;
  // DateTime createdAt;
  // DateTime updatedAt;
  String ordersCount;
  Restaurant restaurant;
  bool isFav;

  FoodData({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    // this.subcategoryId,
    required this.variations,
    // this.addOns,
    required this.price,
    required this.discount,
    required this.discountType,
    required this.availableTimeStarts,
    required this.availableTimeEnds,
    required this.veg,
    // this.calories,
    // this.minimumorderquantity,
    // this.totalallowedquantity,
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
    required this.ordersCount,
    required this.restaurant,
    required this.isFav,
  });

  factory FoodData.fromJson(Map<String, dynamic> json) => FoodData(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    image: json["image"] ?? "",
    categoryId: json["category_id"] ?? "",
    // subcategoryId: json["subcategory_id"],
    variations: List<Variation>.from((json["variations"] ?? []).map((x) => Variation.fromJson(x ?? {}))),
    // addOns: json["add_ons"],
    price: json["price"] ?? "",
    discount: json["discount"] ?? "",
    discountType: json["discount_type"] ?? "",
    availableTimeStarts: json["available_time_starts"] ?? "",
    availableTimeEnds: json["available_time_ends"] ?? "",
    veg: json["veg"] ?? "",
    // calories: json["calories"],
    // minimumorderquantity: json["minimumorderquantity"],
    // totalallowedquantity: json["totalallowedquantity"],
    status: json["status"] ?? "",
    restaurantId: json["restaurant_id"] ?? "",
    orderCount: json["order_count"] ?? "",
    avgRating: json["avg_rating"] ?? "",
    ratingCount: json["rating_count"] ?? "",
    rating: json["rating"] ?? "",
    recommended: json["recommended"] ?? "",
    // slug: json["slug"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
    ordersCount: json["orders_count"] ?? "",
    restaurant: Restaurant.fromJson(json["restaurant"] ?? {}),
    isFav: false,
  );

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
}

class Variation {
  String name;
  List<Value> values;

  Variation({
    required this.name,
    required this.values,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    name: json["name"] ?? "",
    values: List<Value>.from((json["values"] ?? []).map((x) => Value.fromJson(x ?? {}))),
  );

  /*Map<String, dynamic> toJson() => {
    "name": name,
    "values": List<dynamic>.from(values.map((x) => x.toJson())),
  };*/
}

class Value {
  String label;
  String optionPrice;

  Value({
    required this.label,
    required this.optionPrice,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    label: json["label"] ?? "",
    optionPrice: json["optionPrice"] ?? "",
  );

  /*Map<String, dynamic> toJson() => {
    "label": label,
    "optionPrice": optionPrice,
  };*/
}