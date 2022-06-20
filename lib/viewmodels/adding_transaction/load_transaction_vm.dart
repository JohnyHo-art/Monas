import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:monas/models/adding_transaction_repository.dart';
import 'package:monas/models/transaction_model.dart' as model;
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:provider/provider.dart';

class LoadTransactionViewmodel extends ChangeNotifier {
  List<model.Transaction> _listTransaction = [];
  List<model.Transaction> getListTransaction() => _listTransaction;
  void setListTransaction(newVal) {
    _listTransaction = newVal;
    notifyListeners();
  }

  void addTransaction(newVal) {
    _listTransaction.add(newVal);
    notifyListeners();
  }

  int _chosenMonth = DateTime.now().month;
  int get chosenMonth => _chosenMonth;
  void setChosenMonth(newVal) {
    _chosenMonth = newVal;
    notifyListeners();
  }

  List<model.Transaction> _listRecentTransaction = [];
  List<model.Transaction> getListRecentTransaction() => _listRecentTransaction;
  void setListRecentTransaction(newVal) {
    _listRecentTransaction = newVal;
    notifyListeners();
  }

  Future<void> loadTransactionDataFromFirestore(
      String walletId, String? date) async {
    String month = DateTime.now().month.toString();
    String year = DateTime.now().year.toString();

    var list = [];
    list = await AddingTransactionRepo()
        .getTransactionDataFromFirestore(walletId, date ?? "$month-$year");

    setListTransaction(list);
    loadRecentTransaction();
    loadExpenseTittle();
  }

  Future<void> loadRecentTransaction() async {
    var list =
        await AddingTransactionRepo().getRecentTransactionDataFromFirestore();
    setListRecentTransaction(list);
  }

  //load expense tittle
  double _expense = 0;
  double getExpense() => _expense;
  void setExpense(newVal) {
    _expense = newVal;
    notifyListeners();
  }

  double _income = 0;
  double getIncome() => _income;
  void setIncome(newVal) {
    _income = newVal;
    notifyListeners();
  }

  void loadExpenseTittle() {
    _income = 0;
    _expense = 0;
    for (var i in getListTransaction()) {
      if (i.money < 0) {
        _expense += i.money;
        setExpense(_expense);
      } else {
        _income += i.money;
        setIncome(_income);
      }
    }
  }

  Stream<QuerySnapshot> getTransactionStream(String walletId, String date) {
    return FirebaseFirestore.instance
        .collection('transactions')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(walletId)
        .doc(date)
        .collection('listTransactions')
        .snapshots();
  }

  int _length = 0;
  int getLength() => _length;
  void setLength(newVal) {
    _length = newVal;
    notifyListeners();
  }
}
