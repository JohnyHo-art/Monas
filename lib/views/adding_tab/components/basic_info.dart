import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
import 'package:monas/views/adding_tab/components/add_note_dialog.dart';
import 'package:monas/views/adding_tab/components/enter_money_bottom_sheet.dart';
import 'package:monas/views/home_tab/category_list_screen.dart';
import 'package:provider/provider.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var transaction = context.watch<AddingBasicInfoViewModel>();
    var amount = context.watch<AddingAmountViewModel>();

    // Show date picker dialog 
    Future pickDate() async {
      final initialDate = transaction.date;
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
      transaction.date = newDate;
    }

    Widget _moneyAmountSection(String? locale, VoidCallback onTap) => InkWell(
          splashColor: S.colors.subTextColor,
          onTap: onTap,
          child: Row(
            children: [
              const SizedBox(width: 60),
              Flexible(
                flex: 9,
                child: Text(
                  F.currencyFormat.numberMoneyFormat(amount.amountOfMoney),
                  overflow: TextOverflow.ellipsis,
                  style: S.headerTextStyles.header1(S.colors.primaryColor),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  NumberFormat.simpleCurrency(locale: locale ?? 'vi_VN')
                      .currencySymbol,
                  style: S.headerTextStyles.header2(S.colors.primaryColor),
                ),
              ),
            ],
          ),
        );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: S.dimens.smallPadding),
      padding: EdgeInsets.symmetric(horizontal: S.dimens.tinyPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: S.colors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: S.colors.shadowElevationColor,
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: S.dimens.smallPadding),
          _moneyAmountSection(null, () {
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
          }),
          SizedBox(height: S.dimens.tinyPadding),
          ListTile(
            leading: Image.asset(R.walletIcon.walletIc0),
            title: Text(
              'Ví tổng',
              style: S.headerTextStyles.header3(S.colors.textOnSecondaryColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ListTile(
            leading: Image.asset(
              Category
                  .categoryList[transaction.getSelectedCategoryId()].iconUrl,
            ),
            title: Text(
              Category.categoryList[transaction.getSelectedCategoryId()].name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: transaction.getSelectedCategoryId() == 0
                    ? S.colors.subTextColor2
                    : S.colors.textOnSecondaryColor,
              ),
            ),
            onTap: () {
              //Navigator.pushNamed(context, Routes.categoryListScreen);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryListScreen(choice: 0),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notes),
            title: Text(
              transaction.note.isEmpty ? 'Thêm ghi chú' : transaction.note,
              style: TextStyle(
                color: transaction.note.isEmpty
                    ? S.colors.subTextColor2
                    : S.colors.textOnSecondaryColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => const AddingNoteDialog(),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: Text(  
              transaction.getDateText(),
              style: TextStyle(color: S.colors.textOnSecondaryColor),
            ),
            onTap: () => pickDate(),
          ),
          SizedBox(height: S.dimens.padding),
        ],
      ),
    );
  }
}
