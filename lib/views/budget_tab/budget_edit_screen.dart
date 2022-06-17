// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
import 'package:monas/viewmodels/budget_tab/edit_budget_vm.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/views/adding_tab/components/enter_money_bottom_sheet.dart';
import 'package:monas/views/budget_tab/components/budget_detail_item.dart';
import 'package:monas/views/home_tab/category_list_screen.dart';
import 'package:provider/provider.dart';

class BudgetEditScreen extends StatelessWidget {
  BudgetEditScreen({Key? key, required this.budget}) : super(key: key);
  Budget budget;

  @override
  Widget build(BuildContext context) {
    var loadWallet = context.watch<LoadWalletViewModel>();
    var editBudget = context.watch<EditBudgetViewModel>();
    var amount = context.watch<AddingAmountViewModel>();
    var loadBudget = context.watch<LoadBudgetViewModel>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.appBackground,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: S.colors.appBackground,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: S.colors.textOnSecondaryColor,
            ),
            onPressed: () {
              // Pop back event
              Navigator.pop(context);
              amount.resetBottomSheetInfo();
            },
          ),
          title: Text(
            'Chỉnh sửa ngân sách',
            style:
                S.headerTextStyles.appbarTitle(S.colors.textOnSecondaryColor),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                // Save the changes and push it to firestore db
                await editBudget.saveAndPushBudget(amount.amountOfMoney,
                    loadBudget.chosenMonth, loadBudget.chosenYear);
                // If update success
                if (editBudget.updateSuccess) {
                  // Navigate back to the budget screen
                  Utils.showSuccessSnackBar('Sửa ngân sách thành công');
                  // if new category is not different from the old id
                  //then delete the budget, else just update it
                  if (editBudget.newCategoryId != budget.categoryId ||
                      editBudget.newWalletId != budget.walletId) {
                    editBudget.deleteBudget(
                      loadBudget.chosenMonth,
                      loadBudget.chosenYear,
                      budget.walletId,
                      budget.categoryId,
                    );
                  }
                  // Navigation back to the budget screen
                  Navigator.pop(context);
                  Navigator.pop(context);
                  // Set the update success back to false
                  editBudget.setUpDateSuccess = false;
                  amount.resetBottomSheetInfo();
                } else {
                  Utils.showSnackBar('Sửa ngân sách thất bại');
                }
              },
              icon: Icon(
                Icons.done,
                color: S.colors.textOnSecondaryColor,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: S.dimens.smallPadding),
              BudgetDetailItem(
                leading: Image.asset(loadWallet
                    .currentListWallet[editBudget.newWalletId].iconUrl),
                hintText:
                    loadWallet.currentListWallet[editBudget.newWalletId].name,
                title: 'Ví',
                color: S.colors.textOnSecondaryColor,
                onPressed: () =>
                    // Handle event choose wallet
                    Navigator.pushNamed(context, Routes.listWalletScreen),
              ),
              SizedBox(height: S.dimens.smallPadding),
              BudgetDetailItem(
                onPressed: () {
                  // Choose new category
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListScreen(choice: 2),
                    ),
                  );
                },
                leading: Image.asset(
                    Category.categoryList[editBudget.newCategoryId].iconUrl),
                hintText: Category.categoryList[editBudget.newCategoryId].name,
                title: 'Danh mục',
                color: S.colors.textOnSecondaryColor,
              ),
              SizedBox(height: S.dimens.smallPadding),
              BudgetDetailItem(
                leading: Icon(
                  Icons.payments,
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
                        topLeft:
                            Radius.circular(S.dimens.cardCornerRadiusMedium),
                        topRight:
                            Radius.circular(S.dimens.cardCornerRadiusMedium),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return const EnterMoneyBottomSheet();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
