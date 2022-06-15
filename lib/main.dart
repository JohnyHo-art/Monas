import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/utils.dart';

import 'package:monas/viewmodels/budget_tab/adding_budget_vm.dart';
import 'package:monas/models/transaction_model.dart';
import 'package:monas/viewmodels/adding_transaction/adding_amount_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
import 'package:monas/viewmodels/adding_transaction/adding_transaction_vm.dart';
import 'package:monas/viewmodels/adding_transaction/detail_info_vm.dart';
import 'package:monas/viewmodels/adding_transaction/load_transaction_vm.dart';
import 'package:monas/viewmodels/adding_transaction/pick_image_vm.dart';
import 'package:monas/viewmodels/adding_wallet_vm.dart';
import 'package:monas/viewmodels/authentication/account_setting_vm.dart';
import 'package:monas/viewmodels/authentication/authentic_vm.dart';
import 'package:monas/viewmodels/budget_tab/edit_budget_vm.dart';
import 'package:monas/viewmodels/budget_tab/load_budget_vm.dart';
import 'package:monas/viewmodels/dropdown_wallet_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/viewmodels/time_chosen_vm.dart';
import 'package:monas/views/adding_tab/adding_transaction_screen.dart';
import 'package:monas/views/adding_tab/components/contact_list_screen.dart';
import 'package:monas/views/adding_tab/components/list_wallet_screen.dart';

import 'package:monas/views/home_tab/category_list_screen.dart';
import 'package:monas/views/adding_tab/add_wallet_screen.dart';
import 'package:monas/views/budget_tab/adding_budget_screen.dart';
import 'package:monas/views/budget_tab/budget_screen.dart';
import 'package:monas/views/home_tab/detail_transaction_screen.dart';
import 'package:monas/views/home_tab/show_transaction_screen.dart';
import 'package:monas/views/home_tab/wallet_list_screen.dart';
import 'package:monas/views/log_in/forgot_password_screen.dart';
import 'package:monas/views/log_in/login_screen.dart';
import 'package:monas/views/log_in/signup_screen.dart';
import 'package:monas/views/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/routes.dart';
import 'views/main_screen.dart';
import 'views/personal_tab/personal_screen.dart';
import 'views/report_tab/report_screen.dart';

bool? seenOnboard;
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // Initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Create a shared preferences to store the value if onboarding is seen
  SharedPreferences preferences = await SharedPreferences.getInstance();
  seenOnboard = preferences.getBool('seenOnboard') ?? false;

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

        // adding transaction viewmodel
        ChangeNotifierProvider(create: (_) => AddingBasicInfoViewModel()),
        ChangeNotifierProvider(create: (_) => AddingWalletViewModel()),
        ChangeNotifierProvider(create: (_) => AddingAmountViewModel()),
        ChangeNotifierProvider(create: (_) => DropdownWalletViewModel()),
        ChangeNotifierProvider(create: (_) => TimeChosenViewModel()),
        ChangeNotifierProvider(create: (_) => LoadWalletViewModel()),
        ChangeNotifierProvider(create: (_) => DetailInfoViewmodel()),
        ChangeNotifierProvider(create: (_) => PickImage()),
        ChangeNotifierProvider(create: (_) => AddingTransactionViewmodel()),
        ChangeNotifierProvider(create: (_) => LoadTransactionViewmodel()),

        // Accout tab viewmodel
        // Used ChangeNotifier
        ChangeNotifierProxyProvider<AuthenticViewModel,
            AccountSettingViewModel>(
          create: (_) => AccountSettingViewModel(),
          update: (_, authentication, accountSetting) =>
              accountSetting!..updateAccountInfo(authentication),
        ),

        // Budget related viewmodel
        ChangeNotifierProvider(create: (_) => AddingBudgetViewModel()),
        ChangeNotifierProvider(create: (_) => LoadBudgetViewModel()),
        ChangeNotifierProvider(create: (_) => EditBudgetViewModel())
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: Utils.messengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          timePickerTheme: TimePickerThemeData(
            dialHandColor: S.colors.primaryColor,
            dialTextColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? S.colors.whiteColor
                  : S.colors.primaryColor,
            ),
            dialBackgroundColor: S.colors.subTextColor,
            backgroundColor: S.colors.whiteColor,
            hourMinuteColor: S.colors.whiteColor,
            hourMinuteTextColor: S.colors.primaryColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateColor.resolveWith(
                  (states) => S.colors.primaryColor),
              overlayColor: MaterialStateColor.resolveWith(
                  (states) => S.colors.subTextColor),
            ),
          ),
        ),
        //initialRoute: getInitialRoute(),
        onGenerateRoute: (route) => getRoute(route),
        home: seenOnboard == true ? const HomePage() : const OnboardingScreen(),
      ),
    );
  }

  MaterialPageRoute? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainScreen:
        return buildRoute(const MainScreen(), settings: settings);
      case Routes.reportScreen:
        return buildRoute(const ReportScreen(), settings: settings);
      case Routes.budgetScreen:
        return buildRoute(const BudgetScreen(), settings: settings);
      case Routes.personalScreen:
        return buildRoute(const PersonalScreen(), settings: settings);
      case Routes.onboardingScreen:
        return buildRoute(const OnboardingScreen(), settings: settings);
      case Routes.loginScreen:
        return buildRoute(const LoginScreen(), settings: settings);
      case Routes.signupScreen:
        return buildRoute(const SignUpScreen(), settings: settings);
      case Routes.forgotPasswordScreen:
        return buildRoute(const ForgotPasswordScreen(), settings: settings);
      // Adding tab
      case Routes.addTransactionScreen:
        return buildRoute(const AddingTransactionScreen(), settings: settings);
      case Routes.categoryListScreen:
        return buildRoute(CategoryListScreen(choice: 0), settings: settings);
      case Routes.showTransactionScreen:
        return buildRoute(const ShowTransactionScreen(), settings: settings);
      case Routes.addWalletScreen:
        return buildRoute(const AddWalletScreen(), settings: settings);
      case Routes.listWalletScreen:
        return buildRoute(const ListWalletScreen(), settings: settings);
      case Routes.listContactScreen:
        return buildRoute(const ContactListScreen(), settings: settings);
      // Home tab
      case Routes.walletListScreen:
        return buildRoute(const WalletListScreen(), settings: settings);
      case Routes.detailTransactionScreen:
        Transaction transaction = settings.arguments as Transaction;
        return buildRoute(DetailTransactionScreen(transaction: transaction),
            settings: settings);
      // Budget tab
      case Routes.addingBudgetScreen:
        return buildRoute(const AddingBudgetScreen(), settings: settings);
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // Use authStateChanges to subscribe to authentication state changes
      // This is fired when: user has been registered, user signed in, user signed out
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: S.colors.secondaryColor,
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
    );  
  }
}
