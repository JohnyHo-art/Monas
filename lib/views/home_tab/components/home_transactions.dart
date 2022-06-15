import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/models/transaction_model.dart';
import 'package:monas/viewmodels/adding_transaction/load_transaction_vm.dart';
import 'package:provider/provider.dart';

class HomeTransactions extends StatelessWidget {
  const HomeTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loadTransaction = context.watch<LoadTransactionViewmodel>();

    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Giao dịch gần đây',
                  style:
                      S.headerTextStyles.header3(S.colors.textOnSecondaryColor),
                ),
                TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => S.colors.primaryColorShadeThirty)),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.showTransactionScreen);
                    },
                    child: Text(
                      'Xem tất cả',
                      style: S.bodyTextStyles.buttonText(S.colors.primaryColor),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: RefreshIndicator(
              onRefresh: () {
                return loadTransaction.loadTransactionDataFromFirestore();
              },
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: loadTransaction.getListRecentTransaction().length,
                itemBuilder: (context, index) {
                  return TransactionItem(
                      transaction:
                          loadTransaction.getListRecentTransaction()[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({
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
                  style: S.bodyTextStyles.body1(null),
                ),
                Text(
                  Category.categoryList[transaction.categoryId].name,
                  style: S.bodyTextStyles.body1(S.colors.shadowElevationColor),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: Text(
                NumberFormat.decimalPattern().format(transaction.money),
                style: S.bodyTextStyles.body1(
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
