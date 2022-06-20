import 'dart:io';

import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_transaction_vm.dart';
import 'package:monas/viewmodels/adding_transaction/detail_info_vm.dart';
import 'package:monas/viewmodels/adding_transaction/load_transaction_vm.dart';
import 'package:monas/viewmodels/adding_transaction/pick_image_vm.dart';
import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/viewmodels/budget_tab/edit_budget_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/views/adding_tab/components/basic_info.dart';
import 'package:monas/views/adding_tab/components/detail_infor.dart';
import 'package:monas/widgets/empty_wallet_inform.dart';
import 'package:provider/provider.dart';

class AddingTransactionScreen extends StatelessWidget {
  const AddingTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var transaction = context.watch<AddingBasicInfoViewModel>();
    var amount = context.watch<AddingAmountViewModel>();
    var detaiInfo = context.watch<DetailInfoViewmodel>();
    var addingTransaction = context.watch<AddingTransactionViewmodel>();
    var loadTransaction = context.watch<LoadTransactionViewmodel>();

    // adding budget view model to save spent of each buget
    // and to check whether budget is exist
    var addingBudget = context.watch<AddingBudgetViewModel>();
    var editBudget = context.watch<EditBudgetViewModel>();

    var loadWallet = context.watch<LoadWalletViewModel>();

    Widget _addMoreInfoButton(VoidCallback onPressed) => Visibility(
          visible: !transaction.showDetail,
          child: TextButton(
            onPressed: onPressed,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'THÊM CHI TIẾT',
                    style: S.bodyTextStyles.buttonText(S.colors.primaryColor),
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: S.colors.primaryColor,
                      size: S.dimens.smallIconSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: S.colors.appBackground,
          appBar: AppBar(
            backgroundColor: S.colors.appBackground,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: S.colors.textOnSecondaryColor,
              ),
              onPressed: () {
                transaction.clearBasicInformation();
                amount.resetBottomSheetInfo();
                detaiInfo.resetDetailInfo(context);
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Thêm chi tiêu',
              style: S.headerTextStyles.appbarTitle(null),
            ),
            actions: [
              Visibility(
                visible: loadWallet.currentListWallet.isNotEmpty,
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => S.colors.primaryColorShadeThirty)),
                  onPressed: () async {
                    await addingTransaction
                        .pushNewTransactionToFirestore(context);
                    await addingTransaction
                        .updateWalletBalanceAfterAddNewTransaction(context);

                    // Check if budget of this type of category and month is exist
                    // Get the selected wallet id and the chosen date time
                    if (await addingBudget.isBudgetExist(
                        addingBudget.selectedWalletId,
                        transaction.date.month,
                        transaction.date.year,
                        transaction.getSelectedCategoryId())) {
                      // Create a new budget and set it as a new budget fetch from firebase
                      // with given wallet id, month and year
                      Budget budget = await editBudget.getBudgetWithMonthYear(
                          addingBudget.selectedWalletId,
                          transaction.date.month,
                          transaction.date.year,
                          transaction.getSelectedCategoryId());
                      // Save new spent to the given budget
                      editBudget.saveAndPushBudget(
                          budget.budget,
                          transaction.date.month,
                          transaction.date.year,
                          budget.spent -= amount.amountOfMoney,
                          addingBudget.selectedWalletId,
                          transaction.getSelectedCategoryId());
                    }

                    loadTransaction.loadTransactionDataFromFirestore("wallet1");
                    transaction.clearBasicInformation();
                    amount.resetBottomSheetInfo();
                    detaiInfo.resetDetailInfo(context);

                    Navigator.pop(context);
                  },
                  child: Text(
                    'LƯU',
                    style: S.bodyTextStyles.buttonText(S.colors.primaryColor),
                  ),
                ),
              ),
            ],
          ),
          body: loadWallet.currentListWallet.isEmpty
              ? const EmptyWalletInform()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: S.dimens.smallPadding),
                      const BasicInfo(),
                      SizedBox(height: S.dimens.smallPadding),
                      _addMoreInfoButton(() => transaction.showDetail = true),
                      Visibility(
                        visible: transaction.showDetail,
                        child: Column(
                          children: [
                            SizedBox(height: S.dimens.smallPadding),
                            const DetailInfo(),
                            SizedBox(height: S.dimens.padding),
                            const ImagesPicked(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class ImagesPicked extends StatelessWidget {
  const ImagesPicked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pickImage = context.watch<PickImage>();

    return SizedBox(
      height: 200,
      child: GridView.builder(
        itemCount: pickImage.getImages().length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Image.file(
                File(pickImage.getImages()[index].path),
                fit: BoxFit.fill,
              ),
              Positioned(
                right: 10,
                top: -15,
                child: IconButton(
                  onPressed: () {
                    pickImage.removeImageFromList(index);
                  },
                  icon: Icon(
                    Icons.disabled_by_default_rounded,
                    color: S.colors.shadowElevationColor,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
