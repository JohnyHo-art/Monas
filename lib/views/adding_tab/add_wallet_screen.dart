import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/adding_wallet_vm.dart';
import 'package:provider/provider.dart';

import 'components/wallet_icon_bottom_sheet.dart';

class AddWalletScreen extends StatelessWidget {
  const AddWalletScreen({Key? key}) : super(key: key);

  // Wallet name and icon choosing section
  Widget _walletName(String iconUrl, VoidCallback onPressed,
          TextEditingController nameTextFieldController) =>
      Row(
        children: [
          SizedBox(width: S.dimens.padding),
          Flexible(
            flex: 2,
            child: IconButton(
              iconSize: S.dimens.largeIconSize,
              icon: Image.asset(iconUrl),
              onPressed: onPressed,
            ),
          ),
          SizedBox(width: S.dimens.smallPadding),
          Flexible(
            flex: 9,
            child: TextFormField(
              cursorColor: S.colors.primaryColor,
              style: S.headerTextStyles.header2(S.colors.primaryColor),
              controller: nameTextFieldController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Tên ví',
                hintStyle: S.headerTextStyles.header2(S.colors.subTextColor2),
                focusColor: S.colors.primaryColor,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: S.colors.primaryColor),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: S.colors.subTextColor2),
                ),
              ),
            ),
          ),
          SizedBox(width: S.dimens.padding),
        ],
      );

  // Enter initial balance section
  Widget _initialBalance(TextEditingController balanceTextFieldController) {
    return Row(
      children: [
        const Flexible(flex: 2, child: SizedBox(width: 80)),
        Flexible(
          flex: 6,
          child: TextFormField(
            cursorColor: S.colors.primaryColor,
            style: S.headerTextStyles.header2(S.colors.primaryColor),
            controller: balanceTextFieldController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Số dư',
              hintStyle: S.headerTextStyles.header3(S.colors.subTextColor2),
              focusColor: S.colors.primaryColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(S.dimens.cardCornerRadiusSmall)),
                borderSide: BorderSide(color: S.colors.primaryColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(S.dimens.cardCornerRadiusSmall)),
                borderSide: BorderSide(color: S.colors.subTextColor2, width: 2),
              ),
            ),
          ),
        ),
        SizedBox(width: S.dimens.smallPadding),
        Flexible(
          flex: 1,
          child: Text(
            'đ',
            style: S.headerTextStyles.header1(S.colors.primaryColor),
          ),
        ),
        SizedBox(width: S.dimens.padding),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var addWallet = Provider.of<AddingWalletViewModel>(context);

    // Choose to include or exclude from total wallet section
    Widget _includeTotal() {
      return Row(
        children: [
          const Flexible(flex: 2, child: SizedBox(width: 80)),
          Flexible(
            flex: 1,
            child: Checkbox(
              activeColor: S.colors.primaryColor,
              onChanged: (bool? value) {
                addWallet.includeToTotal = value ?? true;
              },
              value: addWallet.includeToTotal,
            ),
          ),
          Flexible(
            flex: 4,
            child: Text(
              'Tính vào ví tổng',
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
        ],
      );
    }

    // Show the wallet icon chosen bottom sheet
    void showWalletIconBottomSheet(BuildContext context) =>
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(S.dimens.cardCornerRadiusMedium),
              topRight: Radius.circular(S.dimens.cardCornerRadiusMedium),
            ),
          ),
          builder: (BuildContext context) {
            return const WalletIconBottomSheet();
          },
        );

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: S.colors.whiteColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: S.colors.whiteColor,
            leading: IconButton(
              icon: Icon(Icons.close, color: S.colors.textOnSecondaryColor),
              onPressed: () {
                Navigator.pop(context);
                addWallet.resetInformation();
              },
            ),
            title: Text(
              "Thêm ví",
              style: S.headerTextStyles.appbarTitle(null),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.done,
                  color: S.colors.primaryColor,
                  size: S.dimens.iconSize,
                ),
                onPressed: () {
                  addWallet.addNewWallet(context);
                  Navigator.pop(context);
                  addWallet.resetInformation();
                },
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: S.dimens.smallPadding),
              _walletName(
                addWallet.iconUrl,
                () => showWalletIconBottomSheet(context),
                addWallet.nameTextFieldController,
              ),
              SizedBox(height: S.dimens.padding),
              _initialBalance(addWallet.balanceTextFieldController),
              SizedBox(height: S.dimens.padding),
              _includeTotal(),
            ],
          ),
        ),
      ),
    );
  }
}
