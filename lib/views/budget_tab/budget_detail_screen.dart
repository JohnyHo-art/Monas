// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
import 'package:monas/viewmodels/budget_tab/edit_budget_vm.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:monas/views/budget_tab/budget_edit_screen.dart';
import 'package:monas/views/budget_tab/components/budget_detail_information.dart';
import 'package:provider/provider.dart';
  
class BudgetDetailScreen extends StatelessWidget {
  BudgetDetailScreen({Key? key, required this.budget}) : super(key: key);
  Budget budget;

  @override
  Widget build(BuildContext context) {
    var editBudget = context.watch<EditBudgetViewModel>();
    var amount = context.watch<AddingAmountViewModel>();
    var loadBudget = context.watch<LoadBudgetViewModel>();

    bool isEditable() {
      if (loadBudget.chosenYear < DateTime.now().year) {
        return false;
      } else if (loadBudget.chosenYear == DateTime.now().year) {
        if (loadBudget.chosenMonth < DateTime.now().month) {
          return false;
        }
        return true;
      }
      return true;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.appBackground,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: S.colors.appBackground,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              color: S.colors.textOnSecondaryColor,
            ),
          ),
          title: Text(
            'Chi tiết ngân sách',
            style: S.headerTextStyles.appbarTitle(null),
          ),
          //centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                if (isEditable()) {
                  // Set all the information of the current budget to the edit budget vm
                  editBudget.setNewWalletId(budget.walletId);
                  editBudget.setNewCategory(budget.categoryId);
                  amount.amountOfMoney = budget.budget;
                  // Move to the edit budget screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BudgetEditScreen(budget: budget),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.edit,
                color: isEditable()
                    ? S.colors.textOnSecondaryColor
                    : S.colors.iconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                // Handle delete budget event
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Xoá ngân sách?'),
                    content: const Text(
                        'Nếu bạn xoá ngân sách, các giao dịch vẫn còn nguyên'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'ĐÓNG',
                          style: S.bodyTextStyles
                              .buttonText(S.colors.textOnSecondaryColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          // Delete current budget
                          await editBudget.deleteBudget(
                              loadBudget.chosenMonth,
                              loadBudget.chosenYear,
                              budget.walletId,
                              budget.categoryId);
                          // If delete success
                          if (editBudget.isDeleteSuccess) {
                            // Navigate to the budget screen
                            Navigator.pushReplacementNamed(
                                context, Routes.budgetScreen);
                            Utils.showSuccessSnackBar(
                                'Xoá ngân sách thành công');
                            editBudget.setIsDeleteSuccess = false;
                          } else {
                            Navigator.pop(context);
                            Utils.showSnackBar('Xoá ngân sách thất bại');
                          }
                        },
                        child: Text(
                          'XOÁ',
                          style: S.bodyTextStyles.buttonText(S.colors.redColor),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.delete,
                color: S.colors.textOnSecondaryColor,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.smallPadding,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    BudgetDetailInformation(budget: budget),
                    Positioned(
                      top: S.dimens.smallPadding,
                      child: Image.asset(
                        Category.categoryList[budget.categoryId].iconUrl,
                        height: S.dimens.extraLargeIconSize,
                        width: S.dimens.extraLargeIconSize,
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
