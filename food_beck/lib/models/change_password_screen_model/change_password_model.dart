// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordModel changePasswordModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

class ChangePasswordModel {
  bool success;
  String message;
  // Data data;

  ChangePasswordModel({
    required this.success,
    required this.message,
    // this.data,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    // data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    // "data": data.toJson(),
  };
}

/*class Data {
  int id;
  String name;
  String email;
  String phoneno;
  int zoneId;
  dynamic image;
  dynamic socialMediaId;
  dynamic emailVerifiedAt;
  dynamic orderCount;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.phoneno,
    this.zoneId,
    this.image,
    this.socialMediaId,
    this.emailVerifiedAt,
    this.orderCount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phoneno: json["phoneno"],
    zoneId: json["zone_id"],
    image: json["image"],
    socialMediaId: json["social_media_id"],
    emailVerifiedAt: json["email_verified_at"],
    orderCount: json["order_count"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phoneno": phoneno,
    "zone_id": zoneId,
    "image": image,
    "social_media_id": socialMediaId,
    "email_verified_at": emailVerifiedAt,
    "order_count": orderCount,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}*/
