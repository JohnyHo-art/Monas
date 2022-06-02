import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

// ignore: must_be_immutable
class BudgetDetailItem extends StatelessWidget {
  BudgetDetailItem({
    Key? key,
    this.leading,
    this.trailing,
    this.color,
    required this.onPressed,
    required this.hintText,
    required this.title,
  }) : super(key: key);
  Widget? leading;
  Widget? trailing;
  Color? color;
  VoidCallback onPressed;
  String title;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: leading ?? const SizedBox.shrink(),
        ),
        Expanded(
          flex: trailing == null ? 8 : 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: S.headerTextStyles.header3(null)),
              SizedBox(height: S.dimens.tinyPadding),
              InkWell(
                onTap: onPressed,
                child: Container(
                  height: 50,
                  width: 270,
                  decoration: BoxDecoration(
                    color: S.colors.subTextColor,
                    border: Border.all(color: S.colors.subTextColor2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(S.dimens.cardCornerRadiusSmall),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: S.dimens.smallPadding),
                      child: Text(
                        hintText,
                        style: S.bodyTextStyles
                            .body1(color ?? S.colors.subTextColor2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: trailing == null ? 0 : 2,
          child: trailing ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
