import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/widgets/inkwell_row_button.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({Key? key}) : super(key: key);

  Widget _enterMoneyTextField(String? locale) => Row(children: [
        const SizedBox(width: 60),
        Flexible(
            flex: 9,
            child: TextField(
                keyboardType: TextInputType.number,
                style: S.headerTextStyles.header1(S.colors.primaryColor),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: S.colors.primaryColor)),
                  focusColor: S.colors.primaryColor,
                )))
      ]);
  Widget _moneyAmountSection(
          String? locale, VoidCallback onTap, double amount) =>
      Material(
          child: InkWell(
              splashColor: S.colors.subTextColor,
              onTap: onTap,
              child: Row(
                children: [
                  const SizedBox(width: 60),
                  Flexible(
                    flex: 9,
                    child: Text(
                      //F.currencyFormat.numberMoneyFormat(amount),
                      amount.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: S.headerTextStyles.header1(S.colors.primaryColor),
                      maxLines: 1,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      NumberFormat.simpleCurrency(locale: locale ?? 'vi_VN')
                          .currencySymbol,
                      style: S.headerTextStyles.header2(S.colors.primaryColor),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      NumberFormat.simpleCurrency(locale: locale ?? 'vi_VN')
                          .currencySymbol,
                      style: S.headerTextStyles.header2(S.colors.primaryColor),
                    ),
                  ),
                ],
              )));

  Widget _chooseWalletSection(VoidCallback onTap) => Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: S.colors.subTextColor,
          onTap: onTap,
          child: Row(
            children: [
              SvgPicture.asset(R.walletIcon.walletIc4),
              SizedBox(width: S.dimens.padding),
              Text('Ví tổng',
                  style: S.headerTextStyles
                      .header3(S.colors.textOnSecondaryColor)),
            ],
          ),
        ),
      );

  Widget _chooseCategorySection(VoidCallback onTap) => Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: S.colors.subTextColor,
          onTap: onTap,
          child: Row(
            children: [
              Image.asset(R.categoryIcon.unknownIc),
              SizedBox(width: S.dimens.padding),
              Text('Chọn nhóm',
                  style: S.headerTextStyles.header3(S.colors.subTextColor2)),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: S.dimens.padding),
      padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: S.colors.textOnPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: S.colors.shadowElevationColor,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 6), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          _enterMoneyTextField(null),
          SizedBox(height: S.dimens.tinyPadding),
          _chooseWalletSection(() {}),
          SizedBox(height: S.dimens.tinyPadding),
          _chooseCategorySection(() {}),
          SizedBox(height: S.dimens.tinyPadding),
          InkWellRowButton(
            onTap: () {},
            iconData: Icons.notes,
            hintText: 'Thêm ghi chú',
          ),
          SizedBox(height: S.dimens.tinyPadding),
          InkWellRowButton(
            onTap: () {},
            iconData: Icons.event,
            hintText: 'Hôm nay',
          ),
          SizedBox(height: S.dimens.padding),
        ],
      ),
    );
  }
}
