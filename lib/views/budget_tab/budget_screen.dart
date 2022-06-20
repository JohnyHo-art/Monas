import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/views/budget_tab/components/budget_list_data.dart';
import 'package:monas/views/budget_tab/components/budget_statistic.dart';
import 'package:monas/widgets/empty_wallet_inform.dart';
import 'package:provider/provider.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize necessary viewmodel
    // Use this adding budget to get selected wallet id, category id
    var addingBudget = context.watch<AddingBudgetViewModel>();
    // Use this load wallet view model to get the icon url and name of the wallet
    var loadWallet = context.watch<LoadWalletViewModel>();
    // Load budget view model to get chosen categories and budget stream
    var loadBudget = context.watch<LoadBudgetViewModel>();

    // Create a custom list of year from current year
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

    return loadWallet.currentListWallet.isEmpty
        ? const EmptyWalletInform()
        : SafeArea(
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
                      // Move to the list wallet screen and pick one
                      Navigator.pushNamed(context, Routes.listWalletScreen);
                    },
                    icon: Padding(
                      padding: const EdgeInsets.all(6.0),
                      // Use get int from string in constants class to get the index of wallet
                      child: Image.asset(loadWallet
                          .currentListWallet[S.getInt
                              .getIntFromString(addingBudget.selectedWalletId)]
                          .iconUrl),
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
                      // The month is always greater than index 1
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
                      // Move to the adding budget screen
                      onPressed: () => Navigator.pushNamed(
                          context, Routes.addingBudgetScreen),
                      icon: const Icon(Icons.add),
                    )
                  ],
                ),
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // January tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // February tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // March tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // April tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // May tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // June tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // July tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // August tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // September tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // October tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // November tab view
                    Column(
                      children: const [
                        BudgetStatistic(),
                        Expanded(child: BudgetListData()),
                        SizedBox(height: 16),
                      ],
                    ),
                    // December tab view
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
