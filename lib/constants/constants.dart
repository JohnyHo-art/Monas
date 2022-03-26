import 'package:flutter/material.dart';

class S {
  static final colors = _Colors();
  static final textStyles = _TextStyle();
  static final headerTextStyles = _HeaderText();
  static final bodyTextStyles = _BodyText();
  static final dimens = _Dimens();
}

class _Colors {
  final primaryColor = const Color(0xFF4F62C0);
  final primaryColorDark = const Color(0xFF0A398F);
  final primaryColorLight = const Color(0xFF838FF3);
  final primaryColorShadeThirty = const Color(0xFF4F62C0).withOpacity(0.3);
  final primaryColorShadeFifty = const Color(0xFF4F62C0).withOpacity(0.5);
  final primaryColorShadeSeventy = const Color(0xFF4F62C0).withOpacity(0.7);

  //* Secondary color and variants
  final secondaryColor = const Color(0xFFADEAF1);
  final secondaryColorDark = const Color(0xFF7CB8BE);
  final secondaryColorLight = const Color(0xFFE0FFFF);

  //* Text style color
  final textOnPrimaryColor = const Color(0xFFFFFFFF);
  final textOnSecondaryColor = const Color(0xFF000000);
  final subTextColor = const Color(0xFFD8D8D8);
  final subTextColor2 = const Color(0xFF979797);

  //* Color for background
  final appBackground = const Color(0xFFF4F4F4);
  final iconColor = const Color(0xFF979797);
  final backgroundIcon1 = const Color(0xFF427CCE);
  final backgroundIcon2 = const Color(0xFF00D159);
  final backgroundIcon3 = const Color(0xFFFFD468);
  final backgroundIcon4 = const Color(0xFFED5C4D);
  final backgroundIcon5 = const Color(0xFFE4AEC5);
  final backgroundIcon6 = const Color(0xFF21325E);
  final backgroundIcon7 = const Color(0xFFAD8B73);
  final backgroundIcon8 = const Color(0xFFFDF6EC);
}

class _TextStyle {
  final subText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    color: S.colors.subTextColor,
    fontWeight: FontWeight.w400,
  );

  final subText2 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    color: S.colors.subTextColor2,
    fontWeight: FontWeight.w500,
  );
}

class _HeaderText {
  TextStyle header1(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 34,
      color: color ?? S.colors.textOnSecondaryColor,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle header2(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 24,
      color: color ?? S.colors.textOnSecondaryColor,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle header3(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
      color: color ?? S.colors.textOnSecondaryColor,
      fontWeight: FontWeight.w600,
    );
  }
}

class _BodyText {
  TextStyle body1(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      color: color ?? S.colors.textOnSecondaryColor,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle body2(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      color: color ?? S.colors.textOnSecondaryColor,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle caption(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      color: color ?? S.colors.textOnSecondaryColor,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle buttonText(Color? color) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      color: color ?? S.colors.textOnPrimaryColor,
      fontWeight: FontWeight.w600,
    );
  }
}

class _Dimens {
  final cardCornerRadiusMedium = 20.0;
  final buttonCornerRadius = 25.0;
  final cardCornerRadiusBig = 30.0;
  final spaceBetweenWidgets = 16.0;
  final iconSize = 24.0;
  final padding = 20.0;
  final smallPadding = 16.0;
  final buttonHeight = 40.0;
  final buttonWidth = 280.0;
}
