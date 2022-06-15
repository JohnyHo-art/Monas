import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadBudgetViewModel extends ChangeNotifier {
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
  }

  // Get the total spent of each month
  double _totalSpent = 0;

  double get totalSpent => _totalSpent;

  void setTotalSpent(newVal) {
    _totalSpent = newVal;
  }

  // Create a new list of int to save the chosen categories
  // This list will be used to check created category budget
  List<int> _chosenCategories = [];

  List<int> get chosenCategories => _chosenCategories;

  void setChosenCategories(newVal) {
    _chosenCategories = newVal;
  }

  void addNewCategoryID(int id) {
    _chosenCategories.add(id);
  }

  // Stream of query snapshot used to pass to the stream builder
  Stream<QuerySnapshot> getBudgetStream(int walletId) {
    return FirebaseFirestore.instance
        .collection('budgets')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('wallet$walletId')
        .doc('$chosenMonth-$chosenYear')
        .collection('budgetList')
        .snapshots();
  }
}
