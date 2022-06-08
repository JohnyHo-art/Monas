import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:monas/views/budget_tab/budget_item.dart';
import 'package:provider/provider.dart';

class BudgetListData extends StatelessWidget {
  const BudgetListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loadBudget = context.watch<LoadBudgetViewModel>();
    var budget = context.watch<AddingBudgetViewModel>();

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('budgets')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('wallet${budget.selectedWalletId}')
          .doc('${loadBudget.chosenMonth}-${loadBudget.chosenYear}')
          .collection('budgetList')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Budget budget = Budget.fromJSON(snapshot.data!.docs[index]);
              return BudgetItem(budget: budget);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: S.colors.secondaryColor,
            ),
          );
        }
      },
    );
  }
}
