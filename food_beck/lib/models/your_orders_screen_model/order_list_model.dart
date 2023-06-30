import 'dart:convert';

import 'package:food_beck/models/common_models/food_data_model.dart';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

// String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  bool success;
  List<Datum> data;
  String message;

  OrderListModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    success: json["success"] ?? false,
    data: List<Datum>.from((json["data"] ?? []).map((x) => Datum.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  // Map<String, dynamic> toJson() => {
  //   "success": success,
  //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //   "message": message,
  // };
}

class Datum {
  int id;
  int userId;
  // dynamic couponDiscountTitle;
  String paymentStatus;
  String orderStatus;
  String paymentMethod;
  int deliveryAddressId;
  int deliveryManId;
  // dynamic couponCode;
  // dynamic orderNote;
  String orderType;
  int checked;
  int restaurantId;
  int zoneId;
  String orderAmount;
  String couponDiscountAmount;
  String totalTaxAmount;
  String deliveryCharge;
  String restaurantDiscountAmount;
  String originalDeliveryCharge;
  String adjusment;
  // dynamic transactionReference;
  int dmTips;
  String processingTime;
  // dynamic freeDeliveryBy;
  // dynamic refundRequestCanceled;
  // dynamic cancellationReason;
  // dynamic canceledBy;
  // dynamic taxStatus;
  // dynamic couponCreatedBy;
  // dynamic vehicleId;
  String discountOnProductBy;
  // dynamic scheduleAt;
  // dynamic callback;
  // dynamic otp;
  // dynamic pending;
  // dynamic accepted;
  // dynamic confirmed;
  // dynamic processing;
  // dynamic handover;
  // dynamic pickedUp;
  // dynamic delivered;
  // dynamic canceled;
  // dynamic refundRequested;
  // dynamic refunded;
  int scheduled;
  // dynamic deliveryAddress;
  int edited;
  int distance;
  // dynamic subscriptionId;
  int isSubscription;
  // dynamic failed;
  DateTime createdAt;
  // dynamic updatedAt;
  List<OrderDetail> orderDetails;
  Address address;

  Datum({
    required this.id,
    required this.userId,
    // this.couponDiscountTitle,
    required this.paymentStatus,
    required this.orderStatus,
    required this.paymentMethod,
    required this.deliveryAddressId,
    required this.deliveryManId,
    // this.couponCode,
    // this.orderNote,
    required this.orderType,
    required this.checked,
    required this.restaurantId,
    required this.zoneId,
    required this.orderAmount,
    required this.couponDiscountAmount,
    required this.totalTaxAmount,
    required this.deliveryCharge,
    required this.restaurantDiscountAmount,
    required this.originalDeliveryCharge,
    required this.adjusment,
    // this.transactionReference,
    required this.dmTips,
    required this.processingTime,
    // this.freeDeliveryBy,
    // this.refundRequestCanceled,
    // this.cancellationReason,
    // this.canceledBy,
    // this.taxStatus,
    // this.couponCreatedBy,
    // this.vehicleId,
    required this.discountOnProductBy,
    // this.scheduleAt,
    // this.callback,
    // this.otp,
    // this.pending,
    // this.accepted,
    // this.confirmed,
    // this.processing,
    // this.handover,
    // this.pickedUp,
    // this.delivered,
    // this.canceled,
    // this.refundRequested,
    // this.refunded,
    required this.scheduled,
    // this.deliveryAddress,
    required this.edited,
    required this.distance,
    // this.subscriptionId,
    required this.isSubscription,
    // this.failed,
    required this.createdAt,
    // this.updatedAt,
    required this.orderDetails,
    required this.address,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    userId: json["user_id"] ?? 0,
    // couponDiscountTitle: json["coupon_discount_title"],
    paymentStatus: json["payment_status"] ?? "",
    orderStatus: json["order_status"] ?? "",
    paymentMethod: json["payment_method"] ?? "",
    deliveryAddressId: json["delivery_address_id"] ?? 0,
    deliveryManId: json["delivery_man_id"] ?? 0,
    // couponCode: json["coupon_code"],
    // orderNote: json["order_note"],
    orderType: json["order_type"] ?? "",
    checked: json["checked"] ?? 0,
    restaurantId: json["restaurant_id"] ?? 0,
    zoneId: json["zone_id"] ?? 0,
    orderAmount: json["order_amount"] ?? "",
    couponDiscountAmount: json["coupon_discount_amount"] ?? "",
    totalTaxAmount: json["total_tax_amount"] ?? "",
    deliveryCharge: json["delivery_charge"] ?? "",
    restaurantDiscountAmount: json["restaurant_discount_amount"] ?? "",
    originalDeliveryCharge: json["original_delivery_charge"] ?? "",
    adjusment: json["adjusment"] ?? "",
    // transactionReference: json["transaction_reference"],
    dmTips: json["dm_tips"] ?? 0,
    processingTime: json["processing_time"] ?? "",
    // freeDeliveryBy: json["free_delivery_by"],
    // refundRequestCanceled: json["refund_request_canceled"],
    // cancellationReason: json["cancellation_reason"],
    // canceledBy: json["canceled_by"],
    // taxStatus: json["tax_status"],
    // couponCreatedBy: json["coupon_created_by"],
    // vehicleId: json["vehicle_id"],
    discountOnProductBy: json["discount_on_product_by"] ?? "",
    // scheduleAt: json["schedule_at"],
    // callback: json["callback"],
    // otp: json["otp"],
    // pending: json["pending"],
    // accepted: json["accepted"],
    // confirmed: json["confirmed"],
    // processing: json["processing"],
    // handover: json["handover"],
    // pickedUp: json["picked_up"],
    // delivered: json["delivered"],
    // canceled: json["canceled"],
    // refundRequested: json["refund_requested"],
    // refunded: json["refunded"],
    scheduled: json["scheduled"] ?? 0,
    // deliveryAddress: json["delivery_address"],
    edited: json["edited"] ?? 0,
    distance: json["distance"] ?? 0,
    // subscriptionId: json["subscription_id"],
    isSubscription: json["is_subscription"] ?? 0,
    // failed: json["failed"],
    createdAt: DateTime.parse(json["created_at"] ?? DateTime.now()),
    // updatedAt: json["updated_at"],
    orderDetails: List<OrderDetail>.from((json["order_details"] ?? []).map((x) => OrderDetail.fromJson(x ?? {}))),
    address: Address.fromJson(json["address"] ?? {}),
  );

  /*Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "coupon_discount_title": couponDiscountTitle,
    "payment_status": paymentStatus,
    "order_status": orderStatus,
    "payment_method": paymentMethod,
    "delivery_address_id": deliveryAddressId,
    "delivery_man_id": deliveryManId,
    "coupon_code": couponCode,
    "order_note": orderNote,
    "order_type": orderType,
    "checked": checked,
    "restaurant_id": restaurantId,
    "zone_id": zoneId,
    "order_amount": orderAmount,
    "coupon_discount_amount": couponDiscountAmount,
    "total_tax_amount": totalTaxAmount,
    "delivery_charge": deliveryCharge,
    "restaurant_discount_amount": restaurantDiscountAmount,
    "original_delivery_charge": originalDeliveryCharge,
    "adjusment": adjusment,
    "transaction_reference": transactionReference,
    "dm_tips": dmTips,
    "processing_time": processingTime,
    "free_delivery_by": freeDeliveryBy,
    "refund_request_canceled": refundRequestCanceled,
    "cancellation_reason": cancellationReason,
    "canceled_by": canceledBy,
    "tax_status": taxStatus,
    "coupon_created_by": couponCreatedBy,
    "vehicle_id": vehicleId,
    "discount_on_product_by": discountOnProductBy,
    "schedule_at": scheduleAt,
    "callback": callback,
    "otp": otp,
    "pending": pending,
    "accepted": accepted,
    "confirmed": confirmed,
    "processing": processing,
    "handover": handover,
    "picked_up": pickedUp,
    "delivered": delivered,
    "canceled": canceled,
    "refund_requested": refundRequested,
    "refunded": refunded,
    "scheduled": scheduled,
    "delivery_address": deliveryAddress,
    "edited": edited,
    "distance": distance,
    "subscription_id": subscriptionId,
    "is_subscription": isSubscription,
    "failed": failed,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "order_details": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
    "address": address.toJson(),
  };*/
}

class Address {
  int id;
  String addressType;
  String contactPersonNumber;
  String address;
  String latitude;
  String longitude;
  int userId;
  String contactPersonName;
  int zoneId;
  String floor;
  String landmark;
  String houseNo;
  // DateTime createdAt;
  // dynamic updatedAt;

  Address({
    required this.id,
    required this.addressType,
    required this.contactPersonNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.contactPersonName,
    required this.zoneId,
    required this.floor,
    required this.landmark,
    required this.houseNo,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"] ?? 0,
    addressType: json["address_type"] ?? "",
    contactPersonNumber: json["contact_person_number"] ?? "",
    address: json["address"] ?? "",
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
    userId: json["user_id"] ?? 0,
    contactPersonName: json["contact_person_name"] ?? "",
    zoneId: json["zone_id"] ?? 0,
    floor: json["floor"] ?? "",
    landmark: json["landmark"] ?? "",
    houseNo: json["house_no"] ?? "",
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: json["updated_at"],
  );

}

class OrderDetail {
  int id;
  int foodId;
  int orderId;
  String price;
  String foodDetails;
  // String variation;
  // dynamic addOns;
  String discountOnFood;
  String discountType;
  int quantity;
  String taxAmount;
  // dynamic variant;
  // dynamic itemCampaignId;
  String totalAddOnPrice;
  DateTime createdAt;
  // dynamic updatedAt;
  FoodData food;

  OrderDetail({
    required this.id,
    required this.foodId,
    required this.orderId,
    required this.price,
    required this.foodDetails,
    // this.variation,
    // this.addOns,
    required this.discountOnFood,
    required this.discountType,
    required this.quantity,
    required this.taxAmount,
    // this.variant,
    // this.itemCampaignId,
    required this.totalAddOnPrice,
    required this.createdAt,
    // this.updatedAt,
    required this.food,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    id: json["id"] ?? 0,
    foodId: json["food_id"] ?? 0,
    orderId: json["order_id"] ?? 0,
    price: json["price"] ?? "",
    foodDetails: json["food_details"] ?? "",
    // variation: json["variation"],
    // addOns: json["add_ons"],
    discountOnFood: json["discount_on_food"] ?? "",
    discountType: json["discount_type"] ?? "",
    quantity: json["quantity"] ?? 0,
    taxAmount: json["tax_amount"] ?? "",
    // variant: json["variant"],
    // itemCampaignId: json["item_campaign_id"],
    totalAddOnPrice: json["total_add_on_price"] ?? "",
    createdAt: DateTime.parse(json["created_at"] ?? DateTime.now()),
    // updatedAt: json["updated_at"],
    food: FoodData.fromJson(json["food"] ?? {}),
  );

}

/*class Food {
  int id;
  String name;
  String description;
  String image;
  int categoryId;
  dynamic subcategoryId;
  String variations;
  dynamic addOns;
  String price;
  String discount;
  String discountType;
  String availableTimeStarts;
  String availableTimeEnds;
  int veg;
  dynamic calories;
  String minimumorderquantity;
  String totalallowedquantity;
  int status;
  int restaurantId;
  int orderCount;
  int avgRating;
  int ratingCount;
  dynamic rating;
  int recommended;
  dynamic slug;
  DateTime createdAt;
  DateTime updatedAt;

  Food({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.subcategoryId,
    this.variations,
    this.addOns,
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
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    variations: json["variations"],
    addOns: json["add_ons"],
    price: json["price"],
    discount: json["discount"],
    discountType: json["discount_type"],
    availableTimeStarts: json["available_time_starts"],
    availableTimeEnds: json["available_time_ends"],
    veg: json["veg"],
    calories: json["calories"],
    minimumorderquantity: json["minimumorderquantity"],
    totalallowedquantity: json["totalallowedquantity"],
    status: json["status"],
    restaurantId: json["restaurant_id"],
    orderCount: json["order_count"],
    avgRating: json["avg_rating"],
    ratingCount: json["rating_count"],
    rating: json["rating"],
    recommended: json["recommended"],
    slug: json["slug"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    "slug": slug,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}*/
