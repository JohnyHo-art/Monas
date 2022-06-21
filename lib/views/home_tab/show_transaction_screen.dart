import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/models/show_expense_title_model.dart';
import 'package:monas/models/transaction_model.dart' as model;
import 'package:monas/models/wallet_model.dart';
import 'package:monas/viewmodels/adding_transaction/load_transaction_vm.dart';
import 'package:monas/viewmodels/dropdown_wallet_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/views/home_tab/components/time_chosen_item.dart';
import 'package:provider/provider.dart';

import '../../constants/utils.dart';
import '../../viewmodels/adding_transaction/adding_basic_info_vm.dart';
import '../../viewmodels/time_chosen_vm.dart';

class ShowTransactionScreen extends StatelessWidget {
  const ShowTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dropdownWallet = context.watch<DropdownWalletViewModel>();
    var loadWallet = context.watch<LoadWalletViewModel>();
    var loadTransaction = context.watch<LoadTransactionViewmodel>();

    int currentYear = DateTime.now().year;
    List yearList = [
      currentYear - 3,
      currentYear - 2,
      currentYear - 1,
      currentYear,
      currentYear + 1,
      currentYear + 2,
      currentYear + 3,
    ];

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
                    padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 0),
                    child: Text(
                      wallet.name,
                      style: S.bodyTextStyles.body1(
                        S.colors.textOnSecondaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      wallet.balance.toString(),
                      style: S.bodyTextStyles.body1(
                        S.colors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );

    Widget _dropdownWallet() => Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: DropdownButton(
            underline: Container(),
            value: dropdownWallet.getSelectedWallet(),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: S.colors.whiteColor,
            ),
            items: loadWallet.currentListWallet
                .map((Wallet wallet) => DropdownMenuItem(
                    value: wallet, child: _dropdownItems(wallet)))
                .toList(),
            onChanged: (newVal) {
              dropdownWallet.setSelectedWallet(newVal);
              loadTransaction.loadTransactionDataFromFirestore(
                  "wallet" +
                      loadWallet.currentListWallet
                          .indexOf(newVal as Wallet)
                          .toString(),
                  null);
            },
          ),
        );

    return SafeArea(
      child: DefaultTabController(
        initialIndex: DateTime.now().month - 1,
        length: 12,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: S.colors.primaryColor,
            foregroundColor: S.colors.textOnSecondaryColor,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
                loadTransaction.loadTransactionDataFromFirestore(
                    "wallet0", null);
              },
            ),
            title: _dropdownWallet(),
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: S.colors.subTextColor,
              indicatorColor: S.colors.whiteColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: S.bodyTextStyles.buttonText(null),
              onTap: (index) async {
                // loadTransaction.loadTransactionDataFromFirestore(
                //     dropdownWallet.getSelectedWallet().id, "${index + 1}-2022");
                loadTransaction.setChosenMonth(index + 1);
              },
              tabs: const [
                Tab(text: 'Tháng 1'),
                Tab(text: 'Tháng 2'),
                Tab(text: 'Tháng 3'),
                Tab(text: 'Tháng 4'),
                Tab(text: 'Tháng 5'),
                Tab(text: 'Tháng 6'),
                Tab(text: 'Tháng 7'),
                Tab(text: 'Tháng 8'),
                Tab(text: 'Tháng 9'),
                Tab(text: 'Tháng 10'),
                Tab(text: 'Tháng 11'),
                Tab(text: 'Tháng 12'),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.addingBudgetScreen),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
              Column(
                children: const [
                  ShowDetailExpense(),
                ],
              ),
            ],
          ),
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
    var dropdownWallet = context.watch<DropdownWalletViewModel>();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
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
                        // DateFormat('yMMMM').format(
                        //     loadTransaction.getListTransaction()[0].date)
                        "aaaa",
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
                      //"${loadTransaction.getListTransaction().length}  transaction",
                      "bbb",
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
              StreamBuilder<QuerySnapshot>(
                stream: loadTransaction.getTransactionStream(
                    dropdownWallet.getSelectedWallet().id,
                    "${loadTransaction.chosenMonth}-2022"),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        // Create a new budget and decompose it from JSON format
                        model.Transaction transaction =
                            model.Transaction.fromMap(
                                snapshot.data!.docs[index]);
                        // Add each budget in the budgets list to the categories list

                        return ShowExpenseItem(transaction: transaction);
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: S.colors.secondaryColor,
                      ),
                    );
                  } // If the snapshot has error than show a snackbar
                  else if (snapshot.hasError) {
                    return Utils.showErrorDialog(context);
                  } else {
                    return const Center(
                      child: Text("No transaction in this month"),
                    );
                  }
                },
              ),
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

  final model.Transaction transaction;

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
