import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';

class BudgetStatistic extends StatelessWidget {
  const BudgetStatistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: S.dimens.smallPadding, vertical: S.dimens.smallPadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(S.dimens.cardCornerRadiusSmall)),
          color: S.colors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: S.colors.shadowElevationColor,
              blurRadius: 3.0,
              spreadRadius: 3.0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(S.dimens.smallPadding),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Còn lại',
                          style: S.bodyTextStyles.body1(S.colors.subTextColor2),
                        ),
                        Text(
                          F.currencyFormat.numberMoneyFormat(1000000),
                          style: S.headerTextStyles
                              .header3(S.colors.backgroundIcon2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tổng ngân sách',
                          style: S.bodyTextStyles.body1(S.colors.subTextColor2),
                        ),
                        Text(
                          F.currencyFormat.numberMoneyFormat(2000000),
                          style: S.headerTextStyles.header3(null),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(S.dimens.smallPadding, 0,
                  S.dimens.smallPadding, S.dimens.smallPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(S.dimens.cardCornerRadiusMedium)),
                      child: LinearProgressIndicator(
                        minHeight: 16,
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            S.colors.primaryColor),
                        backgroundColor: S.colors.subTextColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: S.dimens.smallPadding),
                      child: Text(
                        '50%',
                        style:
                            S.headerTextStyles.header3(S.colors.primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
