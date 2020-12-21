import 'package:flutter/material.dart';
import 'package:frugal_flights/common/constants.dart';
import 'package:frugal_flights/screens/homepage/homepage.dart';
import 'package:frugal_flights/services/database.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Database(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        ),
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
