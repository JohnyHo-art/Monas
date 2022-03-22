import 'package:flutter/material.dart';
import 'package:monas/constants/color.dart';
import 'package:monas/screens/home_tab/home_screen.dart';
import 'package:monas/screens/personal_tab/personal_screen.dart';
import 'package:monas/screens/plan_tab/planning_screen.dart';
import 'package:monas/screens/report_tab/report_screen.dart';

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
      width: 80,
      child: MaterialButton(
        splashColor: primaryColorShadeThirty,
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
              color: _currentTabIndex == index ? primaryColor : iconColor,
              size: 24,
            ),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: _currentTabIndex == index ? primaryColor : iconColor,
              ),
            ),
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
        )
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.arrow_upward),
              title: const Text('Add new income'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.arrow_downward),
              title: const Text('Add new expense'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Create new wallet'),
              onTap: () {},
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
        backgroundColor: appBackground,
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: _showAddingOptions,
          child: const Icon(Icons.add, color: textOnPrimaryColor),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: screens[_currentTabIndex],
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: appBackground,
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomNavItem(Icons.home, 'Home', 0),
                _bottomNavItem(Icons.insert_chart, 'Report', 1),
                const SizedBox(width: 40),
                _bottomNavItem(Icons.view_carousel, 'Planning', 2),
                _bottomNavItem(Icons.person, 'Personal', 3),
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
