import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/models/show_expense_title_model.dart';
import 'package:monas/models/transaction_model.dart';
import 'package:monas/models/wallet_model.dart';
import 'package:monas/viewmodels/adding_transaction/load_transaction_vm.dart';
import 'package:monas/viewmodels/dropdown_wallet_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/views/home_tab/components/time_chosen_item.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/adding_transaction/adding_basic_info_vm.dart';
import '../../viewmodels/time_chosen_vm.dart';

class ShowTransactionScreen extends StatelessWidget {
  const ShowTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dropdownWallet = context.watch<DropdownWalletViewModel>();
    var loadWallet = context.watch<LoadWalletViewModel>();
    var loadTransaction = context.watch<LoadTransactionViewmodel>();

    Widget _dropdownItems(Wallet wallet) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              wallet.iconUrl,
              height: 40,
              width: 40,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 4),
                    child: Text(
                      wallet.name,
                      style: S.bodyTextStyles.caption(
                        S.colors.textOnSecondaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      wallet.balance.toString(),
                      style: S.headerTextStyles.header3(
                        S.colors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );

    Widget _dropdownWallet() => DropdownButton(
          underline: Container(),
          value: dropdownWallet.getSelectedWallet(),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: loadWallet.currentListWallet
              .map((Wallet wallet) => DropdownMenuItem(
                  value: wallet, child: _dropdownItems(wallet)))
              .toList(),
          onChanged: (newVal) {
            dropdownWallet.setSelectedWallet(newVal);
            loadTransaction.loadTransactionDataFromFirestore("wallet" +
                loadWallet.currentListWallet
                    .indexOf(newVal as Wallet)
                    .toString());
          },
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: S.colors.whiteColor,
        foregroundColor: S.colors.textOnSecondaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
            loadTransaction.loadTransactionDataFromFirestore("wallet0");
          },
        ),
        title: _dropdownWallet(),
      ),
      body: Column(
        children: const [
          Classify(),
          ShowDetailExpense(),
        ],
      ),
    );
  }
}

class Classify extends StatelessWidget {
  const Classify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var transaction = context.watch<AddingBasicInfoViewModel>();
    var timeChosen = context.watch<TimeChosenViewModel>();

    Future pickDate() async {
      final initialDate = transaction.date;
      final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) => Theme(
          data: ThemeData().copyWith(
              colorScheme: ColorScheme.light(
            primary: S.colors.primaryColor,
          )),
          child: child ?? const SizedBox.shrink(),
        ),
      );
      if (newDate == null) return;
      transaction.date = newDate;
    }

    return Container(
      decoration: BoxDecoration(
        color: S.colors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: S.colors.shadowElevationColor,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TimeChosenItem(
                number: 0,
                text: "D",
                onPressed: () {
                  timeChosen.setSelectedTime(0);
                },
              ),
            ),
            TimeChosenItem(
              number: 1,
              text: "W",
              onPressed: () {
                timeChosen.setSelectedTime(1);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TimeChosenItem(
                number: 2,
                text: "M",
                onPressed: () {
                  timeChosen.setSelectedTime(2);
                },
              ),
            ),
            const Spacer(),
            Text(
              transaction.getDateText(),
              style: S.bodyTextStyles.body1(S.colors.textOnSecondaryColor),
            ),
            Material(
              child: IconButton(
                onPressed: () => pickDate(),
                icon: Icon(
                  Icons.calendar_today,
                  color: S.colors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowDetailExpense extends StatelessWidget {
  const ShowDetailExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loadTransaction = context.watch<LoadTransactionViewmodel>();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
        child: Container(
          decoration: BoxDecoration(
            color: S.colors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: S.colors.shadowElevationColor,
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 12, 0, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        ExpenseTitle.testTitle.date,
                        style: S.bodyTextStyles.body1(null),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.arrow_circle_down,
                        color: S.colors.backgroundIcon2,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        NumberFormat.decimalPattern()
                            .format(loadTransaction.getIncome()),
                        style: S.bodyTextStyles.body2(null),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4, 0, 8),
                child: Row(
                  children: [
                    Text(
                      "${loadTransaction.getListTransaction().length}  transaction",
                      style: S.bodyTextStyles.caption(S.colors.backgroundIcon2),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.arrow_circle_up,
                        color: S.colors.redColor,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        NumberFormat.decimalPattern()
                            .format(loadTransaction.getExpense()),
                        style: S.bodyTextStyles.body2(null),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: S.colors.shadowElevationColor,
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: loadTransaction.getListTransaction().length,
                  itemBuilder: (context, index) {
                    return ShowExpenseItem(
                        transaction:
                            loadTransaction.getListTransaction()[index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ShowExpenseItem extends StatelessWidget {
  const ShowExpenseItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailTransactionScreen,
            arguments: transaction);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 8, 0, 0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(
                  Category.categoryList[transaction.categoryId].iconUrl),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('yMMMMd').format(transaction.date),
                  style: S.bodyTextStyles.caption(null),
                ),
                Text(
                  Category.categoryList[transaction.categoryId].name,
                  style:
                      S.bodyTextStyles.caption(S.colors.shadowElevationColor),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: Text(
                NumberFormat.decimalPattern().format(transaction.money),
                style: S.bodyTextStyles.caption(
                  transaction.money < 0
                      ? S.colors.redColor
                      : S.colors.greenColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
