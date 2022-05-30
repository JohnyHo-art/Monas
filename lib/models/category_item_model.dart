import 'package:monas/constants/resources.dart';

class Category {
  final int id;
  final bool? type;
  final String iconUrl;
  final String name;

  Category({
    required this.id,
    required this.type,
    required this.iconUrl,
    required this.name,
  });

  // Monthly expense category
  static List<Category> monthlyCategory = [
    Category(
      id: 1,
      type: false,
      iconUrl: R.categoryIcon.foodIc,
      name: "Ăn uống",
    ),
    Category(
      id: 2,
      type: false,
      iconUrl: R.categoryIcon.transportIc,
      name: "Di chuyển",
    ),
    Category(
      id: 3,
      type: false,
      iconUrl: R.categoryIcon.houseIc,
      name: "Thuê nhà",
    ),
    Category(
      id: 4,
      type: false,
      iconUrl: R.categoryIcon.waterIc,
      name: "Hóa đơn nước",
    ),
    Category(
      id: 5,
      type: false,
      iconUrl: R.categoryIcon.phoneIc,
      name: "Hóa đơn điện thoại",
    ),
    Category(
      id: 6,
      type: false,
      iconUrl: R.categoryIcon.electricityIc,
      name: "Hóa đơn điện",
    ),
    Category(
      id: 7,
      type: false,
      iconUrl: R.categoryIcon.gasIc,
      name: "Hóa đơn gas",
    ),
    Category(
      id: 8,
      type: false,
      iconUrl: R.categoryIcon.tvIc,
      name: "Hóa đơn TV",
    ),
    Category(
      id: 9,
      type: false,
      iconUrl: R.categoryIcon.internetIc,
      name: "Hóa đơn internet",
    ),
    Category(
      id: 10,
      type: false,
      iconUrl: R.categoryIcon.othersMonthlyIc,
      name: "Khác",
    ),
  ];

  // Necessary expenses categories list
  static List<Category> necessaryCategory = [
    Category(
      id: 11,
      type: false,
      iconUrl: R.categoryIcon.repairedHouseIc,
      name: "Sửa & trang trí nhà",
    ),
    Category(
      id: 12,
      type: false,
      iconUrl: R.categoryIcon.maintainanceIc,
      name: "Bảo dưỡng xe",
    ),
    Category(
      id: 13,
      type: false,
      iconUrl: R.categoryIcon.insuranceIc,
      name: "Bảo hiểm",
    ),
    Category(
      id: 14,
      type: false,
      iconUrl: R.categoryIcon.healthIc,
      name: "Khám sức khỏe",
    ),
    Category(
      id: 15,
      type: false,
      iconUrl: R.categoryIcon.furnituresIc,
      name: "Đồ gia dụng",
    ),
    Category(
      id: 16,
      type: false,
      iconUrl: R.categoryIcon.personalIc,
      name: "Đồ dùng cá nhân",
    ),
    Category(
      id: 17,
      type: false,
      iconUrl: R.categoryIcon.petsIc,
      name: "Vật nuôi",
    ),
    Category(
      id: 18,
      type: false,
      iconUrl: R.categoryIcon.familyIc,
      name: "Dịch vụ gia đình",
    ),
    Category(
      id: 19,
      type: false,
      iconUrl: R.categoryIcon.othersNecessaryIc,
      name: "Khác",
    ),
  ];

  // Entertainment and gaming categories list
  static List<Category> entertainmentCategory = [
    Category(
      id: 20,
      type: false,
      iconUrl: R.categoryIcon.sportsIC,
      name: "Thể thao",
    ),
    Category(
      id: 21,
      type: false,
      iconUrl: R.categoryIcon.beautyIc,
      name: "Làm đẹp",
    ),
    Category(
      id: 22,
      type: false,
      iconUrl: R.categoryIcon.giftIc,
      name: "Quà tặng & Quyên góp",
    ),
    Category(
      id: 23,
      type: false,
      iconUrl: R.categoryIcon.onlineIc,
      name: "Dịch vụ trực tuyến",
    ),
    Category(
      id: 24,
      type: false,
      iconUrl: R.categoryIcon.playingIc,
      name: "Vui - Chơi",
    ),
  ];

  // Investment and loans categories list
  static List<Category> investmentCategory = [
    Category(
      id: 25,
      type: false,
      iconUrl: R.categoryIcon.investmentIc,
      name: "Đầu tư",
    ),
    Category(
      id: 26,
      type: true,
      iconUrl: R.categoryIcon.debtIc,
      name: "Thu nợ",
    ),
    Category(
      id: 27,
      type: true,
      iconUrl: R.categoryIcon.getALoanIc,
      name: "Đi vay",
    ),
    Category(
      id: 28,
      type: false,
      iconUrl: R.categoryIcon.paybackLoanIc,
      name: "Trả nợ",
    ),
    Category(
      id: 29,
      type: false,
      iconUrl: R.categoryIcon.payInterestIc,
      name: "Trả lãi",
    ),
    Category(
      id: 30,
      type: false,
      iconUrl: R.categoryIcon.collectInterestIc,
      name: "Thu lãi",
    ),
  ];

  // Income categories list
  static List<Category> incomesCategory = [
    Category(
      id: 31,
      type: true,
      iconUrl: R.categoryIcon.salaryIc,
      name: "Lương",
    ),
    Category(
      id: 32,
      type: true,
      iconUrl: R.categoryIcon.othersIncomeIc,
      name: "Thu nhập khác",
    ),
  ];

  // Other categories list
  static List<Category> othersCategory = [
    Category(
      id: 33,
      type: false,
      iconUrl: R.categoryIcon.moneyInIc,
      name: "Tiền chuyển đi",
    ),
    Category(
      id: 34,
      type: true,
      iconUrl: R.categoryIcon.moneyOutIc,
      name: "Tiền chuyển đến",
    ),
  ];

  // The general list that combines all separate list above
  static List<Category> categoryList = [
    Category(
      id: 0,
      type: null,
      iconUrl: R.categoryIcon.unknownIc,
      name: "Chọn nhóm",
    ),
    Category(
      id: 1,
      type: false,
      iconUrl: R.categoryIcon.foodIc,
      name: "Ăn uống",
    ),
    Category(
      id: 2,
      type: false,
      iconUrl: R.categoryIcon.transportIc,
      name: "Di chuyển",
    ),
    Category(
      id: 3,
      type: false,
      iconUrl: R.categoryIcon.houseIc,
      name: "Thuê nhà",
    ),
    Category(
      id: 4,
      type: false,
      iconUrl: R.categoryIcon.waterIc,
      name: "Hóa đơn nước",
    ),
    Category(
      id: 5,
      type: false,
      iconUrl: R.categoryIcon.phoneIc,
      name: "Hóa đơn điện thoại",
    ),
    Category(
      id: 6,
      type: false,
      iconUrl: R.categoryIcon.electricityIc,
      name: "Hóa đơn điện",
    ),
    Category(
      id: 7,
      type: false,
      iconUrl: R.categoryIcon.gasIc,
      name: "Hóa đơn gas",
    ),
    Category(
      id: 8,
      type: false,
      iconUrl: R.categoryIcon.tvIc,
      name: "Hóa đơn TV",
    ),
    Category(
      id: 9,
      type: false,
      iconUrl: R.categoryIcon.internetIc,
      name: "Hóa đơn mạng",
    ),
    Category(
      id: 10,
      type: false,
      iconUrl: R.categoryIcon.othersMonthlyIc,
      name: "Khác",
    ),
    Category(
      id: 11,
      type: false,
      iconUrl: R.categoryIcon.repairedHouseIc,
      name: "Sửa & trang trí nhà",
    ),
    Category(
      id: 12,
      type: false,
      iconUrl: R.categoryIcon.maintainanceIc,
      name: "Bảo dưỡng xe",
    ),
    Category(
      id: 13,
      type: false,
      iconUrl: R.categoryIcon.insuranceIc,
      name: "Bảo hiểm",
    ),
    Category(
      id: 14,
      type: false,
      iconUrl: R.categoryIcon.healthIc,
      name: "Khám sức khỏe",
    ),
    Category(
      id: 15,
      type: false,
      iconUrl: R.categoryIcon.furnituresIc,
      name: "Đồ gia dụng",
    ),
    Category(
      id: 16,
      type: false,
      iconUrl: R.categoryIcon.personalIc,
      name: "Đồ dùng cá nhân",
    ),
    Category(
      id: 17,
      type: false,
      iconUrl: R.categoryIcon.petsIc,
      name: "Vật nuôi",
    ),
    Category(
      id: 18,
      type: false,
      iconUrl: R.categoryIcon.familyIc,
      name: "Dịch vụ gia đình",
    ),
    Category(
      id: 19,
      type: false,
      iconUrl: R.categoryIcon.othersNecessaryIc,
      name: "Khác",
    ),
    Category(
      id: 20,
      type: false,
      iconUrl: R.categoryIcon.sportsIC,
      name: "Thể thao",
    ),
    Category(
      id: 21,
      type: false,
      iconUrl: R.categoryIcon.beautyIc,
      name: "Làm đẹp",
    ),
    Category(
      id: 22,
      type: false,
      iconUrl: R.categoryIcon.giftIc,
      name: "Quà tặng & Quyên góp",
    ),
    Category(
      id: 23,
      type: false,
      iconUrl: R.categoryIcon.onlineIc,
      name: "Dịch vụ trực tuyến",
    ),
    Category(
      id: 24,
      type: false,
      iconUrl: R.categoryIcon.playingIc,
      name: "Vui - Chơi",
    ),
    Category(
      id: 25,
      type: false,
      iconUrl: R.categoryIcon.investmentIc,
      name: "Đầu tư",
    ),
    Category(
      id: 26,
      type: true,
      iconUrl: R.categoryIcon.debtIc,
      name: "Thu nợ",
    ),
    Category(
      id: 27,
      type: true,
      iconUrl: R.categoryIcon.getALoanIc,
      name: "Đi vay",
    ),
    Category(
      id: 28,
      type: false,
      iconUrl: R.categoryIcon.paybackLoanIc,
      name: "Trả nợ",
    ),
    Category(
      id: 29,
      type: false,
      iconUrl: R.categoryIcon.payInterestIc,
      name: "Trả lãi",
    ),
    Category(
      id: 30,
      type: true,
      iconUrl: R.categoryIcon.collectInterestIc,
      name: "Thu lãi",
    ),
    Category(
      id: 31,
      type: true,
      iconUrl: R.categoryIcon.salaryIc,
      name: "Lương",
    ),
    Category(
      id: 32,
      type: true,
      iconUrl: R.categoryIcon.othersIncomeIc,
      name: "Thu nhập khác",
    ),
    Category(
      id: 33,
      type: false,
      iconUrl: R.categoryIcon.moneyInIc,
      name: "Tiền chuyển đi",
    ),
    Category(
      id: 34,
      type: true,
      iconUrl: R.categoryIcon.moneyOutIc,
      name: "Tiền chuyển đến",
    ),
  ];
}
