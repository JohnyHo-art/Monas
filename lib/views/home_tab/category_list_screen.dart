import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/resources.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Monthly(),
              Necessary(),
              Entertainment(),
              Investment(),
              Incomes(),
              Others(),
            ],
          ),
        ),
      ),
    );
  }
}

class Monthly extends StatelessWidget {
  const Monthly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Chi tiêu hàng tháng",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.foodIc,
            text: "Ăn uống",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.transportIc,
            text: "Di chuyển",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.houseIc,
            text: "Thuê nhà",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.waterIc,
            text: "Hóa đơn nước",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.phoneIc,
            text: "Hóa đơn điện thoại",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.electricityIc,
            text: "Hóa đơn điện",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.gasIc,
            text: "Hóa đơn gas",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.tvIc,
            text: "Hóa đơn TV",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.internetIc,
            text: "Hóa đơn mạng",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.othersMonthlyIc,
            text: "Khác",
          ),
        ],
      ),
    );
  }
}

class Necessary extends StatelessWidget {
  const Necessary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Chi tiêu cần thiết",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.repairedHouseIc,
            text: "Sửa & trang trí nhà",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.maintainanceIc,
            text: "Bảo dưỡng xe",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.insuranceIc,
            text: "Bảo hiểm",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.healthIc,
            text: "Khám sức khỏe",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.furnituresIc,
            text: "Đồ gia dụng",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.personalIc,
            text: "Đồ dùng cá nhân",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.petsIc,
            text: "Vật nuôi",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.familyIc,
            text: "Dịch vụ gia đình",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.othersNecessaryIc,
            text: "Khác",
          ),
        ],
      ),
    );
  }
}

class Entertainment extends StatelessWidget {
  const Entertainment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Giải trí",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.sportsIC,
            text: "Thể thao",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.beautyIc,
            text: "Làm đẹp",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.giftIc,
            text: "Quà tặng & Quyên góp",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.onlineIc,
            text: "Dịch vụ trực tuyến",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.playingIc,
            text: "Vui - Chơi",
          ),
        ],
      ),
    );
  }
}

class Investment extends StatelessWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Đầu tư, Cho vay & Nợ",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.investmentIc,
            text: "Đầu tư",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.debtIc,
            text: "Thu nợ",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.getALoanIc,
            text: "Đi vay",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.paybackLoanIc,
            text: "Trả nợ",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.payInterestIc,
            text: "Trả lãi",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.collectInterestIc,
            text: "Thu lãi",
          ),
        ],
      ),
    );
  }
}

class Incomes extends StatelessWidget {
  const Incomes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Khoản thu",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.salaryIc,
            text: "Lương",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.othersIncomeIc,
            text: "Thu nhập khác",
          ),
        ],
      ),
    );
  }
}

class Others extends StatelessWidget {
  const Others({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Khác",
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
            ),
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.moneyInIc,
            text: "Tiền chuyển đi",
          ),
          CategoryItem(
            categoryIcon: R.categoryIcon.moneyOutIc,
            text: "Tiền chuyển đến",
          ),
        ],
      ),
    );
  }
}
