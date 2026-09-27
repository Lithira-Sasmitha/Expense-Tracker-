import '../constants/app_constants.dart';

class CurrencyFormatter {
  static String format(double amount, {String symbol = AppConstants.currencySymbol}) {
    return '$symbol${amount.toStringAsFixed(2)}';
  }
}

class DateFormatter {
  static String formatShort(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
