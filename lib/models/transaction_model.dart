import 'package:image_picker/image_picker.dart';

class Transaction {
  double money;
  String wallet;
  int categoryId;
  String note;
  DateTime date;
  String? withPerson;
  List<XFile>? images;

  Transaction({
    required this.money,
    required this.wallet,
    required this.categoryId,
    required this.note,
    required this.date,
    this.withPerson,
    this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      "money": money,
      "wallet": wallet,
      "categoryId": categoryId,
      'note': note,
      'date': date,
      'withPerson': withPerson,
      'images': images,
    };
  }
}
