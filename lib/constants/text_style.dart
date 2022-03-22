import 'package:flutter/cupertino.dart';
import 'package:monas/constants/color.dart';

const subText = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 14,
  color: subTextColor,
  fontWeight: FontWeight.w400,
);

const subText2 = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 14,
  color: subTextColor2,
  fontWeight: FontWeight.w500,
);

class HeaderText {
  static TextStyle header1(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 34,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle header2(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 24,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle header3(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.w600,
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
    );
  }

  static TextStyle body2(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle caption(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      color: color ?? textOnSecondaryColor,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle buttonText(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      color: color ?? textOnPrimaryColor,
      fontWeight: FontWeight.w600,
    );
  }
}