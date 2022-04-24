import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monas/constants/resources.dart';

class AddingWalletViewModel extends ChangeNotifier {
  TextEditingController nameTextFieldController = TextEditingController();
  TextEditingController balanceTextFieldController = TextEditingController();

  String _name = '';
  String get name => _name;

  double _balance = 0;
  double get balance => _balance;

  String _iconUrl = R.walletIcon.walletIc1;
  String get iconUrl => _iconUrl;

  void saveWalletName() {
    if(nameTextFieldController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Tên bị trống!', toastLength: Toast.LENGTH_SHORT);
    } else {
      _name = nameTextFieldController.value.text;
    }
    notifyListeners();
  }

  void saveBalance() {
    if(balanceTextFieldController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Vui lòng điền số dư!', toastLength: Toast.LENGTH_SHORT);
    } else {
      _balance = double.parse(balanceTextFieldController.value.text);
    }
    notifyListeners();
  }

  void setIconUrl(String url) {
    _iconUrl = url;
    notifyListeners();
  }
}