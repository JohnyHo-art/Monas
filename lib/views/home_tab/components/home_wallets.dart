import 'package:flutter/material.dart';
import 'package:monas/constants/color.dart';
import 'package:monas/constants/dimens.dart';
import 'package:monas/constants/text_style.dart';

class HomeWallets extends StatelessWidget {
  const HomeWallets({Key? key}) : super(key: key);

  Padding _walletItem(String iconUrl, String name, double totalBalance,
      String currencyUnit, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimens.padding),
      child: InkWell(
        onTap: onPressed,
        splashColor: primaryColorShadeThirty,
        borderRadius: BorderRadius.circular(Dimens.cardCornerRadiusMedium),
        child: Container(
          height: 100,
          width: 170,
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(Dimens.cardCornerRadiusMedium),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: Dimens.smallPadding,
              top: Dimens.tinyPadding,
              right: Dimens.smallPadding,
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
                          height: Dimens.largeIconSize,
                          width: Dimens.largeIconSize,
                        ),
                      ),
                      TextSpan(
                        text: '  ' + name,
                        //TODO: text overflow
                        style: BodyText.body1(primaryColor),
                      )
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Dimens.tinyPadding),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: totalBalance.toString(),
                        style: HeaderText.header3(primaryColor),
                      ),
                      TextSpan(
                        text: ' ' + currencyUnit.toUpperCase(),
                        style: BodyText.caption(primaryColor),
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
          padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ví của bạn',
                style: HeaderText.header3(textOnSecondaryColor),
              ),
              TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => primaryColorShadeThirty)),
                  onPressed: () {},
                  child: Text(
                    'Xem tất cả',
                    style: BodyText.buttonText(primaryColor),
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
