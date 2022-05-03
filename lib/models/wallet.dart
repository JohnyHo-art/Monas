import 'package:monas/constants/resources.dart';

class Wallet {
  final String name;
  final double balance;
  final double expense;
  final double income;
  final String iconUrl;

  Wallet({
    required this.name,
    required this.balance,
    required this.expense,
    required this.income,
    required this.iconUrl,
  });
}
