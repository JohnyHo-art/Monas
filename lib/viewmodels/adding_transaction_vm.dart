import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/views/adding_tab/components/enter_money_bottom_sheet.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monas/views/adding_tab/components/wallet_icon_bottom_sheet.dart';

class AddingTransactionViewModel extends ChangeNotifier {
  TextEditingController amountTextFieldController = TextEditingController();
  TextEditingController noteTextFieldController = TextEditingController();

  double _amountOfMoney = 10;
  double get amountOfMoney => _amountOfMoney;
  set amountOfMoney(newVal) {
    _amountOfMoney = newVal;
    notifyListeners();
  }

  String _note = '';
  String get note => _note;

  // This saves the amount of money enter from the bottom sheet to the amount section
  void saveAmountOfMoney() {
    if (amountTextFieldController.text == '') {
      Fluttertoast.showToast(
        msg: 'Vui lòng điền số tiền',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: S.colors.subTextColor2,
      );
    } else if (amountTextFieldController.text == '0') {
      Fluttertoast.showToast(
        msg: 'Số tiền không được phép bằng 0!',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: S.colors.subTextColor2,
      );
    } else {
      amountOfMoney = double.parse(amountTextFieldController.text);
      amountTextFieldController.clear();
    }
  }

  Future<void>? saveTransactionNote(BuildContext context) {
    if (noteTextFieldController.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: 'Ghi chú trống!',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: S.colors.subTextColor2,
      );
    } else {
      _note = noteTextFieldController.text;
      noteTextFieldController.clear();
      Navigator.of(context).pop();
    }
    notifyListeners();
    return null;
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
        return const EnterMoneyBottomSheet();
      },
    );
  }

  void showWalletIconBottomSheet(BuildContext context) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(S.dimens.cardCornerRadiusMedium),
            topRight: Radius.circular(S.dimens.cardCornerRadiusMedium),
          )),
      builder: (BuildContext context) {
        return const WalletIconBottomSheet();
      },
    );
}
