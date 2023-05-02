import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  bool success;
  Data data;
  String message;

  SearchModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    success: json["success"] ?? false,
    data: Data.fromJson(json["data"] ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  List<Food> food;
  List<Restaurant> restaurant;

  Data({
    required this.food,
    required this.restaurant,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    food: List<Food>.from((json["food"] ?? []).map((x) => Food.fromJson(x ?? {}))),
    restaurant: List<Restaurant>.from((json["restaurant"] ?? []).map((x) => Restaurant.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "food": List<dynamic>.from(food.map((x) => x.toJson())),
    "restaurant": List<dynamic>.from(restaurant.map((x) => x.toJson())),
  };
}

class Food {
  int id;
  String name;
  String description;
  String image;
  int categoryId;
  int subcategoryId;
  String variations;
  String addOns;
  // dynamic attributes;
  // dynamic choiceOptions;
  String price;
  String discount;
  String discountType;
  String availableTimeStarts;
  String availableTimeEnds;
  int veg;
  // dynamic calories;
  // dynamic minimumorderquantity;
  // dynamic totalallowedquantity;
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

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.subcategoryId,
    required this.variations,
    required this.addOns,
    // this.attributes,
    // this.choiceOptions,
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
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    image: json["image"] ?? "",
    categoryId: json["category_id"] ?? 0,
    subcategoryId: json["subcategory_id"] ?? 0,
    variations: json["variations"] ?? "",
    addOns: json["add_ons"] ?? "",
    // attributes: json["attributes"],
    // choiceOptions: json["choice_options"],
    price: json["price"] ?? "",
    discount: json["discount"] ?? "",
    discountType: json["discount_type"] ?? "",
    availableTimeStarts: json["available_time_starts"] ?? "",
    availableTimeEnds: json["available_time_ends"] ?? "",
    veg: json["veg"] ?? 0,
    // calories: json["calories"],
    // minimumorderquantity: json["minimumorderquantity"],
    // totalallowedquantity: json["totalallowedquantity"],
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
    // "attributes": attributes,
    // "choice_options": choiceOptions,
    "price": price,
    "discount": discount,
    "discount_type": discountType,
    "available_time_starts": availableTimeStarts,
    "available_time_ends": availableTimeEnds,
    "veg": veg,
    // "calories": calories,
    // "minimumorderquantity": minimumorderquantity,
    // "totalallowedquantity": totalallowedquantity,
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

class Restaurant {
  int id;
  String name;
  String phone;
  String email;
  String logo;
  // dynamic dailyTimeSchedule;
  String latitude;
  String longitude;
  String address;
  // dynamic footerText;
  String minimumOrder;
  // dynamic comission;
  int scheduleOrder;
  // dynamic openingTime;
  // dynamic closeingTime;
  int status;
  int vendorId;
  int freeDelivery;
  // dynamic rating;
  String coverPhoto;
  int delivery;
  int takeAway;
  int foodSection;
  String tax;
  int zoneId;
  int reviewsSection;
  int active;
  String offDay;
  // dynamic gst;
  int selfDeliverySystem;
  int posSystem;
  String description;
  String minimumShippingCharge;
  String deliveryTime;
  int veg;
  int nonVeg;
  int orderCount;
  int totalOrder;
  // dynamic perKmShippingCharge;
  String restaurantModel;
  // dynamic maximumShippingCharge;
  // dynamic slug;
  int orderSubscriptionActive;
  // DateTime createdAt;
  // DateTime updatedAt;
  bool isFav;

  Restaurant({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.logo,
    // this.dailyTimeSchedule,
    required this.latitude,
    required this.longitude,
    required this.address,
    // this.footerText,
    required this.minimumOrder,
    // this.comission,
    required this.scheduleOrder,
    // this.openingTime,
    // this.closeingTime,
    required this.status,
    required this.vendorId,
    required this.freeDelivery,
    // this.rating,
    required this.coverPhoto,
    required this.delivery,
    required this.takeAway,
    required this.foodSection,
    required this.tax,
    required this.zoneId,
    required this.reviewsSection,
    required this.active,
    required this.offDay,
    // this.gst,
    required this.selfDeliverySystem,
    required this.posSystem,
    required this.description,
    required this.minimumShippingCharge,
    required this.deliveryTime,
    required this.veg,
    required this.nonVeg,
    required this.orderCount,
    required this.totalOrder,
    // this.perKmShippingCharge,
    required this.restaurantModel,
    // this.maximumShippingCharge,
    // this.slug,
    required this.orderSubscriptionActive,
    required this.isFav,

    // this.createdAt,
    // this.updatedAt,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    phone: json["phone"] ?? "",
    email: json["email"] ?? "",
    logo: json["logo"] ?? "",
    // dailyTimeSchedule: json["daily_time_schedule"],
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
    address: json["address"] ?? "",
    // footerText: json["footer_text"],
    minimumOrder: json["minimum_order"] ?? "",
    // comission: json["comission"],
    scheduleOrder: json["schedule_order"] ?? 0,
    // openingTime: json["opening_time"],
    // closeingTime: json["closeing_time"],
    status: json["status"] ?? 0,
    vendorId: json["vendor_id"] ?? 0,
    freeDelivery: json["free_delivery"] ?? 0,
    // rating: json["rating"],
    coverPhoto: json["cover_photo"] ?? "",
    delivery: json["delivery"] ?? 0,
    takeAway: json["take_away"] ?? 0,
    foodSection: json["food_section"] ?? 0,
    tax: json["tax"] ?? "",
    zoneId: json["zone_id"] ?? 0,
    reviewsSection: json["reviews_section"] ?? 0,
    active: json["active"] ?? 0,
    offDay: json["off_day"] ?? "",
    // gst: json["gst"],
    selfDeliverySystem: json["self_delivery_system"] ?? 0,
    posSystem: json["pos_system"] ?? 0,
    description: json["description"] ?? "",
    minimumShippingCharge: json["minimum_shipping_charge"] ?? "",
    deliveryTime: json["delivery_time"] ?? "",
    veg: json["veg"] ?? 0,
    nonVeg: json["non_veg"] ?? 0,
    orderCount: json["order_count"] ?? 0,
    totalOrder: json["total_order"] ?? 0,
    // perKmShippingCharge: json["per_km_shipping_charge"],
    restaurantModel: json["restaurant_model"] ?? "",
    // maximumShippingCharge: json["maximum_shipping_charge"],
    // slug: json["slug"],
    orderSubscriptionActive: json["order_subscription_active"] ?? 0,
    isFav: json["IsFav"] ?? false,
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "logo": logo,
    // "daily_time_schedule": dailyTimeSchedule,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    // "footer_text": footerText,
    "minimum_order": minimumOrder,
    // "comission": comission,
    "schedule_order": scheduleOrder,
    // "opening_time": openingTime,
    // "closeing_time": closeingTime,
    "status": status,
    "vendor_id": vendorId,
    "free_delivery": freeDelivery,
    // "rating": rating,
    "cover_photo": coverPhoto,
    "delivery": delivery,
    "take_away": takeAway,
    "food_section": foodSection,
    "tax": tax,
    "zone_id": zoneId,
    "reviews_section": reviewsSection,
    "active": active,
    "off_day": offDay,
    // "gst": gst,
    "self_delivery_system": selfDeliverySystem,
    "pos_system": posSystem,
    "description": description,
    "minimum_shipping_charge": minimumShippingCharge,
    "delivery_time": deliveryTime,
    "veg": veg,
    "non_veg": nonVeg,
    "order_count": orderCount,
    "total_order": totalOrder,
    // "per_km_shipping_charge": perKmShippingCharge,
    "restaurant_model": restaurantModel,
    // "maximum_shipping_charge": maximumShippingCharge,
    // "slug": slug,
    "order_subscription_active": orderSubscriptionActive,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}
