import 'package:auto_route/annotations.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../../common/app_dimensions.dart';
import '../../common/app_text_styles.dart';

@RoutePage()
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offGrey,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.hourglass_empty,
              size: AppDimensions.placeholderPageIconSize,
              color: Colors.grey,
            ),

            const SizedBox(height: AppDimensions.normalM),

            const Text(L10n.placeholderPageTitle, style: AppTextStyles.sfPro24),

            const SizedBox(height: AppDimensions.minorL),

            Text(
              L10n.placeholderPageSubtitle,
              style: AppTextStyles.sfPro16.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
