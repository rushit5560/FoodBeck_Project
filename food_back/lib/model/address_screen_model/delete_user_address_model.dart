import 'dart:convert';

DeleteAddressModel deleteAddressModelFromJson(String str) => DeleteAddressModel.fromJson(json.decode(str));

String deleteAddressModelToJson(DeleteAddressModel data) => json.encode(data.toJson());

class DeleteAddressModel {
  bool success;
  String message;

  DeleteAddressModel({
    required this.success,
    required this.message,
  });

  factory DeleteAddressModel.fromJson(Map<String, dynamic> json) => DeleteAddressModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
