import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/adding_budget_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
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
    return ListTile(
      leading: Image.asset(categoryIcon),
      title: Text(
        text,
        style: S.bodyTextStyles.body1(null),
      ),
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
