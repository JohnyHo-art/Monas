import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

class HomeTransactions extends StatelessWidget {
  const HomeTransactions({Key? key}) : super(key: key);

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
                'Giao dịch gần đây',
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
      ],
    );
  }
}
