import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/adding_transaction/load_transaction_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:provider/provider.dart';

import '../../../constants/format_style.dart';

class HomeTotalBalance extends StatelessWidget {
  const HomeTotalBalance({Key? key}) : super(key: key);

  Row _totalBalance(double totalAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(left: S.dimens.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tổng số dư',
                  style: S.bodyTextStyles.body2(S.colors.textOnPrimaryColor)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        // Add total balance
                        text: F.currencyFormat.numberMoneyFormat(totalAmount),
                        style: S.headerTextStyles
                            .header1(S.colors.textOnPrimaryColor)),
                    TextSpan(
                      // Add currency unit
                      text: NumberFormat.currency(locale: 'vi_VN')
                          .currencySymbol
                          .toString(),
                      style:
                          S.bodyTextStyles.body1(S.colors.textOnPrimaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Row _detailSatistic(double income, double expense) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* Income statistic
        Padding(
          padding: EdgeInsets.only(left: S.dimens.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.arrow_circle_up,
                        color: S.colors.textOnPrimaryColor,
                        size: S.dimens.iconSize,
                      ),
                    ),
                    TextSpan(
                      text: ' Tiền vào',
                      style:
                          S.bodyTextStyles.body2(S.colors.textOnPrimaryColor),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        // Add income money
                        text: F.currencyFormat.numberMoneyFormat(income),
                        style: S.headerTextStyles
                            .header3(S.colors.textOnPrimaryColor)),
                    TextSpan(
                      // Add currency unit
                      text: NumberFormat.currency(locale: 'vi_VN')
                          .currencySymbol
                          .toString(),
                      style:
                          S.bodyTextStyles.caption(S.colors.textOnPrimaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        //* Expenses statistic
        Padding(
          padding: EdgeInsets.only(right: S.dimens.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Tiền ra ',
                      style:
                          S.bodyTextStyles.body2(S.colors.textOnPrimaryColor),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.arrow_circle_down,
                        color: S.colors.textOnPrimaryColor,
                        size: S.dimens.iconSize,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        // Add expenses
                        text: F.currencyFormat.numberMoneyFormat(expense),
                        style: S.headerTextStyles
                            .header3(S.colors.textOnPrimaryColor)),
                    TextSpan(
                      // Add currency unit
                      text: NumberFormat.currency(locale: 'vi_VN')
                          .currencySymbol
                          .toString(),
                      style:
                          S.bodyTextStyles.caption(S.colors.textOnPrimaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var loadWalletWithoutListen =
        Provider.of<LoadWalletViewModel>(context, listen: false);
    var loadTransaction = Provider.of<LoadTransactionViewmodel>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
      child: Container(
        decoration: BoxDecoration(
          color: S.colors.primaryColor,
          borderRadius: BorderRadius.circular(S.dimens.cardCornerRadiusMedium),
        ),
        child: Column(
          children: [
            SizedBox(height: S.dimens.padding),
            _totalBalance(loadWalletWithoutListen.total),
            SizedBox(height: S.dimens.smallPadding),
            _detailSatistic(
              loadTransaction.getIncome(),
              -loadTransaction.getExpense(),
            ),
            SizedBox(height: S.dimens.padding),
          ],
        ),
      ),
    );
  }
}
