import 'dart:convert';

ZoneModel zoneModelFromJson(String str) => ZoneModel.fromJson(json.decode(str));

String zoneModelToJson(ZoneModel data) => json.encode(data.toJson());

class ZoneModel {
  ZoneModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<ZoneData> data;
  String message;

  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
    success: json["success"] ?? false,
    data: List<ZoneData>.from((json["data"] ?? []).map((x) => ZoneData.fromJson(x ?? {}))),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class ZoneData {
  ZoneData({
    required this.id,
    required this.name,
    required this.status,
    // required this.restaurantWiseTopic,
    // required this.customerWiseTopic,
    // required this.deliverymanWiseTopic,
    // required this.minimumShippingCharge,
    // required this.perKmShippingCharge,
    // required this.maximumShippingCharge,
    // required this.maxCodOrderAmount,
    // required this.increasedDeliveryFee,
    // required this.increasedDeliveryFeeStatus,
    // this.increaseDeliveryChargeMessage,
  });

  int id;
  String name;
  int status;
  // String restaurantWiseTopic;
  // String customerWiseTopic;
  // String deliverymanWiseTopic;
  // int minimumShippingCharge;
  // int perKmShippingCharge;
  // int maximumShippingCharge;
  // int maxCodOrderAmount;
  // int increasedDeliveryFee;
  // int increasedDeliveryFeeStatus;
  // dynamic increaseDeliveryChargeMessage;

  factory ZoneData.fromJson(Map<String, dynamic> json) => ZoneData(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    // restaurantWiseTopic: json["restaurant_wise_topic"],
    // customerWiseTopic: json["customer_wise_topic"],
    // deliverymanWiseTopic: json["deliveryman_wise_topic"],
    // minimumShippingCharge: json["minimum_shipping_charge"],
    // perKmShippingCharge: json["per_km_shipping_charge"],
    // maximumShippingCharge: json["maximum_shipping_charge"],
    // maxCodOrderAmount: json["max_cod_order_amount"],
    // increasedDeliveryFee: json["increased_delivery_fee"],
    // increasedDeliveryFeeStatus: json["increased_delivery_fee_status"],
    // increaseDeliveryChargeMessage: json["increase_delivery_charge_message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    // "restaurant_wise_topic": restaurantWiseTopic,
    // "customer_wise_topic": customerWiseTopic,
    // "deliveryman_wise_topic": deliverymanWiseTopic,
    // "minimum_shipping_charge": minimumShippingCharge,
    // "per_km_shipping_charge": perKmShippingCharge,
    // "maximum_shipping_charge": maximumShippingCharge,
    // "max_cod_order_amount": maxCodOrderAmount,
    // "increased_delivery_fee": increasedDeliveryFee,
    // "increased_delivery_fee_status": increasedDeliveryFeeStatus,
    // "increase_delivery_charge_message": increaseDeliveryChargeMessage,
  };
}
