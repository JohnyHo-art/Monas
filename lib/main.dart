import 'package:flutter/material.dart';
import 'package:monas/views/home_tab/add_wallet_screen.dart';
import 'package:monas/views/log_in/login_screen.dart';
import 'package:monas/views/log_in/signup_screen.dart';
import 'package:monas/views/onboarding/onboarding_screen.dart';
import 'package:monas/views/report_tab/components/tab_report_view.dart';

import 'constants/routes.dart';
import 'views/main_screen.dart';
import 'views/personal_tab/personal_screen.dart';
import 'views/plan_tab/planning_screen.dart';
import 'views/report_tab/report_screen.dart';

void main() {
  runApp(const Monas());
}

class Monas extends StatelessWidget {
  const Monas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: getInitialRoute(),
      onGenerateRoute: (route) => getRoute(route),
    );
  }

  String getInitialRoute() {
    return Routes.reportScreen;
  }

  MaterialPageRoute? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainScreen:
        return buildRoute(const MainScreen(), settings: settings);
      case Routes.reportScreen:
        return buildRoute(const ReportScreen(), settings: settings);
      case Routes.planningScreen:
        return buildRoute(const PlanningScreen(), settings: settings);
      case Routes.personalScreen:
        return buildRoute(const PersonalScreen(), settings: settings);
      case Routes.onboardingScreen:
        return buildRoute(const OnboardingScreen(), settings: settings);
      case Routes.loginScreen:
        return buildRoute(const LoginScreen(), settings: settings);
      case Routes.signupScreen:
        return buildRoute(const SignUpScreen(), settings: settings);
      case Routes.addWalletScreen:
        return buildRoute(const AddWalletScreen(), settings: settings);
      default:
        null;
    }
  }

  MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }
}
