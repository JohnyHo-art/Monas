import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

class CustomInputTextField extends StatelessWidget {
  const CustomInputTextField({
    Key? key,
    this.hintText,
    this.suffixIcon,
    this.colorSuffixIcon,
    this.obscureText,
    this.icon,
    this.colorIcon,
    this.controller,
    this.validator,
    this.onSuffixIconTap,
  }) : super(key: key);

  final String? hintText;
  final IconData? suffixIcon;
  final Color? colorSuffixIcon;
  final IconData? icon;
  final Color? colorIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final VoidCallback? onSuffixIconTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: S.colors.primaryColor,
      maxLines: 1,
      obscureText: obscureText ?? false,
      style: S.bodyTextStyles.body1(S.colors.subTextColor2),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: S.colors.primaryColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: S.colors.primaryColor)),
        hintText: hintText,
        hintStyle: S.bodyTextStyles.body1(S.colors.subTextColor2),
        suffixIcon: GestureDetector(
          onTap: onSuffixIconTap,
          child: Icon(
            suffixIcon,
            color: colorSuffixIcon,
          ),
        ),
      ),
    );
  }
}
