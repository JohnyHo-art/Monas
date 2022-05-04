import 'package:flutter/material.dart';

class ChooseCategoryViewModel extends ChangeNotifier {
  int _selectedCategoryIndex = 0;

  int getSelectedCategoryIndex() => _selectedCategoryIndex;

  void setSelectedCategoryIndex(int newVal) {
    _selectedCategoryIndex = newVal;
    notifyListeners();
  }
}
