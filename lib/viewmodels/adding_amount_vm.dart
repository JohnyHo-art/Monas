import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monas/constants/constants.dart';

class AddingAmountViewModel extends ChangeNotifier {
  TextEditingController amountTextFieldController = TextEditingController();

  void setMoneyAmountTextField(newVal) {
    amountTextFieldController.text = newVal;
    notifyListeners();
  }

  final List<double> _amountList = [
    10000,
    20000,
    50000,
    100000,
    200000,
    500000,
  ];

  get amountList => _amountList;

  double _amountOfMoney = 0;

  double get amountOfMoney => _amountOfMoney;

  set amountOfMoney(newVal) {
    _amountOfMoney = newVal;
    notifyListeners();
  }

  int _optionIndex = -1;

  int get optionIndex => _optionIndex;

  set optionIndex(newVal) {
    _optionIndex = newVal;
    notifyListeners();
  }

  // Update text field when option is selected
  void onOptionSelected(int index) {
    switch(index) {
      case 0: {
        setMoneyAmountTextField(amountList[index].toString());
         break;
      }
      case 1: {
        setMoneyAmountTextField(amountList[index].toString());
        break;
      }
      case 2: {
        setMoneyAmountTextField(amountList[index].toString());
        break;
      }
      case 3: {
        setMoneyAmountTextField(amountList[index].toString());
        break;
      }
      case 4: {
        setMoneyAmountTextField(amountList[index].toString());
        break;
      }
      case 5: {
        setMoneyAmountTextField(amountList[index].toString());
        break;
      }
      case 6: {
        setMoneyAmountTextField(amountList[index].toString());
        break;
      }
    }
  }

  // This updates the amount of money enter from the
  // bottom sheet to the amount section
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
    }
  }

  // Reset information
  void resetBottomSheetInfo() {
    amountOfMoney = 0.0;
    optionIndex = -1;
    amountTextFieldController.clear();
  }
}
