import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDateTime(String dateTimeString,
      {String format = 'MMM dd, yyyy hh:mm a'}) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeString);
      return DateFormat(format).format(dateTime);
    } catch (e) {
      return dateTimeString;
    }
  }
}
