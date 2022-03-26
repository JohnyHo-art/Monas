import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/views/home_tab/components/home_total_balance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.appBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: S.dimens.padding),
              const HomeScreen(),
              SizedBox(height: S.dimens.padding),
              const HomeTotalBalance(),
              SizedBox(height: S.dimens.padding),
            ],
          ),
        ),
      ),
    );
  }
}
