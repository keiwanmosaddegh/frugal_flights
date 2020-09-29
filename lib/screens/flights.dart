import 'package:flutter/material.dart';
import 'package:frugal_flights/models/post.dart';
import 'package:frugal_flights/screens/post_detail.dart';
import 'package:frugal_flights/services/api_service.dart';
import 'package:frugal_flights/services/http_service.dart';

class FlightsPage extends StatelessWidget {
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flights"),
      ),
      body: FutureBuilder(
        future: apiService.getFlights(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Text("Hej");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
