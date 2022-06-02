import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monas/constants/string_constants.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/models/account_model.dart';
import 'package:monas/viewmodels/authentication/authentic_vm.dart';
import 'package:monas/views/personal_tab/date_format_picker_dialog.dart';

class AccountSettingViewModel extends ChangeNotifier {
  // Variable to update user name
  late String _userName;

  get userName => _userName;

  // Variable to check notification sound is on or not
  late bool _soundNotificationOn;

  get soundNotificationOn => _soundNotificationOn;

  set soundNotificationOn(newVal) {
    _soundNotificationOn = newVal;
    notifyListeners();
  }

  // Date format
  late String _dateFormat;

  get dateFormat => _dateFormat;

  set dateFormat(newVal) {
    if (_dateFormat != newVal) {
      _dateFormat = newVal;
      notifyListeners();
    }
  }

  // Date Time for notification
  late DateTime _notificationTime;

  get notificationTime => _notificationTime;

  set notificationTime(newVal) {
    _notificationTime = newVal;
    notifyListeners();
  }

  // Because every variable is initialize as late
  // so we need to create a function to update and initialize all the variable before use it
  void updateAccountInfo(AuthenticViewModel authenticViewModel) {
    Account account = authenticViewModel.account;

    _soundNotificationOn = account.soundNotificationOn;
    _dateFormat = account.dateFormat;
    _notificationTime = account.notificationTime;
    _userName = account.userName;
    notifyListeners();
  }

  // Show time picker dialog to choose a time for notification
  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child ?? const SizedBox.shrink(),
      ),
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (timeOfDay != null) {
      notificationTime =
          DateTime(2022, 3, 15, timeOfDay.hour, timeOfDay.minute);
      updateDataToFirestore(context);
    }
  }

  // Update data to firestore after changes
  Future<void> updateDataToFirestore(BuildContext context) async {
    // Create a new JSON data object
    Map<String, dynamic> newData() {
      return {
        'dateFormat': dateFormat,
        'notificationTime': notificationTime,
        'soundNotificationOn': soundNotificationOn,
        'userName': userName,
      };
    }

    try {
      await FirebaseFirestore.instance
          .collection(StringConstants.firebaseString.accountPath)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(newData(), SetOptions(merge: true));
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    } catch (e) {
      Utils.showErrorDialog(context);
    }
  }

  // Show Dialog to set custom
  void showDateFormatPickerDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => const DateFormatPickerDialog());
  }
}
