import 'package:flutter/cupertino.dart';
import 'package:frugal_flights/models/tracker.dart';

class Database extends ChangeNotifier {
  List<Tracker> _trackers = new List<Tracker>();

  List<Tracker> get trackers => _trackers;

  void addTracker(Tracker tracker) {
    _trackers.add(tracker);
    notifyListeners();
  }

  void removeTracker(Tracker tracker) {
    _trackers.remove(tracker);
    notifyListeners();
  }

}
