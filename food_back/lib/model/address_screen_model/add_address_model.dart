// To parse this JSON data, do
//
//     final addAddressModel = addAddressModelFromJson(jsonString);

import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) =>
    AddAddressModel.fromJson(json.decode(str));

// String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
  bool success;
  AddressData data;
  String message;

  AddAddressModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AddAddressModel.fromJson(Map<String, dynamic> json) =>
      AddAddressModel(
        success: json["success"] ?? false,
        data: AddressData.fromJson(json["data"] ?? {}),
        message: json["message"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "success": success,
  //     "data": data.toJson(),
  //     "message": message,
  // };
}

class AddressData {
  String addressType;
  String contactPersonNumber;
  String address;
  String latitude;
  String longitude;
  String userId;
  String contactPersonName;
  String zoneId;
  String landmark;
  String floor;
  String houseNo;
  // DateTime updatedAt;
  // DateTime createdAt;
  int id;

  AddressData({
    required this.addressType,
    required this.contactPersonNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.contactPersonName,
    required this.zoneId,
    required this.landmark,
    required this.floor,
    required this.houseNo,
    // required this.updatedAt,
    // required this.createdAt,
    required this.id,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
        addressType: json["address_type"] ?? "",
        contactPersonNumber: json["contact_person_number"] ?? "",
        address: json["address"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        userId: json["user_id"] ?? "",
        contactPersonName: json["contact_person_name"] ?? "",
        zoneId: json["zone_id"] ?? "",
        landmark: json["landmark"] ?? "",
        floor: json["floor"] ?? "",
        houseNo: json["house_no"] ?? "",
        // updatedAt: DateTime.parse(json["updated_at"]),
        // createdAt: DateTime.parse(json["created_at"]),
        id: json["id"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "address_type": addressType,
  //     "contact_person_number": contactPersonNumber,
  //     "address": address,
  //     "latitude": latitude,
  //     "longitude": longitude,
  //     "user_id": userId,
  //     "contact_person_name": contactPersonName,
  //     "zone_id": zoneId,
  //     "landmark": landmark,
  //     "floor": floor,
  //     "house_no": houseNo,
  //     "updated_at": updatedAt.toIso8601String(),
  //     "created_at": createdAt.toIso8601String(),
  //     "id": id,
  // };
}
