class ExpenseItem {
  late int categoryId;
  late String date;
  late double money;

  ExpenseItem({
    required this.categoryId,
    required this.date,
    required this.money,
  });

  static List<ExpenseItem> testList = [
    ExpenseItem(categoryId: 1, date: "20/10/2022", money: 200000),
    ExpenseItem(categoryId: 2, date: "21/10/2022", money: 3000),
    ExpenseItem(categoryId: 2, date: "22/10/2022", money: 400000),
  ];
}
