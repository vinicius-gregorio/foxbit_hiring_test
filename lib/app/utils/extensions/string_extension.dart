import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatToBrl() {
    const String symbol = r'R$';
    const int decimalDigits = 2;
    const String locale = 'pt';

    final formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: decimalDigits,
      locale: locale,
    );
    final formatted = formatter.format(double.parse(this));
    return formatted;
  }

  String formatQuotationValue() {
    const int decimalDigits = 2;
    const String symbol = '';
    final formatter = NumberFormat.simpleCurrency(
      decimalDigits: decimalDigits,
      name: symbol,
    );
    double value = double.parse(this);
    String formatted = formatter.format(value);
    if (value > 0) {
      formatted = '+ $formatted';
    }
    return formatted;
  }
}
