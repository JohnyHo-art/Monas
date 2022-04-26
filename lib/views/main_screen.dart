import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/views/home_tab/home_screen.dart';
import 'package:monas/views/personal_tab/personal_screen.dart';
import 'package:monas/views/plan_tab/planning_screen.dart';
import 'package:monas/views/report_tab/report_screen.dart';

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
    PlanningScreen(),
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

  void _showAddingOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      )),
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: S.dimens.tinyPadding),
            ListTile(
              leading: const Icon(Icons.arrow_upward),
              title: const Text('Thêm chi tiêu mới'),
              onTap: () => Navigator.pushReplacementNamed(context, Routes.addExpenseScreen),
            ),
            ListTile(
              leading: const Icon(Icons.arrow_downward),
              title: const Text('Thêm thu nhập mới'),
              onTap: () => Navigator.pushReplacementNamed(context, Routes.addIncomeScreen),
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Thêm ví mới'),
              onTap: () => Navigator.pushReplacementNamed(context, Routes.addWalletScreen),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.appBackground,
        floatingActionButton: FloatingActionButton(
          backgroundColor: S.colors.primaryColor,
          onPressed: _showAddingOptions,
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
          notchMargin: 5,
        ),
      ),
    );
  }
}
