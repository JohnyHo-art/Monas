// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/views/budget_tab/components/budget_detail_information.dart';

class BudgetDetailScreen extends StatelessWidget {
  BudgetDetailScreen({Key? key, required this.budget}) : super(key: key);
  Budget budget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.appBackground,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: S.colors.primaryColor,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              color: S.colors.whiteColor,
            ),
          ),
          title: Text(
            'Chi tiết ngân sách',
            style: S.headerTextStyles.appbarTitle(S.colors.whiteColor),
          ),
          //centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                //TODO: Handle edit budget event
              },
              icon: Icon(Icons.edit, color: S.colors.whiteColor),
            ),
            IconButton(
              onPressed: () {
                //TODO: Handle delete budget event
              },
              icon: Icon(Icons.delete, color: S.colors.whiteColor),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: S.dimens.smallPadding,
                  horizontal: S.dimens.smallPadding,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    BudgetDetailInformation(budget: budget),
                    Positioned(
                      top: S.dimens.smallPadding,
                      child: Image.asset(
                        Category.categoryList[budget.categoryId].iconUrl,
                        height: S.dimens.extraLargeIconSize,
                        width: S.dimens.extraLargeIconSize,
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
