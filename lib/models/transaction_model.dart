import 'package:image_picker/image_picker.dart';

class Transaction {
  double money;
  String wallet = "";
  String catergoryId;
  String note;
  DateTime date;
  String? withPerson;
  List<XFile>? images;

  Transaction({
    required this.money,
    required this.wallet,
    required this.catergoryId,
    required this.note,
    required this.date,
    this.withPerson,
    this.images,
  });
}
