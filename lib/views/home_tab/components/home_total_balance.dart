import 'package:flutter/material.dart';
import 'package:monas/constants/color.dart';
import 'package:monas/constants/dimens.dart';
import 'package:monas/constants/text_style.dart';

class HomeTotalBalance extends StatelessWidget {
  const HomeTotalBalance({Key? key}) : super(key: key);

  Row _totalBalance() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Dimens.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total balance', style: BodyText.body2(textOnPrimaryColor)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        //TODO: Add total balance
                        text: '2.000.000',
                        style: HeaderText.header1(textOnPrimaryColor)),
                    TextSpan(
                        //TODO: Add currency unit
                        text: ' VNĐ',
                        style: BodyText.body1(textOnPrimaryColor)),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: Dimens.padding),
          child: IconButton(
            onPressed: () {},
            splashColor: secondaryColor,
            icon: const Icon(
              Icons.visibility_off,
              color: textOnPrimaryColor,
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
          padding: const EdgeInsets.only(left: Dimens.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.arrow_circle_up,
                        color: textOnPrimaryColor,
                        size: Dimens.iconSize,
                      ),
                    ),
                    TextSpan(
                      text: ' Income',
                      style: BodyText.body2(textOnPrimaryColor),
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
                        style: HeaderText.header3(textOnPrimaryColor)),
                    TextSpan(
                        //TODO: Add currency unit
                        text: 'VNĐ',
                        style: BodyText.caption(textOnPrimaryColor)),
                  ],
                ),
              )
            ],
          ),
        ),
        //* Expenses statistic
        Padding(
          padding: const EdgeInsets.only(right: Dimens.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Expenses ',
                      style: BodyText.body2(textOnPrimaryColor),
                    ),
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.arrow_circle_down,
                        color: textOnPrimaryColor,
                        size: Dimens.iconSize,
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
                        style: HeaderText.header3(textOnPrimaryColor)),
                    TextSpan(
                      //TODO: Add currency unit
                      text: 'VNĐ',
                      style: BodyText.caption(textOnPrimaryColor),
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
      padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(Dimens.cardCornerRadiusMedium),
        ),
        child: Column(
          children: [
            const SizedBox(height: Dimens.padding),
            _totalBalance(),
            const SizedBox(height: Dimens.smallPadding),
            _detailSatistic(),
            const SizedBox(height: Dimens.padding),
          ],
        ),
      ),
    );
  }
}
