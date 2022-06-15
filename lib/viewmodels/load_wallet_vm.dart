import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monas/models/wallet_model.dart';

class LoadWalletViewModel extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Wallet> currentListWallet = [];

  List<Wallet> includeToTotalListWallet = [];

  List<Wallet> nonIncludeToTotalListWallet = [];

  double total = 0;

  Future<void> loadListWalletFromFirestore() async {
    currentListWallet = [];
    await firestore
        .collection("wallets")
        .doc(auth.currentUser!.uid)
        .collection("listWallets")
        .get()
        .then(
      (value) {
        var docSnapshots = value.docs;
        for (var i in docSnapshots) {
          var doc = i.data();
          currentListWallet.add(Wallet.fromMap(doc));
        }
        notifyListeners();
        classifyWallet();
      },
    );
  }

  Future<void> classifyWallet() async {
    includeToTotalListWallet = [];
    nonIncludeToTotalListWallet = [];
    for (var i in currentListWallet) {
      if (i.includeToTotal) {
        includeToTotalListWallet.add(i);
      } else {
        nonIncludeToTotalListWallet.add(i);
      }
    }
    totalMoney();
    notifyListeners();
  }

  void totalMoney() {
    total = 0.0;
    for (var i in includeToTotalListWallet) {
      total += i.balance;
    }
    notifyListeners();
  }
}
