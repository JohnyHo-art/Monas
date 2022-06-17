import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  double money;
  int walletId;
  int categoryId;
  String? note;
  DateTime date;
  String? withPerson;
  List<String>? images;

  Transaction({
    required this.money,
    required this.walletId,
    required this.categoryId,
    this.note,
    required this.date,
    this.withPerson,
    this.images,
  });

  // push data to firestore
  Map<String, dynamic> toMap() {
    return {
      'money': money,
      'wallet': walletId,
      'categoryId': categoryId,
      'note': note,
      'date': date,
      'withPerson': withPerson,
      'images': images,
    };
  }

  // get data from firestore
  factory Transaction.fromMap(map) {
    Timestamp timestamp = map['date'];
    DateTime date = timestamp.toDate();

    return Transaction(
        money: checkDouble(map['money']),
        walletId: map['wallet'],
        categoryId: map['categoryId'],
        note: map['note'],
        date: date,
        withPerson: map['withPerson'] == "" ? null : map['withPerson'],
        images: map['images'] == [] ? null : List<String>.from(map['images']));
  }
}

double checkDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  }
  return value;
}
