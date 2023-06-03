import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.success,
    required this.data,
    required this.message,
    required this.error,
  });

  bool success;
  SignUpModelData data;
  int message;
  String error;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    success: json["success"] ?? false,
    data: SignUpModelData.fromJson(json["data"] ?? {}),
    message: json["message"] ?? 0,
    error: json["error"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class SignUpModelData {
  SignUpModelData({
    required this.success,
    required this.data,
    required this.token,
    required this.message,
  });

  bool success;
  DataData data;
  String token;
  String message;

  factory SignUpModelData.fromJson(Map<String, dynamic> json) => SignUpModelData(
    success: json["success"] ?? false,
    data: DataData.fromJson(json["data"] ?? {}),
    token: json["token"] ?? "",
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "token": token,
    "message": message,
  };
}

class DataData {
  DataData({
    required this.name,
    required this.email,
    // required this.updatedAt,
    // required this.createdAt,
    required this.id,
  });

  String name;
  String email;
  // DateTime updatedAt;
  // DateTime createdAt;
  int id;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    name: json["name"]??"",
    email: json["email"]??"",
    // updatedAt: DateTime.parse(json["updated_at"]),
    // createdAt: DateTime.parse(json["created_at"]),
    id: json["id"]??0,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    // "updated_at": updatedAt.toIso8601String(),
    // "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}