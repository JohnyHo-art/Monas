class Budget {
  double budget;
  int categoryId;
  int walletId;
  double spent;

  Budget({
    required this.budget,
    required this.categoryId,
    required this.walletId,
    required this.spent,
  });

  // Decompose a JSON object to a budget object
  factory Budget.fromJSON(json) {
    return Budget(
      budget: double.parse(json['budget'].toString()),
      categoryId: json['categoryId'],
      walletId: json['walletId'],
      spent: double.parse(json['spent'].toString()),
    );
  }

  // Package budget object to the JSON file
  Map<String, dynamic> toJSON() {
    return {
      'budget': budget,
      'categoryId': categoryId,
      'walletId': walletId,
      'spent': spent,
    };
  }
}
