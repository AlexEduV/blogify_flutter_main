import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppDimensions', () {
    test('should have correct minor dimensions', () {
      expect(AppDimensions.minorXS, 2.0);
      expect(AppDimensions.minorS, 4.0);
      expect(AppDimensions.minorM, 6.0);
      expect(AppDimensions.minorL, 8.0);
    });

    test('should have correct normal dimensions', () {
      expect(AppDimensions.normalS, 12.0);
      expect(AppDimensions.normalM, 16.0);
      expect(AppDimensions.normalL, 20.0);
    });

    test('should have correct major dimensions', () {
      expect(AppDimensions.majorS, 24.0);
      expect(AppDimensions.majorM, 28.0);
      expect(AppDimensions.majorL, 32.0);
    });

    test('should have correct avatar and icon sizes', () {
      expect(AppDimensions.commentsUserAvatarImageSize, 40.0);
      expect(AppDimensions.appBarUserAvatarImageSize, 55.0);
      expect(AppDimensions.appBarIconSize, 20.0);
    });

    test('should have correct image heights', () {
      expect(AppDimensions.postCoverImageHeight, 250.0);
      expect(AppDimensions.articleImageHeight, 220.0);
      expect(AppDimensions.userPhotoImageHeight, 80.0);
    });

    test('should have correct account avatar and placeholder icon sizes', () {
      expect(AppDimensions.accountUserAvatarSize, 120.0);
      expect(AppDimensions.placeholderPageIconSize, 48.0);
    });
  });
}
