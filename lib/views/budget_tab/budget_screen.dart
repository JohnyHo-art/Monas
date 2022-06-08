import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/views/budget_tab/budget_list_data.dart';
import 'package:monas/views/budget_tab/budget_statistic.dart';
import 'package:provider/provider.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize necessary viewmodel
    var budget = context.watch<AddingBudgetViewModel>();
    var loadWallet = context.watch<LoadWalletViewModel>();
    var loadBudget = context.watch<LoadBudgetViewModel>();

    // Create a custom list of year from current
    int currentYear = DateTime.now().year;
    List yearList = [
      currentYear - 3,
      currentYear - 2,
      currentYear - 1,
      currentYear,
      currentYear + 1,
      currentYear + 2,
      currentYear + 3,
    ];

    return SafeArea(
      child: DefaultTabController(
        initialIndex: DateTime.now().month - 1,
        length: 12,
        child: Scaffold(
          backgroundColor: S.colors.appBackground,
          appBar: AppBar(
            backgroundColor: S.colors.primaryColor,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                // Handle choose wallet event
                Navigator.pushNamed(context, Routes.listWalletScreen);
              },
              icon: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(loadWallet
                    .currentListWallet[budget.selectedWalletId].iconUrl),
              ),
              iconSize: S.dimens.smallIconSize,
            ),
            title: PopupMenuButton(
              initialValue: loadBudget.chosenYear,
              onSelected: (item) {
                loadBudget.setChosenYear(item);
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('${yearList[0]}'),
                  value: yearList[0],
                ),
                PopupMenuItem(
                  child: Text('${yearList[1]}'),
                  value: yearList[1],
                ),
                PopupMenuItem(
                  child: Text('${yearList[2]}'),
                  value: yearList[2],
                ),
                PopupMenuItem(
                  child: Text('${yearList[3]}'),
                  value: yearList[3],
                ),
                PopupMenuItem(
                  child: Text('${yearList[4]}'),
                  value: yearList[4],
                ),
                PopupMenuItem(
                  child: Text('${yearList[5]}'),
                  value: yearList[5],
                ),
                PopupMenuItem(
                  child: Text('${yearList[6]}'),
                  value: yearList[6],
                ),
              ],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${loadBudget.chosenYear}',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      color: S.colors.textOnPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: S.colors.subTextColor,
              indicatorColor: S.colors.whiteColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: S.bodyTextStyles.buttonText(null),
              onTap: (index) {
                loadBudget.setChosenMonth(index + 1);
              },
              tabs: const [
                Tab(text: 'Tháng 1'),
                Tab(text: 'Tháng 2'),
                Tab(text: 'Tháng 3'),
                Tab(text: 'Tháng 4'),
                Tab(text: 'Tháng 5'),
                Tab(text: 'Tháng 6'),
                Tab(text: 'Tháng 7'),
                Tab(text: 'Tháng 8'),
                Tab(text: 'Tháng 9'),
                Tab(text: 'Tháng 10'),
                Tab(text: 'Tháng 11'),
                Tab(text: 'Tháng 12'),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.addingBudgetScreen),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
              Column(
                children: const [
                  BudgetStatistic(),
                  Expanded(child: BudgetListData()),
                  SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
