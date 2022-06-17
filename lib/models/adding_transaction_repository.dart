import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monas/models/transaction_model.dart' as model;

class AddingTransactionRepo {
  Future<List<String>> getListUrlFromStorage(List<XFile> xFile) async {
    final storageRef = FirebaseStorage.instance.ref();
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final List<String> listUrl = [];

    for (var i in xFile) {
      File file = File(i.path);
      final imageRef = storageRef.child("transaction/$userId/${i.name}");

      try {
        await imageRef.putFile(file);
      } catch (e) {}

      String url = await imageRef.getDownloadURL();
      listUrl.add(url);
    }

    return listUrl;
  }

  Future<void> pushTransactionToFirestore(
      model.Transaction newTransaction) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    String month = DateTime.now().month.toString();
    String year = DateTime.now().year.toString();

    firebaseFirestore
        .collection("transactions")
        .doc(firebaseAuth.currentUser!.uid)
        .collection(newTransaction.walletId)
        .doc(month + "-" + year)
        .collection("listTransactions")
        .doc(newTransaction.categoryId.toString())
        .set(newTransaction.toMap());
  }

  Future<List<model.Transaction>> getTransactionDataFromFirestore(
      String walletId, String month) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    List<model.Transaction> listTransaction = [];

    await firebaseFirestore
        .collection("transactions")
        .doc(firebaseAuth.currentUser!.uid)
        .collection(walletId)
        .doc(month)
        .collection("listTransactions")
        .get()
        .then((value) {
      var docSnapshots = value.docs;
      for (var i in docSnapshots) {
        var doc = i.data();
        listTransaction.add(model.Transaction.fromMap(doc));
      }
    });

    return listTransaction;
  }

  Future<void> updateWalletBalance(int walletId, double newBalance) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    final newData = {"balance": newBalance};

    await firebaseFirestore
        .collection("wallets")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("listWallets")
        .doc(walletId.toString())
        .update(newData);
  }
}
