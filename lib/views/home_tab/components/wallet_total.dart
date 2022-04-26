import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/resources.dart';

class WalletTotal extends StatelessWidget {
  const WalletTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: S.dimens.smallPadding),
        enableFeedback: true,
        leading: Image.asset(R.walletIcon.walletIc0),
        title: Text(
          'Ví tổng',
          overflow: TextOverflow.ellipsis,
          style: S.headerTextStyles.header3(null),
        ),
        subtitle: Text(
          F.currencyFormat.formatCurrency(2000000, 'vi-VN'),
          style: S.bodyTextStyles.body2(S.colors.subTextColor2),
        ),
      ),
    );
  }
}
