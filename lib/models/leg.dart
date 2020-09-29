import 'package:meta/meta.dart';
import 'dart:convert';

Leg clientFromJson(String str) => Leg.fromJson(json.decode(str));

String clientToJson(Leg data) => json.encode(data.toJson());

class Leg {
  Leg({
    @required this.carrierIds,
    @required this.originId,
    @required this.destinationId,
    @required this.departureDate,
  });

  final List<int> carrierIds;
  final int originId;
  final int destinationId;
  final DateTime departureDate;

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
    carrierIds: List<int>.from(json["CarrierIds"].map((x) => x)),
    originId: json["OriginId"],
    destinationId: json["DestinationId"],
    departureDate: DateTime.parse(json["DepartureDate"]),
  );

  Map<String, dynamic> toJson() => {
    "CarrierIds": List<dynamic>.from(carrierIds.map((x) => x)),
    "OriginId": originId,
    "DestinationId": destinationId,
    "DepartureDate": departureDate.toIso8601String(),
  };
}
