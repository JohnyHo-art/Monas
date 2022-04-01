import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

// ignore: must_be_immutable
class InkWellRowButton extends StatelessWidget {
  InkWellRowButton(
      {Key? key,
      required this.onTap,
      required this.iconData,
      required this.hintText})
      : super(key: key);
  VoidCallback onTap;
  IconData iconData;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: S.colors.subTextColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: S.dimens.tinyPadding, vertical: S.dimens.tinyPadding),
          child: Row(
            children: [
              Icon(
                iconData,
                color: S.colors.iconColor,
                size: S.dimens.iconSize,
              ),
              SizedBox(width: S.dimens.padding),
              SizedBox(width: S.dimens.tinyPadding),
              Text(
                hintText,
                style: S.bodyTextStyles.body1(S.colors.subTextColor2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
