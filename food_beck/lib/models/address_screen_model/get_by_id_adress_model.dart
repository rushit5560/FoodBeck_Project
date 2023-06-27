// To parse this JSON data, do
//
//     final getByIdUserAddressModel = getByIdUserAddressModelFromJson(jsonString);

import 'dart:convert';

GetByIdUserAddressModel getByIdUserAddressModelFromJson(String str) =>
    GetByIdUserAddressModel.fromJson(json.decode(str));

// String getByIdUserAddressModelToJson(GetByIdUserAddressModel data) => json.encode(data.toJson());

class GetByIdUserAddressModel {
  bool success;
  GetByIdAddress data;
  String message;

  GetByIdUserAddressModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory GetByIdUserAddressModel.fromJson(Map<String, dynamic> json) =>
      GetByIdUserAddressModel(
        success: json["success"] ?? false,
        data: GetByIdAddress.fromJson(json["data"] ?? {}),
        message: json["message"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "success": success,
  //     "data": data.toJson(),
  //     "message": message,
  // };
}

class GetByIdAddress {
  int id;
  String addressType;
  String contactPersonNumber;
  String address;
  String latitude;
  String longitude;
  String userId;
  String contactPersonName;
  String zoneId;
  String floor;
  String landmark;
  String houseNo;
  // DateTime createdAt;
  // DateTime updatedAt;

  GetByIdAddress({
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

  factory GetByIdAddress.fromJson(Map<String, dynamic> json) => GetByIdAddress(
        id: json["id"] ?? 0,
        addressType: json["address_type"] ?? "",
        contactPersonNumber: json["contact_person_number"] ?? "",
        address: json["address"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        userId: json["user_id"] ?? "",
        contactPersonName: json["contact_person_name"] ?? "",
        zoneId: json["zone_id"] ?? "",
        floor: json["floor"] ?? "",
        landmark: json["landmark"] ?? "",
        houseNo: json["house_no"] ?? "",
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "address_type": addressType,
  //     "contact_person_number": contactPersonNumber,
  //     "address": address,
  //     "latitude": latitude,
  //     "longitude": longitude,
  //     "user_id": userId,
  //     "contact_person_name": contactPersonName,
  //     "zone_id": zoneId,
  //     "floor": floor,
  //     "landmark": landmark,
  //     "house_no": houseNo,
  //     "created_at": createdAt.toIso8601String(),
  //     "updated_at": updatedAt.toIso8601String(),
  // };
}
