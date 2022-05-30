import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/models/category_item_model.dart';

import 'components/category_item.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: S.colors.whiteColor,
        elevation: 2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: S.colors.textOnSecondaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            color: S.colors.subTextColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {},
              ),
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: List(),
      ),
    );
  }
}

class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(S.dimens.tinyPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(S.dimens.tinyPadding),
            child: Text(
              "Chi tiêu hàng tháng",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            //! Listview for monthly expense category 
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Category.monthlyCategory.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  id: Category.monthlyCategory[index].id,
                  categoryIcon: Category.monthlyCategory[index].iconUrl,
                  text: Category.monthlyCategory[index].name,
                );
              },
            ),
          ),
          Divider(
            thickness: 1,
            indent: S.dimens.smallPadding,
            endIndent: S.dimens.smallPadding,
            color: S.colors.subTextColor2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Chi tiêu cần thiết",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            //! ListView for necessary expense
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Category.necessaryCategory.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  id: Category.necessaryCategory[index].id,
                  categoryIcon: Category.necessaryCategory[index].iconUrl,
                  text: Category.necessaryCategory[index].name,
                );
              },
            ),
          ),
          Divider(
            thickness: 1,
            indent: S.dimens.smallPadding,
            endIndent: S.dimens.smallPadding,
            color: S.colors.subTextColor2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Giải trí",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            //! ListView for gaming and entertainment
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Category.entertainmentCategory.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  id: Category.entertainmentCategory[index].id,
                  categoryIcon: Category.entertainmentCategory[index].iconUrl,
                  text: Category.entertainmentCategory[index].name,
                );
              },
            ),
          ),
          Divider(
            thickness: 1,
            indent: S.dimens.smallPadding,
            endIndent: S.dimens.smallPadding,
            color: S.colors.subTextColor2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Đầu tư, Cho vay & Nợ",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            //! ListView for investment and loans
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Category.investmentCategory.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  id: Category.investmentCategory[index].id,
                  categoryIcon: Category.investmentCategory[index].iconUrl,
                  text: Category.investmentCategory[index].name,
                );
              },
            ),
          ),
          Divider(
            thickness: 1,
            indent: S.dimens.smallPadding,
            endIndent: S.dimens.smallPadding,
            color: S.colors.subTextColor2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Khoản thu",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            //! ListView for incomes
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Category.incomesCategory.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  id: Category.incomesCategory[index].id,
                  categoryIcon: Category.incomesCategory[index].iconUrl,
                  text: Category.incomesCategory[index].name,
                );
              },
            ),
          ),
          Divider(
            thickness: 1,
            indent: S.dimens.smallPadding,
            endIndent: S.dimens.smallPadding,
            color: S.colors.subTextColor2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Khác",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            //! ListView for other types of transaction
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Category.othersCategory.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  id: Category.othersCategory[index].id,
                  categoryIcon: Category.othersCategory[index].iconUrl,
                  text: Category.othersCategory[index].name,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
