import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/widgets/custom_button.dart';

import 'resources.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  // Show snack bar for error message
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar =
        SnackBar(content: Text(text), backgroundColor: S.colors.redColor);

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  // Show toast to notification
  static showToast(String text) {
    Fluttertoast.showToast(
      timeInSecForIosWeb: 5,
      msg: text,
      backgroundColor: S.colors.subTextColor2,
      textColor: S.colors.textOnPrimaryColor,
    );
  }

  static showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(S.dimens.cardCornerRadiusMedium),
          color: S.colors.whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: S.dimens.padding,
            vertical: S.dimens.smallPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                R.othersIcon.notificationLoudSpeaker,
                height: 150,
                width: 150,
              ),
              SizedBox(height: S.dimens.smallPadding),
              Text(
                'Lỗi là của chúng tôi, không phải của bạn, \nVui lòng thử lại sau',
                style: S.bodyTextStyles.body1(S.colors.subTextColor2),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: S.dimens.smallPadding),
              CustomButton(
                onPressed: () => Navigator.pop(context),
                text: 'TÔI ĐÃ HIỂU',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
