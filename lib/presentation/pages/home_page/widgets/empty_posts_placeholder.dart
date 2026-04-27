import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EmptyPostsPlaceholder extends StatelessWidget {
  const EmptyPostsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      L10n.noPostsPlaceholder,
      style: AppTextStyles.sfPro16,
    );
  }
}
