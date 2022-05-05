import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/authentic_vm.dart';
import 'package:monas/views/home_tab/components/home_transactions.dart';
import 'package:monas/views/home_tab/components/home_wallets.dart';
import 'package:provider/provider.dart';

import 'components/home_header.dart';
import 'components/home_total_balance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<AuthenticViewModel>(context, listen: false)
          .getUserDataFromFirestore(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: S.colors.appBackground,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: S.dimens.padding),
                    const HomeHeader(),
                    SizedBox(height: S.dimens.smallPadding),
                    const HomeTotalBalance(),
                    SizedBox(height: S.dimens.smallPadding),
                    const HomeWallets(),
                    SizedBox(height: S.dimens.smallPadding),
                    const HomeTransactions(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: S.colors.secondaryColor,
            ),
          );
        }
      },
    );
  }
}
