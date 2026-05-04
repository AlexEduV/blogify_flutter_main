import 'package:blogify_flutter_main/common/app_constants.dart';
import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostCategory', () {
    test('should have correct tabIndex and label for each category', () {
      expect(PostCategory.design.tabIndex, AppConstants.homeTabDesignIndex);
      expect(PostCategory.design.label, L10n.postsCategoryDesign);

      expect(PostCategory.tech.tabIndex, AppConstants.homeTabTechIndex);
      expect(PostCategory.tech.label, L10n.postsCategoryTech);

      expect(PostCategory.trending.tabIndex, AppConstants.homeTabTrendingIndex);
      expect(PostCategory.trending.label, L10n.postsCategoryTrending);

      expect(PostCategory.none.tabIndex, isNull);
      expect(PostCategory.none.label, '');
    });

    test('fromLabel returns correct enum value', () {
      expect(PostCategory.fromLabel('design'), PostCategory.design);
      expect(PostCategory.fromLabel('tech'), PostCategory.tech);
      expect(PostCategory.fromLabel('trending'), PostCategory.trending);
      expect(PostCategory.fromLabel('none'), PostCategory.none);
    });

    test('fromLabel returns null for unknown label', () {
      expect(PostCategory.fromLabel('unknown'), isNull);
      expect(PostCategory.fromLabel(''), isNull);
    });
  });
}
