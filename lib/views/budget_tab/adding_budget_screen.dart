import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/string_constants.dart';
import 'package:monas/viewmodels/adding_budget_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
import 'package:monas/views/adding_tab/components/enter_money_bottom_sheet.dart';
import 'package:monas/views/budget_tab/budget_detail.dart';
import 'package:provider/provider.dart';

class AddingBudgetScreen extends StatelessWidget {
  const AddingBudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var budget = context.watch<AddingBudgetViewModel>();
    var amount = context.watch<AddingAmountViewModel>();

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
          onPressed: () {
            String amount = budget.budgetAmountController.text;
            double money = double.parse(amount);
            if (budget.selectedCategoryId != 0 && money != 0) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(S.dimens.cardCornerRadiusMedium),
                  topRight: Radius.circular(S.dimens.cardCornerRadiusMedium),
                )),
                builder: (BuildContext context) {
                  return const EnterMoneyBottomSheet();
                },
              );
            }
          },
        ),
      ),
    );
  }
}
