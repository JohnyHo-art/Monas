import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/adding_amount_vm.dart';
import 'package:monas/viewmodels/choose_category_vm.dart';
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
    var amount = context.watch<AddingAmountViewModel>();
    var chooseCategory = context.watch<ChooseCategoryViewModel>();

    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0.0),
        backgroundColor: MaterialStateProperty.all<Color>(S.colors.whiteColor),
      ),
      child: Row(
        children: [
          SizedBox(
            width: S.dimens.smallPadding,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(categoryIcon),
          ),
          Text(
            text,
            style: S.bodyTextStyles.body2(null),
          )
        ],
      ),
      onPressed: () {
        chooseCategory.setSelectedCategoryIndex(id);
        Navigator.pop(context);
      },
    );
  }
}
