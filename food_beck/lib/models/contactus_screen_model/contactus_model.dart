// To parse this JSON data, do
//
//     final contactusModel = contactusModelFromJson(jsonString);

import 'dart:convert';

ContactusModel contactusModelFromJson(String str) =>
    ContactusModel.fromJson(json.decode(str));

// String contactusModelToJson(ContactusModel data) => json.encode(data.toJson());

class ContactusModel {
  ContactusModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  ContactusData data;
  int message;

  factory ContactusModel.fromJson(Map<String, dynamic> json) => ContactusModel(
        success: json["success"],
        data: ContactusData.fromJson(json["data"]),
        message: json["message"],
      );
}

class ContactusData {
  ContactusData({
    required this.fullName,
    required this.email,
    required this.subject,
    required this.userId,
    required this.comment,
    required this.id,
  });

  String fullName;
  String email;
  String subject;
  String userId;
  String comment;
  int id;

  factory ContactusData.fromJson(Map<String, dynamic> json) => ContactusData(
        fullName: json["full_name"],
        email: json["email"],
        subject: json["subject"],
        userId: json["user_id"],
        comment: json["comment"],
        id: json["id"],
      );
}
