import 'package:blogify_flutter_main/common/app_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppConstants', () {
    test('should have correct homePagePostsVisibleCount', () {
      expect(AppConstants.homePagePostsVisibleCount, 3);
    });

    test('should have correct home tab indices', () {
      expect(AppConstants.homeTabTrendingIndex, 0);
      expect(AppConstants.homeTabDesignIndex, 1);
      expect(AppConstants.homeTabTechIndex, 2);
    });

    test('should have correct webHost', () {
      expect(AppConstants.webHost, 'https://blogify.co.uk/');
    });
  });
}
