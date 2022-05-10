import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/models/show_expense_item_model.dart';
import 'package:monas/models/show_expense_title_model.dart';
import 'package:monas/models/wallet_model.dart';
import 'package:monas/viewmodels/dropdown_wallet_vm.dart';
import 'package:monas/views/home_tab/components/time_chosen_item.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/adding_transaction_vm.dart';
import '../../viewmodels/time_chosen_vm.dart';

class ShowExpenseScreen extends StatelessWidget {
  const ShowExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dropdownWallet = context.watch<DropdownWalletViewModel>();

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
          items: dropdownWallet.dropdownWalletList
              .map((Wallet wallet) => DropdownMenuItem(
                  value: wallet, child: _dropdownItems(wallet)))
              .toList(),
          onChanged: (newVal) {
            dropdownWallet.setSelectedWallet(newVal);
          },
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: S.colors.whiteColor,
        foregroundColor: S.colors.textOnSecondaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: _dropdownWallet(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
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
    var transaction = context.watch<AddingTransactionViewModel>();
    var timeChosen = context.watch<TimeChosenViewModel>();

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
                onPressed: () => transaction.pickDate(context),
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
                            .format(ExpenseTitle.testTitle.income),
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
                      "${ExpenseTitle.testTitle.numberTransactions} transaction",
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
                            .format(ExpenseTitle.testTitle.expense),
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
                  itemCount: ExpenseItem.testList.length,
                  itemBuilder: (context, index) {
                    return ShowExpenseItem(
                        categoryId: ExpenseItem.testList[index].categoryId,
                        date: ExpenseItem.testList[index].date,
                        money: ExpenseItem.testList[index].money);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ShowExpenseItem extends StatelessWidget {
  const ShowExpenseItem(
      {Key? key,
      required this.categoryId,
      required this.date,
      required this.money})
      : super(key: key);

  final int categoryId;
  final String date;
  final double money;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 8, 0, 0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(Category.categoryList[categoryId].iconUrl),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: S.bodyTextStyles.caption(null),
              ),
              Text(
                Category.categoryList[categoryId].name,
                style: S.bodyTextStyles.caption(S.colors.shadowElevationColor),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Text(
              NumberFormat.decimalPattern().format(money),
              style: S.bodyTextStyles.caption(null),
            ),
          ),
        ],
      ),
    );
  }
}
