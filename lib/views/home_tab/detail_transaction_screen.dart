import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/models/transaction_model.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/load_wallet_vm.dart';

class DetailTransactionScreen extends StatelessWidget {
  const DetailTransactionScreen({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    var loadWallet = Provider.of<LoadWalletViewModel>(context, listen: false);

    Widget _customRichtext(String text1, String? text2, double? paddingBottom) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8, 8, paddingBottom ?? 8),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: text1,
                  style: S.bodyTextStyles.body1(S.colors.subTextColor2),
                ),
                TextSpan(
                  text: text2,
                  style: S.bodyTextStyles.body1(null),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget _image(String imageUrl) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 128,
          width: 128,
          child: Image.network(imageUrl),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: S.colors.primaryColor,
        title: Text(
          "Chi tiết giao dịch",
          style: S.headerTextStyles.header3(S.colors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: Center(
                  child: SizedBox(
                    width: 380,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      elevation: 4,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 64.0),
                            child: Text(
                              transaction.money.toString(),
                              style: S.headerTextStyles.header4(
                                transaction.money < 0
                                    ? S.colors.redColor
                                    : S.colors.greenColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Category
                                  .categoryList[transaction.categoryId].name,
                              style: S.headerTextStyles
                                  .header2(S.colors.subTextColor2),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              height: 1,
                              color: S.colors.shadowElevationColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  loadWallet
                                      .currentListWallet[transaction.walletId]
                                      .iconUrl,
                                  scale: 0.8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    loadWallet
                                        .currentListWallet[transaction.walletId]
                                        .name,
                                    style: S.bodyTextStyles.body1(null),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              height: 1,
                              color: S.colors.shadowElevationColor,
                            ),
                          ),
                          _customRichtext(
                            "Date: ",
                            DateFormat('yMMMMd').format(transaction.date),
                            null,
                          ),
                          _customRichtext(
                            "Note: ",
                            transaction.note,
                            null,
                          ),
                          _customRichtext(
                            "With: ",
                            transaction.withPerson,
                            16,
                          ),
                          transaction.images == null
                              ? const SizedBox()
                              : Wrap(
                                  children: [
                                    SizedBox(
                                      height: 280,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: transaction.images!.length,
                                        itemBuilder: (context, index) {
                                          return _image(
                                              transaction.images![index]);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 30,
            child: Image.asset(
              Category.categoryList[transaction.categoryId].iconUrl,
              scale: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
