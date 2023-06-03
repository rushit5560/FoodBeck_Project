// To parse this JSON data, do
//
//     final allPopularRestaurants = allPopularRestaurantsFromJson(jsonString);

import 'dart:convert';

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

class RestaurantData {
  RestaurantData({
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
    required this.comission,
    required this.scheduleOrder,
    required this.openingTime,
    required this.closeingTime,
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
    required this.perKmShippingCharge,
    required this.restaurantModel,
    required this.maximumShippingCharge,
    // this.slug,
    required this.orderSubscriptionActive,
    // required this.createdAt,
    required this.isFav,

    // required this.updatedAt,
  });

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
  String comission;
  int scheduleOrder;
  String openingTime;
  String closeingTime;
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
  int perKmShippingCharge;
  String restaurantModel;
  int maximumShippingCharge;
  // dynamic slug;
  int orderSubscriptionActive;
  bool isFav;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory RestaurantData.fromJson(Map<String, dynamic> json) =>
      RestaurantData(
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
        comission: json["comission"] ?? "",
        scheduleOrder: json["schedule_order"] ?? 0,
        openingTime: json["opening_time"] ?? "",
        closeingTime: json["closeing_time"] ?? "",
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
        perKmShippingCharge: json["per_km_shipping_charge"] ?? 0,
        restaurantModel: json["restaurant_model"] ?? "",
        maximumShippingCharge: json["maximum_shipping_charge"] ?? 0,
        // slug: json["slug"],
        orderSubscriptionActive: json["order_subscription_active"] ?? 0,
        isFav: json["IsFav"] ?? false,

        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  //     "phone": phone,
  //     "email": email,
  //     "logo": logo,
  //     "daily_time_schedule": dailyTimeSchedule,
  //     "latitude": latitude,
  //     "longitude": longitude,
  //     "address": address,
  //     "footer_text": footerText,
  //     "minimum_order": minimumOrder,
  //     "comission": comission,
  //     "schedule_order": scheduleOrder,
  //     "opening_time": openingTime,
  //     "closeing_time": closeingTime,
  //     "status": status,
  //     "vendor_id": vendorId,
  //     "free_delivery": freeDelivery,
  //     "rating": rating,
  //     "cover_photo": coverPhoto,
  //     "delivery": delivery,
  //     "take_away": takeAway,
  //     "food_section": foodSection,
  //     "tax": tax,
  //     "zone_id": zoneId,
  //     "reviews_section": reviewsSection,
  //     "active": active,
  //     "off_day": offDay,
  //     "gst": gst,
  //     "self_delivery_system": selfDeliverySystem,
  //     "pos_system": posSystem,
  //     "description": description,
  //     "minimum_shipping_charge": minimumShippingCharge,
  //     "delivery_time": deliveryTime,
  //     "veg": veg,
  //     "non_veg": nonVeg,
  //     "order_count": orderCount,
  //     "total_order": totalOrder,
  //     "per_km_shipping_charge": perKmShippingCharge,
  //     "restaurant_model": restaurantModel,
  //     "maximum_shipping_charge": maximumShippingCharge,
  //     "slug": slug,
  //     "order_subscription_active": orderSubscriptionActive,
  //     "created_at": createdAt.toIso8601String(),
  //     "updated_at": updatedAt.toIso8601String(),
  // };
}
