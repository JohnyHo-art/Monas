import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/models/budget_model.dart';

class EditBudgetViewModel extends ChangeNotifier {
  // Initialize firebase instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // New chosen wallet id
  int _newWalletId = 0;

  int get newWalletId => _newWalletId;

  void setNewWalletId(newVal) { 
    _newWalletId = newVal;
    notifyListeners();
  }

  // New chosen category id
  int _newCategoryId = 0;

  int get newCategoryId => _newCategoryId;

  void setNewCategory(newVal) {
    _newCategoryId = newVal;
    //notifyListeners();
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

  // Delete current budget
  Future<void> deleteBudget(
      int chosenMonth, int chosenYear, int walletId, int categoryId) async {
    await _firestore
        .collection('budgets')
        .doc(_auth.currentUser!.uid)
        .collection('wallet$walletId')
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
  Future<void> saveAndPushBudget(
      double amount, int chosenMonth, int chosenYear) async {
    Budget budget = Budget(
      budget: amount,
      categoryId: newCategoryId,
      walletId: newWalletId,
      spent: 0,
    );

    await _firestore
        .collection('budgets')
        .doc(_auth.currentUser!.uid)
        .collection('wallet$newWalletId')
        .doc('$chosenMonth-$chosenYear')
        .collection('budgetList')
        .doc('category$newCategoryId')
        .set(budget.toJSON(), SetOptions(merge: true))
        .onError((error, stackTrace) => {})
        .then(
          (value) {
            setUpDateSuccess = true;
          },
        );
  }
}
