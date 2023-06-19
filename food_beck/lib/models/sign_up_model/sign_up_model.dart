// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

class SignUpModel {
  bool success;
  String error;

  String message;

  SignUpModel(
      {required this.success, required this.error, required this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        success: json["success"] ?? false,
        error: json["error"] ?? "",
        message: json["message"] ?? "",
      );
}
