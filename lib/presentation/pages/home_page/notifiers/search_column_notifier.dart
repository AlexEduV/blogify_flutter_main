import 'package:flutter/material.dart';

class SearchColumnNotifier extends ChangeNotifier {

  String _value = 'Author';
  String get value => _value;
  
  bool _isSelectionOpen = false;
  bool get isSelectionOpen => _isSelectionOpen;

  void updateColumn(String newValue) {
    _value = newValue;
    notifyListeners();
  }
  
  void updateSelectionOpenedState(bool newState) {
    _isSelectionOpen = newState;
    notifyListeners();
  }

}