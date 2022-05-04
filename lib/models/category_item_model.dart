import 'package:monas/constants/resources.dart';

class Category {
  late int id;
  late String iconUrl;
  late String name;

  Category({
    required this.id,
    required this.iconUrl,
    required this.name,
  });

  static List<Category> monthlyCategory = [
    Category(
      id: 1,
      iconUrl: R.categoryIcon.foodIc,
      name: "Ăn uống",
    ),
    Category(
      id: 2,
      iconUrl: R.categoryIcon.transportIc,
      name: "Di chuyển",
    ),
    Category(
      id: 3,
      iconUrl: R.categoryIcon.houseIc,
      name: "Thuê nhà",
    ),
    Category(
      id: 4,
      iconUrl: R.categoryIcon.waterIc,
      name: "Hóa đơn nước",
    ),
    Category(
      id: 5,
      iconUrl: R.categoryIcon.phoneIc,
      name: "Hóa đơn điện thoại",
    ),
    Category(
      id: 6,
      iconUrl: R.categoryIcon.electricityIc,
      name: "Hóa đơn điện",
    ),
    Category(
      id: 7,
      iconUrl: R.categoryIcon.gasIc,
      name: "Hóa đơn gas",
    ),
    Category(
      id: 8,
      iconUrl: R.categoryIcon.tvIc,
      name: "Hóa đơn TV",
    ),
    Category(
      id: 9,
      iconUrl: R.categoryIcon.internetIc,
      name: "Hóa đơn mạng",
    ),
    Category(
      id: 10,
      iconUrl: R.categoryIcon.othersMonthlyIc,
      name: "Khác",
    ),
  ];

  static List<Category> necessaryCategory = [
    Category(
      id: 11,
      iconUrl: R.categoryIcon.repairedHouseIc,
      name: "Sửa & trang trí nhà",
    ),
    Category(
      id: 12,
      iconUrl: R.categoryIcon.maintainanceIc,
      name: "Bảo dưỡng xe",
    ),
    Category(
      id: 13,
      iconUrl: R.categoryIcon.insuranceIc,
      name: "Bảo hiểm",
    ),
    Category(
      id: 14,
      iconUrl: R.categoryIcon.healthIc,
      name: "Khám sức khỏe",
    ),
    Category(
      id: 15,
      iconUrl: R.categoryIcon.furnituresIc,
      name: "Đồ gia dụng",
    ),
    Category(
      id: 16,
      iconUrl: R.categoryIcon.personalIc,
      name: "Đồ dùng cá nhân",
    ),
    Category(
      id: 17,
      iconUrl: R.categoryIcon.petsIc,
      name: "Vật nuôi",
    ),
    Category(
      id: 18,
      iconUrl: R.categoryIcon.familyIc,
      name: "Dịch vụ gia đình",
    ),
    Category(
      id: 19,
      iconUrl: R.categoryIcon.othersNecessaryIc,
      name: "Khác",
    ),
  ];

  static List<Category> entertainmentCategory = [
    Category(
      id: 20,
      iconUrl: R.categoryIcon.sportsIC,
      name: "Thể thao",
    ),
    Category(
      id: 21,
      iconUrl: R.categoryIcon.beautyIc,
      name: "Làm đẹp",
    ),
    Category(
      id: 22,
      iconUrl: R.categoryIcon.giftIc,
      name: "Quà tặng & Quyên góp",
    ),
    Category(
      id: 23,
      iconUrl: R.categoryIcon.onlineIc,
      name: "Dịch vụ trực tuyến",
    ),
    Category(
      id: 24,
      iconUrl: R.categoryIcon.playingIc,
      name: "Vui - Chơi",
    ),
  ];

  static List<Category> investmentCategory = [
    Category(
      id: 25,
      iconUrl: R.categoryIcon.investmentIc,
      name: "Đầu tư",
    ),
    Category(
      id: 26,
      iconUrl: R.categoryIcon.debtIc,
      name: "Thu nợ",
    ),
    Category(
      id: 27,
      iconUrl: R.categoryIcon.getALoanIc,
      name: "Đi vay",
    ),
    Category(
      id: 28,
      iconUrl: R.categoryIcon.paybackLoanIc,
      name: "Trả nợ",
    ),
    Category(
      id: 29,
      iconUrl: R.categoryIcon.payInterestIc,
      name: "Trả lãi",
    ),
    Category(
      id: 30,
      iconUrl: R.categoryIcon.collectInterestIc,
      name: "Thu lãi",
    ),
  ];

  static List<Category> incomesCategory = [
    Category(
      id: 31,
      iconUrl: R.categoryIcon.salaryIc,
      name: "Lương",
    ),
    Category(
      id: 32,
      iconUrl: R.categoryIcon.othersIncomeIc,
      name: "Thu nhập khác",
    ),
  ];

  static List<Category> othersCategory = [
    Category(
      id: 33,
      iconUrl: R.categoryIcon.moneyInIc,
      name: "Tiền chuyển đi",
    ),
    Category(
      id: 34,
      iconUrl: R.categoryIcon.moneyOutIc,
      name: "Tiền chuyển đến",
    ),
  ];

  static List<Category> categoryList = [
    Category(
      id: 0,
      iconUrl: R.categoryIcon.unknownIc,
      name: "Chọn nhóm",
    ),
    Category(
      id: 1,
      iconUrl: R.categoryIcon.foodIc,
      name: "Ăn uống",
    ),
    Category(
      id: 2,
      iconUrl: R.categoryIcon.transportIc,
      name: "Di chuyển",
    ),
    Category(
      id: 3,
      iconUrl: R.categoryIcon.houseIc,
      name: "Thuê nhà",
    ),
    Category(
      id: 4,
      iconUrl: R.categoryIcon.waterIc,
      name: "Hóa đơn nước",
    ),
    Category(
      id: 5,
      iconUrl: R.categoryIcon.phoneIc,
      name: "Hóa đơn điện thoại",
    ),
    Category(
      id: 6,
      iconUrl: R.categoryIcon.electricityIc,
      name: "Hóa đơn điện",
    ),
    Category(
      id: 7,
      iconUrl: R.categoryIcon.gasIc,
      name: "Hóa đơn gas",
    ),
    Category(
      id: 8,
      iconUrl: R.categoryIcon.tvIc,
      name: "Hóa đơn TV",
    ),
    Category(
      id: 9,
      iconUrl: R.categoryIcon.internetIc,
      name: "Hóa đơn mạng",
    ),
    Category(
      id: 10,
      iconUrl: R.categoryIcon.othersMonthlyIc,
      name: "Khác",
    ),
    Category(
      id: 11,
      iconUrl: R.categoryIcon.repairedHouseIc,
      name: "Sửa & trang trí nhà",
    ),
    Category(
      id: 12,
      iconUrl: R.categoryIcon.maintainanceIc,
      name: "Bảo dưỡng xe",
    ),
    Category(
      id: 13,
      iconUrl: R.categoryIcon.insuranceIc,
      name: "Bảo hiểm",
    ),
    Category(
      id: 14,
      iconUrl: R.categoryIcon.healthIc,
      name: "Khám sức khỏe",
    ),
    Category(
      id: 15,
      iconUrl: R.categoryIcon.furnituresIc,
      name: "Đồ gia dụng",
    ),
    Category(
      id: 16,
      iconUrl: R.categoryIcon.personalIc,
      name: "Đồ dùng cá nhân",
    ),
    Category(
      id: 17,
      iconUrl: R.categoryIcon.petsIc,
      name: "Vật nuôi",
    ),
    Category(
      id: 18,
      iconUrl: R.categoryIcon.familyIc,
      name: "Dịch vụ gia đình",
    ),
    Category(
      id: 19,
      iconUrl: R.categoryIcon.othersNecessaryIc,
      name: "Khác",
    ),
    Category(
      id: 20,
      iconUrl: R.categoryIcon.sportsIC,
      name: "Thể thao",
    ),
    Category(
      id: 21,
      iconUrl: R.categoryIcon.beautyIc,
      name: "Làm đẹp",
    ),
    Category(
      id: 22,
      iconUrl: R.categoryIcon.giftIc,
      name: "Quà tặng & Quyên góp",
    ),
    Category(
      id: 23,
      iconUrl: R.categoryIcon.onlineIc,
      name: "Dịch vụ trực tuyến",
    ),
    Category(
      id: 24,
      iconUrl: R.categoryIcon.playingIc,
      name: "Vui - Chơi",
    ),
    Category(
      id: 25,
      iconUrl: R.categoryIcon.investmentIc,
      name: "Đầu tư",
    ),
    Category(
      id: 26,
      iconUrl: R.categoryIcon.debtIc,
      name: "Thu nợ",
    ),
    Category(
      id: 27,
      iconUrl: R.categoryIcon.getALoanIc,
      name: "Đi vay",
    ),
    Category(
      id: 28,
      iconUrl: R.categoryIcon.paybackLoanIc,
      name: "Trả nợ",
    ),
    Category(
      id: 29,
      iconUrl: R.categoryIcon.payInterestIc,
      name: "Trả lãi",
    ),
    Category(
      id: 30,
      iconUrl: R.categoryIcon.collectInterestIc,
      name: "Thu lãi",
    ),
    Category(
      id: 31,
      iconUrl: R.categoryIcon.salaryIc,
      name: "Lương",
    ),
    Category(
      id: 32,
      iconUrl: R.categoryIcon.othersIncomeIc,
      name: "Thu nhập khác",
    ),
    Category(
      id: 33,
      iconUrl: R.categoryIcon.moneyInIc,
      name: "Tiền chuyển đi",
    ),
    Category(
      id: 34,
      iconUrl: R.categoryIcon.moneyOutIc,
      name: "Tiền chuyển đến",
    ),
  ];
}
