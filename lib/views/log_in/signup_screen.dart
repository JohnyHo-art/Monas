import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/viewmodels/authentication/authentic_vm.dart';
import 'package:monas/views/log_in/components/input_text_field.dart';
import 'package:monas/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Text editing controller
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Key to validate form or text form field
    final registerFormKey = GlobalKey<FormState>();

    //! Listen = false to avoid listening to viewmodel out side of widget tree
    //! (this happens when calling viewmodel in a stateful widget)
    final authentication =
        Provider.of<AuthenticViewModel>(context, listen: false);

    return Scaffold(
      backgroundColor: S.colors.whiteColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: registerFormKey,
              child: Column(
                children: [
                  Column(
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
                        padding:
                            EdgeInsets.only(right: S.dimens.buttonHeight),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Chào mừng tới với Monas",
                                style: S.headerTextStyles
                                    .header2(S.colors.primaryColor),
                              ),
                              Text(
                                "Đăng ký ngay thôi!",
                                style: S.headerTextStyles
                                    .header2(S.colors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: S.dimens.smallPadding),
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
                            child: CustomInputTextField(
                              controller: _emailController,
                              hintText: "Email",
                              validator: (value) =>
                                  authentication.emailValidator(value.toString()),
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
                            child: SvgPicture.asset(R.logIn.usernameIc),
                          ),
                          SizedBox(
                            width: S.dimens.buttonWidth - 40,
                            height: S.dimens.buttonHeight + 20,
                            child: CustomInputTextField(
                              controller: _userNameController,
                              hintText: "Tên tài khoản",
                              validator: (value) => authentication
                                  .userNameValidator(value.toString()),
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
                              controller: _passwordController,
                              obscureText: authentication.isObscurePass2,
                              hintText: 'Mật khẩu',
                              suffixIcon: authentication.isObscurePass2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              colorSuffixIcon: S.colors.iconColor,
                              validator: (value) => authentication
                                  .passwordValidator(value.toString()),
                              onSuffixIconTap: () {
                                // Must call setState because the view model listen is false
                                setState(() {
                                  authentication.isObscurePass2 =
                                      !authentication.isObscurePass2;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(S.dimens.cardCornerRadiusBig),
                        child: CustomButton(
                          onPressed: () {
                            if (registerFormKey.currentState!.validate()) {
                              authentication.createUserWithEmailAndPassword(
                                context,
                                _emailController.text.trim(),
                                _passwordController.text,
                                _userNameController.text.trim(),
                              );
                            }
                          },
                          text: "ĐĂNG KÝ",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Đã có tài khoản? ",
                            style: S.bodyTextStyles
                                .body1(S.colors.subTextColor2),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Đăng nhập",
                              style: S.bodyTextStyles
                                  .body1(S.colors.primaryColor),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
