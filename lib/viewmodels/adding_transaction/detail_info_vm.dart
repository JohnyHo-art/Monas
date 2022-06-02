import 'package:flutter/material.dart';
import 'package:monas/viewmodels/adding_transaction/pick_image_vm.dart';
import 'package:provider/provider.dart';

class DetailInfoViewmodel extends ChangeNotifier {
  //tag a person in a transaction
  String _withPerson = "";
  String getWithPerson() => _withPerson;
  void setWithPerson(String newVal) {
    _withPerson = newVal;
    notifyListeners();
  }

  void resetDetailInfo(BuildContext context) {
    var pickImage = context.watch<PickImage>();

    setWithPerson("");
    pickImage.setImages([]);
  }
}
