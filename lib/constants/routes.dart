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
  static const addTransactionScreen = '$mainScreen/adding_transaction_screen';
  static const budgetScreen = '$mainScreen/budget_screen';
  static const personalScreen = '$mainScreen/personal_screen';

  //* Routes from home
  static const walletListScreen = '$homeScreen/wallet_list_screen';
  static const notificationScreen = '$homeScreen/notification_screen';
  static const addWalletScreen = '$homeScreen/add_wallet_screen';
  static const showTransactionScreen = '$homeScreen/show_transaction_screen';
  static const categoryListScreen = '$homeScreen/category_list_screen';

  //* Routes from report

  //* routes from budget screen
  static const addingBudgetScreen = '$budgetScreen/adding_budget_screen';

}
