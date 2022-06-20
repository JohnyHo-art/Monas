import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.whiteColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(R.illutrations.pageNotFound),
              SizedBox(height: S.dimens.padding),
              Text(
                'Tính năng đang phát triển\nVui lòng trở lại sau',
                style: S.bodyTextStyles.body1(S.colors.subTextColor2),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
