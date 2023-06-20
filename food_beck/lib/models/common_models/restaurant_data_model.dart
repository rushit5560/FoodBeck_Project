

class RestaurantData {
  int id;
  String name;
  String phone;
  String email;
  String logo;
  // String dailyTimeSchedule;
  // dynamic latitude;
  // dynamic longitude;
  String address;
  String currency;
  // dynamic footerText;
  String minimumOrder;
  // dynamic comission;
  String scheduleOrder;
  String openingTime;
  String closeingTime;
  String status;
  String vendorId;
  String freeDelivery;
  // dynamic rating;
  String coverPhoto;
  String delivery;
  String takeAway;
  String foodSection;
  String tax;
  String zoneId;
  String reviewsSection;
  String active;
  String offDay;
  // dynamic gst;
  String selfDeliverySystem;
  String posSystem;
  String description;
  String minimumShippingCharge;
  String deliveryTime;
  String veg;
  String nonVeg;
  String orderCount;
  String totalOrder;
  // dynamic perKmShippingCharge;
  String restaurantModel;
  // dynamic maximumShippingCharge;
  // dynamic slug;
  String orderSubscriptionActive;
  // DateTime createdAt;
  // DateTime updatedAt;
  String ordersCount;
  bool isFav;

  RestaurantData({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.logo,
    // this.dailyTimeSchedule,
    // this.latitude,
    // this.longitude,
    required this.address,
    required this.currency,
    // this.footerText,
    required this.minimumOrder,
    // this.comission,
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
    // this.perKmShippingCharge,
    required this.restaurantModel,
    // this.maximumShippingCharge,
    // this.slug,
    required this.orderSubscriptionActive,
    // this.createdAt,
    // this.updatedAt,
    required this.ordersCount,
    required this.isFav,
  });

  factory RestaurantData.fromJson(Map<String, dynamic> json) => RestaurantData(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    phone: json["phone"] ?? "",
    email: json["email"] ?? "",
    logo: json["logo"] ?? "",
    // dailyTimeSchedule: json["daily_time_schedule"],
    // latitude: json["latitude"],
    // longitude: json["longitude"],
    address: json["address"] ?? "",
    currency: json["currency"] ?? "",
    // footerText: json["footer_text"],
    minimumOrder: json["minimum_order"] ?? "",
    // comission: json["comission"],
    scheduleOrder: json["schedule_order"] ?? "",
    openingTime: json["opening_time"] ?? "",
    closeingTime: json["closeing_time"] ?? "",
    status: json["status"] ?? "",
    vendorId: json["vendor_id"] ?? "",
    freeDelivery: json["free_delivery"] ?? "",
    // rating: json["rating"],
    coverPhoto: json["cover_photo"] ?? "",
    delivery: json["delivery"] ?? "",
    takeAway: json["take_away"] ?? "",
    foodSection: json["food_section"] ?? "",
    tax: json["tax"] ?? "",
    zoneId: json["zone_id"] ?? "",
    reviewsSection: json["reviews_section"] ?? "",
    active: json["active"] ?? "",
    offDay: json["off_day"] ?? "",
    // gst: json["gst"],
    selfDeliverySystem: json["self_delivery_system"] ?? "",
    posSystem: json["pos_system"] ?? "",
    description: json["description"] ?? "",
    minimumShippingCharge: json["minimum_shipping_charge"] ?? "",
    deliveryTime: json["delivery_time"] ?? "",
    veg: json["veg"] ?? "",
    nonVeg: json["non_veg"] ?? "",
    orderCount: json["order_count"] ?? "",
    totalOrder: json["total_order"] ?? "",
    // perKmShippingCharge: json["per_km_shipping_charge"],
    restaurantModel: json["restaurant_model"] ?? "",
    // maximumShippingCharge: json["maximum_shipping_charge"],
    // slug: json["slug"],
    orderSubscriptionActive: json["order_subscription_active"] ?? "",
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
    ordersCount: json["orders_count"] ?? "",
    isFav: json["IsFav"] ?? false,
  );

}