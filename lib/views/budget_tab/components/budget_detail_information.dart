// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class BudgetDetailInformation extends StatelessWidget {
  BudgetDetailInformation({Key? key, required this.budget}) : super(key: key);
  Budget budget;

  @override
  Widget build(BuildContext context) {
    var loadWallet = context.watch<LoadWalletViewModel>();
    var loadBudget = context.watch<LoadBudgetViewModel>();

    // Get the current state of the budget
    String getBudgetState() {
      int currentMonth = DateTime.now().month;
      int currentYear = DateTime.now().year;
      // if the current year is greater than the chosen year than return 'cancled'
      if (currentMonth > loadBudget.chosenMonth) {
        if (currentYear > loadBudget.chosenYear) {
          return 'Đã kết thúc';
        }
        if (currentYear < loadBudget.chosenYear) {
          return 'Chưa bắt đầu';
        } else {
          return 'Đã kết thúc';
        }
      } else if (currentMonth < loadBudget.chosenMonth) {
        if (currentYear > loadBudget.chosenYear) {
          return 'Đã kết thúc';
        }
        if (currentYear < loadBudget.chosenYear) {
          return 'Chưa bắt đầu';
        } else {
          return 'Chưa bắt đầu';
        }
      } else {
        if (currentYear > loadBudget.chosenYear) {
          return 'Đã kết thúc';
        }
        if (currentYear < loadBudget.chosenYear) {
          return 'Chưa bắt đầu';
        } else {
          return 'Đang diễn ra';
        }
      }
    }

    // Get the number of days of each month
    int getDaysInMonth(int year, int month) {
      if (month == DateTime.february) {
        final bool isLeapYear =
            (year % 4 == 0) && (year % 100 != 0) || (year % 400 != 0);
        return isLeapYear ? 29 : 28;
      }
      var daysInMonth = [31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
      return daysInMonth[month - 1];
    }

    double _val = -budget.spent / (budget.budget == 0.0 ? 1 : budget.budget);

    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            color: S.colors.whiteColor,
            borderRadius:
                BorderRadius.circular(S.dimens.cardCornerRadiusMedium)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
          child: Column(
            children: [
              const SizedBox(height: 45),
              Text(
                Category.categoryList[budget.categoryId].name,
                style: S.headerTextStyles.header2(null),
              ),
              Text(
                F.currencyFormat.numberMoneyFormat(budget.budget),
                style: S.headerTextStyles.header2(S.colors.primaryColor),
              ),
              Padding(
                padding: EdgeInsets.only(top: S.dimens.tinyPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Còn lại',
                            style:
                                S.bodyTextStyles.body2(S.colors.subTextColor2),
                          ),
                          Text(
                            F.currencyFormat.numberMoneyFormat(
                                budget.budget + budget.spent < 0
                                    ? 0
                                    : budget.budget + budget.spent),
                            style:
                                S.headerTextStyles.header3(S.colors.greenColor),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: S.colors.subTextColor,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Đã chi',
                            style:
                                S.bodyTextStyles.body2(S.colors.subTextColor2),
                          ),
                          Text(
                            F.currencyFormat.numberMoneyFormat(-budget.spent),
                            style:
                                S.headerTextStyles.header3(S.colors.redColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: S.dimens.smallPadding,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(S.dimens.cardCornerRadiusMedium)),
                  child: LinearProgressIndicator(
                    minHeight: 8,
                    value:
                        budget.spent == 0 ? 0 : -budget.spent / budget.budget,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        _val > 0.8 ? S.colors.redColor : S.colors.primaryColor),
                    backgroundColor: S.colors.subTextColor,
                  ),
                ),
              ),
              ListTile(
                leading: SizedBox(
                  height: S.dimens.iconSize,
                  width: S.dimens.iconSize,
                  child: Image.asset(loadWallet
                      .currentListWallet[
                          S.getInt.getIntFromString(budget.walletId)]
                      .iconUrl),
                ),
                title: Text(loadWallet
                    .currentListWallet[
                        S.getInt.getIntFromString(budget.walletId)]
                    .name),
              ),
              ListTile(
                leading: const Icon(Icons.event),
                title: Text(
                    'Tháng ${loadBudget.chosenMonth}, ${loadBudget.chosenYear}'),
                subtitle: Text(getBudgetState()),
              ),
              const Divider(
                thickness: 1,
              ),
              ListTile(
                title: const Text(
                  'Nên chi hàng ngày',
                ),
                subtitle: Text(
                  F.currencyFormat.numberMoneyFormat(
                    budget.budget /
                        getDaysInMonth(
                            loadBudget.chosenYear, loadBudget.chosenMonth),
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'Thực tế chi tiêu hàng ngày',
                ),
                subtitle: Text(
                  F.currencyFormat.numberMoneyFormat(
                    -budget.spent / DateTime.now().day,
                  ),
                ),
              ),
              CustomButton(onPressed: () {}, text: 'DANH SÁCH GIAO DỊCH'),
              SizedBox(height: S.dimens.padding),
            ],
          ),
        ),
      ),
    );
  }
}
