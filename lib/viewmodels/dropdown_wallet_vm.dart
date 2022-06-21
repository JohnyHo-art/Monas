import 'package:flutter/material.dart';

import '../models/wallet_model.dart';

class DropdownWalletViewModel extends ChangeNotifier {
  late Wallet _selectedWallet;

  Wallet getSelectedWallet() => _selectedWallet;

  Future<void> setSelectedWallet(newVal) async {
    _selectedWallet = newVal;
    notifyListeners();
  }
}
