import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/viewmodels/adding_budget_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/views/budget_tab/budget_statistic.dart';
import 'package:provider/provider.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var budget = context.watch<AddingBudgetViewModel>();
    var loadWallet = context.watch<LoadWalletViewModel>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.appBackground,
        appBar: AppBar(
          backgroundColor: S.colors.primaryColor,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              onPressed: () {
                // Handle choose wallet event
                Navigator.pushNamed(context, Routes.listWalletScreen);
              },
              icon: Image.asset(loadWallet
                  .currentListWallet[budget.selectedWalletId].iconUrl),
              iconSize: S.dimens.smallIconSize,
            ),
          ),
          title: InkWell(
            splashColor: S.colors.shadowElevationColor,
            onTap: () {
              //TODO: Handle month picker event
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Tháng 5, 2022',
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
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.addingBudgetScreen),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Column(
          children: const [
            BudgetStatistic(),
          ],
        ),
      ),
    );
  }
}
