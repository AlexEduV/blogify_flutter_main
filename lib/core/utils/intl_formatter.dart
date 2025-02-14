import 'package:intl/intl.dart';

class IntlFormatter {

  static String getFormattedDays(int days) {

    return Intl.plural(
      days,
      one: '$days day ago',
      other: '$days days ago',
      zero: '$days days ago',
    );
  }

}
