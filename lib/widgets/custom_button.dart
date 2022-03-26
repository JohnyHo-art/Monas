import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  Color? color;
  Color? textColor;
  double? height;
  double? width;
  double? cornerRadius;
  double? borderWidth;
  Color? borderColor;
  TextStyle? textStyle;
  bool? textUppercase;
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.height,
    this.width,
    this.cornerRadius,
    this.borderWidth,
    this.borderColor,
    this.textStyle,
    this.textUppercase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? S.dimens.buttonHeight,
      width: width ?? S.dimens.buttonWidth,
      decoration: BoxDecoration(
        border: Border.all(
            width: borderWidth ?? 1,
            color: borderColor ?? S.colors.primaryColor),
        borderRadius:
            BorderRadius.circular(cornerRadius ?? S.dimens.buttonCornerRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(textUppercase == true ? text.toUpperCase() : text,
            style: S.bodyTextStyles
                .buttonText(textColor ?? S.colors.textOnPrimaryColor)),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  cornerRadius ?? S.dimens.buttonCornerRadius),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(color ?? S.colors.primaryColor),
        ),
      ),
    );
  }
}
