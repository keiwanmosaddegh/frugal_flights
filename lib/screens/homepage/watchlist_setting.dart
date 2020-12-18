import 'package:flutter/material.dart';

class WatchlistSetting extends StatelessWidget {
  final String setting;
  final String settingValue;

  const WatchlistSetting({
    Key key,
    this.setting,
    this.settingValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(setting,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(settingValue,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
}
