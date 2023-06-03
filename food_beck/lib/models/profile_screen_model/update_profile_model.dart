// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) =>
    UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) =>
    json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileModel(
        success: json["success"] ?? false,
        data: Data.fromJson(json["data"] ?? {}),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        // "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneno,
    required this.zoneId,
    required this.image,
    required this.emailVerifiedAt,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String phoneno;
  String zoneId;
  String image;
  String emailVerifiedAt;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        phoneno: json["phoneno"] ?? "",
        zoneId: (json["zone_id"] ?? 0).toString(),
        image: json["image"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //       "email": email,
  //       "phoneno": phoneno,
  //       "zone_id": zoneId,
  //       "image": image,
  //       "email_verified_at": emailVerifiedAt,
  //       // "created_at": createdAt.toIso8601String(),
  //       // "updated_at": updatedAt.toIso8601String(),
  //     };
}
