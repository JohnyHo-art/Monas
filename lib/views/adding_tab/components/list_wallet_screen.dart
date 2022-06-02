import 'package:flutter/material.dart';
import 'package:monas/models/wallet_model.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:provider/provider.dart';

class ListWalletScreen extends StatelessWidget {
  const ListWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loadWallet = Provider.of<LoadWalletViewModel>(context, listen: false);
    var addBasic = context.watch<AddingBasicInfoViewModel>();

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
                  Navigator.pop(context);
                },
              ),
            );
          },
        );

    return Scaffold(
      body: SafeArea(child: _listWallet(loadWallet.currentListWallet)),
    );
  }
}
