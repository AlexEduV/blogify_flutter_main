import 'package:blogify_flutter_main/common/enums/post_filter.dart';
import 'package:blogify_flutter_main/presentation/notifiers/home_page/search_bar_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SearchBarNotifier', () {
    late SearchBarNotifier notifier;

    setUp(() {
      notifier = SearchBarNotifier();
    });

    test('initial state is correct', () {
      expect(notifier.selectedFilterType, PostFilter.title);
      expect(notifier.isSelectionOpen, isFalse);
      expect(notifier.searchControllerValue, '');
    });

    test('updateFilterType changes filter and notifies listeners', () {
      var notified = false;
      notifier.addListener(() {
        notified = true;
      });

      notifier.updateFilterType(PostFilter.author);

      expect(notifier.selectedFilterType, PostFilter.author);
      expect(notified, true);
    });

    test('setIsMenuExpanded changes isSelectionOpen and notifies listeners', () {
      var notified = false;
      notifier.addListener(() {
        notified = true;
      });

      notifier.setIsMenuExpanded(true);

      expect(notifier.isSelectionOpen, isTrue);
      expect(notified, true);
    });

    test('updateSearchControllerValue changes value and notifies listeners', () {
      var notified = false;
      notifier.addListener(() {
        notified = true;
      });

      notifier.updateSearchControllerValue('query');

      expect(notifier.searchControllerValue, 'query');
      expect(notified, true);
    });
  });
}
