import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/viewmodels/adding_transaction_vm.dart';
import 'package:provider/provider.dart';

class AddWalletScreen extends StatelessWidget {
  const AddWalletScreen({Key? key}) : super(key: key);

  Widget _walletName(VoidCallback onPressed, String? iconUrl) => Row(
        children: [
          SizedBox(width: S.dimens.padding),
          Flexible(
            flex: 2,
            child: IconButton(
              iconSize: S.dimens.largeIconSize,
              icon: Image.asset(
                iconUrl ?? R.walletIcon.walletIc1,
              ),
              onPressed: onPressed,
            ),
          ),
          SizedBox(width: S.dimens.smallPadding),
          Flexible(
            flex: 9,
            child: TextFormField(
              cursorColor: S.colors.primaryColor,
              style: S.headerTextStyles.header2(S.colors.primaryColor),
              //controller: controller,
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

  Widget _initialBalance() {
    return Row(
      children: [
        const Flexible(flex: 2, child: SizedBox(width: 80)),
        Flexible(
          flex: 6,
          child: TextFormField(
            cursorColor: S.colors.primaryColor,
            style: S.headerTextStyles.header2(S.colors.primaryColor),
            //controller: controller,
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

  Widget _includeTotal() {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return S.colors.subTextColor2;
      }
      return S.colors.primaryColor;
    }

    return Row(
      children: [
        const Flexible(flex: 2, child: SizedBox(width: 80)),
        Flexible(
          flex: 1,
          child: Checkbox(
            checkColor: S.colors.whiteColor,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            onChanged: (bool? value) {},
            value: true,
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

  @override
  Widget build(BuildContext context) {
    var transaction = context.watch<AddingTransactionViewModel>();

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: S.colors.whiteColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: S.colors.whiteColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  color: S.colors.textOnSecondaryColor),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              "Thêm ví",
              style: S.headerTextStyles.header2(S.colors.textOnSecondaryColor),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.done,
                    color: S.colors.primaryColor,
                    size: S.dimens.iconSize,
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: 'Thêm ví thành công',
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: S.colors.subTextColor,
                        textColor: S.colors.primaryColor);
                    Navigator.pop(context);
                  }),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: S.dimens.smallPadding),
              _walletName(
                  () => transaction.showWalletIconBottomSheet(context), null),
              SizedBox(height: S.dimens.padding),
              _initialBalance(),
              SizedBox(height: S.dimens.padding),
              _includeTotal(),
            ],
          ),
        ),
      ),
    );
  }
}
