import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/models/wallet_model.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:provider/provider.dart';

class WalletListScreen extends StatelessWidget {
  const WalletListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loadWallet = Provider.of<LoadWalletViewModel>(context);
    var loadWalletWithoutListen =
        Provider.of<LoadWalletViewModel>(context, listen: false);

    Widget _listWallet(List<Wallet> listWallet) => ListView.builder(
          itemCount: listWallet.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
              child: ListTile(
                leading: Image.asset(listWallet[index].iconUrl),
                trailing: IconButton(
                    icon: const Icon(Icons.more_vert), onPressed: () {}),
                title: Text(
                  listWallet[index].name,
                ),
                subtitle: Text(
                  listWallet[index].balance.toString(),
                ),
                onTap: () =>
                    Navigator.pushNamed(context, Routes.showTransactionScreen),
              ),
            );
          },
        );

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
                    F.currencyFormat
                        .formatCurrency(loadWalletWithoutListen.total, 'vi-VN'),
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
              Expanded(
                child: TabBarView(
                  children: [
                    RefreshIndicator(
                      onRefresh: () {
                        return loadWallet.loadListWalletFromFirestore();
                      },
                      child: _listWallet(loadWallet.includeToTotalListWallet),
                    ),
                    _listWallet(loadWallet.nonIncludeToTotalListWallet),
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
