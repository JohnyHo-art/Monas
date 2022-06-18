import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/models/wallet_model.dart';
import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
import 'package:monas/viewmodels/budget_tab/edit_budget_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:provider/provider.dart';

class ListWalletScreen extends StatelessWidget {
  const ListWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loadWallet = Provider.of<LoadWalletViewModel>(context, listen: false);
    var addBasic = context.watch<AddingBasicInfoViewModel>();
    var budget = context.watch<AddingBudgetViewModel>();
    var editBudget = context.watch<EditBudgetViewModel>();

    Widget _listWallet(List<Wallet> listWallet) => ListView.builder(
          itemCount: listWallet.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
              child: ListTile(
                leading: Image.asset(listWallet[index].iconUrl),
                title: Text(
                  listWallet[index].name,
                ),
                subtitle: Text(
                  listWallet[index].balance.toString(),
                ),
                onTap: () {
                  addBasic.setSelectedWallet(index);
                  budget.setSelectedWalletId('wallet$index');
                  editBudget.setNewWalletId('wallet$index');
                  Navigator.pop(context);
                },
              ),
            );
          },
        );

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: S.colors.whiteColor,
            elevation: 2,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: S.colors.textOnSecondaryColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Chọn ví',
              style: S.headerTextStyles.appbarTitle(null),
            ),
          ),
          body: Column(
            children: [
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
                    _listWallet(loadWallet.includeToTotalListWallet),
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
