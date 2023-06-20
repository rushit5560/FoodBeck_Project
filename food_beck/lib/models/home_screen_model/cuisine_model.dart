import 'dart:convert';

CuisineModel cuisineModelFromJson(String str) => CuisineModel.fromJson(json.decode(str));

String cuisineModelToJson(CuisineModel data) => json.encode(data.toJson());

class CuisineModel {
  bool success;
  List<CuisineDetails> data;
  String message;

  CuisineModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory CuisineModel.fromJson(Map<String, dynamic> json) => CuisineModel(
    success: json["success"] ?? false,
    data: List<CuisineDetails>.from((json["data"] ?? []).map((x) => CuisineDetails.fromJson(x))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class CuisineDetails {
  int id;
  String name;
  String image;
  String status;
  // dynamic slug;
  // DateTime createdAt;
  // DateTime updatedAt;

  CuisineDetails({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    // this.slug,
    // this.createdAt,
    // this.updatedAt,
  });

  factory CuisineDetails.fromJson(Map<String, dynamic> json) => CuisineDetails(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    image: json["image"] ?? "",
    status: json["status"] ?? "0",
    // slug: json["slug"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "status": status,
    // "slug": slug,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}
