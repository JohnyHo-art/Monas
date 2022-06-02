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
      budget: json['budget'],
      categoryId: json['categoryId'],
      walletId: json['walletId'],
      spent: json['spent'],
    );
  }

  // Package budget object to the JSON file
  Map<String, dynamic> toJSON() {
    return {
      'budget': budget,
      'category': categoryId,
      'walletId': walletId,
      'spent': spent,
    };
  }
}
