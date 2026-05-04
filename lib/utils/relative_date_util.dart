import 'package:intl/intl.dart';

class RelativeDateUtil {
  static final inputFormat = DateFormat('MM/dd/yy');

  static String getRelativeDate(String dateString) {
    final parsedDate = inputFormat.parse(dateString);
    final now = DateTime.now();

    final difference = now.difference(parsedDate);
    final days = difference.inDays;
    final years = (days / 365).floor();
    final months = (days / 30).floor();
    final weeks = (days / 7).floor();

    if (days == 0) {
      return 'today';
    } else if (days == 1) {
      return 'yesterday';
    } else if (years >= 1) {
      return '$years year${years > 1 ? 's' : ''} ago';
    } else if (months >= 1) {
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (weeks >= 1) {
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else {
      return '$days days ago';
    }
  }
}
