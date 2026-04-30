import 'package:blogify_flutter_main/common/enums/post_filter.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostFilter', () {
    test('should have correct label for each filter', () {
      expect(PostFilter.title.label, L10n.searchFilterTitle);
      expect(PostFilter.author.label, L10n.searchFilterAuthor);
    });
  });
}
