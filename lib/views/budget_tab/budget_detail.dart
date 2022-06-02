import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/viewmodels/adding_budget_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/views/adding_tab/components/enter_money_bottom_sheet.dart';
import 'package:monas/views/budget_tab/budget_detail_item.dart';
import 'package:monas/views/home_tab/category_list_screen.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';

class BudgetDetail extends StatelessWidget {
  const BudgetDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var budget = context.watch<AddingBudgetViewModel>();
    var amount = context.watch<AddingAmountViewModel>();
    var loadWallet = context.watch<LoadWalletViewModel>();

    return Padding(
      padding: EdgeInsets.only(top: S.dimens.smallPadding),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(S.dimens.cardCornerRadiusMedium),
            topLeft: Radius.circular(S.dimens.cardCornerRadiusMedium),
          ),
          color: S.colors.whiteColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 5,
                width: 70,
                decoration: BoxDecoration(
                  color: S.colors.primaryColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(S.dimens.cardCornerRadiusMedium)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: S.dimens.smallPadding),
              child: BudgetDetailItem(
                leading: Image.asset(loadWallet
                    .currentListWallet[budget.selectedWalletId].iconUrl),
                hintText:
                    loadWallet.currentListWallet[budget.selectedWalletId].name,
                title: 'Ví',
                color: S.colors.textOnSecondaryColor,
                onPressed: () =>
                    // Handle event choose wallet
                    Navigator.pushNamed(context, Routes.listWalletScreen),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: S.dimens.padding),
              child: BudgetDetailItem(
                leading: Image.asset(
                    Category.categoryList[budget.selectedCategoryId].iconUrl),
                hintText: Category.categoryList[budget.selectedCategoryId].name,
                title: 'Danh mục',
                color: budget.selectedCategoryId == 0
                    ? null
                    : S.colors.textOnSecondaryColor,
                onPressed: () {
                  // Handle event choose category
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListScreen(choice: 1),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: S.dimens.padding),
              child: BudgetDetailItem(
                leading: Icon(
                  Icons.money,
                  color: S.colors.subTextColor2,
                ),
                hintText: F.currencyFormat
                        .numberMoneyFormat(amount.amountOfMoney) +
                    NumberFormat.simpleCurrency(locale: 'vi_VN').currencySymbol,
                title: 'Số tiền',
                color: amount.amountOfMoney == 0
                    ? null
                    : S.colors.textOnSecondaryColor,
                onPressed: () {
                  // Handle event enter amount of money
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(S.dimens.cardCornerRadiusMedium),
                      topRight:
                          Radius.circular(S.dimens.cardCornerRadiusMedium),
                    )),
                    builder: (BuildContext context) {
                      return const EnterMoneyBottomSheet();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
