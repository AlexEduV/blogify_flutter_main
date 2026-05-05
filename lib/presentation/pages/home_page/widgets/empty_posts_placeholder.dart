import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class EmptyListPlaceholder extends StatelessWidget {
  final String text;

  const EmptyListPlaceholder({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyles.sfPro16);
  }
}
