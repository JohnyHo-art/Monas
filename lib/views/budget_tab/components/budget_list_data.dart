import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:monas/views/budget_tab/components/budget_item.dart';
import 'package:provider/provider.dart';

class BudgetListData extends StatelessWidget {
  const BudgetListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loadBudget = context.watch<LoadBudgetViewModel>();
    var budget = context.watch<AddingBudgetViewModel>();

    return StreamBuilder<QuerySnapshot>(
      // Call a stream from viewmodel which return snapshots from firestore
      stream: loadBudget.getBudgetStream(budget.selectedWalletId),
      // Builder which is the main part that produces UI with each snapshot state
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // if the snapshot return data then build a listview
        if (snapshot.hasData) {
          // Refresh the chosen category list
          loadBudget.setChosenCategories(<int>[26, 27, 30, 31, 32, 33, 34]);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              // Create a new budget and decompose it from JSON format
              Budget budget = Budget.fromJSON(snapshot.data!.docs[index]);
              // Add each budget in the budgets list to the categories list
              loadBudget.addNewCategoryID(budget.categoryId);
              return BudgetItem(budget: budget);
            },
          );
        } // if the current state is waiting then return a circle indicator
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: S.colors.secondaryColor,
            ),
          );
        } // If the snapshot has error than show a snackbar
        else if (snapshot.hasError) {
          return Utils.showErrorDialog(context);
        } else {
          return const Center(
            child: Text("Chưa có ngân sách, Bấm '+' để tạo mới"),
          );
        }
      },
    );
  }
}
