import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:monas/models/adding_transaction_repository.dart';
import 'package:monas/models/transaction_model.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:provider/provider.dart';

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

  Future<void> loadTransactionDataFromFirestore(String walletId) async {
    String month = DateTime.now().month.toString();
    String year = DateTime.now().year.toString();

    var list = await AddingTransactionRepo()
        .getTransactionDataFromFirestore(walletId, "$month-$year");

    setListTransaction(list);
    loadRecentTransaction();
    loadExpenseTittle();
  }

  Future<void> loadRecentTransaction() async {
    List<Transaction> tempList = [];
    // AddingTransactionRepo().getTransactionDataFromFirestore().then((value) {
    //   Iterable temp = value.reversed;
    //   if (value.length < 5) {
    //     for (int i = 0; i < value.length; i++) {
    //       tempList.add(temp.elementAt(i));
    //     }
    //   } else {
    //     for (int i = 0; i < 5; i++) {
    //       tempList.add(temp.elementAt(i));
    //     }
    //   }
    //   setListRecentTransaction(tempList);
    // });
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
}
