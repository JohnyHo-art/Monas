class Routes {
  static const mainScreen = '/mainScreen';

  //* Routes outside main screen
  static const onboardingScreen = 'onboarding_screen/';
  static const loginScreen = 'login_screen/';
  static const signupScreen = '$loginScreen/signup_screen/';
  static const forgotPasswordScreen = '$loginScreen/forgot_password_screen';

  //* Routes in bottom nav
  static const homeScreen = '$mainScreen/home_screen';
  static const reportScreen = '$mainScreen/report_screen';
  static const addExpenseScreen = '$mainScreen/adding_expense_screen';
  static const planningScreen = '$mainScreen/planning_screen';
  static const personalScreen = '$mainScreen/personal_screen';
  static const addIncomeScreen = '$mainScreen/adding_income_screen';

  //* Routes from home
  static const walletDetailExpenseScreen = homeScreen + '/wallet_detail_screen';
  static const walletListScreen = homeScreen + '/wallet_list_screen';
  static const notificationScreen = homeScreen + '/notification_screen';
  static const addWalletScreen = homeScreen + '/add_wallet_screen';
  static const showExpenseScreen = homeScreen + '/show_expense_screen';
  static const categoryListScreen = showExpenseScreen + '/category_list_screen';

  //* Routes from report

}
