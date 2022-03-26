import 'package:flutter/cupertino.dart';
import 'package:monas/constants/color.dart';

const subText = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 14,
  color: subTextColor,
  fontWeight: FontWeight.w400,
  overflow: TextOverflow.ellipsis,
);

const subText2 = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 14,
  color: subTextColor2,
  fontWeight: FontWeight.w500,
  overflow: TextOverflow.ellipsis,
);

class HeaderText {
  static TextStyle header1(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 34,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle header2(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 24,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle header3(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class BodyText {
  static TextStyle body1(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle body2(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle caption(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.normal,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle buttonText(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      color: color ?? textOnPrimaryColor,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    );
  }
}