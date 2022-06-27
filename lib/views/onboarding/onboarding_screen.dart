import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  // Create a new widget for indicator
  Widget slidePoint() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == 0
                  ? S.colors.primaryColor
                  : S.colors.subTextColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == 1
                  ? S.colors.primaryColor
                  : S.colors.subTextColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == 2
                  ? S.colors.primaryColor
                  : S.colors.subTextColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == 3
                  ? S.colors.primaryColor
                  : S.colors.subTextColor,
            ),
          ),
        ],
      );

  Future setSeenOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    super.initState();
    setSeenOnboard();
  }

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
                  onPageChanged: (value) => {
                    setState(() {
                      _currentIndex = value;
                    })
                  },
                  children: [
                    // First onboarding screen
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
                            "Quản lý tài chính hiệu quả \nvới Monas",
                            style: S.headerTextStyles
                                .header2(S.colors.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    // Second onboarding
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
                            "Thêm ngân sách tài chính\nbạn mong muốn",
                            style: S.headerTextStyles
                                .header2(S.colors.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    // Third onboarding
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
                            "Thoả sức tuỳ biến\nví của bạn",
                            style: S.headerTextStyles
                                .header2(S.colors.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    // final onboarding
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
                            "Bảo mật thông tin\nlà ưu tiên hàng đầu",
                            style: S.headerTextStyles
                                .header2(S.colors.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: S.colors.whiteColor,
        height: 250,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              slidePoint(),
              Padding(
                padding: EdgeInsets.all(S.dimens.padding),
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.signupScreen);
                  },
                  text: "ĐĂNG KÝ MIỄN PHÍ",
                ),
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginScreen);
                },
                text: "ĐĂNG NHẬP",
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
