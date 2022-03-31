import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

class LabelMoney extends StatelessWidget {
  const LabelMoney({
    Key? key,
    required this.label,
    required this.money,
    required this.dotAppear,
    this.dotColor,
    this.moneyColor,
  }) : super(key: key);

  final String label;
  final String money;
  final bool dotAppear;
  final Color? dotColor;
  final Color? moneyColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: S.dimens.padding),
      child: RichText(
        text: dotAppear
            ? TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Icon(
                        Icons.circle,
                        size: 12,
                        color: dotColor ?? S.colors.textOnSecondaryColor,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: label,
                    style: S.bodyTextStyles.body2(S.colors.subTextColor2),
                  ),
                  TextSpan(
                    text: "\n" + money,
                    style: S.headerTextStyles
                        .header3(moneyColor ?? S.colors.textOnSecondaryColor),
                  ),
                ],
              )
            : TextSpan(
                children: [
                  TextSpan(
                    text: label,
                    style: S.bodyTextStyles.body2(S.colors.subTextColor2),
                  ),
                  TextSpan(
                    text: "\n" + money,
                    style: S.headerTextStyles
                        .header3(moneyColor ?? S.colors.textOnSecondaryColor),
                  ),
                ],
              ),
      ),
    );
  }
}
