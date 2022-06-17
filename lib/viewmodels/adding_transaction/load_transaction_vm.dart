import 'package:flutter/foundation.dart';
import 'package:monas/models/adding_transaction_repository.dart';
import 'package:monas/models/transaction_model.dart';

class LoadTransactionViewmodel extends ChangeNotifier {
  List<Transaction> _listTransaction = [];
  List<Transaction> getListTransaction() => _listTransaction;
  void setListTransaction(newVal) {
    _listTransaction = newVal;
    notifyListeners();
  }

  List<Transaction> _listRecentTransaction = [];
  List<Transaction> getListRecentTransaction() => _listRecentTransaction;
  void setListRecentTransaction(newVal) {
    _listRecentTransaction = newVal;
    notifyListeners();
  }

  Future<void> loadTransactionDataFromFirestore() async {
    var list = await AddingTransactionRepo().getTransactionDataFromFirestore();

    setListTransaction(list);
    loadRecentTransaction();
  }

  Future<void> loadRecentTransaction() async {
    List<Transaction> tempList = [];
    AddingTransactionRepo().getTransactionDataFromFirestore().then((value) {
      Iterable temp = value.reversed;
      if (value.length < 5) {
        for (int i = 0; i < value.length; i++) {
          tempList.add(temp.elementAt(i));
        }
      } else {
        for (int i = 0; i < 5; i++) {
          tempList.add(temp.elementAt(i));
        }
      }
      setListRecentTransaction(tempList);
    });
  }
}