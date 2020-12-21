import 'package:flutter/cupertino.dart';

class WatchViewModel extends ChangeNotifier {
  String _fromValue = '';
  String _toValue = '';
  bool _directValue = false;
  int _maxPriceValue = -1;


  String get fromValue => _fromValue;

  String get toValue => _toValue;

  bool get directValue => _directValue;

  int get maxPriceValue => _maxPriceValue;

  set maxPriceValue(int value) {
    _maxPriceValue = value;
    notifyListeners();
  }

  set directValue(bool value) {
    _directValue = value;
    notifyListeners();
  }

  set toValue(String value) {
    _toValue = value;
    notifyListeners();
  }

  set fromValue(String value) {
    _fromValue = value;
    notifyListeners();
  }
}