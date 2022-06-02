class Budget {
  double budget;
  int category;
  double spent;

  Budget({
    required this.budget,
    required this.category,
    required this.spent,
  });

  // Decompose a JSON object to a budget object
  factory Budget.fromJSON(json) {
    return Budget(
      budget: json['budget'],
      category: json['category'],
      spent: json['spent'],
    );
  }

  // Package budget object to the JSON file
  Map<String, dynamic> toJSON() {
    return {
      'budget': budget,
      'category': category,
      'spent': category,
    };
  }
}
