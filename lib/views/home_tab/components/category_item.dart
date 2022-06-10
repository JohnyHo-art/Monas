import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.id,
    required this.categoryIcon,
    required this.text,
    this.choice,
  }) : super(key: key);

  final int id;
  final String categoryIcon;
  final String text;
  final int? choice;

  @override
  Widget build(BuildContext context) {
    var loadBudget = context.watch<LoadBudgetViewModel>();

    bool isCreated() {
      if (choice == 1) {
        for (int i in loadBudget.chosenCategories) {
          if (i == id) return true;
        }
        return false;
      } else {
        return false;
      }
    }

    return ListTile(
      leading: Image.asset(categoryIcon),
      title: Text(
        text,
        style:
            S.bodyTextStyles.body1(!isCreated() ? null : S.colors.subTextColor),
      ),
      enabled: !isCreated(),
      enableFeedback: !isCreated(),
      onTap: () {
        if (choice == 0) {
          Provider.of<AddingBasicInfoViewModel>(context, listen: false)
              .setSelectedCategoryIndex(id);
        }
        if (choice == 1) {
          Provider.of<AddingBudgetViewModel>(context, listen: false)
              .setSelectedCategoryId(id);
        }
        //call here
        Navigator.pop(context);
      },
    );
  }
}
