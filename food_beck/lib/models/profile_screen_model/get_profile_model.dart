// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

class GetProfileModel {
  bool success;
  ProfileData data;
  String message;

  GetProfileModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        success: json["success"] ?? false,
        data: ProfileData.fromJson(json["data"] ?? {}),
        message: json["message"] ?? "",
      );
}

class ProfileData {
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

  ProfileData({
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

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"]??0,
        name: json["name"]??"",
        email: json["email"]??"",
        phoneno: json["phoneno"]??"",
        zoneId: json["zone_id"]??"",
        image: json["image"]??"",
        // socialMediaId: json["social_media_id"],
        // emailVerifiedAt: json["email_verified_at"],
        // orderCount: json["order_count"],
        status: json["status"]??"",
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );
}
