import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';

class BudgetItem extends StatelessWidget {
  const BudgetItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(R.categoryIcon.educationIc),
      title: Text('Giáo dục', style: S.headerTextStyles.header3(null)),
    );
  }
}
