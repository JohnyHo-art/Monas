// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/models/transaction_model.dart';
import 'package:monas/viewmodels/adding_transaction/load_transaction_vm.dart';
import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:provider/provider.dart';

class BudgetTransactionsListScreen extends StatelessWidget {
  BudgetTransactionsListScreen({Key? key, required this.budget})
      : super(key: key);
  Budget budget;

  @override
  Widget build(BuildContext context) {
    var loadTransaction = context.watch<LoadTransactionViewmodel>();
    var loadBudget = context.watch<LoadBudgetViewModel>();
    var addingBudget = context.watch<AddingBudgetViewModel>();

    // Transaction item in the list
    Widget transactionItem(Transaction transaction) {
      return ListTile(
        leading: Text(
          transaction.date.day.toString(),
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 34,
            color: S.colors.textOnSecondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        title: Text(
          'tháng ' +
              transaction.date.month.toString() +
              ', ' +
              transaction.date.year.toString(),
        ),
        subtitle: Text(transaction.note ?? ''),
        trailing: Text(
          //Ftransaction.money.toString(),
          F.currencyFormat.numberMoneyFormat(-transaction.money),
          style: S.bodyTextStyles.body2(S.colors.redColor),
        ),
      );
    }

    // A general view to summarize the report
    Column generalView(String subtext) => Column(
          children: [
            ListTile(
              leading: Image.asset(
                Category.categoryList[budget.categoryId].iconUrl,
              ),
              title: Text(Category.categoryList[budget.categoryId].name),
              subtitle: Text(subtext + ' giao dịch'),
              trailing: Text(
                '-' + F.currencyFormat.numberMoneyFormat(budget.spent),
                style: S.bodyTextStyles.body2(null),
              ),
            ),
            Divider(
              indent: S.dimens.smallPadding,
              endIndent: S.dimens.smallPadding,
              color: S.colors.subTextColor2,
            ),
          ],
        );

    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.appBackground,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: S.colors.primaryColor,
          leading: IconButton(
            onPressed: () {
              // Navigate back
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: S.colors.whiteColor,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Danh sách giao dịch',
            style: S.headerTextStyles.appbarTitle(S.colors.textOnPrimaryColor),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: S.dimens.padding,
            horizontal: S.dimens.smallPadding,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: S.colors.whiteColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(S.dimens.cardCornerRadiusMedium))),
            child: StreamBuilder<cloud_firestore.QuerySnapshot>(
              stream: loadTransaction.getTransactionStream(
                addingBudget.selectedWalletId,
                budget.categoryId,
                loadBudget.chosenMonth,
                loadBudget.chosenYear,
              ),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  // Insert a list of transaction
                  return Column(
                    children: [
                      generalView(snapshot.data!.docs.length.toString()),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            Transaction transaction = Transaction.fromMap(
                                snapshot.data!.docs[index].data());
                            return transactionItem(transaction);
                          },
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: S.colors.secondaryColor,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Không có giao dịch nào'),
                  );
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
