class Routes {
  static const mainScreen = '/';

  //* Routes outside main screen
  static const onboardingScreen ='onboarding_screen/';
  static const loginScreen ='login_screen/';
  static const signupScreen = 'signup_screen/';

  //* Routes in bottom nav
  static const homeScreen = '/home_screen';
  static const reportScreen = '/report_screen';
  static const addExpenseScreen = '/add_expense_screen';
  static const planningScreen = '/planning_screen';
  static const personalScreen = 'personal_screen';

  //* Routes from home
  static const walletDetailExpenseScreen = homeScreen + '/wallet_detail_screen';
  static const walletListScreen = homeScreen + '/wallet_list_screen';
  static const walletAddingScreen = walletListScreen + '/wallet_adding_screen';
  static const notificationScreen = homeScreen + '/notification_screen';

  //* Routes from report
  
}