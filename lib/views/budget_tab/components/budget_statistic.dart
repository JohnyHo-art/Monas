import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:provider/provider.dart';

class BudgetStatistic extends StatelessWidget {
  const BudgetStatistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use load budget view model to get chosen month and year
    var loadBudget = context.watch<LoadBudgetViewModel>();
    var addingBudget = context.watch<AddingBudgetViewModel>();

    return StreamBuilder<QuerySnapshot>(
      stream: loadBudget.getBudgetStream(addingBudget.selectedWalletId),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          // Set initial total budget and spent as 0
          // do this to avoid incremental when we load view many times
          loadBudget.setTotalBudget(0.0);
          loadBudget.setTotalSpent(0.0);
          // Run a for loop and for each budget in the budget documents list
          // add the budget as well as spent
          for (DocumentSnapshot doc in snapshot.data!.docs) {
            Budget b = Budget.fromJSON(doc.data() as Map<String, dynamic>);
            loadBudget.setTotalBudget(loadBudget.totalBudget + b.budget);
            loadBudget.setTotalSpent(loadBudget.totalSpent + b.spent);
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: S.dimens.smallPadding,
                vertical: S.dimens.smallPadding),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(S.dimens.cardCornerRadiusSmall)),
                color: S.colors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: S.colors.shadowElevationColor,
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(S.dimens.smallPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Còn lại',
                                style: S.bodyTextStyles
                                    .body1(S.colors.subTextColor2),
                              ),
                              Text(
                                // because the toatl spent is a negative double
                                // so we use plus insted of minus
                                F.currencyFormat.numberMoneyFormat(
                                    loadBudget.totalBudget +
                                        loadBudget.totalSpent),
                                style: S.headerTextStyles
                                    .header3(S.colors.backgroundIcon2),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tổng ngân sách',
                                style: S.bodyTextStyles
                                    .body1(S.colors.subTextColor2),
                              ),
                              Text(
                                F.currencyFormat
                                    .numberMoneyFormat(loadBudget.totalBudget),
                                style: S.headerTextStyles.header3(null),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(S.dimens.smallPadding, 0,
                        S.dimens.smallPadding, S.dimens.smallPadding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(
                                S.dimens.cardCornerRadiusMedium)),
                            child: LinearProgressIndicator(
                              minHeight: 8,
                              // Because the total budget can be 0 so we need to check it
                              value: loadBudget.totalSpent == 0
                                  ? 0
                                  : -loadBudget.totalSpent /
                                      loadBudget.totalBudget,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  S.colors.primaryColor),
                              backgroundColor: S.colors.subTextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: S.dimens.smallPadding),
                            child: Text(
                              loadBudget.totalSpent == 0
                                  ? '0%'
                                  : ((-loadBudget.totalSpent /
                                                  loadBudget.totalBudget) *
                                              100)
                                          .toStringAsFixed(0) +
                                      '%',
                              style: S.headerTextStyles
                                  .header3(S.colors.primaryColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('No statistic'),
          );
        }
      },
    );
  }
}
