import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/viewmodels/adding_budget_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
import 'package:provider/provider.dart';

class BudgetRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late AddingBudgetViewModel budgetVM;

  // Add new budget and push it data to firstore
  Future<void> saveAndPushBudget(Budget budget, int walletId) async {
    // Get the current time when the budget is created
    DateTime now = DateTime.now();
    // The budget document path will look like: 6-2022-wallet1
    String budgetDocPath = '${now.month}-${now.year}-wallet$walletId';

    await _firestore
    .collection('budgets')
    .doc(_auth.currentUser!.uid)
    .collection('budgetList')
    .doc(budgetDocPath)
    .set(budget.toJSON())
    .onError((error, stackTrace) =>  Utils.showSnackBar('Thêm ngân sách thất bại'))
    .then((value) => {
      Utils.showSuccessSnackBar('Thêm ngân sách thành công')
    });
  }
}