import 'package:flutter/material.dart';

class CustomInputTextField extends StatelessWidget {
  const CustomInputTextField({
    Key? key,
    this.hintText,
    this.suffixIcon,
    this.colorSuffixIcon,
    this.labelText,
    this.obscureText,
    this.icon,
    this.colorIcon,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final Color? colorSuffixIcon;
  final IconData? icon;
  final Color? colorIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
            suffixIcon,
            color: colorSuffixIcon,
          ),
        ),
      ),
    );
  }
}
