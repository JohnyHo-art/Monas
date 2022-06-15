class Wallet {
  final int id;
  final String name;
  final double balance;
  final double expense;
  final double income;
  final String iconUrl;
  final bool includeToTotal;

  Wallet({
    required this.id,
    required this.name,
    required this.balance,
    required this.expense,
    required this.income,
    required this.iconUrl,
    required this.includeToTotal,
  });

  static double toDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    }
    return value;
  }

  //send data to firestore
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "balance": balance,
      "income": income,
      "expense": expense,
      "iconUrl": iconUrl,
      "includeToTotal": includeToTotal,
    };
  }

  //receive data from firestore
  factory Wallet.fromMap(map) {
    return Wallet(
      id: map['id'],
      name: map['name'],
      balance: toDouble(map['balance']),
      expense: toDouble(map['expense']),
      income: toDouble(map['income']),
      iconUrl: map['iconUrl'],
      includeToTotal: map['includeToTotal'],
    );
  }
}
