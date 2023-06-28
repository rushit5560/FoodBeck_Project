// To parse this JSON data, do
//
//     final addToCartModel = addToCartModelFromJson(jsonString);

import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) =>
    AddToCartModel.fromJson(json.decode(str));

class AddToCartModel {
  bool success;
  AddCartData data;
  String message;
  String error;

  AddToCartModel({
    required this.success,
    required this.data,
    required this.message,
    required this.error,
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        success: json["success"] ?? false,
        data: AddCartData.fromJson(json["data"] ?? {}),
        message: json["message"] ?? "",
        error: json["error"] ?? "",
      );
}

class AddCartData {
  Cart cart;
  CartDetails cartDetails;

  AddCartData({
    required this.cart,
    required this.cartDetails,
  });

  factory AddCartData.fromJson(Map<String, dynamic> json) => AddCartData(
        cart: Cart.fromJson(json["cart"] ?? {}),
        cartDetails: CartDetails.fromJson(json["cart_details"] ?? {}),
      );
}

class Cart {
  String userId;
  String restaurantId;

  // dynamic couponId;
  // DateTime updatedAt;
  // DateTime createdAt;
  int id;

  Cart({
    required this.userId,
    required this.restaurantId,
    // this.couponId,
    // required this.updatedAt,
    // required this.createdAt,
    required this.id,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        userId: json["user_id"] ?? "",
        restaurantId: json["restaurant_id"] ?? "",
        // couponId: json["coupon_id"],
        // updatedAt: DateTime.parse(json["updated_at"]),
        // createdAt: DateTime.parse(json["created_at"]),
        id: json["id"] ?? 0,
      );
}

class CartDetails {
  int cartId;
  String foodId;
  String quantity;
  String subtotal;

  // DateTime updatedAt;
  // DateTime createdAt;
  int id;

  CartDetails({
    required this.cartId,
    required this.foodId,
    required this.quantity,
    required this.subtotal,
    // required this.updatedAt,
    // required this.createdAt,
    required this.id,
  });

  factory CartDetails.fromJson(Map<String, dynamic> json) => CartDetails(
        cartId: json["cart_id"] ?? 0,
        foodId: json["food_id"] ?? "",
        quantity: json["quantity"] ?? "",
        subtotal: json["subtotal"] ?? "",
        // updatedAt: DateTime.parse(json["updated_at"]),
        // createdAt: DateTime.parse(json["created_at"]),
        id: json["id"] ?? 0,
      );
}
