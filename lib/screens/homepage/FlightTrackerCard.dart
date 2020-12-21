import 'package:flutter/material.dart';
import 'package:frugal_flights/common/constants.dart';
import 'package:frugal_flights/screens/homepage/watchlist_setting.dart';

class FlightTrackerCard extends StatelessWidget {
  final String outbound;
  final String inbound;
  final bool direct;
  final int maxPrice;

  FlightTrackerCard({this.outbound, this.inbound, this.direct, this.maxPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: 12
      ),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            color: kPrimaryColor.withOpacity(0.23),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WatchlistSetting(
            setting: "Outbound",
            settingValue: this.outbound,
          ),
          WatchlistSetting(
            setting: "Inbound",
            settingValue: this.inbound,
          ),
          WatchlistSetting(
            setting: "Direct",
            settingValue: "${this.direct}",
          ),
          WatchlistSetting(
            setting: "Max price",
            settingValue: "${this.maxPrice} SEK",
          ),
        ],
      ),
    );
  }
}
