import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    required this.success,
    required this.data,
    required this.message,
    required this.error,
  });

  bool success;
  SignInModelData data;
  int message;
  String error;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    success: json["success"] ?? false,
    data: SignInModelData.fromJson(json["data"] ?? {}),
    message: json["message"] ?? 0,
    error: json["error"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class SignInModelData {
  SignInModelData({
    required this.success,
    required this.data,
    required this.token,
    required this.message,
  });

  bool success;
  DataData data;
  String token;
  String message;

  factory SignInModelData.fromJson(Map<String, dynamic> json) => SignInModelData(
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
    required this.id,
    required this.name,
    required this.email,
    required this.phoneno,
    required this.zoneId,
    // this.emailVerifiedAt,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String phoneno;
  int zoneId;
  // dynamic emailVerifiedAt;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    phoneno: json["phoneno"] ?? "",
    zoneId: json["zone_id"] ?? 0,
    // emailVerifiedAt: json["email_verified_at"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phoneno": phoneno,
    "zone_id": zoneId,
    // "email_verified_at": emailVerifiedAt,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}
