import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircledButtonOutlined extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircledButtonOutlined({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final boxSize = AppDimensions.appBarIconSize + (AppDimensions.normalS * 2);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.lightGrey),
          ),
          child: Center(
            child: FaIcon(
              icon,
              color: Colors.black54,
              size: AppDimensions.appBarIconSize,
            ),
          ),
        ),
      ),
    );
  }
}
