// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/format_style.dart';
import 'package:monas/models/budget_model.dart';
import 'package:monas/models/category_item_model.dart';
import 'package:monas/views/budget_tab/budget_detail_screen.dart';

class BudgetItem extends StatelessWidget {
  BudgetItem({Key? key, required this.budget}) : super(key: key);
  Budget budget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:
              Image.asset(Category.categoryList[budget.categoryId].iconUrl),
          title: Text(
            Category.categoryList[budget.categoryId].name,
            style: S.headerTextStyles.header3(null),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: S.dimens.smallIconSize,
          ),
          isThreeLine: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: F.currencyFormat.numberMoneyFormat(budget.spent) +
                          ' / ',
                      style: S.bodyTextStyles.body1(
                          budget.spent / budget.budget > 0.8
                              ? S.colors.redColor
                              : S.colors.primaryColor),
                    ),
                    TextSpan(
                      text: F.currencyFormat.numberMoneyFormat(budget.budget),
                      style: S.bodyTextStyles.body1(S.colors.subTextColor2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: S.dimens.tinyPadding),
              ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(S.dimens.cardCornerRadiusMedium)),
                child: LinearProgressIndicator(
                  minHeight: 6,
                  value: budget.spent / budget.budget,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(S.colors.secondaryColor),
                  backgroundColor: S.colors.subTextColor,
                ),
              ),
            ],
          ),
          onTap: () {
            // Move to the budget detail screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BudgetDetailScreen(budget: budget),
              ),
            );
          },
        ),
        Divider(
          indent: S.dimens.largePadding,
          thickness: 1,
          color: S.colors.subTextColor,
        ),
      ],
    );
  }
}
