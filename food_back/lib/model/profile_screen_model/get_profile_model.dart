// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  ProfileData data;
  String message;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        success: json["success"] ?? false,
        data: ProfileData.fromJson(json["data"] ?? {}),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class ProfileData {
  ProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneno,
    required this.zoneId,
    required this.image,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String phoneno;
  int zoneId;
  String image;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        phoneno: json["phoneno"] ?? "",
        zoneId: json["zone_id"] ?? 0,
        image: json["image"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phoneno": phoneno,
        "zone_id": zoneId,
        "image": image,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
