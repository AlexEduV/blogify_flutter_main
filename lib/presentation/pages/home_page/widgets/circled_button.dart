import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircledButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircledButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey.withAlpha(40),
        customBorder: const CircleBorder(),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border(
              bottom: BorderSide(
                color: AppColors.lightGrey,
                width: 0.5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.offGrey,
                offset: const Offset(0, 2),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.normalM),
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
