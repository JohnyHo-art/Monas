import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
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
    var amount = context.watch<AddingAmountViewModel>();

    Widget _optionListView() => Padding(
          padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: amount.amountList.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: S.dimens.tinyPadding),
                child: CustomButton(
                  width: 90,
                  onPressed: () {
                    amount.onOptionSelected(index);
                    amount.optionIndex = index;
                  },
                  text: F.currencyFormat
                      .numberMoneyFormat(amount.amountList[index]),
                  color: amount.optionIndex == index
                      ? S.colors.primaryColor
                      : S.colors.whiteColor,
                  borderColor: S.colors.primaryColor,
                  borderWidth: 2,
                  textColor: amount.optionIndex == index
                      ? S.colors.whiteColor
                      : S.colors.primaryColor,
                ),
              ),
            ),
          ),
        );

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: S.dimens.tinyPadding),
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(S.dimens.cardCornerRadiusSmall),
              color: S.colors.subTextColor,
            ),
          ),
          SizedBox(height: S.dimens.smallPadding),
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
                  style: S.headerTextStyles.header2(S.colors.primaryColor),
                  controller: amount.amountTextFieldController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        borderSide:
                            BorderSide(color: S.colors.primaryColor, width: 2)),
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: S.colors.subTextColor2)),
                    focusColor: S.colors.primaryColor,
                  ),
                ),
              ),
              SizedBox(width: S.dimens.padding),
            ],
          ),
          SizedBox(height: S.dimens.padding),
          _optionListView(),
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
                  amount.resetBottomSheetInfo();
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
                  amount.saveAmountOfMoney();
                  Navigator.pop(context);
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
    );
  }
}
