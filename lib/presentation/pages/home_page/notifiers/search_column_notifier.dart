import 'package:flutter/material.dart';

class SearchColumnNotifier extends ChangeNotifier {

  String _value = 'Author';
  String get value => _value;

  void update(String newValue) {
    _value = newValue;
    notifyListeners();
  }

}