import 'package:intl/intl.dart';

extension NumberFormatter on num {
  String toFormattedString() {
    if (this >= 1000000000000) {
      // Trillion
      return '${(this / 1000000000000).toStringAsFixed(1)}T';
    } else if (this >= 1000000000) {
      // Billion
      return '${(this / 1000000000).toStringAsFixed(1)}B';
    } else if (this >= 1000000) {
      // Million
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      // Thousand
      return NumberFormat('#,##0.##').format(this);
    } else {
      return toString();
    }
  }
}
