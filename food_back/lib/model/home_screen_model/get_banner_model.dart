// To parse this JSON data, do
//
//     final getbannerModel = getbannerModelFromJson(jsonString);

import 'dart:convert';

GetbannerModel getbannerModelFromJson(String str) => GetbannerModel.fromJson(json.decode(str));

String getbannerModelToJson(GetbannerModel data) => json.encode(data.toJson());

class GetbannerModel {
    GetbannerModel({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final List<Datum> data;
    final String message;

    factory GetbannerModel.fromJson(Map<String, dynamic> json) => GetbannerModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    Datum({
        required this.id,
        required this.title,
        required this.zone,
        required this.type,
        required this.data,
        required this.image,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    final int id;
    final String title;
    final String zone;
    final String type;
    final int data;
    final String image;
    final int status;
    final DateTime createdAt;
    final DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        zone: json["zone"],
        type: json["type"],
        data: json["data"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "zone": zone,
        "type": type,
        "data": data,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
