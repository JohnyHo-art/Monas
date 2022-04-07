import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/views/adding_tab/components/enter_money_bottom_sheet.dart';

class AddingTransactionViewModel extends ChangeNotifier {
  final _amountTextFieldController = TextEditingController();
  final noteTextFieldController = TextEditingController();
  double _amountOfMoney = 0;

  double get amountOfMoney => _amountOfMoney; 

  void saveAmountOfMoney() {
    print(_amountTextFieldController.value.text);
    _amountOfMoney = double.parse(_amountTextFieldController.value.text.toString());
    notifyListeners();
  }

  void showAmountMoneyTextField(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(S.dimens.cardCornerRadiusMedium),
          topRight: Radius.circular(S.dimens.cardCornerRadiusMedium),
        )),
        builder: (BuildContext context) {
          return EnterMoneyBottomSheet(controller: _amountTextFieldController);
        },
      );
    }
}