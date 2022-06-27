import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monas/models/adding_transaction_repository.dart';
import 'package:monas/models/transaction_model.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
import 'package:monas/viewmodels/adding_transaction/detail_info_vm.dart';
import 'package:monas/viewmodels/adding_transaction/pick_image_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:provider/provider.dart';

class AddingTransactionViewmodel extends ChangeNotifier {
  late Transaction newTransaction;

  Future<Transaction> getInfoNewTransaction(BuildContext context) async {
    var detaiInfo = Provider.of<DetailInfoViewmodel>(context, listen: false);
    var pickImage = Provider.of<PickImage>(context, listen: false);
    var basicInfo =
        Provider.of<AddingBasicInfoViewModel>(context, listen: false);
    var addingMoney =
        Provider.of<AddingAmountViewModel>(context, listen: false);
    var loadWallet = Provider.of<LoadWalletViewModel>(context, listen: false);

    String walletId =
        loadWallet.currentListWallet[basicInfo.getSelectedWallet()].id;

    int categoryId = basicInfo.getSelectedCategoryId();

    double money = 0;

    if (isExpenseCategory(categoryId)) {
      money = 0 - addingMoney.amountOfMoney;
    } else {
      money = addingMoney.amountOfMoney;
    }

    String note = basicInfo.note;
    DateTime date = basicInfo.date;
    String withPerson = detaiInfo.getWithPerson();
    var tempList = await AddingTransactionRepo()
        .getListUrlFromStorage(pickImage.getImages());
    List<String> listImages = tempList;

    Transaction newTransaction = Transaction(
        money: money,
        walletId: walletId,
        categoryId: categoryId,
        note: note,
        date: DateUtils.dateOnly(date),
        withPerson: withPerson,
        images: listImages);

    return newTransaction;
  }

  Future<void> pushNewTransactionToFirestore(BuildContext context) async {
    newTransaction = await getInfoNewTransaction(context);

    AddingTransactionRepo().pushTransactionToFirestore(newTransaction);
    AddingTransactionRepo().pushRecentTransactionToFirestore(newTransaction);
  }

  Future<void> updateWalletBalanceAfterAddNewTransaction(
      BuildContext context) async {
    var loadWallet = Provider.of<LoadWalletViewModel>(context, listen: false);
    var addingMoney =
        Provider.of<AddingAmountViewModel>(context, listen: false);
    var basicInfo =
        Provider.of<AddingBasicInfoViewModel>(context, listen: false);

    double remaningBalance =
        loadWallet.currentListWallet[basicInfo.getSelectedWallet()].balance;

    int categoryId = basicInfo.getSelectedCategoryId();

    double money = 0;

    if (isExpenseCategory(categoryId)) {
      money = 0 - addingMoney.amountOfMoney;
    } else {
      money = addingMoney.amountOfMoney;
    }

    double newBalance = remaningBalance + money;

    await AddingTransactionRepo()
        .updateWalletBalance(basicInfo.getSelectedWallet(), newBalance);
  }

  //clarify expenses and incomes
  bool isExpenseCategory(int id) {
    if (id == 26 || id == 27 || id == 30 || id == 31 || id == 32 || id == 34) {
      return false;
    }
    return true;
  }
}
