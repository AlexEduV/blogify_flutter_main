import 'package:blogify_flutter_main/utils/intl_day_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('IntlFormatter', () {
    setUp(() {
      // Set locale to English for consistent results
      Intl.defaultLocale = 'en';
    });

    test('returns correct string for 0 days', () {
      expect(IntlDayFormatter.getFormattedDays(0), '0 days ago');
    });

    test('returns correct string for 1 day', () {
      expect(IntlDayFormatter.getFormattedDays(1), '1 day ago');
    });

    test('returns correct string for multiple days', () {
      expect(IntlDayFormatter.getFormattedDays(2), '2 days ago');
      expect(IntlDayFormatter.getFormattedDays(5), '5 days ago');
      expect(IntlDayFormatter.getFormattedDays(100), '100 days ago');
    });
  });
}
