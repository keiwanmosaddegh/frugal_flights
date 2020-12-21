class Tracker {
  Tracker({
    this.outbound,
    this.inbound,
    this.direct,
    this.maxPrice,
  });

  final String outbound;
  final String inbound;
  final bool direct;
  final int maxPrice;

  factory Tracker.fromJson(Map<String, dynamic> json) => Tracker(
        outbound: json["outbound"],
        inbound: json["inbound"],
        direct: json["direct"],
        maxPrice: json["maxPrice"],
      );

  Map<String, dynamic> toJson() => {
        "outbound": outbound,
        "inbound": inbound,
        "direct": direct,
        "maxPrice": maxPrice,
      };
}
