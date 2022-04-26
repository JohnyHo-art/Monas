import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    this.categoryIcon,
    this.text,
    this.onTap,
  }) : super(key: key);

  final String? categoryIcon;
  final String? text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          SizedBox(
            width: S.dimens.smallPadding,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(categoryIcon ?? ""),
          ),
          Text(
            text ?? "",
            style: S.bodyTextStyles.body2(null),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
