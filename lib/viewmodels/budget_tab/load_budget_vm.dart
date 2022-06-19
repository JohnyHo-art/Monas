import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadBudgetViewModel extends ChangeNotifier {
  // show budget by year
  int _chosenYear = DateTime.now().year;

  int get chosenYear => _chosenYear;

  void setChosenYear(newVal) {
    _chosenYear = newVal;
    notifyListeners();
  }

  // show budget by month
  int _chosenMonth = DateTime.now().month;

  int get chosenMonth => _chosenMonth;

  void setChosenMonth(newVal) {
    _chosenMonth = newVal;
    notifyListeners();
  }

  // Get the total budget amount of each month to show in the budget dashboard
  double _totalBudget = 0;

  double get totalBudget => _totalBudget;

  void setTotalBudget(newVal) {
    _totalBudget = newVal;
  }

  // Get the total spent of each month to show in the budget dashboard
  double _totalSpent = 0;

  double get totalSpent => _totalSpent;

  void setTotalSpent(double newVal) {
    _totalSpent = newVal;
  }

  // Create a new list of int to save the chosen categories
  // This list will be used to check created category budget
  List<int> _chosenCategories = [];

  List<int> get chosenCategories => _chosenCategories;

  void setChosenCategories(List<int> newVal) {
    _chosenCategories = newVal;
  }

  void addNewCategoryID(int id) {
    _chosenCategories.add(id);
  }

  // Stream of query snapshot used to pass to the stream builder 
  // at the budget screen to get this screen updated 
  // Pass in the chosen month, year and walletId
  Stream<QuerySnapshot> getBudgetStream(String walletId) {
    return FirebaseFirestore.instance
        .collection('budgets')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(walletId)
        .doc('$chosenMonth-$chosenYear')
        .collection('budgetList')
        .snapshots();
  }
}
