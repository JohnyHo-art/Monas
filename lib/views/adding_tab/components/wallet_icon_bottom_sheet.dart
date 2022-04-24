import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';

class WalletIconBottomSheet extends StatelessWidget {
  const WalletIconBottomSheet({Key? key}) : super(key: key);

  Row _fistRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc1),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc2),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc3),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc4),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc5),
        onPressed: () {},
      ),
    ],
  );

  Row _secondRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc6),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc7),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc8),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc9),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc10),
        onPressed: () {},
      ),
    ],
  );

  Row _thirdRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc11),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc12),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc13),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc14),
        onPressed: () {},
      ),
      IconButton(
        iconSize: S.dimens.largeIconSize,
        icon: Image.asset(R.walletIcon.walletIc15),
        onPressed: () {},
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: S.dimens.tinyPadding),
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(S.dimens.cardCornerRadiusSmall),
              color: S.colors.subTextColor,
            ),
          ),
          SizedBox(height: S.dimens.smallPadding),
          _fistRow(),
          SizedBox(height: S.dimens.smallPadding),
          _secondRow(),
          SizedBox(height: S.dimens.smallPadding),
          _thirdRow(),
          SizedBox(height: S.dimens.padding),
        ],
      ),
    );
  }
}
