import 'package:frugal_flights/models/leg.dart';
import 'package:meta/meta.dart';

class Quote {
  Quote({
    @required this.quoteId,
    @required this.minPrice,
    @required this.direct,
    @required this.outboundLeg,
    @required this.inboundLeg,
    @required this.quoteDateTime,
  });

  final int quoteId;
  final double minPrice;
  final bool direct;
  final Leg outboundLeg;
  final Leg inboundLeg;
  final DateTime quoteDateTime;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    quoteId: json["QuoteId"],
    minPrice: json["MinPrice"].toDouble(),
    direct: json["Direct"],
    outboundLeg: Leg.fromJson(json["OutboundLeg"]),
    inboundLeg: Leg.fromJson(json["InboundLeg"]),
    quoteDateTime: DateTime.parse(json["QuoteDateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "QuoteId": quoteId,
    "MinPrice": minPrice,
    "Direct": direct,
    "OutboundLeg": outboundLeg.toJson(),
    "InboundLeg": inboundLeg.toJson(),
    "QuoteDateTime": quoteDateTime.toIso8601String(),
  };
}
