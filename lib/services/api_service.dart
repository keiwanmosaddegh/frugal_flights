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
    "outboundpartialdate":"2020-10-01",
    "inboundpartialdate":"2020-10-27",
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
}

