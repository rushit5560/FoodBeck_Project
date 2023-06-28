// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

class CartModel {
  bool success;
  List<CartData> data;
  String message;

  CartModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        success: json["success"],
        data:
            List<CartData>.from(json["data"].map((x) => CartData.fromJson(x))),
        message: json["message"],
      );
}

class CartData {
  int id;
  String userId;
  String restaurantId;

  // dynamic couponId;
  String totalprice;
  String totalqty;

  // DateTime createdAt;
  // DateTime updatedAt;
  List<CartDetail> cartDetails;

  CartData({
    required this.id,
    required this.userId,
    required this.restaurantId,
    // this.couponId,
    required this.totalprice,
    required this.totalqty,
    // required this.createdAt,
    // required this.updatedAt,
    required this.cartDetails,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? "",
        restaurantId: json["restaurant_id"] ?? "",
        // couponId: json["coupon_id"],
        totalprice: json["totalprice"] ?? "",
        totalqty: json["totalqty"] ?? "",
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        cartDetails: List<CartDetail>.from(
            (json["cart_details"] ?? []).map((x) => CartDetail.fromJson(x)) ??
                {}),
      );
}

class CartDetail {
  int id;
  String cartId;
  String foodId;
  String quantity;
  String subtotal;

  // DateTime createdAt;
  // DateTime updatedAt;
  Foods foods;

  CartDetail({
    required this.id,
    required this.cartId,
    required this.foodId,
    required this.quantity,
    required this.subtotal,
    // required this.createdAt,
    // required this.updatedAt,
    required this.foods,
  });

  factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
        id: json["id"] ?? 0,
        cartId: json["cart_id"] ?? "",
        foodId: json["food_id"] ?? "",
        quantity: json["quantity"] ?? "",
        subtotal: json["subtotal"] ?? "",
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        foods: Foods.fromJson((json["foods"]) ?? {}),
      );
}

class Foods {
  int id;
  String name;
  String description;
  String image;
  String categoryId;
  String subcategoryId;
  String variations;
  String addOns;
  String price;
  String discount;
  String discountType;
  String availableTimeStarts;
  String availableTimeEnds;
  String veg;
  // dynamic calories;
  String minimumorderquantity;
  String totalallowedquantity;
  String status;
  String restaurantId;
  String orderCount;
  String avgRating;
  String ratingCount;
  String rating;
  String recommended;
  String slug;

  // DateTime createdAt;
  // DateTime updatedAt;

  Foods({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.subcategoryId,
    required this.variations,
    required this.addOns,
    required this.price,
    required this.discount,
    required this.discountType,
    required this.availableTimeStarts,
    required this.availableTimeEnds,
    required this.veg,
    // this.calories,
    required this.minimumorderquantity,
    required this.totalallowedquantity,
    required this.status,
    required this.restaurantId,
    required this.orderCount,
    required this.avgRating,
    required this.ratingCount,
    required this.rating,
    required this.recommended,
    required this.slug,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory Foods.fromJson(Map<String, dynamic> json) => Foods(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        image: json["image"] ?? "",
        categoryId: json["category_id"] ?? "",
        subcategoryId: json["subcategory_id"] ?? "",
        variations: json["variations"] ?? "",
        addOns: json["add_ons"] ?? "",
        price: json["price"] ?? "",
        discount: json["discount"] ?? "",
        discountType: json["discount_type"] ?? "",
        availableTimeStarts: json["available_time_starts"] ?? "",
        availableTimeEnds: json["available_time_ends"] ?? "",
        veg: json["veg"] ?? "",
        // calories: json["calories"],
        minimumorderquantity: json["minimumorderquantity"] ?? "",
        totalallowedquantity: json["totalallowedquantity"] ?? "",
        status: json["status"] ?? "",
        restaurantId: json["restaurant_id"] ?? "",
        orderCount: json["order_count"] ?? "",
        avgRating: json["avg_rating"] ?? "",
        ratingCount: json["rating_count"] ?? "",
        rating: json["rating"] ?? "",
        recommended: json["recommended"] ?? "",
        slug: json["slug"] ?? "",
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );
}
