import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;

  const MenuItem({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(AppDimensions.minorL), child: Text(text));
  }
}
