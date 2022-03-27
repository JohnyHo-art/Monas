import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/views/log_in/components/input_text_field.dart';
import 'package:monas/widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Container(
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
                  Image.asset(
                    R.logIn.signUp,
                    height: 250,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: S.dimens.buttonHeight),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Welcome to Monas",
                            style: S.headerTextStyles
                                .header2(S.colors.primaryColor),
                          ),
                          Text(
                            "Sign up now!",
                            style: S.headerTextStyles
                                .header2(S.colors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: S.dimens.padding),
                        child: SvgPicture.asset(R.logIn.emailIc),
                      ),
                      SizedBox(
                          width: S.dimens.buttonWidth - 40,
                          height: S.dimens.buttonHeight + 20,
                          child: const CustomInputTextField(
                            labelText: "Email",
                          )),
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
                        child: SvgPicture.asset(R.logIn.usernameIc),
                      ),
                      SizedBox(
                        width: S.dimens.buttonWidth - 40,
                        height: S.dimens.buttonHeight + 20,
                        child: const CustomInputTextField(
                          labelText: "User Name",
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
                        height: S.dimens.buttonHeight + 15,
                        child: CustomInputTextField(
                          obscureText: true,
                          hintText: "Password",
                          suffixIcon: Icons.visibility_off,
                          colorSuffixIcon: S.colors.iconColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(S.dimens.cardCornerRadiusBig),
                    child: CustomButton(
                      onPressed: () {},
                      text: "CONTINUE",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Joined us before? ",
                        style: S.bodyTextStyles.body1(S.colors.subTextColor2),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.loginScreen);
                        },
                        child: Text(
                          "Sign in",
                          style: S.bodyTextStyles.body1(S.colors.primaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
