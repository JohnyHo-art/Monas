import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/views/log_in/components/input_text_field.dart';
import 'package:monas/widgets/custom_button.dart';

import '../../constants/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: S.colors.whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: S.dimens.padding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(R.logo.horiLogo),
                ),
              ),
              Image.asset(R.logIn.logIn),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: S.dimens.padding),
                    child: SvgPicture.asset(R.logIn.emailIc),
                  ),
                  SizedBox(
                    width: S.dimens.buttonWidth - 40,
                    height: S.dimens.buttonHeight + 10,
                    child: const CustomInputTextField(
                      labelText: "Email",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: S.dimens.smallPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: S.dimens.padding),
                    child: SvgPicture.asset(R.logIn.passwordIc),
                  ),
                  SizedBox(
                    width: S.dimens.buttonWidth - 40,
                    height: S.dimens.buttonHeight + 10,
                    child: CustomInputTextField(
                      obscureText: true,
                      hintText: "Password",
                      suffixIcon: Icons.visibility_off,
                      colorSuffixIcon: S.colors.iconColor,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, S.dimens.smallPadding, 50, 0),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: S.colors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: S.dimens.padding,
              ),
              CustomButton(
                onPressed: () {},
                text: "SIGN IN",
              ),
              Padding(
                padding: EdgeInsets.all(S.dimens.smallPadding),
                child: Text(
                  "OR",
                  style: S.bodyTextStyles.body1(S.colors.primaryColor),
                ),
              ),
              CustomButton(
                onPressed: () {},
                text: "",
                widgetText: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.only(right: S.dimens.tinyPadding),
                          child: SvgPicture.asset(R.logIn.googleIc),
                        ),
                      ),
                      TextSpan(
                        text: "Continue with Google",
                        style: S.bodyTextStyles.body1(S.colors.primaryColor),
                      )
                    ],
                  ),
                ),
                textColor: S.colors.primaryColor,
                color: S.colors.whiteColor,
                borderColor: S.colors.whiteColor,
              ),
              Padding(
                padding: EdgeInsets.all(S.dimens.smallPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: S.dimens.padding),
                      child: Text(
                        "New to Monas? ",
                        style: S.bodyTextStyles.body1(S.colors.subTextColor2),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signupScreen);
                      },
                      child: Text(
                        "Sign up for free",
                        style: S.bodyTextStyles.body1(S.colors.primaryColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
