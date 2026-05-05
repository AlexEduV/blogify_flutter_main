import 'package:blogify_flutter_main/common/extensions/list_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddIfNotContains extension', () {
    test('adds value if not present', () {
      final list = <int>[1, 2, 3];
      list.addIfNotContains(4);
      expect(list, [1, 2, 3, 4]);
    });

    test('does not add value if already present', () {
      final list = <int>[1, 2, 3];
      list.addIfNotContains(2);
      expect(list, [1, 2, 3]);
    });
  });

  group('AddOrRemoveIfContains extension', () {
    test('removes value if present', () {
      final list = <String>['a', 'b', 'c'];
      list.addOrRemoveIfContains('b');
      expect(list, ['a', 'c']);
    });

    test('adds value if not present', () {
      final list = <String>['a', 'b', 'c'];
      list.addOrRemoveIfContains('d');
      expect(list, ['a', 'b', 'c', 'd']);
    });
  });
}
