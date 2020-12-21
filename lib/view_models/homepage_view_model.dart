import 'package:flutter/foundation.dart';
import 'package:frugal_flights/models/quote.dart';
import 'package:frugal_flights/services/api_service.dart';
import 'package:frugal_flights/services/database.dart';

// ALL IN ALL
// 1. Create a View Model for each Screen
// 2. Let class extend ChangeNotifier
// 3. And then simply call notifyListener() whenever you need to update the UI

class HomepageViewModel extends ChangeNotifier {
  List<Quote> quotes = List<Quote>();
  bool isLoading = false;
  int minPrice = 2000;

  Future<void> fetchAllFlights() async {
    this.isLoading = true;

    var fetchedQuotes = await APIService().getAllFlights();

    var filteredQuotes = fetchedQuotes.where((quote) =>
        (quote.direct) &&
        (quote.outboundLeg.departureDate.weekday == 4 ||
            quote.outboundLeg.departureDate.weekday == 5) &&
        (quote.inboundLeg.departureDate.weekday == 7) &&
        (quote.inboundLeg.departureDate
                .difference(quote.outboundLeg.departureDate)
                .inDays <
            6) &&
        (quote.minPrice < minPrice));

    this.quotes = filteredQuotes.toList();

    print("Total amount of Quotes: ${fetchedQuotes.length}");
    print("Amount of Filtered Quotes: ${filteredQuotes.length}");

    this.isLoading = false;
    notifyListeners();
  }
}
