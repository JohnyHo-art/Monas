import 'package:flutter/material.dart';

class AddingBudgetViewModel extends ChangeNotifier {
  // Budget amount
  double _budgetAmount = 0;

  double get budgetAmount => _budgetAmount;

  void setBudgetAmount(newVal) {
    _budgetAmount = newVal;
    notifyListeners();
  }

  // Index of the category which is call as id
  int _selectedCategoryId = 0;

  int get selectedCategoryId => _selectedCategoryId;

  void setSelectedCategoryId(newVal) {
    _selectedCategoryId = newVal;
    notifyListeners();
  }

  // Index of the chosen wallet
  int _selectedWalletId = 0;

  int get selectedWalletId => _selectedWalletId;

  void setSelectedWalletId(newVal) {
    _selectedWalletId = newVal;
    notifyListeners();
  }
}
