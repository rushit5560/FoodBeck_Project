import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

// String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<CategoryData> data;
  String message;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    success: json["success"] ?? false,
    data: List<CategoryData>.from((json["data"] ?? []).map((x) => CategoryData.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  // Map<String, dynamic> toJson() => {
  //   "success": success,
  //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //   "message": message,
  // };
}

class CategoryData {
  CategoryData({
    required this.id,
    required this.name,
    required this.image,
    required this.parentId,
    required this.position,
    required this.status,
    required this.priority,
    // this.slug,
    // this.createdAt,
    // this.updatedAt,
  });

  int id;
  String name;
  String image;
  int parentId;
  int position;
  int status;
  int priority;
  // dynamic slug;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    image: json["image"] ?? "",
    parentId: json["parent_id"] ?? 0,
    position: json["position"] ?? 0,
    status: json["status"] ?? 0,
    priority: json["priority"] ?? 0,
    // slug: json["slug"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "image": image,
  //   "parent_id": parentId,
  //   "position": position,
  //   "status": status,
  //   "priority": priority,
  //   // "slug": slug,
  //   // "created_at": createdAt.toIso8601String(),
  //   // "updated_at": updatedAt.toIso8601String(),
  // };
}
