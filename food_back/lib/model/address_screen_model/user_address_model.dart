import 'dart:convert';

UserAddressModel userAddressModelFromJson(String str) => UserAddressModel.fromJson(json.decode(str));

String userAddressModelToJson(UserAddressModel data) => json.encode(data.toJson());

class UserAddressModel {
  bool success;
  List<AddressData> data;
  String message;

  UserAddressModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory UserAddressModel.fromJson(Map<String, dynamic> json) => UserAddressModel(
    success: json["success"] ?? false,
    data: List<AddressData>.from((json["data"] ?? []).map((x) => AddressData.fromJson(x))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class AddressData {
  int id;
  String addressType;
  String contactPersonNumber;
  String address;
  String latitude;
  String longitude;
  int userId;
  String contactPersonName;
  int zoneId;
  String floor;
  String landmark;
  String houseNo;
  // DateTime createdAt;
  // DateTime updatedAt;

  AddressData({
    required this.id,
    required this.addressType,
    required this.contactPersonNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.contactPersonName,
    required this.zoneId,
    required this.floor,
    required this.landmark,
    required this.houseNo,
    // this.createdAt,
    // this.updatedAt,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
    id: json["id"] ?? 0,
    addressType: json["address_type"] ?? "",
    contactPersonNumber: json["contact_person_number"] ?? "",
    address: json["address"] ?? "",
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
    userId: json["user_id"] ?? 0,
    contactPersonName: json["contact_person_name"] ?? "",
    zoneId: json["zone_id"] ?? 0,
    floor: json["floor"] ?? "",
    landmark: json["landmark"] ?? "",
    houseNo: json["house_no"] ?? "",
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address_type": addressType,
    "contact_person_number": contactPersonNumber,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "user_id": userId,
    "contact_person_name": contactPersonName,
    "zone_id": zoneId,
    "floor": floor,
    "landmark": landmark,
    "house_no": houseNo,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}
