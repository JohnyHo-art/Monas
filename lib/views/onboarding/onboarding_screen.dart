import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/routes.dart';

import '../../widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: S.colors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(S.dimens.padding),
                child: Image.asset(
                  "assets/logo/logo.png",
                  scale: 0.9,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 200.0),
                child: PageView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Image.asset(R.onboarding.onboarding1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Text(
                            "Effective financial management",
                            style: S.headerTextStyles
                                .header2(S.colors.primaryColor),
                          ),
                        ),
                        Text(
                          "with Monas",
                          style:
                              S.headerTextStyles.header2(S.colors.primaryColor),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Image.asset(R.onboarding.onboarding2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Text(
                            "Make the financial budgets",
                            style: S.headerTextStyles
                                .header2(S.colors.primaryColor),
                          ),
                        ),
                        Text(
                          "you want",
                          style:
                              S.headerTextStyles.header2(S.colors.primaryColor),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Image.asset(
                            R.onboarding.onboarding3,
                            scale: 1.7,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Text(
                            "Customize your favorite",
                            style: S.headerTextStyles
                                .header2(S.colors.primaryColor),
                          ),
                        ),
                        Text(
                          "e-wallet",
                          style:
                              S.headerTextStyles.header2(S.colors.primaryColor),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Image.asset(
                            R.onboarding.onboarding4,
                            scale: 1.2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Text(
                            "Give you a maximum",
                            style: S.headerTextStyles
                                .header2(S.colors.primaryColor),
                          ),
                        ),
                        Text(
                          "security for your account",
                          style:
                              S.headerTextStyles.header2(S.colors.primaryColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: 200,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(S.dimens.padding),
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.signupScreen);
                  },
                  text: "SIGN UP FOR FREE",
                ),
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginScreen);
                },
                text: "SIGN IN",
                color: S.colors.whiteColor,
                textColor: S.colors.primaryColor,
                borderColor: S.colors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
