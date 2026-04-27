import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;

  const MenuItem({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.minorL),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.majorS),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
