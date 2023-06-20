// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

class SignUpModel {
  bool success;
  // Data data;
  String token;
  String message;
  String error;

  SignUpModel({
    required this.success,
    // required this.data,
    required this.token,
    required this.message,
    required this.error,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        success: json["success"] ?? false,
        // data: Data.fromJson(json["data"]),
        token: json["token"] ?? "",
        message: json["message"] ?? "",
        error: json["error"] ?? "",
      );
}
