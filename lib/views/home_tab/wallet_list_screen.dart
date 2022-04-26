import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/views/adding_tab/components/wallet_tab.dart';
import 'package:monas/views/home_tab/components/wallet_total.dart';

class WalletListScreen extends StatelessWidget {
  const WalletListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.appBackground,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: S.colors.primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Ví của bạn",
            style: S.headerTextStyles.appbarTitle(S.colors.textOnPrimaryColor),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: S.colors.primaryColor,
          onPressed: () => Navigator.pushNamed(context, Routes.addWalletScreen),
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            const WalletTotal(),
            SizedBox(height: S.dimens.smallPadding),
            //const WalletTab(),
          ],
        ),
      ),
    );
  }
}
