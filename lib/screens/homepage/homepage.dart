import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frugal_flights/common/constants.dart';
import 'package:frugal_flights/common/custom_title.dart';
import 'package:frugal_flights/screens/homepage/EmptyListMessage.dart';
import 'package:frugal_flights/screens/homepage/header.dart';
import 'package:frugal_flights/screens/homepage/watchlist_setting.dart';
import 'file:///C:/Users/keiwa/Documents/projects/apps/frugal_flights/lib/screens/homepage/FlightTrackerCard.dart';
import 'package:frugal_flights/screens/watch_form/watch_form.dart';
import 'package:frugal_flights/services/database.dart';
import 'package:frugal_flights/view_models/homepage_view_model.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomepageViewModel(),
      child: Builder(builder: (context) {
        Size size = MediaQuery.of(context).size;
        final provider = Provider.of<HomepageViewModel>(context);
        final db = Provider.of<Database>(context);
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
                                  MaterialPageRoute(
                                      builder: (context) => WatchForm()),
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
                      db.trackers.length > 0
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: db.trackers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Dismissible(
                                    key: Key(db.trackers[index].inbound),
                                    onDismissed: (direction) {
                                      db.removeTracker(db.trackers[index]);
                                    },
                                    child: FlightTrackerCard(
                                      outbound: db.trackers[index].outbound,
                                      inbound: db.trackers[index].inbound,
                                      direct: db.trackers[index].direct,
                                      maxPrice: db.trackers[index].maxPrice,
                                    ),
                                  );
                                },
                              ),
                            )
                          : EmptyListMessage(),
                    ],
                  ));
      }),
    );
  }
}
