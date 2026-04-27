import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final sfPro12Dark =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.darkGrey);
  static const sfPro13Dark =
      TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black54);

  static const sfPro14 = TextStyle(fontSize: 14, height: 1.7);
  static final sfPro14Accent = sfPro14.copyWith(color: AppColors.accentColor);

  static const sfPro16 = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static final sfPro16Accent = sfPro16.copyWith(color: AppColors.accentColor);

  static const sfPro20 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500, height: 1.4);
  static const sfPro24 = TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.4);
}
