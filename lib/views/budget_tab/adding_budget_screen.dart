import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/string_constants.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/viewmodels/adding_transaction/load_transaction_vm.dart';
import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/views/budget_tab/components/budget_detail.dart';
import 'package:provider/provider.dart';

class AddingBudgetScreen extends StatelessWidget {
  const AddingBudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var budget = context.watch<AddingBudgetViewModel>();
    var amount = context.watch<AddingAmountViewModel>();

    var loadWallet = context.watch<LoadWalletViewModel>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.appBackground,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: S.colors.appBackground,
          leading: IconButton(
            onPressed: () {
              // When pop out of the screen clear the information in the bottom sheet
              amount.resetBottomSheetInfo();
              budget.setSelectedCategoryId(0);
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: S.colors.textOnSecondaryColor),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
              child: Text('Thêm ngân sách',
                  style: S.headerTextStyles
                      .header2(S.colors.textOnSecondaryColor)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: S.dimens.padding,
                vertical: S.dimens.tinyPadding,
              ),
              child: Text(
                StringConstants.planDescription.budgetDescription,
                style: S.bodyTextStyles.body2(S.colors.subTextColor2),
              ),
            ),
            const Expanded(child: BudgetDetail()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: S.colors.primaryColor,
          child: Icon(Icons.check, color: S.colors.whiteColor),
          onPressed: () async {
            if(budget.selectedCategoryId != 0 &&
                amount.amountOfMoney <=
                    loadWallet
                        .currentListWallet[
                            S.getInt.getIntFromString(budget.selectedWalletId)]
                        .balance) {
              // Handle save budget event
              budget.saveAndPushBudget(
                amount.amountOfMoney,
                await Provider.of<LoadTransactionViewmodel>(context,
                        listen: false)
                    .calculateCatExpense(
                  budget.selectedWalletId,
                  budget.selectedCategoryId,
                  DateTime.now().month,
                  DateTime.now().year,
                ),
              );
              amount.resetBottomSheetInfo();
              budget.setSelectedCategoryId(0);
              Navigator.pop(context);
            } else if (amount.amountOfMoney >
                loadWallet
                    .currentListWallet[
                        S.getInt.getIntFromString(budget.selectedWalletId)]
                    .balance) {
              Utils.showSnackBar(
                  'Ngân sách không được lớn hơn số dư ví của bạn!');
            } else {
              Utils.showSnackBar('Vui lòng chọn danh mục');
            }
          },
        ),
      ),
    );
  }
}
