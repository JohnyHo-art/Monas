import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

class HomeTotalBalance extends StatelessWidget {
  const HomeTotalBalance({Key? key}) : super(key: key);

  Row _totalBalance() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(left: S.dimens.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total balance',
                  style: S.bodyTextStyles.body2(S.colors.textOnPrimaryColor)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        //TODO: Add total balance
                        text: '2.000.000',
                        style: S.headerTextStyles
                            .header1(S.colors.textOnPrimaryColor)),
                    TextSpan(
                        //TODO: Add currency unit
                        text: ' VNĐ',
<<<<<<< Updated upstream:lib/views/home_tab/components/home_total_balance.dart
                        style: BodyText.body1(textOnPrimaryColor)),
=======
                        style: S.bodyTextStyles
                            .body1(S.colors.textOnPrimaryColor)),
>>>>>>> Stashed changes:lib/screens/home_tab/components/home_total_balance.dart
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: S.dimens.padding),
          child: IconButton(
            onPressed: () {},
            splashColor: S.colors.secondaryColor,
            icon: Icon(
              Icons.visibility_off,
              color: S.colors.textOnPrimaryColor,
            ),
          ),
        )
      ],
    );
  }

  Row _detailSatistic() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* Income statistic
        Padding(
          padding: EdgeInsets.only(left: S.dimens.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.arrow_circle_up,
                        color: S.colors.textOnPrimaryColor,
                        size: S.dimens.iconSize,
                      ),
                    ),
                    TextSpan(
                      text: ' Income',
                      style:
                          S.bodyTextStyles.body2(S.colors.textOnPrimaryColor),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        //TODO: Add income money
                        text: '3.000.000',
                        style: S.headerTextStyles
                            .header3(S.colors.textOnPrimaryColor)),
                    TextSpan(
<<<<<<< Updated upstream:lib/views/home_tab/components/home_total_balance.dart
                        //TODO: Add currency unit
                        text: 'VNĐ',
                        style: BodyText.caption(textOnPrimaryColor)),
=======
                      //TODO: Add currency unit
                      text: 'VNĐ',
                      style:
                          S.bodyTextStyles.caption(S.colors.textOnPrimaryColor),
                    ),
>>>>>>> Stashed changes:lib/screens/home_tab/components/home_total_balance.dart
                  ],
                ),
              )
            ],
          ),
        ),
        //* Expenses statistic
        Padding(
          padding: EdgeInsets.only(right: S.dimens.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Expenses ',
                      style:
                          S.bodyTextStyles.body2(S.colors.textOnPrimaryColor),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.arrow_circle_down,
                        color: S.colors.textOnPrimaryColor,
                        size: S.dimens.iconSize,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        //TODO: Add expenses
                        text: '1.000.000',
                        style: S.headerTextStyles
                            .header3(S.colors.textOnPrimaryColor)),
                    TextSpan(
                      //TODO: Add currency unit
                      text: 'VNĐ',
                      style:
                          S.bodyTextStyles.caption(S.colors.textOnPrimaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
      child: Container(
        decoration: BoxDecoration(
          color: S.colors.primaryColor,
          borderRadius: BorderRadius.circular(S.dimens.cardCornerRadiusMedium),
        ),
        child: Column(
          children: [
            SizedBox(height: S.dimens.padding),
            _totalBalance(),
            SizedBox(height: S.dimens.smallPadding),
            _detailSatistic(),
            SizedBox(height: S.dimens.padding),
          ],
        ),
      ),
    );
  }
}
