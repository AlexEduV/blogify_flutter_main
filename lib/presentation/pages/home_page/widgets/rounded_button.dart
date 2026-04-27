import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final bool filled;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final double horizontalPadding;
  final String text;
  final double borderRadius;
  final Function()? onTap;
  final Color backgroundColor;
  final Color tintColor;

  const RoundedButton({
    required this.text,
    this.leadingIcon,
    this.trailingIcon,
    this.filled = false,
    this.horizontalPadding = AppDimensions.normalM,
    this.borderRadius = AppDimensions.majorS,
    this.backgroundColor = AppColors.primaryColor,
    this.tintColor = Colors.black,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: filled ? backgroundColor : Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: AppDimensions.minorL, horizontal: horizontalPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppDimensions.minorL,
            children: [
              if (leadingIcon != null)
                Icon(
                  leadingIcon,
                  color: tintColor,
                  size: AppDimensions.appBarIconSize,
                ),
              Text(
                text,
                style: AppTextStyles.sfPro14.copyWith(
                  color: filled ? tintColor : AppColors.accentColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (trailingIcon != null)
                Icon(
                  trailingIcon,
                  color: tintColor,
                  size: AppDimensions.appBarIconSize,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
