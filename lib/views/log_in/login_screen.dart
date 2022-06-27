import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/viewmodels/authentication/authentic_vm.dart';
import 'package:monas/views/log_in/components/input_text_field.dart';
import 'package:monas/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text editing controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Key to validate form or text form field
    final loginFormKey = GlobalKey<FormState>();

    final authentication =
        Provider.of<AuthenticViewModel>(context, listen: false);

    return Scaffold(
      backgroundColor: S.colors.whiteColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: loginFormKey,
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
                        child: CustomInputTextField(
                          hintText: "Email",
                          controller: _emailController,
                          validator: (val) =>
                              authentication.emailValidator(val.toString()),
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
                          controller: _passwordController,
                          obscureText: authentication.isObscurePass,
                          hintText: "Mật khẩu",
                          suffixIcon: authentication.isObscurePass
                              ? Icons.visibility_off
                              : Icons.visibility,
                          colorSuffixIcon: S.colors.iconColor,
                          validator: (val) =>
                              authentication.passwordValidator(val.toString()),
                          onSuffixIconTap: () {
                            // Must call setState because the view model listen is false
                            setState(() {
                              authentication.isObscurePass =
                                  !authentication.isObscurePass;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, Routes.forgotPasswordScreen),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, S.dimens.smallPadding, 50, 0),
                        child: Text(
                          "Quên mật khẩu?",
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
                    onPressed: () {
                      authentication.signInWithEmailAndPassword(
                        context,
                        _emailController.text.trim(),
                        _passwordController.text,
                      );
                    },
                    text: "ĐĂNG NHẬP",
                  ),
                  Padding(
                    padding: EdgeInsets.all(S.dimens.smallPadding),
                    child: Text(
                      "hoặc",
                      style: S.bodyTextStyles.body1(S.colors.primaryColor),
                    ),
                  ),
                  CustomButton(
                    onPressed: () => authentication.signInWithGoogle(context),
                    text: "",
                    widgetText: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: S.dimens.tinyPadding),
                              child: SvgPicture.asset(R.logIn.googleIc),
                            ),
                          ),
                          TextSpan(
                            text: "Đăng nhập với Google",
                            style:
                                S.bodyTextStyles.body1(S.colors.primaryColor),
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
                          padding:
                              EdgeInsets.symmetric(vertical: S.dimens.padding),
                          child: Text(
                            "Lần đầu đến Monas? ",
                            style:
                                S.bodyTextStyles.body1(S.colors.subTextColor2),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.signupScreen);
                          },
                          child: Text(
                            "Đăng ký ngay",
                            style:
                                S.bodyTextStyles.body1(S.colors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
