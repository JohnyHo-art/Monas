import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/widgets/custom_button.dart';

class EmptyWalletInform extends StatelessWidget {
  const EmptyWalletInform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 250,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(S.dimens.cardCornerRadiusSmall)),
          color: S.colors.whiteColor,
        ),
        child: Center(  
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(R.illutrations.sadEmotion),
              ),
              SizedBox(height: S.dimens.smallPadding),
              Text(
                'Bạn chưa có ví, hãy thêm ví mới',
                style: S.bodyTextStyles.body1(null),
              ),
              SizedBox(height: S.dimens.smallPadding),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: S.dimens.largePadding),
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.addWalletScreen);
                  },
                  text: 'THÊM VÍ MỚI',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
