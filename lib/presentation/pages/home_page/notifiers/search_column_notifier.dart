import 'package:blogify_flutter_main/common/enums/post_filter.dart';
import 'package:flutter/material.dart';

class SearchColumnNotifier extends ChangeNotifier {
  String _value = PostFilter.author.label;

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
