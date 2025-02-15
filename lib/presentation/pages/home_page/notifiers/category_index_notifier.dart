import 'package:flutter/cupertino.dart';

class CategoryIndexNotifier extends ChangeNotifier {

  int _categoryIndex = 0;
  int get categoryIndex => _categoryIndex;

  void update(int newValue) {
    _categoryIndex = newValue;
    notifyListeners();
  }

}