// To parse this JSON data, do
//
//     final cmsPageModel = cmsPageModelFromJson(jsonString);

import 'dart:convert';

CmsPageModel cmsPageModelFromJson(String str) => CmsPageModel.fromJson(json.decode(str));

String cmsPageModelToJson(CmsPageModel data) => json.encode(data.toJson());

class CmsPageModel {
  CmsPageModel({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final List<CmsPage> data;
  final String message;

  factory CmsPageModel.fromJson(Map<String, dynamic> json) => CmsPageModel(
    success: json["success"]??"",
    data: List<CmsPage>.from(json["data"].map((x) => CmsPage.fromJson(x))??{}),
    message: json["message"]??"",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    //"data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class CmsPage {
  CmsPage({
    required this.id,
    required this.title,
    required this.content,
    required this.metaTitle,
    required this.metaDec,
    required this.metaKey,
    this.userId,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String content;
  final String metaTitle;
  final String metaDec;
  final String metaKey;
  final dynamic userId;
  final String verified;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CmsPage.fromJson(Map<String, dynamic> json) => CmsPage(
    id: json["id"]??0,
    title: json["title"]??"",
    content: json["content"]??"",
    metaTitle: json["meta_title"]??"",
    metaDec: json["meta_dec"]??"",
    metaKey: json["meta_key"]??"",
    userId: json["user_id"],
    verified: json["verified"]??"",
    createdAt: DateTime.parse(json["created_at"]??""),
    updatedAt: DateTime.parse(json["updated_at"]??""),
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "title": title,
  //   "content": content,
  //   "meta_title": metaTitle,
  //   "meta_dec": metaDec,
  //   "meta_key": metaKey,
  //   "user_id": userId,
  //   "verified": verified,
  //   "created_at": createdAt.toIso8601String(),
  //   "updated_at": updatedAt.toIso8601String(),
  // };
}
