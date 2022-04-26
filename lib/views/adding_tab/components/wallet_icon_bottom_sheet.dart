import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/models/icon_list.dart';
import 'package:monas/viewmodels/adding_wallet_vm.dart';
import 'package:provider/provider.dart';

class WalletIconBottomSheet extends StatelessWidget {
  const WalletIconBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wallet = context.watch<AddingWalletViewModel>();

    Widget _firstRow() => SizedBox(
      height: 60,
      width: double.infinity,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: IconList.walletIcon.icList1.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: S.dimens.tinyPadding),
                child: IconButton(
                  icon: Image.asset(IconList.walletIcon.icList1[index]),
                  iconSize: S.dimens.largeIconSize,
                  onPressed: () {
                    wallet.iconUrl = IconList.walletIcon.icList1[index];
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
      ),
    );

    Widget _secondRow() => SizedBox(
      height: 60,
      width: double.infinity,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: IconList.walletIcon.icList2.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: S.dimens.tinyPadding),
            child: IconButton(
              icon: Image.asset(IconList.walletIcon.icList2[index]),
              iconSize: S.dimens.largeIconSize,
              onPressed: () {
                wallet.iconUrl = IconList.walletIcon.icList2[index];
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );

    Widget _thirdRow() => SizedBox(
      height: 60,
      width: double.infinity,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: IconList.walletIcon.icList3.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: S.dimens.tinyPadding),
            child: IconButton(
              icon: Image.asset(IconList.walletIcon.icList3[index]),
              iconSize: S.dimens.largeIconSize,
              onPressed: () {
                wallet.iconUrl = IconList.walletIcon.icList3[index];
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: S.dimens.tinyPadding),
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(S.dimens.cardCornerRadiusSmall),
              color: S.colors.subTextColor,
            ),
          ),
          SizedBox(height: S.dimens.smallPadding),
          _firstRow(),
          SizedBox(height: S.dimens.tinyPadding),
          _secondRow(),
          SizedBox(height: S.dimens.tinyPadding),
          _thirdRow(),
          SizedBox(height: S.dimens.padding),
        ],
      ),
    );
  }
}
