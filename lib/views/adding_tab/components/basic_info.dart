import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/viewmodels/adding_amount_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:provider/provider.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var transaction = context.watch<AddingBasicInfoViewModel>();
    var amount = context.watch<AddingAmountViewModel>();
    var loadWallet = context.watch<LoadWalletViewModel>();

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

    return Container(
      margin: EdgeInsets.symmetric(horizontal: S.dimens.smallPadding),
      padding: EdgeInsets.symmetric(horizontal: S.dimens.tinyPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: S.colors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: S.colors.shadowElevationColor,
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: S.dimens.smallPadding),
          _moneyAmountSection(
              null, () => transaction.showAmountMoneyBottomSheet(context)),
          SizedBox(height: S.dimens.tinyPadding),
          ListTile(
            leading: Image.asset(loadWallet
                .currentListWallet[transaction.getSelectedWallet()].iconUrl),
            title: Text(
              loadWallet
                  .currentListWallet[transaction.getSelectedWallet()].name,
              style: S.headerTextStyles.header3(S.colors.textOnSecondaryColor),
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => Navigator.pushNamed(context, Routes.listWalletScreen),
          ),
          ListTile(
            leading: Image.asset(
              Category
                  .categoryList[transaction.getSelectedCategoryId()].iconUrl,
            ),
            title: Text(
              Category.categoryList[transaction.getSelectedCategoryId()].name,
              overflow: TextOverflow.ellipsis,
              style: S.headerTextStyles.header3(
                  transaction.getSelectedCategoryId() == 0
                      ? S.colors.subTextColor2
                      : S.colors.textOnSecondaryColor),
            ),
            onTap: () =>
                Navigator.pushNamed(context, Routes.categoryListScreen),
          ),
          ListTile(
            leading: const Icon(Icons.notes),
            title: Text(
              transaction.note.isEmpty ? 'Thêm ghi chú' : transaction.note,
              style: S.bodyTextStyles.buttonText(S.colors.subTextColor2),
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => transaction.showNoteAddingDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: Text(
              transaction.getDateText(),
              style: S.bodyTextStyles.buttonText(S.colors.subTextColor2),
            ),
            onTap: () => transaction.pickDate(context),
          ),
          SizedBox(height: S.dimens.padding),
        ],
      ),
    );
  }
}
