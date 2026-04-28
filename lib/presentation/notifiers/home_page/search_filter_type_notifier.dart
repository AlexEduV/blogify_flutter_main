import 'package:blogify_flutter_main/common/enums/post_filter.dart';
import 'package:flutter/material.dart';

class SearchFilterTypeNotifier extends ChangeNotifier {
  PostFilter _value = PostFilter.author;

  PostFilter get value => _value;

  bool _isSelectionOpen = false;

  bool get isSelectionOpen => _isSelectionOpen;

  void updateFilterType(PostFilter newValue) {
    _value = newValue;
    notifyListeners();
  }

  void setIsMenuExpanded(bool newState) {
    _isSelectionOpen = newState;
    notifyListeners();
  }
}
