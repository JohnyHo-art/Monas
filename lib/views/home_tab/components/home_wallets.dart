import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/models/wallet_model.dart';
import 'package:monas/viewmodels/dropdown_wallet_vm.dart';
import 'package:monas/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/load_wallet_vm.dart';

class HomeWallets extends StatelessWidget {
  const HomeWallets({Key? key}) : super(key: key);

  // Create an item to show information of recent wallet
  Padding _walletItem(String iconUrl, String name, double totalBalance,
      String locale, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: S.dimens.tinyPadding),
      child: InkWell(
        onTap: onPressed,
        splashColor: S.colors.primaryColorShadeThirty,
        borderRadius: BorderRadius.circular(S.dimens.cardCornerRadiusMedium),
        child: Container(
          height: 100,
          width: 170,
          decoration: BoxDecoration(
            border: Border.all(color: S.colors.primaryColor),
            borderRadius: BorderRadius.circular(S.dimens.cardCornerRadiusSmall),
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
    var loadWallet = Provider.of<LoadWalletViewModel>(context);
    var dropdownWallet = context.watch<DropdownWalletViewModel>();

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
                  onPressed: () async => {
                        await loadWallet.loadListWalletFromFirestore(),
                        Navigator.pushNamed(context, Routes.walletListScreen),
                      },
                  child: Text(
                    'Xem tất cả',
                    style: S.bodyTextStyles.buttonText(S.colors.primaryColor),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: StreamBuilder(
              stream: loadWallet.getWalletStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length < 5
                          ? snapshot.data!.docs.length
                          : 5,
                      itemBuilder: (context, index) {
                        Wallet wallet =
                            Wallet.fromMap(snapshot.data!.docs[index]);
                        if (snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: CustomButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.addWalletScreen);
                              },
                              text: 'THÊM VÍ MỚI',
                            ),
                          );
                        } else {
                          return _walletItem(
                            wallet.iconUrl,
                            wallet.name,
                            wallet.balance,
                            'vi-VN',
                            () {
                              dropdownWallet.setSelectedWallet(
                                  loadWallet.currentListWallet[index]);
                              Navigator.pushNamed(
                                  context, Routes.showTransactionScreen);
                            },
                          );
                        }
                      });
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: S.colors.secondaryColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Utils.showSnackBar('Xảy ra lỗi!');
                } else {
                  return const Center(
                    child: Text("Chưa có ví, Bấm '+' để tạo mới"),
                  );
                }
              }),
        ),
      ],
    );
  }
}
