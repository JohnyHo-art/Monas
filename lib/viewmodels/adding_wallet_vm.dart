import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/models/wallet_model.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:provider/provider.dart';

class AddingWalletViewModel extends ChangeNotifier {
  TextEditingController nameTextFieldController = TextEditingController();
  TextEditingController balanceTextFieldController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  String _iconUrl = R.walletIcon.walletIc1;

  String get iconUrl => _iconUrl;

  set iconUrl(String newVal) {
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
  String saveWalletName() {
    if (nameTextFieldController.text.isEmpty) {
      Utils.showToast('Tên bị trống!');
      return "";
    }
    return nameTextFieldController.text;
  }

  // Save initial balance
  double saveBalance() {
    if (balanceTextFieldController.text.isEmpty) {
      Utils.showToast('Vui lòng điền số dư!');
      return 0;
    }
    return double.parse(balanceTextFieldController.value.text);
  }

  // Reset information before close
  void resetInformation() {
    iconUrl = R.walletIcon.walletIc1;
    includeToTotal = true;
    nameTextFieldController.clear();
    balanceTextFieldController.clear();
  }

  Wallet newWallet(var loadWallet) {
    return Wallet(
      id: "wallet" + loadWallet.currentListWallet.length.toString(),
      name: saveWalletName(),
      balance: saveBalance(),
      expense: 0.0,
      income: 0.0,
      iconUrl: iconUrl,
      includeToTotal: includeToTotal,
    );
  }

  Future<void> addNewWallet(BuildContext context) async {
    var loadWallet = Provider.of<LoadWalletViewModel>(context, listen: false);

    Wallet newWallet1 = newWallet(loadWallet);

    await FirebaseFirestore.instance
        .collection("wallets")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("listWallets")
        .doc(loadWallet.currentListWallet.length.toString())
        .set(newWallet1.toMap())
        .onError((error, stackTrace) =>
            Fluttertoast.showToast(msg: "Thêm ví thất bại"))
        .then(
          (value) => {
            Fluttertoast.showToast(msg: "Thêm ví thành công"),
            loadWallet.loadListWalletFromFirestore(),
          },
        );
  }
}
