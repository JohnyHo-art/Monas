import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

class HomeWallets extends StatelessWidget {
  const HomeWallets({Key? key}) : super(key: key);

  Padding _walletItem(String iconUrl, String name, double totalBalance,
      String currencyUnit, VoidCallback onPressed) {
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
                        //TODO: text overflow
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
                        text: totalBalance.toString(),
                        style:
                            S.headerTextStyles.header3(S.colors.primaryColor),
                      ),
                      TextSpan(
                        text: ' ' + currencyUnit.toUpperCase(),
                        style: S.bodyTextStyles.caption(S.colors.primaryColor),
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
                  onPressed: () {},
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
                'assets/icons/wallet_ic/wallet_ic1.png',
                'Saving',
                2000000,
                'usd',
                () {},
              ),
              _walletItem(
                'assets/icons/wallet_ic/wallet_ic5.png',
                'Daily expense',
                4000000,
                'vnđ',
                () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
