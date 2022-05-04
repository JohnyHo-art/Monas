import 'package:flutter/material.dart';

class TimeChosenViewModel extends ChangeNotifier {
  int _selectedTime = 0;

  getSelectedTime() => _selectedTime;

  void setSelectedTime(newVal) {
    _selectedTime = newVal;
    notifyListeners();
  }
}
