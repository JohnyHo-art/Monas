import 'package:intl/intl.dart';
import 'package:monas/constants/string_constants.dart';

class F {
  static final currencyFormat = _CurrencyFormat();
  static final dateTimeFormat = _DateTimeFormat();
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

  String numberMoneyFormat(double amount) {
    var numberFormat = NumberFormat("###,###,###,###.##");
    return numberFormat.format(amount);
  }
}

class _DateTimeFormat {
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
  String simpleFormat(DateTime dateTime) => _dateFormat.format(dateTime);

  final DateFormat _englishStyleFormat = DateFormat.yMMMd(StringConstants.localeString.unitedStates);
  String enStyleFormat(DateTime dateTime) => _englishStyleFormat.format(dateTime);
}