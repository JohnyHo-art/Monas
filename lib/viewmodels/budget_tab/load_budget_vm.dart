import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monas/models/budget_model.dart';

class LoadBudgetViewModel extends ChangeNotifier {
  // Create a new list of budgets
  List<Budget> _budgets = [];

  List<Budget> get budgets => _budgets;

  void setBudgets(newVal) {
    _budgets = newVal;
    notifyListeners();
  }

  // year to show budget
  int _chosenYear = DateTime.now().year;

  int get chosenYear => _chosenYear;

  void setChosenYear(newVal) {
    _chosenYear = newVal;
    notifyListeners();
  }

  // month to show budget
  int _chosenMonth = DateTime.now().month;

  int get chosenMonth => _chosenMonth;

  void setChosenMonth(newVal) {
    _chosenMonth = newVal;
    notifyListeners();
  }

  // Get the total budget amount
  double _totalBudget = 0;

  double get totalBudget => _totalBudget;

  void setTotalBudget(newVal) {
    _totalBudget = newVal;
    notifyListeners();
  }

  void updateTotalBudget() {
    for (Budget budget in _budgets) {
      _totalBudget += budget.budget;
      notifyListeners();
    }
  }

  // Get the total spent of each month
  double _totalSpent = 0;

  double get totalSpent => _totalSpent;

  void setTotalSpent(newVal) {
    _totalSpent = newVal;
    notifyListeners();
  }

  void updateTotalSpent() {
    for (Budget budget in _budgets) {
      _totalSpent += budget.spent;
      notifyListeners();
    }
  }
}
