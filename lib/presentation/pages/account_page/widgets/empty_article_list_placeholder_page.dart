import 'package:flutter/material.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_dimensions.dart';
import '../../../../common/app_text_styles.dart';

class EmptyArticleListPlaceholderPage extends StatelessWidget {
  final IconData icon;

  final String title;
  final String subtitle;

  const EmptyArticleListPlaceholderPage({
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: AppDimensions.publishedArticlePlaceholderIconSize,
            color: AppColors.emeraldGreen,
          ),

          const SizedBox(height: AppDimensions.normalS),

          Text(title, style: AppTextStyles.sfPro16),
          Text(subtitle),
        ],
      ),
    );
  }
}
