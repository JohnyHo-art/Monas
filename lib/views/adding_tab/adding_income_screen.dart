import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/adding_amount_vm.dart';
import 'package:monas/viewmodels/adding_transaction_vm.dart';
import 'package:provider/provider.dart';

import 'components/basic_info.dart';
import 'components/detail_infor.dart';

class AddingIncomeScreen extends StatelessWidget {
  const AddingIncomeScreen({Key? key}) : super(key: key);

  Widget _addMoreInfoButton(VoidCallback onPressed, bool showDetail) =>
      Visibility(
        visible: !showDetail,
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

  @override
  Widget build(BuildContext context) {
    var transaction = context.watch<AddingTransactionViewModel>();
    var amount = context.watch<AddingAmountViewModel>();

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
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: S.colors.textOnSecondaryColor,
              ),
              onPressed: () {
                amount.resetBottomSheetInfo();
                transaction.clearBasicInformation();
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Thêm thu nhập',
              style: S.headerTextStyles.appbarTitle(null),
            ),
            actions: [
              TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => S.colors.primaryColorShadeThirty)),
                onPressed: () {},
                child: Text(
                  'LƯU',
                  style: S.bodyTextStyles.buttonText(S.colors.primaryColor),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: S.dimens.padding),
                const BasicInfo(),
                SizedBox(height: S.dimens.smallPadding),
                _addMoreInfoButton(() => transaction.showDetail = true,
                    transaction.showDetail),
                Visibility(
                  visible: transaction.showDetail,
                  child: Column(
                    children: [
                      SizedBox(height: S.dimens.smallPadding),
                      const DetailInfo(),
                      SizedBox(height: S.dimens.padding),
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
