import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:monas/models/budget_model.dart';

class EditBudgetViewModel extends ChangeNotifier {
  // Initialize firebase instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // New chosen wallet id
  String _newWalletId = 'wallet0';

  String get newWalletId => _newWalletId;

  void setNewWalletId(String newVal) {
    _newWalletId = newVal;
    notifyListeners();
  }

  // New chosen category id
  int _newCategoryId = 0;

  int get newCategoryId => _newCategoryId;

  void setNewCategory(int newVal) {
    _newCategoryId = newVal;
    notifyListeners();
  }

  // A variable to check if update is success
  bool _updateSuccess = false;

  bool get updateSuccess => _updateSuccess;

  set setUpDateSuccess(newVal) {
    _updateSuccess = newVal;
    notifyListeners();
  }

  // A variable to check if delete is success
  bool _isDeleteSuccess = false;

  bool get isDeleteSuccess => _isDeleteSuccess;

  set setIsDeleteSuccess(newVal) {
    _isDeleteSuccess = newVal;
    notifyListeners();
  }

  // Check all the spent in a transactions list 
  // given by month, year and category id
  double _newSpent = 0.0;

  double get newSpent => _newSpent;

  set newSpent(double newVal) {
    _newSpent = newVal;
    notifyListeners();
  }

  // Delete current budget
  // We need to pass the old chosen month and year
  Future<void> deleteBudget(
      int chosenMonth, int chosenYear, String walletId, int categoryId) async {
    await _firestore
        .collection('budgets')
        .doc(_auth.currentUser!.uid)
        .collection(walletId)
        .doc('$chosenMonth-$chosenYear')
        .collection('budgetList')
        .doc('category$categoryId')
        .delete()
        .onError((error, stackTrace) => {})
        .then(
      (value) {
        setIsDeleteSuccess = true;
      },
    );
  }

  // Update current info and push it to firestore
  Future<void> saveAndPushBudget(double amount, int chosenMonth, int chosenYear,
      double spent, String? walletId, int? categoryId) async {
    Budget budget = Budget(
      budget: amount,
      categoryId: categoryId ?? newCategoryId,
      walletId: newWalletId,
      spent: spent,
    );

  await _firestore
        .collection('budgets')
        .doc(_auth.currentUser!.uid)
        .collection(walletId ?? newWalletId)
        .doc('$chosenMonth-$chosenYear')
        .collection('budgetList')
        .doc('category${categoryId ?? newCategoryId}')
        .set(budget.toJSON(), SetOptions(merge: true))
        .onError((error, stackTrace) => {})
        .then(
      (value) {
        setUpDateSuccess = true;
      },
    );
  }

  // Get a specified budget with category
  Future<Budget> getBudgetWithMonthYear(
      String walletId, int chosenMonth, int chosenYear, int categoryId) async {
    final docSnap = await FirebaseFirestore.instance
        .collection('budgets')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(walletId)
        .doc('$chosenMonth-$chosenYear')
        .collection('budgetList')
        .doc('category$categoryId')
        .get();

    return Budget.fromJSON(docSnap.data());
  }
}
