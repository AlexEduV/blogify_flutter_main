import 'package:blogify_flutter_main/presentation/notifiers/home_page/category_index_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoryIndexNotifier', () {
    late CategoryIndexNotifier notifier;

    setUp(() {
      notifier = CategoryIndexNotifier();
    });

    test('initial state is correct', () {
      expect(notifier.categoryIndex, 0);
      expect(notifier.previousIndex, isNull);
    });

    test('update changes categoryIndex and previousIndex', () {
      notifier.update(2);

      expect(notifier.previousIndex, 0);
      expect(notifier.categoryIndex, 2);

      notifier.update(5);

      expect(notifier.previousIndex, 2);
      expect(notifier.categoryIndex, 5);
    });

    test('update notifies listeners', () {
      var notified = false;
      notifier.addListener(() {
        notified = true;
      });

      notifier.update(1);

      expect(notified, true);
    });
  });
}
