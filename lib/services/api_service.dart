import 'dart:convert';
import 'package:frugal_flights/models/quote.dart';
import 'package:http/http.dart';

class APIService {
  static const String _apiKey = "00d8c97dbdmsh99d2b8f7fb0625dp160606jsn7f3f7d6c5848";
  static const String _apiHost = "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com";
  static const String _apiEndpoint = "apiservices/browseroutes/v1.0";
  static const Map<String, String> queries = {
    "currency":"SEK",
    "country":"SE",
    "locale":"sv-SE",
    "originplace":"CPH-sky",
    "outboundpartialdate":"2020-11-03",
    "inboundpartialdate":"2020-11-27",
    "destinationplace":"AGP-sky"
  };

  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": _apiHost,
    "x-rapidapi-key": _apiKey,
  };

  Future<dynamic> getFlights({Map<String, String> query}) async {
    Map<String, String> qs = query ?? queries;
    String url = Uri.encodeFull("https://$_apiHost/$_apiEndpoint/${qs["country"]}/${qs["currency"]}/${qs["locale"]}/${qs["originplace"]}/${qs["destinationplace"]}/${qs["outboundpartialdate"]}/${qs["inboundpartialdate"]}");
    Response response = await get(url, headers: _headers);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)["Quotes"];
      List<Quote> quotes  = body.map((dynamic item) => Quote.fromJson(item)).toList();
      return quotes;
    } else {
      throw Exception('Failed to load json data');
    }
  }

  Future<List<Quote>> getAllFlights({Map<String, String> query}) async {
    Map<String, String> qs = query ?? queries;
    List<Quote> allQuotes = [];

    DateTime now = DateTime.now();
    DateTime apiCallDate = new DateTime(now.year, now.month, now.day + 1);
    for (var i = 1; i <= 12; i++) {
      // Retrieve the year, month, day from apiCallDate
      int year = apiCallDate.year;
      String month = apiCallDate.month.toString().padLeft(2, "0");
      String day = apiCallDate.day.toString().padLeft(2, "0");

      //Parse the correct date to add into the url, to avoid to many loose variables inside the complete string
      String urlDate = "$year-$month-$day";
      String url = Uri.encodeFull("https://$_apiHost/$_apiEndpoint/${qs["country"]}/${qs["currency"]}/${qs["locale"]}/${qs["originplace"]}/${qs["destinationplace"]}/$urlDate/$urlDate");
      Response response = await get(url, headers: _headers);

      if (response.statusCode == 200) {
        print("API Call #$i");
        List<dynamic> body = jsonDecode(response.body)["Quotes"];
        List<Quote> quotes = body.map((dynamic item) => Quote.fromJson(item)).toList();
        allQuotes.addAll(quotes);
      } else {
        print("Failed to load json data");
        throw Exception('Failed to load json data');
      }

      // Increase the month by 1, and fetch the next set of flights.
      apiCallDate = new DateTime(apiCallDate.year, apiCallDate.month + 1, apiCallDate.day);
    }
    return allQuotes;
  }
}

