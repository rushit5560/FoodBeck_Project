// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

// String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  bool success;
  SignInModelData data;
  String token;
  String message;
   String error;

  SignInModel({
    required this.success,
    required this.data,
    required this.token,
    required this.message,
     required this.error,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        success: json["success"] ?? false,
        data: SignInModelData.fromJson(json["data"] ?? {}),
        token: json["token"] ?? "",
        message: json["message"] ?? "",
        error: json["error"]??"",
      );

  // Map<String, dynamic> toJson() => {
  //     "success": success,
  //     "data": data.toJson(),
  //     "token": token,
  //     "message": message,
  // };
}

class SignInModelData {
  int id;
  String name;
  String email;
  String phoneno;
  String zoneId;
  String image;
  // dynamic socialMediaId;
  // dynamic emailVerifiedAt;
  // dynamic orderCount;
  String status;
  // DateTime createdAt;
  // DateTime updatedAt;

  SignInModelData({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneno,
    required this.zoneId,
    required this.image,
    // this.socialMediaId,
    // this.emailVerifiedAt,
    // this.orderCount,
    required this.status,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory SignInModelData.fromJson(Map<String, dynamic> json) =>
      SignInModelData(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        phoneno: json["phoneno"] ?? "",
        zoneId: json["zone_id"] ?? "",
        image: json["image"] ?? "",
        // socialMediaId: json["social_media_id"],
        // emailVerifiedAt: json["email_verified_at"],
        // orderCount: json["order_count"],
        status: json["status"] ?? "",
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  //     "email": email,
  //     "phoneno": phoneno,
  //     "zone_id": zoneId,
  //     "image": image,
  //     "social_media_id": socialMediaId,
  //     "email_verified_at": emailVerifiedAt,
  //     "order_count": orderCount,
  //     "status": status,
  //     "created_at": createdAt.toIso8601String(),
  //     "updated_at": updatedAt.toIso8601String(),
  // };
}
