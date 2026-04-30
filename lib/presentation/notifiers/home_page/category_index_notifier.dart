import 'package:flutter/cupertino.dart';

class CategoryIndexNotifier extends ChangeNotifier {
  int? _previousIndex;

  int? get previousIndex => _previousIndex;

  int _categoryIndex = 0;

  int get categoryIndex => _categoryIndex;

  void update(int newValue) {
    _previousIndex = _categoryIndex;

    _categoryIndex = newValue;
    notifyListeners();
  }
}
