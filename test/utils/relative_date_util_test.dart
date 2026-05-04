import 'package:blogify_flutter_main/utils/relative_date_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('RelativeDateUtil.getRelativeDate', () {
    String formatDate(DateTime date) => DateFormat('MM/dd/yy').format(date);

    test('returns "today" for today\'s date', () {
      final now = DateTime.now();
      final todayString = formatDate(now);
      expect(RelativeDateUtil.getRelativeDate(todayString), 'today');
    });

    test('returns "yesterday" for yesterday\'s date', () {
      final yesterday = DateTime.now().subtract(const Duration(days: 1));
      final yesterdayString = formatDate(yesterday);
      expect(RelativeDateUtil.getRelativeDate(yesterdayString), 'yesterday');
    });

    test('returns "X days ago" for dates within 2-7 days', () {
      for (var days = 2; days < 7; days++) {
        final date = DateTime.now().subtract(Duration(days: days));
        final dateString = formatDate(date);
        expect(RelativeDateUtil.getRelativeDate(dateString), '$days days ago');
      }
    });

    test('returns "2 weeks ago" for 14 days ago', () {
      final date = DateTime.now().subtract(const Duration(days: 14));
      final dateString = formatDate(date);
      expect(RelativeDateUtil.getRelativeDate(dateString), '2 weeks ago');
    });

    test('returns "3 weeks ago" for 21 days ago', () {
      final date = DateTime.now().subtract(const Duration(days: 21));
      final dateString = formatDate(date);
      expect(RelativeDateUtil.getRelativeDate(dateString), '3 weeks ago');
    });

    test('returns "1 month ago" for 30 days ago', () {
      final date = DateTime.now().subtract(const Duration(days: 30));
      final dateString = formatDate(date);
      expect(RelativeDateUtil.getRelativeDate(dateString), '1 month ago');
    });

    test('returns "2 months ago" for 60 days ago', () {
      final date = DateTime.now().subtract(const Duration(days: 60));
      final dateString = formatDate(date);
      expect(RelativeDateUtil.getRelativeDate(dateString), '2 months ago');
    });

    test('returns "1 year ago" for 365 days ago', () {
      final date = DateTime.now().subtract(const Duration(days: 365));
      final dateString = formatDate(date);
      expect(RelativeDateUtil.getRelativeDate(dateString), '1 year ago');
    });

    test('returns "2 years ago" for 730 days ago', () {
      final date = DateTime.now().subtract(const Duration(days: 730));
      final dateString = formatDate(date);
      expect(RelativeDateUtil.getRelativeDate(dateString), '2 years ago');
    });
  });
}
