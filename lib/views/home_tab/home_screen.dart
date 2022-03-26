import 'package:flutter/material.dart';
<<<<<<< Updated upstream:lib/views/home_tab/home_screen.dart
import 'package:monas/constants/color.dart';
import 'package:monas/constants/dimens.dart';

import 'components/home_header.dart';
import 'components/home_total_balance.dart';
=======

>>>>>>> Stashed changes:lib/screens/home_tab/home_screen.dart

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackground,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: Dimens.padding),
              HomeHeader(),
              SizedBox(height: Dimens.padding),
              HomeTotalBalance(),
              SizedBox(height: Dimens.padding),
            ],
          ),
        ),
      ),
    );
  }
}
