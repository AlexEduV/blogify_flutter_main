import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SearchColumnNotifier extends ChangeNotifier {
  //todo: can be moved to an enum;
  String _value = L10n.searchFilterAuthor;

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
