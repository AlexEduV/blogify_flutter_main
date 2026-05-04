import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTextStyles', () {
    test('sfPro12Dark has correct properties', () {
      final style = AppTextStyles.sfPro12Dark;
      expect(style.fontSize, 12);
      expect(style.fontWeight, FontWeight.w500);
      expect(style.color, AppColors.darkGrey);
    });

    test('sfPro13Dark has correct properties', () {
      const style = AppTextStyles.sfPro13Dark;
      expect(style.fontSize, 13);
      expect(style.fontWeight, FontWeight.w500);
      expect(style.color, Colors.black54);
    });

    test('sfPro14 has correct properties', () {
      const style = AppTextStyles.sfPro14;
      expect(style.fontSize, 14);
      expect(style.height, 1.7);
      expect(style.fontWeight, isNull);
      expect(style.color, isNull);
    });

    test('sfPro14Accent has correct properties', () {
      final style = AppTextStyles.sfPro14Accent;
      expect(style.fontSize, 14);
      expect(style.height, 1.7);
      expect(style.color, AppColors.accentColor);
      expect(style.fontWeight, isNull);
    });

    test('sfPro16 has correct properties', () {
      const style = AppTextStyles.sfPro16;
      expect(style.fontSize, 16);
      expect(style.fontWeight, FontWeight.w500);
      expect(style.color, isNull);
    });

    test('sfPro16Accent has correct properties', () {
      final style = AppTextStyles.sfPro16Accent;
      expect(style.fontSize, 16);
      expect(style.fontWeight, FontWeight.w500);
      expect(style.color, AppColors.accentColor);
    });

    test('sfPro20 has correct properties', () {
      const style = AppTextStyles.sfPro20;
      expect(style.fontSize, 20);
      expect(style.fontWeight, FontWeight.w500);
      expect(style.height, 1.4);
    });

    test('sfPro24 has correct properties', () {
      const style = AppTextStyles.sfPro24;
      expect(style.fontSize, 24);
      expect(style.fontWeight, FontWeight.w600);
      expect(style.height, 1.4);
    });
  });
}
