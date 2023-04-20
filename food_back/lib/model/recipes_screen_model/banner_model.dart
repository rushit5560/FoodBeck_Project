// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final List<BannerList> data;
  final String message;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    success: json["success"]??"",
    data: List<BannerList>.from(json["data"].map((x) => BannerList.fromJson(x))??{}),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    //"data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class BannerList {
  BannerList({
    required this.id,
    required this.title,
    required this.zone,
    required this.type,
    required this.data,
    required this.image,
    required this.status,
   // required this.createdAt,
    //required this.updatedAt,
  });

  final int id;
  final String title;
  final String zone;
  final Type type;
  final int data;
  final String image;
  final int status;
  //final DateTime createdAt;
 // final DateTime updatedAt;

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
    id: json["id"]??0,
    title: json["title"]??"",
    zone: json["zone"]??"",
    type: typeValues.map[json["type"]]!,
    data: json["data"]??0,
    image: json["image"]??"",
    status: json["status"]??0,
    //createdAt: DateTime.parse(json["created_at"]),
    //updatedAt: DateTime.parse(json["updated_at"]),
  );
  //
  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "title": title,
  //   "zone": zone,
  //   "type": typeValues.reverse[type],
  //   "data": data,
  //   "image": image,
  //   "status": status,
  //   "created_at": createdAt.toIso8601String(),
  //   "updated_at": updatedAt.toIso8601String(),
  // };
}

enum Type { RESTAURANT_WISE, ITEM_WISE }

final typeValues = EnumValues({
  "item_wise": Type.ITEM_WISE,
  "restaurant_wise": Type.RESTAURANT_WISE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
