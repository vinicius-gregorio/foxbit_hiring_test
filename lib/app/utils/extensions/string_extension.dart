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
}
