import 'package:blogify_flutter_main/common/enums/post_filter.dart';
import 'package:flutter/material.dart';

class SearchBarNotifier extends ChangeNotifier {
  PostFilter _selectedFilterType = PostFilter.author;

  PostFilter get selectedFilterType => _selectedFilterType;

  bool _isSelectionOpen = false;

  bool get isSelectionOpen => _isSelectionOpen;

  String _searchControllerValue = '';

  String get searchControllerValue => _searchControllerValue;

  void updateFilterType(PostFilter newValue) {
    _selectedFilterType = newValue;
    notifyListeners();
  }

  void setIsMenuExpanded(bool newState) {
    _isSelectionOpen = newState;
    notifyListeners();
  }

  void updateSearchControllerValue(String newValue) {
    _searchControllerValue = newValue;
    notifyListeners();
  }
}
