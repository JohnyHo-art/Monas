import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/viewmodels/adding_amount_vm.dart';
import 'package:monas/viewmodels/adding_wallet_vm.dart';
import 'package:monas/viewmodels/authentication/authentic_vm.dart';
import 'package:monas/viewmodels/authentication/login_vm.dart';
import 'package:monas/viewmodels/authentication/register_vm.dart';

import 'package:monas/views/home_tab/category_list_screen.dart';
import 'package:monas/views/home_tab/show_expense_screen.dart';
import 'package:monas/views/adding_tab/add_wallet_screen.dart';
import 'package:monas/views/home_tab/wallet_list_screen.dart';

import 'package:monas/views/log_in/login_screen.dart';
import 'package:monas/views/log_in/signup_screen.dart';
import 'package:monas/views/onboarding/onboarding_screen.dart';
import 'package:monas/views/adding_tab/adding_expense_screen.dart';
import 'package:provider/provider.dart';

import 'constants/routes.dart';
import 'viewmodels/adding_transaction_vm.dart';
import 'views/adding_tab/adding_income_screen.dart';
import 'views/main_screen.dart';
import 'views/personal_tab/personal_screen.dart';
import 'views/plan_tab/planning_screen.dart';
import 'views/report_tab/report_screen.dart';

bool? seenOnboard;

void main() async {
  // Initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Monas());
}

class Monas extends StatelessWidget {
  const Monas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Authentication viewmodel
        ChangeNotifierProvider(create: (_) => AuthenticViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),

        // adding transaction viewmodel
        ChangeNotifierProvider(create: (_) => AddingTransactionViewModel()),
        ChangeNotifierProvider(create: (_) => AddingWalletViewModel()),
        ChangeNotifierProvider(create: (_) => AddingAmountViewModel()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        debugShowCheckedModeBanner: false,
        initialRoute: getInitialRoute(),
        onGenerateRoute: (route) => getRoute(route),
        home: StreamBuilder<User?>(
          // Use authStateChanges to subscribe to authentication state changes
          // This is fired when: user has been registered, user signed in, user signed out
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: S.colors.primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Oops! Something went wrong!'));
            } else if (snapshot.hasData) {
              return const MainScreen();
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }

  String getInitialRoute() {
    return Routes.mainScreen;
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
      // Adding tab
      case Routes.addExpenseScreen:
        return buildRoute(const AddingExpenseScreen(), settings: settings);
      case Routes.addIncomeScreen:
        return buildRoute(const AddingIncomeScreen(), settings: settings);
      case Routes.categoryListScreen:
        return buildRoute(const CategoryListScreen(), settings: settings);
      case Routes.showExpenseScreen:
        return buildRoute(const ShowExpenseScreen(), settings: settings);
      case Routes.addWalletScreen:
        return buildRoute(const AddWalletScreen(), settings: settings);
      // Home tab
      case Routes.walletListScreen:
        return buildRoute(const WalletListScreen(), settings: settings);
      default:
        return buildRoute(const MainScreen(), settings: settings);
    }
  }

  MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }
}
