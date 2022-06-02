import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/views/adding_tab/components/add_note_dialog.dart';
import 'package:monas/views/adding_tab/components/enter_money_bottom_sheet.dart';

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

  int _selectedWallet = 0;
  int getSelectedWallet() => _selectedWallet;
  void setSelectedWallet(int newVal) {
    _selectedWallet = newVal;
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

  // Show the amount of money bottom sheet
  void showAmountMoneyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(S.dimens.cardCornerRadiusMedium),
        topRight: Radius.circular(S.dimens.cardCornerRadiusMedium),
      )),
      builder: (BuildContext context) {
        return const EnterMoneyBottomSheet();
      },
    );
  }

  // Show the note adding dialog
  void showNoteAddingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => const AddingNoteDialog(),
    );
  }

  // Show the date picker dialog
  Future pickDate(BuildContext context) async {
    final initialDate = date;
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
            colorScheme: ColorScheme.light(
          primary: S.colors.primaryColor,
        )),
        child: child ?? const SizedBox.shrink(),
      ),
    );
    if (newDate == null) return;
    date = newDate;
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
