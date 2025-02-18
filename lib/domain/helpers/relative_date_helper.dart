import 'package:intl/intl.dart';

class RelativeDateHelper {

  static String getRelativeDate(String dateString) {
    // Define the input format
    DateFormat inputFormat = DateFormat('MM/dd/yy');

    // Parse the date string into a DateTime object
    DateTime parsedDate = inputFormat.parse(dateString);
    DateTime now = DateTime.now();

    // Normalize times to midnight to compare only dates
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime givenDate = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

    // Calculate the difference in days
    int difference = today.difference(givenDate).inDays;

    if (difference == 0) {
      return 'today';
    } else if (difference == 1) {
      return 'yesterday';
    } else if (difference >= 365) {
      return '${(difference / 365).floor()} year${difference >= 730 ? 's' : ''} ago';
    } else if (difference >= 30) {
      return '${(difference / 30).floor()} month${difference >= 60 ? 's' : ''} ago';
    } else if (difference >= 14) {
      return '${(difference / 7).floor()} week${difference >= 21 ? 's' : ''} ago';
    }

    return '$difference days ago';
  }

}