import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/models/budget_model.dart';

class AddingBudgetViewModel extends ChangeNotifier {
  // Initialize firebase instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Index of the category which is call as id
  int _selectedCategoryId = 0;

  int get selectedCategoryId => _selectedCategoryId;

  void setSelectedCategoryId(newVal) {
    _selectedCategoryId = newVal;
    notifyListeners();
  }

  // Index of the chosen wallet
  String _selectedWalletId = 'wallet0';

  String get selectedWalletId => _selectedWalletId;

  void setSelectedWalletId(String newVal) {
    _selectedWalletId = newVal;
    notifyListeners();
  }

  // Add new budget and push it data to firstore
  Future<void> saveAndPushBudget(double amount) async {
    // Get the current time when the budget is created
    DateTime now = DateTime.now();

  Budget budget = Budget(
      budget: amount,
      categoryId: selectedCategoryId,
      walletId: selectedWalletId,
      spent: 0,
    );

    await _firestore
        .collection('budgets')
        .doc(_auth.currentUser!.uid)
        .collection(selectedWalletId)
        .doc('${now.month}-${now.year}')
        .collection('budgetList')
        .doc('category$selectedCategoryId')
        .set(budget.toJSON())
        .onError((error, stackTrace) =>
            Utils.showSnackBar('Thêm ngân sách thất bại'))
        .then(
      (value) {
        Utils.showSuccessSnackBar('Thêm ngân sách thành công');
      },
    );
  }
}
