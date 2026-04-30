import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppColors', () {
    test('should have correct constant color values', () {
      expect(AppColors.scaffoldBackgroundColor, const Color(0xfff6f6f6));
      expect(AppColors.accentColor, const Color(0xff9e9e9e));
      expect(AppColors.primaryColor, const Color(0xfff5f5f5));
      expect(AppColors.secondaryColor, Colors.white);
      expect(AppColors.settingsItemColor, const Color(0xfff8f8f8));
      expect(AppColors.emeraldGreen, const Color(0xff2e7d32));
      expect(AppColors.beige, const Color(0xffdfae94));
      expect(AppColors.dark, const Color(0xff013500));
    });

    test('should have correct grey shades', () {
      expect(AppColors.offGrey, Colors.grey.shade200);
      expect(AppColors.lightGrey, Colors.grey.shade300);
      expect(AppColors.darkGrey, Colors.grey.shade600);
    });
  });
}
