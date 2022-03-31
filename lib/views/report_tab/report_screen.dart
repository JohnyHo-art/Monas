import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';

import 'components/tab_report_view.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: S.colors.whiteColor,
            leading: SvgPicture.asset(
              R.walletIcon.walletIc1,
              fit: BoxFit.scaleDown,
            ),
            title: Text(
              "Total",
              style: S.bodyTextStyles.body1(
                (S.colors.subTextColor2),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_today,
                  size: S.dimens.iconSize,
                  color: S.colors.textOnSecondaryColor,
                ),
              )
            ],
            bottom: TabBar(
              labelColor: S.colors.textOnSecondaryColor,
              isScrollable: true,
              tabs: const [
                Tab(text: "1/2022"),
                Tab(text: "LAST MONTH"),
                Tab(text: "THIS MONTH"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                color: S.colors.redColor,
              ),
              Container(
                color: S.colors.primaryColorLight,
              ),
              const TabReportView(),
            ],
          ),
        ),
      ),
    );
  }
}
