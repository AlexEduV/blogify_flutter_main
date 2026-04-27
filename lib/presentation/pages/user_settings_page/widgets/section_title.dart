import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.sfPro13Dark.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
