import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(
    DateTime dateTime,
    DateFormat format,
  ) {
    return format.format(dateTime);
  }
}
