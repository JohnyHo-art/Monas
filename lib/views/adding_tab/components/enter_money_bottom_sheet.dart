import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/viewmodels/adding_transaction_vm.dart';
import 'package:monas/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class EnterMoneyBottomSheet extends StatelessWidget {
  const EnterMoneyBottomSheet({
    Key? key,
    this.locale,
  }) : super(key: key);
  final String? locale;

  @override
  Widget build(BuildContext context) {
    // final AddingTransactionViewModel addingTransactionViewModel =
    //     Provider.of<AddingTransactionViewModel>(context);
    var transaction = context.watch<AddingTransactionViewModel>();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: S.dimens.largePadding),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: S.dimens.padding),
                Flexible(
                  child: TextFormField(
                    autofocus: true,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    cursorColor: S.colors.primaryColor,
                    keyboardType: TextInputType.number,
                    style: S.headerTextStyles.header2(S.colors.primaryColor), controller:
                        transaction.amountTextFieldController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                              color: S.colors.primaryColor, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          borderSide:
                              BorderSide(color: S.colors.subTextColor2)),
                      focusColor: S.colors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: S.dimens.padding),
              ],
            ),
            SizedBox(height: S.dimens.padding),
            Wrap(
              spacing: S.dimens.smallPadding,
              runSpacing: S.dimens.smallPadding,
              children: [
                CustomButton(
                  width: 100,
                  onPressed: () {},
                  text: F.currencyFormat.numberMoneyFormat(10000),
                  color: S.colors.textOnPrimaryColor,
                  borderColor: S.colors.primaryColor,
                  borderWidth: 2,
                  textColor: S.colors.primaryColor,
                ),
                CustomButton(
                  width: 100,
                  onPressed: () {},
                  text: F.currencyFormat.numberMoneyFormat(20000),
                  color: S.colors.textOnPrimaryColor,
                  borderColor: S.colors.primaryColor,
                  borderWidth: 2,
                  textColor: S.colors.primaryColor,
                ),
                CustomButton(
                  width: 100,
                  onPressed: () {},
                  text: F.currencyFormat.numberMoneyFormat(50000),
                  color: S.colors.textOnPrimaryColor,
                  borderColor: S.colors.primaryColor,
                  borderWidth: 2,
                  textColor: S.colors.primaryColor,
                ),
                CustomButton(
                  width: 100,
                  onPressed: () {},
                  text: F.currencyFormat.numberMoneyFormat(100000),
                  color: S.colors.textOnPrimaryColor,
                  borderColor: S.colors.primaryColor,
                  borderWidth: 2,
                  textColor: S.colors.primaryColor,
                ),
                CustomButton(
                  width: 100,
                  onPressed: () {},
                  text: F.currencyFormat.numberMoneyFormat(200000),
                  color: S.colors.textOnPrimaryColor,
                  borderColor: S.colors.primaryColor,
                  borderWidth: 2,
                  textColor: S.colors.primaryColor,
                ),
                CustomButton(
                  width: 100,
                  onPressed: () {},
                  text: F.currencyFormat.numberMoneyFormat(500000),
                  color: S.colors.textOnPrimaryColor,
                  borderColor: S.colors.primaryColor,
                  borderWidth: 2,
                  textColor: S.colors.primaryColor,
                ),
              ],
            ),
            SizedBox(height: S.dimens.tinyPadding),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => S.colors.subTextColor)),
                  onPressed: () {
                    transaction.amountTextFieldController.clear();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'HUỶ',
                    style: S.bodyTextStyles.buttonText(S.colors.iconColor),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => S.colors.primaryColorShadeThirty)),
                  onPressed: () {
                    transaction.saveAmountOfMoney();
                    //Navigator.pop(context);
                  },
                  child: Text(
                    'LƯU',
                    style: S.bodyTextStyles.buttonText(S.colors.primaryColor),
                  ),
                ),
                SizedBox(width: S.dimens.padding),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
