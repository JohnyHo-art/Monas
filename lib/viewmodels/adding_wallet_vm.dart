import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/views/adding_tab/components/wallet_icon_bottom_sheet.dart';

class AddingWalletViewModel extends ChangeNotifier {
  TextEditingController nameTextFieldController = TextEditingController();
  TextEditingController balanceTextFieldController = TextEditingController();

  String _name = '';

  String get name => _name;

  set name(newVal) {
    _name = newVal;
    notifyListeners();
  }

  double _balance = 0;

  double get balance => _balance;

  set balance(newVal) {
    _balance = newVal;
    notifyListeners();
  }

  String _iconUrl = R.walletIcon.walletIc1;

  String get iconUrl => _iconUrl;

  set iconUrl(newVal) {
    _iconUrl = newVal;
    notifyListeners();
  }

  bool _includeToTotal = true;

  bool get includeToTotal => _includeToTotal;

  set includeToTotal(newVal) {
    _includeToTotal = newVal;
    notifyListeners();
  }

  // Save wallet name
  void saveWalletName() {
    if (nameTextFieldController.text.isEmpty) {
      Utils.showToast('Tên bị trống!');
    } else {
      name = nameTextFieldController.text;
    }
  }

  // Save initial balance
  void saveBalance() {
    if (balanceTextFieldController.text.isEmpty) {
      Utils.showToast('Vui lòng điền số dư!');
    } else {
      balance = double.parse(balanceTextFieldController.value.text);
    }
  }

  // Show the wallet icon chosen bottom sheet
  void showWalletIconBottomSheet(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(S.dimens.cardCornerRadiusMedium),
            topRight: Radius.circular(S.dimens.cardCornerRadiusMedium),
          ),
        ),
        builder: (BuildContext context) {
          return const WalletIconBottomSheet();
        },
      );

  // Reset information before close
  void resetInformation() {
    iconUrl = R.walletIcon.walletIc1;
    name = '';
    balance = 0.0;
    includeToTotal = true;
    nameTextFieldController.clear();
    balanceTextFieldController.clear();
  }
}
