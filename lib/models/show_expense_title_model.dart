class ExpenseTitle {
  late String date;
  late int numberTransactions;
  late double income;
  late double expense;

  ExpenseTitle({
    required this.date,
    required this.numberTransactions,
    required this.income,
    required this.expense,
  });

  static ExpenseTitle testTitle = ExpenseTitle(
    date: "Octorber, 2022",
    numberTransactions: 5,
    income: 200000,
    expense: 150000,
  );
}
