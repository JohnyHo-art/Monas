import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/viewmodels/authentication/authentic_vm.dart';
import 'package:monas/views/log_in/components/input_text_field.dart';
import 'package:monas/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final authentication =
        Provider.of<AuthenticViewModel>(context, listen: false);

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: S.colors.whiteColor,
          appBar: AppBar(
            backgroundColor: S.colors.whiteColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  color: S.colors.textOnSecondaryColor),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(R.logIn.forgotPassword),
                    Text(
                      'Bạn quên mật khẩu rồi à?',
                      style: S.headerTextStyles.header2(S.colors.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Hãy nhập email của bạn, còn lại để chúng tôi lo!',
                      style: S.bodyTextStyles.body1(S.colors.subTextColor2),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: S.dimens.padding),
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
                    SizedBox(height: S.dimens.padding),
                    CustomButton(
                      onPressed: () => authentication.resetPassword(
                          context, _emailController.text.trim()),
                      text: 'TÔI MUỐN ĐẶT LẠI MẬT KHẨU',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
