import 'package:intl/intl.dart';

class F {
  static final currencyFormat = _CurrencyFormat();
}

class _CurrencyFormat {
  String compactSimpleFormatCurrency (double amount, String locale) {
    var compactF = NumberFormat.compactSimpleCurrency(locale: locale);
    return compactF.format(amount);
  }

  String formatCurrency (double amount, String locale) {
    var currencyF = NumberFormat.currency(locale: locale);
    return currencyF.format(amount);
  }
}