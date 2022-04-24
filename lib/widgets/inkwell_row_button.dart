import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/adding_transaction_vm.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => AddingTransactionViewModel(),
      child: Material(
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
                  style: hintText == 'Thêm ghi chú'
                      ? S.bodyTextStyles.body1(S.colors.subTextColor2)
                      : S.bodyTextStyles.body1(S.colors.textOnSecondaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
