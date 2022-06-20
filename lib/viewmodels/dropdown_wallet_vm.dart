import 'package:flutter/material.dart';

import '../models/wallet_model.dart';

class DropdownWalletViewModel extends ChangeNotifier {
  late Wallet _selectedWallet;

  getSelectedWallet() => _selectedWallet;

  void setSelectedWallet(newVal) {
    _selectedWallet = newVal;
    notifyListeners();
  }
}
