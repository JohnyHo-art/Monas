import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/routes.dart';

class WalletListScreen extends StatelessWidget {
  const WalletListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
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
              style:
                  S.headerTextStyles.appbarTitle(S.colors.textOnPrimaryColor),
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
            onPressed: () =>
                Navigator.pushNamed(context, Routes.addWalletScreen),
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              Card(
                elevation: 2,
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: S.dimens.smallPadding),
                  enableFeedback: true,
                  leading: Image.asset(R.walletIcon.walletIc0),
                  title: Text(
                    'Tổng cộng',
                    overflow: TextOverflow.ellipsis,
                    style: S.headerTextStyles.header3(null),
                  ),
                  subtitle: Text(
                    F.currencyFormat.formatCurrency(2000000, 'vi-VN'),
                    style: S.bodyTextStyles.body2(S.colors.subTextColor2),
                  ),
                ),
              ),
              SizedBox(height: S.dimens.tinyPadding),
              TabBar(
                unselectedLabelColor: S.colors.subTextColor2,
                indicatorColor: S.colors.primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: S.bodyTextStyles.buttonText(null),
                labelColor: S.colors.primaryColor,
                tabs: const [
                  Tab(text: 'TÍNH VÀO TỔNG'),
                  Tab(text: 'KHÔNG TÍNH VÀO TỔNG'),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Icon(Icons.directions_car),
                    Icon(Icons.directions_transit),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
