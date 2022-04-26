import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/constants/string_constants.dart';

class HomeWallets extends StatelessWidget {
  const HomeWallets({Key? key}) : super(key: key);

  Padding _walletItem(String iconUrl, String name, double totalBalance,
      String locale, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.only(left: S.dimens.padding),
      child: InkWell(
        onTap: onPressed,
        splashColor: S.colors.primaryColorShadeThirty,
        borderRadius: BorderRadius.circular(S.dimens.cardCornerRadiusMedium),
        child: Container(
          height: 100,
          width: 170,
          decoration: BoxDecoration(
            border: Border.all(color: S.colors.primaryColor),
            borderRadius:
                BorderRadius.circular(S.dimens.cardCornerRadiusMedium),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: S.dimens.smallPadding,
              top: S.dimens.tinyPadding,
              right: S.dimens.smallPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Image.asset(
                          iconUrl,
                          fit: BoxFit.cover,
                          height: S.dimens.largeIconSize,
                          width: S.dimens.largeIconSize,
                        ),
                      ),
                      TextSpan(
                        text: '  ' + name,
                        style: S.bodyTextStyles.body1(S.colors.primaryColor),
                      )
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: S.dimens.tinyPadding),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: F.currencyFormat
                            .compactSimpleFormatCurrency(totalBalance, locale),
                        style:
                            S.headerTextStyles.header3(S.colors.primaryColor),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ví của bạn',
                style:
                    S.headerTextStyles.header3(S.colors.textOnSecondaryColor),
              ),
              TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => S.colors.primaryColorShadeThirty)),
                  onPressed: () => Navigator.pushNamed(context, Routes.walletListScreen),
                  child: Text(
                    'Xem tất cả',
                    style: S.bodyTextStyles.buttonText(S.colors.primaryColor),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _walletItem(
                R.walletIcon.walletIc1,
                'Saving',
                10230000,
                StringConstants.localeString.japan,
                () {},
              ),
              _walletItem(
                R.walletIcon.walletIc2,
                'Daily expense',
                400000000,
                StringConstants.localeString.vietnam,
                () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
