// To parse this JSON data, do
//
//     final updateUserAddressModel = updateUserAddressModelFromJson(jsonString);

import 'dart:convert';

UpdateUserAddressModel updateUserAddressModelFromJson(String str) =>
    UpdateUserAddressModel.fromJson(json.decode(str));

String updateUserAddressModelToJson(UpdateUserAddressModel data) =>
    json.encode(data.toJson());

class UpdateUserAddressModel {
  bool success;
  int data;
  String message;

  UpdateUserAddressModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory UpdateUserAddressModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserAddressModel(
        success: json["success"] ?? false,
        data: json["data"] ?? 0,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "message": message,
      };
}
