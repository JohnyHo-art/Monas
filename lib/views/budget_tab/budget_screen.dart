import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/views/budget_tab/budget_statistic.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                //TODO: Handle choose wallet event
              },
              icon: Image.asset(R.walletIcon.walletIc1),
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
              onPressed: () => Navigator.pushNamed(
                  context, Routes.addingBudgetScreen),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Column(
          children: [
            const BudgetStatistic(),
          ],
        ),
      ),
    );
  }
}
