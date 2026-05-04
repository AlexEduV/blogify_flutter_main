import 'package:flutter/material.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_dimensions.dart';
import '../../../../../../common/app_text_styles.dart';
import '../../../../../../l10n/l10n.dart';

class EmptyArticlesPage extends StatelessWidget {
  const EmptyArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.article,
            size: AppDimensions.publishedArticlePlaceholderIconSize,
            color: AppColors.emeraldGreen,
          ),

          SizedBox(height: AppDimensions.normalS),

          Text(L10n.publishedArticlesPageEmptyListTitle, style: AppTextStyles.sfPro16),
          Text(L10n.publishedArticlesPageEmptyListSubtitle),
        ],
      ),
    );
  }
}
