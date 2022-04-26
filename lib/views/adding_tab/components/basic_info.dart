import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/viewmodels/adding_amount_vm.dart';
import 'package:monas/viewmodels/adding_transaction_vm.dart';
import 'package:monas/widgets/inkwell_row_button.dart';
import 'package:provider/provider.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var transaction = context.watch<AddingTransactionViewModel>();
    var amount = context.watch<AddingAmountViewModel>();
    
    Widget _moneyAmountSection(String? locale, VoidCallback onTap) => InkWell(
          splashColor: S.colors.subTextColor,
          onTap: onTap,
          child: Row(
            children: [
              const SizedBox(width: 60),
              Flexible(
                flex: 9,
                child: Text(
                  F.currencyFormat.numberMoneyFormat(amount.amountOfMoney),
                  overflow: TextOverflow.ellipsis,
                  style: S.headerTextStyles.header1(S.colors.primaryColor),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  NumberFormat.simpleCurrency(locale: locale ?? 'vi_VN')
                      .currencySymbol,
                  style: S.headerTextStyles.header2(S.colors.primaryColor),
                ),
              ),
            ],
          ),
        );

    Widget _chooseWalletSection(VoidCallback onTap) => Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: S.colors.subTextColor,
            onTap: onTap,
            child: Row(
              children: [
                Image.asset(R.walletIcon.walletIc0),
                SizedBox(width: S.dimens.padding),
                Text('Ví tổng',
                    style: S.headerTextStyles
                        .header3(S.colors.textOnSecondaryColor)),
              ],
            ),
          ),
        );

    Widget _chooseCategorySection(VoidCallback onTap) => Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: S.colors.subTextColor,
            onTap: onTap,
            child: Row(
              children: [
                Image.asset(R.categoryIcon.unknownIc),
                SizedBox(width: S.dimens.padding),
                Text('Chọn nhóm',
                    style: S.headerTextStyles.header3(S.colors.subTextColor2)),
              ],
            ),
          ),
        );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: S.dimens.padding),
      padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: S.colors.textOnPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: S.colors.shadowElevationColor,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 6), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: S.dimens.smallPadding),
          _moneyAmountSection(
              null, () => transaction.showAmountMoneyBottomSheet(context)),
          SizedBox(height: S.dimens.smallPadding),
          _chooseWalletSection(() {}),
          SizedBox(height: S.dimens.smallPadding),
          _chooseCategorySection(() {}),
          SizedBox(height: S.dimens.smallPadding),
          InkWellRowButton(
            onTap: () => transaction.showNoteAddingDialog(context),
            iconData: Icons.notes,
            hintText:
                transaction.note.isEmpty ? 'Thêm ghi chú' : transaction.note,
          ),
          SizedBox(height: S.dimens.smallPadding),
          InkWellRowButton(
            onTap: () => transaction.pickDate(context),
            iconData: Icons.event,
            hintText: transaction.getDateText(),
          ),
          SizedBox(height: S.dimens.padding),
        ],
      ),
    );
  }
}
