import 'package:flutter/material.dart';
import 'package:monas/constants/resources.dart';

import '../models/wallet.dart';

class DropdownWalletViewModel extends ChangeNotifier {
  List<Wallet> dropdownWalletList = [
    Wallet(
        name: "Ví tổng",
        balance: 500000,
        expense: 20000,
        income: 40000,
        iconUrl: R.walletIcon.walletIc0),
    Wallet(
        name: "Ví chi tiêu cần thiết",
        balance: 600000,
        expense: 30000,
        income: 50000,
        iconUrl: R.walletIcon.walletIc1),
    Wallet(
        name: "Ví ăn uống",
        balance: 400000,
        expense: 10000,
        income: 30000,
        iconUrl: R.walletIcon.walletIc2),
  ];

  late Wallet _selectedWallet = dropdownWalletList[0];

  getSelectedWallet() => _selectedWallet;

  void setSelectedWallet(newVal) {
    _selectedWallet = newVal;
    notifyListeners();
  }
}
