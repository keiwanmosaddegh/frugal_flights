import 'package:flutter/material.dart';
import 'package:frugal_flights/common/constants.dart';
import 'package:frugal_flights/common/custom_title.dart';
import 'package:frugal_flights/screens/homepage/header.dart';
import 'package:frugal_flights/screens/homepage/watchlist_setting.dart';
import 'package:frugal_flights/screens/watch_form/watch_form.dart';
import 'package:frugal_flights/view_models/flights_provider.dart';
import 'package:provider/provider.dart';

class FlightsPage extends StatefulWidget {
  @override
  _FlightsPageState createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FlightsProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<FlightsProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),
        body: provider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Header(size: size),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      left: kDefaultPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTitle(text: "Watchlist"),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WatchForm()),
                            );
                          },
                          color: Colors.white,
                          child: Icon(
                            Icons.add,
                            color: kTextColor,
                          ),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
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
                          settingValue: "CPH-sky",
                        ),
                        WatchlistSetting(
                          setting: "Inbound",
                          settingValue: "AGP-sky",
                        ),
                        WatchlistSetting(
                          setting: "Direct",
                          settingValue: "True",
                        ),
                        WatchlistSetting(
                          setting: "Max price",
                          settingValue: "${provider.minPrice} SEK",
                        ),
                      ],
                    ),
                  ),
                ],
              ));
  }
}
