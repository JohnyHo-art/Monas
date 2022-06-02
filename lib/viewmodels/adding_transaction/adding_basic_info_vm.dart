import 'package:flutter/material.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/utils.dart';

class AddingBasicInfoViewModel extends ChangeNotifier {
  TextEditingController noteTextFieldController = TextEditingController();

  String _note = '';

  String get note => _note;

  set note(newVal) {
    _note = newVal;
    notifyListeners();
  }

  DateTime _date = DateTime.now();

  DateTime get date => _date;

  set date(newVal) {
    _date = newVal;
    notifyListeners();
  }

  bool _showDetail = false;

  bool get showDetail => _showDetail;

  set showDetail(newVal) {
    _showDetail = newVal;
    notifyListeners();
  }

  int _selectedCategoryId = 0;

  int getSelectedCategoryId() => _selectedCategoryId;

  void setSelectedCategoryIndex(int newVal) {
    _selectedCategoryId = newVal;
    notifyListeners();
  }

  // This updates note from the dialog to the note section
  void saveTransactionNote() {
    if (noteTextFieldController.text.trim().isEmpty) {
      Utils.showToast('Ghi chú trống!');
    } else {
      note = noteTextFieldController.text;
    }
  }

  // Update date text field
  String getDateText() {
    var now = DateTime.now();
    if (date.day == now.day &&
        date.month == now.month &&
        date.year == now.year) {
      return 'Hôm nay';
    }
    return F.dateTimeFormat.simpleFormat(date);
  }

  // Clear basic information
  void clearBasicInformation() {
    note = '';
    date = DateTime.now();
    showDetail = false;
    noteTextFieldController.clear();
  }
}
