import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/viewmodels/adding_transaction/load_transaction_vm.dart';
import 'package:monas/viewmodels/load_wallet_vm.dart';
import 'package:monas/viewmodels/authentication/authentic_vm.dart';
import 'package:monas/views/budget_tab/budget_screen.dart';
import 'package:monas/views/home_tab/home_screen.dart';
import 'package:monas/views/personal_tab/personal_screen.dart';
import 'package:monas/views/report_tab/report_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;
  final List<Widget> screens = const [
    HomeScreen(),
    ReportScreen(),
    BudgetScreen(),
    PersonalScreen(),
  ];

  Widget _bottomNavItem(IconData iconData, String name, int index) {
    return SizedBox(
      width: 90,
      child: MaterialButton(
        splashColor: S.colors.primaryColorShadeThirty,
        onPressed: () {
          setState(() {
            _currentTabIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: _currentTabIndex == index
                  ? S.colors.primaryColor
                  : S.colors.iconColor,
              size: 24,
            ),
            Text(name,
                style: S.bodyTextStyles.caption(_currentTabIndex == index
                    ? S.colors.primaryColor
                    : S.colors.iconColor)),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<LoadWalletViewModel>(context, listen: false)
        .loadListWalletFromFirestore();
    Provider.of<AuthenticViewModel>(context, listen: false)
        .getUserDataFromFirestore();

    Provider.of<LoadTransactionViewmodel>(context, listen: false)
        .loadTransactionDataFromFirestore("wallet0");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.appBackground,
        floatingActionButton: FloatingActionButton(
          backgroundColor: S.colors.primaryColor,
          onPressed: () =>
              Navigator.pushNamed(context, Routes.addTransactionScreen),
          child: Icon(Icons.add, color: S.colors.textOnPrimaryColor),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: screens[_currentTabIndex],
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: S.colors.appBackground,
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomNavItem(Icons.home, 'Monas', 0),
                _bottomNavItem(Icons.insert_chart, 'Báo cáo', 1),
                const SizedBox(width: 30),
                _bottomNavItem(Icons.view_carousel, 'Ngân sách', 2),
                _bottomNavItem(Icons.person, 'Tài khoản', 3),
              ],
            ),
          ),
          shape: const CircularNotchedRectangle(),
          elevation: 10,
          notchMargin: 5,
        ),
      ),
    );
  }
}
