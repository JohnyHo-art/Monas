import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.id,
    required this.categoryIcon,
    required this.text,
  }) : super(key: key);

  final int id;
  final String categoryIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(categoryIcon),
      title: Text(
        text,
        style: S.bodyTextStyles.body1(null),
      ),
      onTap: () {
        Provider.of<AddingBasicInfoViewModel>(context, listen: false)
            .setSelectedCategoryIndex(id);
        Navigator.pop(context);
      },
    );
  }
}
